from pathlib import Path
import yaml
root=Path(__file__).resolve().parents[3]
out=Path(__file__).resolve().parents[1]
d=yaml.safe_load((root/'specs/031-ai-error-lab-shoot-to-fix/map.yaml').read_text(encoding='utf-8'))
d['map'].update(id='error_lab_confirmed_movement',title='Error Lab - confirm Pix movement before credit',source_feature='specs/057-error-lab-movement-verification/spec.md')
for m in d['markers']:
    m['source']='Accepted031 context annotation, not a new placement or newly measured actor. Preserve scene. Track/Pix current measurement in evidence/live-baseline.json.'
for x in d['devices']:
    x['source']='Existing031 device preserved; no creation, removal, relocation or rebind in057.'
    if x['id']=='entry':
        x['settings']['poll_seconds']=0.1
    if x['id']=='controller':
        x['source']='Existing debug_station; local movement confirmation/recovery adapter in plan.md required.'
        x['settings'].update(movement_confirmation='TeleportTo true AND full3D Distance<=5cm for start and each step including STOP',failure_recovery='Same stage, no credit/mistake; truthful unknown position; guarded1s+quiet retry',observation='BEFORE only after fully confirmed demo; NOW only confirmed current placement')
d['assumptions']=[
 {'id':'context','detail':'Accepted031 envelopes and markers are unchanged context; no placement commands. Measured Pix/track bind and fulltransform preserved.','status':'resolved','evidence':'evidence/live-baseline.json; plan.md'},
 {'id':'adapter','detail':'Existing code discards movement failure. Local boolean movement confirmation, observation flags and recovery helper are required; Tool Lab confirms supported API precedent.','status':'resolved','evidence':'plan.md; current debug_station/event_station source'},
 {'id':'stages','detail':'Stage parent refs measured; friendly inner values cannot be read through installed ObjectTools. Preserve source/defaults and all saved stage refs without writes.','status':'resolved','evidence':'evidence/live-baseline.json; spec.md'},
 {'id':'review','detail':'User delegates agent/Producer review and forbids game/session/cook/push. Standard human-only ready gate remains honestly blocked, no fake approval. Runtime checks manual pending.','status':'resolved','evidence':'review.md; plan.md'}]
(out/'map.yaml').write_text(yaml.safe_dump(d,allow_unicode=True,sort_keys=False),encoding='utf-8')
