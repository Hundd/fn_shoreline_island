"""Independent feature039 data checks; these do not execute Verse or gameplay."""
import copy
import math
import unittest
from pathlib import Path

import yaml


ROOT = Path(__file__).resolve().parents[2]


def validate_contract(contract):
    nodes = {n['id']: n for n in contract['nodes']}
    assert len(nodes) == len(contract['nodes']), 'duplicate node'
    assert set(nodes) == {'starter', 'first', 'reuse', 'fork', 'left', 'right', 'finish'}
    edges = {(e['source'], e['destination']): e for e in contract['jump_edges']}
    assert len(edges) == len(contract['jump_edges']), 'duplicate edge'
    receivers = {r['target_id']: r for r in contract['receivers']}
    assert len(receivers) == 8 and set(receivers) == set(range(8)), 'target IDs'
    assert contract['skill']['instructions'] == ['Load', 'Heat', 'Pop'], 'instructions'
    for node in nodes.values():
        assert node['size'][0] >= 4 and node['size'][1] >= 4 and node['size'][2] > 0
        assert 0 <= node['center'][0] - node['size'][0] / 2
        assert node['center'][0] + node['size'][0] / 2 <= 34
        assert 0 <= node['center'][1] - node['size'][1] / 2
        assert node['center'][1] + node['size'][1] / 2 <= 37
    for (source, destination), edge in edges.items():
        assert source in nodes and destination in nodes and edge['kind'] == 'jump'
        a, b = nodes[source], nodes[destination]
        dx = max(0, abs(a['center'][0] - b['center'][0]) - (a['size'][0] + b['size'][0]) / 2)
        dy = max(0, abs(a['center'][1] - b['center'][1]) - (a['size'][1] + b['size'][1]) / 2)
        assert abs(math.hypot(dx, dy) - edge['edge_gap_m']) < 0.01, 'gap mismatch'
        assert 0 < edge['edge_gap_m'] <= 1.2
        assert a['center'][2] == b['center'][2]
    expected_paths = [
        ['starter', 'first', 'reuse', 'fork', 'left', 'finish'],
        ['starter', 'first', 'reuse', 'fork', 'right', 'finish'],
    ]
    assert contract['required_paths'] == expected_paths, 'equal routes'
    for path in expected_paths:
        for source, destination in zip(path, path[1:]):
            assert (source, destination) in edges, 'missing predecessor'
    for receiver in receivers.values():
        assert receiver['from_landing'] in nodes
        destination = receiver['creates']
        if destination in nodes:
            assert (receiver['from_landing'], destination) in edges, 'receiver shortcut'
        else:
            assert destination is None or destination == 'basket_overflow'
    assert receivers[5]['from_landing'] == receivers[6]['from_landing'] == 'fork'
    assert receivers[5]['creates'] == 'left' and receivers[6]['creates'] == 'right'
    assert edges['fork', 'left']['edge_gap_m'] == edges['fork', 'right']['edge_gap_m']
    assert receivers[7]['from_landing'] == 'finish'


class PopbridgeContractTests(unittest.TestCase):
    def setUp(self):
        data = yaml.safe_load((ROOT / 'specs/039-popcorn-parkour/map.yaml').read_text())
        self.contract = next(d for d in data['devices'] if d['id'] == 'controller')['settings']['course_contract']

    def test_approved_both_routes_geometry(self):
        validate_contract(self.contract)

    def rejects(self, mutate):
        bad = copy.deepcopy(self.contract)
        mutate(bad)
        with self.assertRaises((AssertionError, KeyError)):
            validate_contract(bad)

    def test_duplicate_nodes(self):
        self.rejects(lambda c: c['nodes'].append(copy.deepcopy(c['nodes'][0])))

    def test_duplicate_target(self):
        self.rejects(lambda c: c['receivers'][6].update(target_id=5))

    def test_wrong_instruction(self):
        self.rejects(lambda c: c['skill'].update(instructions=['Load', 'Pop', 'Heat']))

    def test_receiver_shortcut(self):
        self.rejects(lambda c: c['receivers'][7].update(from_landing='starter'))

    def test_missing_predecessor(self):
        self.rejects(lambda c: c['jump_edges'].pop(3))

    def test_unequal_route(self):
        self.rejects(lambda c: c['required_paths'][1].remove('fork'))

    def test_invalid_gap(self):
        self.rejects(lambda c: c['jump_edges'][0].update(edge_gap_m=0))

    def test_floor_height_shortcut(self):
        self.rejects(lambda c: c['nodes'][4]['center'].__setitem__(2, 0))


if __name__ == '__main__':
    unittest.main()
