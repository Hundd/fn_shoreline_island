"""Offline regressions for design integrity and approval boundaries."""
import copy
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
import xml.etree.ElementTree as ET

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import map_workflow as mw
import yaml


class WorkflowTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.original = mw.read_yaml(mw.DEFAULT)
        cls.library = mw.patterns()

    def setUp(self):
        self.data = copy.deepcopy(self.original)

    def bad(self, text):
        with self.assertRaisesRegex(mw.Invalid, text):
            mw.validate(self.data, self.library)

    def test_real_example_and_pattern_library(self):
        warnings = mw.validate(self.data, self.library)
        self.assertEqual(len(self.library), 10)
        self.assertEqual(len([m for m in self.data['markers'] if m['kind'] == 'target']), 9)
        self.assertTrue(any('open assumption' in w for w in warnings))

    def test_structural_errors_reject_unknown_fields_and_boolean_number(self):
        self.data['map']['width'] = 100
        self.data['map']['size'][0] = True
        self.bad('unknown field.*width')

    def test_duplicate_ids_and_broken_references(self):
        self.data['markers'][1]['id'] = self.data['markers'][0]['id']
        self.data['zones'][0]['devices'].append('missing_device')
        self.bad('duplicate ids')

    def test_invalid_sizes_and_target_bounds(self):
        self.data['markers'][3]['position'][0] = 900
        self.bad('marker outside')
        self.data = copy.deepcopy(self.original)
        self.data['zones'][0]['size'][0] = -1
        self.bad('positive dimensions')

    def test_missing_directed_path_and_inaccessible_width(self):
        self.data['connections'].pop(0)
        self.bad('missing directed connection')
        self.data = copy.deepcopy(self.original)
        self.data['connections'][0]['width'] = 0.5
        self.bad('insufficient path width')

    def test_bad_path_endpoints_and_slope(self):
        self.data['connections'][0]['points'][-1] = [35,46,14]
        self.bad('excessive step/slope')
        self.data['connections'][0]['points'][-1] = [0,0,0]
        self.bad('inside endpoint zones')

    def test_undeclared_overlap(self):
        self.data['zones'][1]['overlap_with'] = []
        self.bad('overlap')

    def test_pattern_unknown_parameter_and_required_device(self):
        self.data['zones'][1]['parameters']['duration'] = 8
        self.data['zones'][1]['devices'].remove('board')
        self.bad('unsupported pattern parameter')
        del self.data['zones'][1]['parameters']['duration']
        self.bad('missing required device class')

    def test_negative_parameter_and_target_count(self):
        self.data['zones'][1]['parameters']['duration_seconds'] = -1
        self.bad('must be positive')
        self.data = copy.deepcopy(self.original)
        self.data['devices'][2]['count'] = 8
        self.bad('target device count')

    def test_sequence_and_target_identity(self):
        self.data['zones'][2]['parameters']['sequence'] = [0,3,5,6]
        self.bad('sequence disagrees')
        self.data = copy.deepcopy(self.original)
        self.data['markers'][4]['target_id'] = 0
        self.bad('duplicate target_id')

    def test_stage_cycles_inactive_success_and_gate_deadlock(self):
        self.data['stages'][0]['requires'] = ['finale']
        self.bad('dependencies must precede')
        self.data = copy.deepcopy(self.original)
        self.data['stages'][2]['success_target'] = 'reactor'
        self.bad('success target must be active')
        self.data = copy.deepcopy(self.original)
        self.data['connections'][2]['gate'] = 'finale'
        self.bad('deadlock')

    def test_bad_yaml_fails_cleanly(self):
        cases = ['version: 1\nversion: 2', 'a: &x [1]\nb: *x', 'a: !!python/object/apply:os.system [echo bad]', 'a: .nan', 'a: 2026-01-01']
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)/'bad.yaml'
            for content in cases:
                path.write_text(content, encoding='utf-8')
                with self.subTest(content=content), self.assertRaises(mw.Invalid):
                    mw.read_yaml(path)

    def test_determinism_dedup_and_coordinate_conversion(self):
        a,plan,manifest = mw.artifacts(self.data,self.library)
        self.assertEqual(a,mw.artifacts(self.data,self.library)[0])
        zone = next(s for s in plan['implementation'] if s.get('zone') == 'arena')
        self.assertEqual(zone['position_cm'],[8000,-5500,2410])
        devices = [s['device']['id'] for s in plan['implementation'] if s['step']=='reconcile_device']
        self.assertEqual(devices.count('controller'),1)
        self.assertFalse(plan['executable'])
        self.assertEqual(manifest['review_digest'],mw.digest(manifest['files']))

    def test_preview_is_valid_svg_and_escapes_untrusted_text(self):
        self.data['map']['title'] = '<script>alert("x")</script>'
        self.data['markers'][0]['label'] = '<img src=x onerror=alert(1)>'
        svg,page = mw.render(self.data)
        ET.fromstring(svg)
        self.assertNotIn('<script>',page)
        self.assertNotIn('<img src=',page)
        self.assertIn('&lt;script&gt;',page)
        self.assertIn('checkpoint',page)

    def bundle(self, folder, data=None):
        data = data or self.data
        spec = Path(folder)/'map.yaml'
        spec.write_text(yaml.safe_dump(data,sort_keys=False),encoding='utf-8')
        outputs,plan,manifest = mw.artifacts(data,self.library)
        generated = spec.parent/'generated'
        generated.mkdir(exist_ok=True)
        for name,content in outputs.items():
            (generated/name).write_bytes(content.encode())
        approval = spec.parent/'approval.yaml'
        approval.write_text(yaml.safe_dump({'status':'approved','reviewer':'Test fixture only',
            'approved_at':'2026-09-27T00:00:00Z','evidence':'Synthetic unit test; not production approval',
            'review_digest':manifest['review_digest']}),encoding='utf-8')
        return spec,outputs,plan,manifest,approval

    def test_missing_approval_and_open_assumptions_block_execution(self):
        with tempfile.TemporaryDirectory() as folder:
            args = self.bundle(folder)
            with self.assertRaisesRegex(mw.Invalid,'unresolved execution blocker'):
                mw.ready(*args)
            args[-1].unlink()
            with self.assertRaises(mw.Invalid):
                mw.ready(*args)

    def test_valid_fixture_approval_then_artifact_tamper(self):
        self.data['assumptions'] = []
        with tempfile.TemporaryDirectory() as folder:
            args = self.bundle(folder)
            mw.ready(*args)
            (Path(folder)/'generated/implementation.yaml').write_text('tampered',encoding='utf-8')
            with self.assertRaisesRegex(mw.Invalid,'stale/missing artifact'):
                mw.ready(*args)

    def test_spec_or_pattern_change_invalidates_existing_approval(self):
        self.data['assumptions'] = []
        with tempfile.TemporaryDirectory() as folder:
            spec,_,_,_,approval = self.bundle(folder)
            old_approval = approval.read_bytes()
            self.data['zones'][0]['size'][1] = 31
            spec,outputs,plan,manifest,approval = self.bundle(folder)
            approval.write_bytes(old_approval)
            with self.assertRaisesRegex(mw.Invalid,'approval is stale'):
                mw.ready(spec,outputs,plan,manifest,approval)
            changed = copy.deepcopy(self.library)
            changed['corridor']['reset'] = 'A different reset contract.'
            new_outputs,new_plan,new_manifest = mw.artifacts(self.data,changed)
            self.assertNotEqual(manifest['review_digest'],new_manifest['review_digest'])

    def test_contract_only_and_unsupported_sequence_block_plan(self):
        self.data['assumptions'] = []
        changed = copy.deepcopy(self.library)
        changed['corridor']['implementation_status'] = 'contract_only'
        self.assertTrue(any('no verified' in b for b in mw.compile_plan(self.data,changed)['blockers']))
        self.data['zones'][2]['parameters']['sequence'] = [1,3,5,5,6]
        self.data['stages'][2]['success_target'] = 'red'
        mw.validate(self.data,self.library)
        self.assertTrue(any('only nine targets' in b for b in mw.compile_plan(self.data,self.library)['blockers']))

    def test_cli_check_writes_complete_bundle_and_ready_does_not_approve(self):
        with tempfile.TemporaryDirectory() as folder:
            spec = Path(folder)/'map.yaml'
            spec.write_text(yaml.safe_dump(self.data),encoding='utf-8')
            command = [sys.executable,str(mw.ROOT/'tools/map_workflow.py')]
            result = subprocess.run(command+['check',str(spec)],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)
            self.assertEqual(len(list((spec.parent/'generated').iterdir())),4)
            result = subprocess.run(command+['plan',str(spec),'--ready'],capture_output=True,text=True)
            self.assertEqual(result.returncode,1)
            self.assertFalse((spec.parent/'approval.yaml').exists())


if __name__ == '__main__':
    unittest.main()
