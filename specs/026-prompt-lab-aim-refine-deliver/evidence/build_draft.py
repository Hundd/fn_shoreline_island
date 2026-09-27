"""Reproduce this feature's authored draft from the preserved feature-025 baseline."""
from pathlib import Path
import json
import hashlib
import yaml

ROOT = Path(__file__).resolve().parents[3]
FEATURE = Path(__file__).resolve().parents[1]
base = yaml.safe_load((ROOT / 'specs/025-map-planning-workflow/map.yaml').read_text(encoding='utf-8'))
base['map'].update(id='prompt_lab_aim_refine_deliver', title='Prompt Lab - Aim, Refine, Deliver', intent='propose_change', source_feature='specs/026-prompt-lab-aim-refine-deliver/spec.md', min_path_width=3)
base['map']['learning_objective'] = 'Choose WHAT, add WHICH ONE, then choose WHERE; useful details make a prompt actionable.'
z = {v['id']: v for v in base['zones']}
z['arrival'].update(label='Approach / walk back', position=[0,30,0], size=[20,32,15], purpose='Reuse the west approach and entry volume; keep an ungated walking return.', reset='Walking out does not reset current source. Replay or last participant leaving the playspace resets.')
z['knowledge'].update(label='Pix hints', position=[20,34,0], size=[14,14,15], purpose='Read existing scripted Pix hints from the firing area; no walk to a board is required.')
z['arena'].update(label='Aim / Refine / Deliver', position=[20,30,0], size=[35,32,15], purpose='Five hits from the common firing area; blue, LARGE detail, large blue, moving acquisition, reactor.', reset='Replay cancels delayed work and resets the shared stage; last enrolled participant leaving the playspace resets. Walking out alone does not reset. Replay retains DATA and badge.')
z['reward'].update(label='Finale', purpose='Preserve distant module spectacle and badge; walking return uses the same west approach. Rail boarding remains unverified.')
z['reward']['parameters']['return_mode'] = 'walk back via west approach; existing rail is optional and unverified'
base['connections'] = [
    dict({'from':'arrival','to':'knowledge'}, mode='walk', width=3, points=[[15,33,0],[20,40,0],[24,46,0]], gate='always'),
    dict({'from':'knowledge','to':'arena'}, mode='walk', width=3, points=[[24,46,0],[24,47,0]], gate='always'),
    dict({'from':'arena','to':'reward'}, mode='walk', width=3, points=[[24,47,0],[24,59,0],[55,59,0]], gate='always'),
]
# Reward route is OPTIONAL. The badge is automatic on finale; no walk is required.
# Stage gating controls target activation and the existing module door, not these floor routes.
positions = [[30,52,2.2],[30,40,2.2],[30,46,2.2],[36,38,2.2],[38,43,2.2],[38,51,2.2],[46,54,2.2],[46,48,2.2],[46,42,2.2]]
for marker in base['markers']:
    if marker['kind'] == 'target':
        marker['position'] = positions[marker['target_id']]
        marker['source'] = 'PROPOSED hit-surface anchor, not measured geometry; baseline evidence/read-only-inspection.json target_' + str(marker['target_id']) + '; translate complete assembly with preserved offsets; see plan.md'
    elif marker['id'] == 'lesson_board':
        marker['position'] = [30,34,4]
        marker['label'] = 'Pix hints: existing board + HUD'
        marker['source'] = 'PROPOSED board anchor; measured baseline [35,46,11.9]; preserve yaw 180 and scale 3 pending readability test'
    elif marker['id'] == 'return_exit':
        marker['label'] = 'Optional rail / boarding unverified'
        marker['source'] = 'MEASURED rail actor anchor in evidence/read-only-inspection.json; spline and hub endpoint not surveyed'
    elif marker['id'] == 'module':
        marker['source'] = 'MEASURED unchanged module anchor in evidence/read-only-inspection.json; automatic reward, not required walk'
    elif marker['id'] == 'arrival_point':
        marker['source'] = 'MEASURED entry-volume center in evidence/read-only-inspection.json; denotes hub arrival, not a spawn pad'
