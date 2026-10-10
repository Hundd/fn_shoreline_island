"""Offline focused repair proposal; no scene mutation or approval."""
from pathlib import Path
import json
import yaml
root = Path(__file__).resolve().parents[2]
out = Path(__file__).resolve().parent
data = yaml.safe_load((root / 'specs/026-prompt-lab-aim-refine-deliver/map.yaml').read_text(encoding='utf-8'))
survey = json.loads((out / 'evidence/live-survey.json').read_text(encoding='utf-8'))
data['map'].update(id='prompt_lab_focused_repair', title='Prompt Lab - Grounded entry; existing target layout', source_feature='specs/049-prompt-lab-clear-start/spec.md', intent='propose_change')
for zone in data['zones']:
    if zone['id'] in ('arrival', 'arena'):
        zone['reset'] = 'Current source removes participation on entry-volume exit; last participant exit resets the room. Replay retains earned DATA and badge.'
    if zone['id'] == 'arrival':
        zone['purpose'] = 'Existing west approach; lower only existing enrollment volume Z by 2.4m for grounded entry. Preserve XY and departure semantics.'
    if zone['id'] == 'reward':
        zone['purpose'] = 'Distant finale spectacle; reward is automatic without walking here. Existing optional walk annotation is not a required reward route.'
for marker in data['markers']:
    marker['source'] = marker['source'].replace('evidence/read-only-inspection.json', 'specs/026-prompt-lab-aim-refine-deliver/evidence/read-only-inspection.json')
    tid = marker.get('target_id')
    if tid is not None:
        pose = survey['transforms'][f'prompt_blaster_hit_surface_{tid}']['location']
        marker['position'] = [(pose[k] - o) / 100 for k,o in zip(('x','y','z'), data['map']['origin_cm'])]
        marker['source'] = f'MEASURED unchanged native hit anchor in evidence/live-survey.json#transforms.prompt_blaster_hit_surface_{tid}; not a relocation proposal; visual correspondence needs cooked diagnosis.'
    elif marker['id'] == 'lesson_board':
        marker['source'] = 'Existing feature026 saved board anchor; unchanged. Native readback and cooked readability must be confirmed during diagnosis.'
    elif marker['id'] == 'arrival_point':
        marker['position'] = [15,33,0]
        marker['label'] = 'Entry volume: lower 2.4m; XY unchanged'
        marker['source'] = 'PROPOSED grounded arrival annotation at existing entry XY, not new geometry. Actual volume actor Z2600->2360cm (50cm below floor2410) in evidence/proposed-entry-delta.json. Native generated overlap mesh confirms present lower bound2600; cooked post-fix acceptance pending.'
    elif marker['id'] == 'walk_return':
        marker['source'] = 'Existing route annotation, not new geometry. Preserve west approach; reverse walking requires current cooked check.'
data['markers'].append(dict(id='replay_control',kind='checkpoint',zone='arrival',label='Existing Replay control (unchanged)',position=[16,34,0.9],source='MEASURED native replay transform in evidence/live-survey.json; no relocation or new control proposed.'))
for device in data['devices']:
    device['settings']['action'] = 'preserve unchanged; diagnostic baseline only'
    if device['id'] == 'entry':
        device['settings'].update(action='lower existing actor Z only; preserve all native settings and subscriptions',native_actor_before_cm=[7500,-5200,2600],native_actor_proposed_cm=[7500,-5200,2360],resolved_delta='evidence/proposed-entry-delta.json',bottom_evidence='Generated overlap mesh localZ0..384, relativeLocation0, relativeScale6/12/3 confirms present bottom2600 and top3752. Proposed bottom2360 is50cm below floor2410; verify grounded overlap after implementation.')
    if device['id'] == 'controller':
        device['settings']['lifecycle'] = 'Current on_exit calls on_leave; last volume participant leaving resets. Preserve until runtime cause is established.'
    if device['id'] == 'targets':
        for key in ('resolved_delta','proposed_anchor_height_m','machinery_height_policy'):
            device['settings'].pop(key,None)
    if device['id'] == 'board':
        device['settings'].pop('proposed_local_anchor',None)
data['assumptions'] = [
    dict(id='fixed_adapter',status='resolved',detail='Preserve current nine IDs and fixed [0,3,5,5,6] sequence, original 2s+7s intro, 2s moving-stage handoff, motion, Pix delivery, rewards and shared controller.',evidence='Current Content/fn_shoreline_island_prompt_blaster.verse; evidence/live-survey.json'),
    dict(id='withdrawn_redesign',status='resolved',detail='Earlier all-target row redesign is withdrawn, archived and excluded from this revision.',evidence='docs/producer/prompt-lab-focused-improvement.md; revisions/withdrawn-row-redesign/README.md'),
    dict(id='start_cause',status='resolved',detail='QA twice reproduced jump-only optional enrollment with landing exit/reset. Native generated overlap mesh localZ0..384, component location0/scale6,12,3 confirms lower2600, upper3752 versus floor2410. Propose only Z2360; retain XY/tiles/source. Grounded post-fix trials remain acceptance, not prior proof.',evidence='evidence/diagnostic-qa.md; evidence/live-survey.json; evidence/proposed-entry-delta.json; plan.md'),
    dict(id='start_only_scope',status='resolved',detail='Revision3 approves only the one actor Z repair. Hidden-target/visual overlap feedback remains an explicit deferred investigation, excluded from this delta. No target transforms, source, cues or decoration change.',evidence='spec.md FR-002 follow-up; tasks.md D01; current QA completed sequence but reports viewpoint-dependent overlap near Replay and presentation offsets.'),
]
(out/'map.yaml').write_text(yaml.safe_dump(data,sort_keys=False,allow_unicode=True),encoding='utf-8')
