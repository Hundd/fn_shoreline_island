# Independent HUD-size retest — 2026-10-05

Original gpt-6.1-sol QA; affected scope only size18→96 on existing feedback HUD. No source/gameplay edits, event injection, synthetic hit, course/arrival acceptance, or repeat starter test. Reference repair/validation/cook evidence: `startability-hud-repair-2026-10-05.md`.

Actual real final receiver rifle hit showed the full instruction `Start at LOAD. Follow the ramp to the starting platform.` clearly. Core remained0/8 and Workshop-next HUD remained unchanged; no activity claim occurred. Captured `startability-hud-retest-readable.jpg` at1280×720. The unreadably tiny font defect is corrected at96. Presentation observation: it wraps into seven large lines, roughly40px high, occupying the central upper half of the screen and overlapping the target view. Readability passes; this oversized layout warrants a bounded shorter-copy/font polish rather than blanket visual-quality acceptance.

## Verified bounded test setup

Current session remained Connected. Normal StartGame first produced hub; stopped it. Fresh observed UEFN Session dropdown showed Spawn At Viewport Camera originally unchecked. Recorded GetCameraTransform, checked that actual visible option, set supported EditorAppToolset.SetCameraTransform to location(-2220,-17200,2597), rotation(pitch0,yaw90,roll0), scale1. StartGame{} in the existing connected session actually spawned at the finish, as confirmed by the visible course/minimap. No StopSession/StartSession/relaunch or Play From Here timeout. This is explicit test setup, not normal arrival or route proof. One initial shot was low; one supported mouse aim correction produced the unique new HUD message. No diagnostic tag or observer cook was needed.

## Shutdown

StopGame Completed, fresh CanStart. Restored Spawn At Viewport Camera unchecked and observed it unchecked. Restored the recorded original viewport transform: location(-2283.050288380171,-17045.149320935921,3148.9260117910176), rotation(51.799900447034801,-158.6000788355218,-0.0000019999999986380984), scale1. Native production debug_tag readback empty. Targeted level save true, is_dirty=false; final fresh CanStart. UEFN left open. No pending calls. Explicit live ownership release sent before offline report completion.

Normal ramp/grounded LOAD response and repaired FINISH sign were already physically passed in `startability-retest-2026-10-05.md`; they were not repeated here. Other full-course/fault/human first-use coverage is unchanged.
