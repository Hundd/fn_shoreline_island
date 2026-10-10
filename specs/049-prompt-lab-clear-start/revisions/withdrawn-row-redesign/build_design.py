"""Generate the authored revision from the prior mission contract; no Unreal calls."""
from pathlib import Path
import yaml

root = Path(__file__).resolve().parents[2]
out = Path(__file__).resolve().parent
data = yaml.safe_load((root / 'specs/026-prompt-lab-aim-refine-deliver/map.yaml').read_text(encoding='utf-8'))
data['map'].update(id='prompt_lab_clear_start', title='Prompt Lab - Clear Start, Clear Choices', source_feature='specs/049-prompt-lab-clear-start/spec.md', learning_objective='Help Pix choose WHAT, resolve WHICH ONE with useful details, then specify WHERE; see the result of an actionable request.')
zones = {z['id']: z for z in data['zones']}
zones['arrival'].update(label='Entry',position=[0,0,0],size=[14,62,15],purpose='Grounded auto-entry with a clearly labelled Start/Restart control and always-open west exit.',completion='Automatic full-platform enrollment or explicit Start; idempotent after readiness.',reset='Actual full-room departure removes participant; last participant departure resets.')
zones['knowledge'].update(position=[14,25,0],size=[8,12,15],purpose='Persistent request visible from the marked firing area; one-second welcome and four-second lesson.',overlap_with=['arena','reward'],completion='Four-second lesson completes; current instruction persists.')
zones['knowledge']['parameters'].update(duration_seconds=4,lesson='Useful details help Pix choose the right core and its destination.')
zones['arena'].update(position=[14,0,0],size=[52,62,15],purpose='Five hits from a clear marked firing area; one row of visible answers with explanatory wrong-choice recovery.',overlap_with=['knowledge','reward'],reset='Restart cancels stale work and reenrolls occupants; full-room departure resets only when empty; retain earned DATA/badge.')
zones['reward'].update(position=[14,27,0],size=[8,6,15],purpose='Observe the distant delivery and receive badge/HUD where already standing; no walk required for reward.',overlap_with=['knowledge','arena'],completion='Automatic visible delivery and badge feedback at the firing area.',reset='Replay preserves earned DATA and badge; cancel stale finale.')
zones['reward']['parameters']['return_mode']='walk west any time; existing rail optional only'
data['connections']=[dict(**{'from':'arrival','to':'knowledge'},mode='walk',width=3,points=[[12,30,0],[17,30,0]],gate='always'),dict(**{'from':'knowledge','to':'arena'},mode='walk',width=3,points=[[17,30,0],[18,30,0]],gate='always'),dict(**{'from':'arena','to':'reward'},mode='walk',width=3,points=[[18,30,0],[17,30,0]],gate='always')]
ys=[12,24,36,54,42,48,6,18,30]
for m in data['markers']:
    if m['kind']=='target':
        m['position']=[50,ys[m['target_id']],2.2]
        m['source']='PROPOSED row anchor; current measured anchor in evidence/live-survey.json. Full owned assembly reconciliation and cooked sightlines required.'
    elif m['id']=='arrival_point': m.update(position=[5,30,0],source='PROPOSED grounded external hub/west-ramp arrival annotation; no spawn pad.')
    elif m['id']=='blaster_inventory': m.update(position=[6,33,0])
    elif m['id']=='lesson_board': m.update(zone='arena',position=[52,30,6.5],source='PROPOSED existing board anchor, west-facing yaw180, persistent request and step; no new board controller.')
    elif m['id']=='module': m.update(position=[21,32,0],label='Automatic badge and visible delivery; no required reward walk',source='Information overlay at firing area; preserve actual distant module at local[64,23,2.7]. No reward prop placement here.')
    elif m['id']=='return_exit': m.update(zone='arena',position=[63,20,3.4],source='Historical measured rail anchor: specs/026-prompt-lab-aim-refine-deliver/evidence/read-only-inspection.json; preserve unchanged; actual boarding remains unverified.')
    elif m['id']=='walk_return': m.update(position=[0,30,0],source='PROPOSED always-open west walking exit annotation; preserve existing ramp, retest reverse route.')
