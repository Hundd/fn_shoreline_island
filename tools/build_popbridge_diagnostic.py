"""Generate a temporary Verse runner from reviewed feature039 data; no editor calls."""
import hashlib
from pathlib import Path
import yaml

ROOT = Path(__file__).resolve().parents[1]
data = yaml.safe_load((ROOT / 'specs/039-popcorn-parkour/map.yaml').read_text())
contract = next(d for d in data['devices'] if d['id'] == 'controller')['settings']['course_contract']
ids = {n['id']: i for i, n in enumerate(contract['nodes'])}
stages = {}
for path in contract['required_paths']:
    for stage, name in enumerate(path):
        assert name not in stages or stages[name] == stage
        stages[name] = stage
origin = data['map']['origin_cm']
def vec(values):
    return 'vector3{' + ', '.join(f'{axis} := {float(value):.3f}' for axis, value in zip('XYZ', values)) + '}'
def world(values):
    return [offset + value * 100 for offset, value in zip(origin, values)]
nodes = []
for node in contract['nodes']:
    terminal = node['id'] == contract['required_paths'][0][-1]
    milestone = {'first': 0, 'reuse': 1}.get(node['id'], -1)
    nodes.append(f'popbridge_node{{id := {ids[node["id"]]}, center := {vec(world(node["center"]))}, size := {vec([v * 100 for v in node["size"]])}, initially_built := {str(node["initially_built"]).lower()}, milestone := {milestone}, route_stage := {stages[node["id"]]}, terminal := {str(terminal).lower()}}}')
edges = [f'popbridge_edge{{source := {ids[e["source"]]}, destination := {ids[e["destination"]]}, gap_cm := {e["edge_gap_m"] * 100:.3f}}}' for e in contract['jump_edges']]
receivers = []
for receiver in contract['receivers']:
    creates = ids.get(receiver['creates'], -2 if receiver['creates'] == 'basket_overflow' else -1)
    instruction = receiver['target_id'] if receiver['target_id'] < 3 else 3
    receivers.append(f'popbridge_receiver{{target_id := {receiver["target_id"]}, from_landing := {ids[receiver["from_landing"]]}, creates := {creates}, instruction := {instruction}}}')
fixture_hash = hashlib.sha256((ROOT / 'Content/fn_shoreline_island_popbridge_fixtures.verse').read_bytes()).hexdigest()
run_id = '039-A-20261004-r02'
source = 'using { /Fortnite.com/Devices }\nusing { /Verse.org/Simulation }\nusing { /UnrealEngine.com/Temporary/SpatialMath }\n\n'
source += 'fn_shoreline_island_popbridge_diagnostic := class(creative_device):\n    OnBegin<override>()<suspends>:void =\n        Hide()\n'
source += f'        Print("POPBRIDGE_DIAG {run_id} BEGIN fixture_sha256={fixture_hash}")\n'
for name, records in [('nodes', nodes), ('edges', edges), ('receivers', receivers)]:
    source += f'        {name} := array{{\n            ' + ',\n            '.join(records) + '}\n'
source += '        checks := fn_shoreline_island_popbridge_fixtures{}\n        check_code := checks.self_check(nodes, edges, receivers)\n'
source += f'        Print("POPBRIDGE_DIAG {run_id} END result={{check_code}}")\n'
(ROOT / 'Content/fn_shoreline_island_popbridge_diagnostic.verse').write_text(source)
print(f'Generated {run_id} from actual reviewed YAML; fixture={fixture_hash}')