base['markers'].append(dict(id='walk_return', kind='exit', zone='arrival', label='Walk back west / always open', position=[0,40,0], source='PROPOSED route annotation at existing platform edge; west ramp verified inbound in feature 024; outbound retest needed'))
dev = {v['id']:v for v in base['devices']}
dev['controller']['settings'].update(sequence_policy='preserve fixed source sequence; YAML does not configure stages', hints='existing authored messages only', lifecycle='preserve playspace-departure reset; no volume-exit reset')
dev['targets']['settings'].update(action='reuse; relocate full assemblies', proposed_anchor_height_m=2.2, required_hit_coverage='preserve current generous surface; verify maximum pulsed ring coverage and no overlap', moving_target_id=5, moving_offset_y_m=2.5, moving_leg_seconds=4)
dev['hit_surfaces']['settings'].update(action='reuse; relocate with target assemblies', inactive_behavior='preserve runtime parking 100m below home')
dev['board']['settings'].update(action='reuse; reposition existing board', proposed_local_anchor=[30,34,4], current_copy='preserve hardcoded stage messages')
dev['return_rail']['settings'].update(action='preserve; no rail geometry mutation in this proposal', acceptance='optional only; existing boarding/endpoint acceptance open')
dev['replay']['settings'].update(action='preserve existing binding and transform; survey player access before readiness')
for stage in base['stages']:
    if stage['id']=='intro': stage['purpose']='Existing 2s spectacle then 7s scripted AI Knowledge; board stays visible after timed HUD'
    if stage['id']=='finale': stage['completion']='Existing Pix delivery and module spectacle; eligible participants get badge and 3 DATA; return rail enabled; walking exit stays open'
base['assumptions'] = [
 dict(id='fixed_adapter', status='resolved', detail='Use only fixed [0,3,5,5,6] sequence and current authored hints; no new Verse, LLM, hint button, wave, timer or scoring rule.', evidence='Content/fn_shoreline_island_prompt_blaster.verse; live configured=true and nine ordered targets in evidence/read-only-inspection.json'),
 dict(id='design_review', status='open', detail='Human must review proposed target layout, lowered board, scripted hints and optional rail. No approval record exists.', evidence='User planning-only request; spec.md and generated/preview.html'),
 dict(id='assembly_survey', status='open', detail='Resolve all target mesh pivots, actual pulsed footprints, collisions, cone/VFX/audio anchors and savedActor references into complete transforms; test sightlines from the firing area before execution readiness.', evidence='13 anchor transforms measured; Verse device readback contains wrapper refs for native actors. plan.md scene delta is not a complete native payload.'),
 dict(id='approach_and_replay', status='open', detail='Survey existing replay control and entry volume extents; prove proposed walking lane, board clearance and reverse west-ramp return. Full rail spline remains outside this compact preview.', evidence='Feature 024 west inbound walk succeeded; return-boarding-comparison-2026-09-27.md leaves rail boarding open.'),
 dict(id='lifecycle_scope', status='resolved', detail='Preserve shared replay and playspace-departure behavior. Walking out does not unsubscribe participants or auto-reset; replay does not clear participants. Late entrants do not receive a fresh full intro mid-stage.', evidence='on_enter/on_leave/on_replay in current controller; no AgentExitsEvent subscription. Additional behavior requires separately reviewed code scope.'),
 dict(id='verification_gate', status='resolved', detail='Future implementation must pass cooked solo/cooperative, hit coverage, reset, board readability and learning checks before acceptance. These are post-implementation tests, not evidence supplied by draft validation.', evidence='spec.md acceptance scenarios and tasks.md; feature 024 acceptance remains partial'),
]
(FEATURE / 'map.yaml').write_text(yaml.safe_dump(base, sort_keys=False, allow_unicode=True, width=100), encoding='utf-8')
# Baseline records source bytes before any proposed implementation. Never overwrite it on regeneration.
snapshot = FEATURE / 'evidence/source-baseline.json'
if not snapshot.exists():
    paths = sorted((ROOT / 'Content').glob('*.verse')) + [ROOT/'Content/fn_shoreline_island.umap']
    snapshot.write_text(json.dumps({str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}, indent=2)+'\n', encoding='utf-8')
print('Wrote planning map only:', FEATURE / 'map.yaml')