data['markers'] += [dict(id='start_control',kind='checkpoint',zone='arrival',label='Start / Restart / Play again',position=[12,30,0.9],source='PROPOSED relocation of existing prompt_lab_replay_button; no additional controller.'),dict(id='firing_area',kind='checkpoint',zone='knowledge',label='Firing area: X14..20, Y27..33; face east',position=[17,30,0],source='PROPOSED noncolliding outline; center plus four corners are sightline acceptance points.')]
dev={d['id']:d for d in data['devices']}
dev['entry']['settings'].update(tiles=[13,13,3],native_actor_world_cm=[9300,-5400,2360],purpose='Whole-platform grounded occupancy; automatic enrollment and departure lifecycle')
dev['controller']['settings'].update(sequence_policy='Retain fixed [0,3,5,5,6]; scoped readiness, lifecycle and feedback changes in existing controller',hints='Persistent evolving request and stage-specific mismatch explanations',lifecycle='Reset only after actual full-platform last departure; restart cancels work and reenrolls current occupants')
dev['targets']['settings'].update(action='reuse; one visible row; recenter core visual bounds; move machinery behind row',resolved_delta='plan.md coordinate delta; native wrappers resolved in implementation preflight',machinery_height_policy='Retain measured floor Z; machine centers X53 at matching target Y',required_hit_coverage='Center and outer third from center/four corners standing/crouched, plus full moving sweep')
dev['board']['settings'].update(knowledge_seconds=4,proposed_local_anchor=[52,30,6.5],current_copy='Evolving request, next action and step; stage-specific useful-detail feedback')
dev['replay']['settings'].update(action='reuse; move existing button to [12,30,0.9], yaw180, scale1, max radius2m',label='Start mission / Restart mission / Play again')
dev['return_rail']['settings']['action']='preserve unchanged; optional return only; west walking exit is authoritative'
for s in data['stages']:
    if s['id']=='enter': s.update(completion='Ready grounded entry or explicit Start enrolls; no invisible movement requirement')
    if s['id']=='intro': s.update(purpose='One-second welcome, four-second lesson; persistent request stays readable',completion='Choices activate by6s from ready entry')
    if s['id']=='finale': s.update(completion='Automatic delivery, same Prompt Badge and3 DATA; completion explanation and west return visible from firing area')
data['assumptions']=[dict(id='runtime_adapter',status='resolved',detail='Fixed sequence only; scoped improvements use existing controller and startup_ready, occupancy, generation and target hooks. Changes are explicitly proposed, not already supported YAML configuration.',evidence='Current Content/fn_shoreline_island_prompt_blaster.verse and fn_shoreline_island_data_target.verse; plan.md code delta'),dict(id='survey_and_runtime',status='resolved',detail='Native floor/zone/target anchors measured. Floating/partial zone is a hypothesis; exact FNE runtime overlap and sightlines are mandatory post-implementation acceptance, not proven by editor bounds.',evidence='evidence/live-survey.json; user reports intermittent start and hidden targets; spec.md AC-01..04'),dict(id='ownership_and_isolation',status='resolved',detail='Preserve shared devices and Prompt Workshop; only exact listed passive presentation objects retire. Conflicting references or additional obstructions require plan amendment before mutation.',evidence='plan.md exact retirement scope and source audit'),dict(id='verification_scope',status='resolved',detail='Cooked coverage, lifecycle, shared-state and first-time learning remain acceptance gates. No gameplay completion or historical approval is claimed.',evidence='spec.md and tasks.md')]
data['map']['title']='WITHDRAWN - Prompt Lab row redesign'
data['assumptions'].append(dict(id='producer_scope_revision',status='open',detail='Owner questioned excessive redo; independent Producer withdrew this row redesign from approval review. Diagnose runtime failures and replace with a focused repair preserving unaffected layout, mission and timings before approval or implementation.',evidence='docs/producer/prompt-lab-focused-improvement.md; user request to check with Producer, 2026-10-09'))
(out/'map.yaml').write_text(yaml.safe_dump(data,sort_keys=False,allow_unicode=True),encoding='utf-8')



