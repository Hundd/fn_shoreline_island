"""Offline regressions for the deterministic map review gate."""
import copy
import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import map_workflow as mw
import map_gate as mg
import yaml


class GateTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.original = mw.read_yaml(mw.DEFAULT)
        cls.library = mw.patterns()

    def setUp(self):
        self.data = copy.deepcopy(self.original)

    def test_example_blocks_on_open_assumptions(self):
        result = mg.gate(self.data, self.library)
        self.assertEqual(result["verdict"], "blocked")
        self.assertIn("OPEN_ASSUMPTION", {b["code"] for b in result["blockers"]})
        self.assertGreaterEqual(result["counts"]["blockers"], 1)
        self.assertTrue(result["review_digest"])

    def test_clean_map_passes_with_advisories(self):
        self.data["assumptions"] = []
        result = mg.gate(self.data, self.library)
        self.assertEqual(result["verdict"], "pass")
        self.assertEqual(result["counts"]["blockers"], 0)
        self.assertEqual(result["counts"]["violations"], 0)
        self.assertGreater(result["counts"]["advisories"], 0)

    def test_orphan_target_is_a_violation(self):
        self.data["assumptions"] = []
        arrival = next(z for z in self.data["zones"] if z["id"] == "arrival")
        self.data["markers"].append({
            "id": "orphan_target", "kind": "target", "zone": "arrival",
            "label": "orphan", "position": [arrival["position"][0] + 1, arrival["position"][1] + 1, 1.9],
            "source": "synthetic test", "target_id": 99,
        })
        mw.validate(self.data, self.library)  # still structurally valid, only orphaned
        result = mg.gate(self.data, self.library)
        self.assertEqual(result["verdict"], "fail")
        self.assertIn("MARKER_UNUSED", {v["code"] for v in result["violations"]})

    def test_contract_only_pattern_blocks(self):
        self.data["assumptions"] = []
        changed = copy.deepcopy(self.library)
        changed["corridor"]["implementation_status"] = "contract_only"
        result = mg.gate(self.data, changed)
        self.assertEqual(result["verdict"], "blocked")
        self.assertIn("CONTRACT_ONLY", {b["code"] for b in result["blockers"]})

    def test_review_digest_binds_to_map_revision(self):
        self.data["assumptions"] = []
        before = mg.gate(self.data, self.library)["review_digest"]
        self.data["zones"][0]["size"][1] = 31
        after = mg.gate(self.data, self.library)["review_digest"]
        self.assertNotEqual(before, after)

    def test_cli_exit_codes(self):
        command = [sys.executable, str(mw.ROOT / "tools/map_gate.py"), "gate"]
        blocked = subprocess.run(command + [str(mw.DEFAULT)], capture_output=True, text=True)
        self.assertEqual(blocked.returncode, 1, blocked.stderr)
        self.assertEqual(json.loads(blocked.stdout)["verdict"], "blocked")
        with tempfile.TemporaryDirectory() as folder:
            spec = Path(folder) / "map.yaml"
            clean = copy.deepcopy(self.original)
            clean["assumptions"] = []
            spec.write_text(yaml.safe_dump(clean), encoding="utf-8")
            passed = subprocess.run(command + [str(spec)], capture_output=True, text=True)
            self.assertEqual(passed.returncode, 0, passed.stderr)
            self.assertEqual(json.loads(passed.stdout)["verdict"], "pass")


if __name__ == "__main__":
    unittest.main()
