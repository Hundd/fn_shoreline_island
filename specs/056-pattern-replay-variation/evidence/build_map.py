"""Prepare context-only map; never changes source or editor."""
from pathlib import Path
import yaml
root=Path(__file__).resolve().parents[3]
out=Path(__file__).resolve().parents[1]
d=yaml.safe_load((root/'specs/028-pattern-scanner-cargo-circuit/map.yaml').read_text(encoding='utf-8'))
d['map'].update(id='pattern_replay_variation',title='Pattern Scanner - one authored alternate Replay set',source_feature='specs/056-pattern-replay-variation/spec.md')
for z in d['zones']:
    z['reset']='Cancel old generation; same owner restarts selected set. New round/disconnect/replacement owner restores original. Only completed Replay toggles set.'
d['zones'][1]['completion']='Solve original B/A/C or alternate C/B/A in the same bay. Existing guarded badge once.'
for m in d['markers']:
    m['source']='Accepted028 diagram context only; preserve existing scene. No creation/placement at this annotation.'
    if m['id'].startswith('answer_') or m['id'] in ['replay','return']:
        m['source']='Measured current native actor world transform converted to local meters; evidence/live-baseline.json. Preserve unchanged.'
    if m['id']=='rule':
        m['position']=[10,17.0802658,2.79]
        m['source']='Measured current board transform; evidence/live-baseline.json. Preserve unchanged.'
for x in d['devices']:
    x['source']='Existing accepted028 identity; preserve unchanged. Current controller/native evidence in evidence/live-baseline.json.'
    x['settings'].pop('action',None)
c=d['devices'][0]
c['source']='Existing pattern_line; scoped selected-puzzle/owner adapter REQUIRED by plan.md. No scene edits.'
c['settings']={'action':'local_source_adapter_after_delegated_review','preserve_saved_original_arrays':True,'original_success_ids':[1,0,2],'alternate_success_ids':[2,1,0],'selection':'Toggle only valid completed Replay; retain same owner; new round/disconnect/replacement owner original','content':'Exact six-field table in spec.md; all board/HUD/journal/answer consumers share selected record','geometry':'Preserve every actor transform and binding'}
for s in d['stages']:
    s['completion']+=' Original first-run stage shown; alternate substitutes C/B/A in the same stages. No additional walk or sequential stages.'
d['assumptions']=[
 {'id':'context','detail':'Accepted028 envelopes/routes are context, not walls or new placements. Native target/board/control markers measured; no scene delta.','status':'resolved','evidence':'evidence/live-baseline.json; plan.md'},
 {'id':'adapter','detail':'Current hardcoded controller lacks set selection. Bounded local adapter specified with inspected lifecycle and reusable target/progress APIs.','status':'resolved','evidence':'plan.md; current pattern_line source hash'},
 {'id':'learning','detail':'Exact alternate table audited for intended periods1-3; engagement and readability remain manual, not established by static checks.','status':'resolved','evidence':'../../docs/specialists/pattern-replay/learning-designer.md; spec.md'},
 {'id':'review','detail':'User delegates agent/Producer review for this task; no fabricated human approval. Standard ready gate may remain human-approval blocked. No games/session/cook/push.','status':'resolved','evidence':'plan.md; review.md'}]
(out/'map.yaml').write_text(yaml.safe_dump(d,allow_unicode=True,sort_keys=False),encoding='utf-8')
