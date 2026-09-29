# Plan - Classifier: Sort and Check, revision 2

## Inspected basis

Existing read-only `evidence/editor-inventory.json` records four signal floor AABBs, top Z=2400 cm: X=-4600..-1800, -7400..-4600, -10200..-7400, -13000..-10200; all Y=-600..2700. Keep origin (-13000,-600,2400), site 112 x 33 x 9 m. Targets/controls below are proposed anchors, not measured placements. Evidence is historical; reconcile live scene before implementation.

`signal_station` currently uses ten buttons, manual categories and rule/run modes with fixed Apple/Puppy/Car fixtures and an optional separate mistake UI. `signal_progress` holds three completion flags and the Classifier Badge. Both source APIs were inspected. Revision 1 proposed nine shots, thirteen answer assemblies and roughly 93 m of travel. Revision 2 uses seven shots, three assemblies and a 9 m approach; no inter-round travel. 028's user-reported working/fun solo play is a design reference, not acceptance evidence for 029.

## Concrete layout

All local coordinates are metres; world_cm = origin_cm + 100 * local_m.

| Element | Anchor/envelope | Role |
|---|---|---|
| Arrival | (109,11,0), zone X=108..112 | Existing approach annotation, no spawn/granter. |
| Firing position | (100,11,0), bay X=84..108 | 9 m straight approach at Y=11, 3 m wide. |
| A/B/C | (97,17,1.8), (100,17,1.8), (103,17,1.8) | 1.5 m faces, 3 m spacing, face toward -Y. |
| Object display | (105.5,18,1.6), max 1.5 m cube | One visible item to the right of targets; unshootable, optional low support. |
| Main board | center (100,19,3.8), max 10 x 1.6 m | Persistent instruction, item name, section/item count, result/hint. |
| Lights | X=98.5,100,101.5; Y=19; Z=5 | Three learning sections, text duplicates color. |
| Replay / Return | (106,9,1), (106,13,1) | Beside firing position, outside 3 m approach strip Y=9.5..12.5. |
| Protected field note | approximately (110.5,21) | Existing cargo interaction kept accessible; not part of this puzzle. |

One forward view: outer target angle about 27 degrees and display about 38 degrees from the firing point. The object is beside, not behind, the middle target. Display maximum X extent 106.25 leaves space from right target edge 103.75. Board lower edge 3 m, above answer faces (top 2.55 m); final label placement must also pass perspective review. No mandatory aim below muzzle height. Minimum headroom 4 m if retaining one useful shelter. No continuous new wall/roof requirement. Inactive objects are hidden/parked, not stacked nearby.

## Exact fixtures and teaching feedback

| Step | Object / prompt | Correct ID | Correct reason / section |
|---|---|---|---|
| label_burger | BURGER / Shoot its category | 0 Food | A burger is food we can eat. |
| label_chair | CHAIR | 1 Furniture | A chair furnishes a room for sitting. |
| label_car | CAR | 2 Vehicle | A car transports people. Section 0 complete. |
| fix_chair | CHAIR / Pix predicts VEHICLE | 1 Furniture | The chair is furniture. Check the item, not just Pix's label. Section 1 complete. |
| new_banana | NEW EXAMPLE: BANANA | 0 Food | A banana is food too. |
| new_sofa | NEW EXAMPLE: SOFA | 1 Furniture | A sofa is furniture for sitting. |
| new_tractor | NEW EXAMPLE: TRACTOR | 2 Vehicle | A tractor transports people and pulls loads. Section 2; finish. |

All seven decisions use the same [Food,Furniture,Vehicle] target array. Category icons are eat/seat/transport symbols, never the current item itself revealing the answer. First hint uses item function (for chair: `What is it used for?`); second gives the category and concrete reason. Object name avoids miniature-car ambiguity; do not call a display a toy. No accuracy percentage is shown in 029; confidence is explored in 030. Feedback never claims one correction retrained a model. New-example success means these examples fit, not that all future items will.

## Exact scene ownership policy

Preserve four support floors, global weapon/respawn setup, signal_progress, signal_badge_tracker, journal/finale, hub destination, shared promenade and field_note_cargo (including any prop it depends on). Export incoming/outgoing bindings and source subscriptions. Retire four old placed signal_station controllers before replacement; reuse one outer controller if compatible. Reuse suitable boards/buttons/HUD after unbinding. Retire old station-only boats/docks, rule boards, claim/run/button banks and obsolete lighthouse identity dressing. Inspect campus_signal_beacon_hall/campus_signal_station_identity components: shared roots or overlapping bounds alone never authorize deletion. Keep unused tiles physically safe and clear of implied objectives. Revision-1 conveyors/lifts/dispatch machinery were proposed, not proven placed: do not fabricate removals or add them.

Six example props plus at most one display support; only one example visible. Additional physical scenery follows asset-palette.md's functional limit. Qualify six objects and matching names before placement; category and held-out distinction must survive substitution.

## Implementation discipline and reuse

This is a documentation-only revision. No scene, Verse, project or matchmaking changes are authorized by this request. After explicit approval of the concrete revision, record its current review digest and pass `plan --ready`; implementation can then use `$uefn-map-implementation`. Do not reuse 028's approval for these features.

Reuse `corridor` and `shooting_gallery`, the shared Data Blaster, attributed `data_target` hit surfaces, and the solo bounds/generation/quiet-hit approach now used by `pattern_line`. This is a reusable basis, not an existing drop-in adapter: the old station's button/ownership controller cannot implement these semantics through YAML settings alone. Refactor one existing mission controller for this scoped sequence after approval; disable/remove the other three placed controllers and all old runtime subscriptions. Do not duplicate the complete mission framework or alter other missions' target behavior. Reuse `stationary_y_facing` only after verifying forward offset/sign for this bay; the Confidence bay faces the opposite Y direction from 028.

Each target assembly has a Verse target, damage-only trigger, ring visual and label; reconcile optional cone/VFX/audio dependencies explicitly. Three assemblies are not three engine actors. Share feedback only where it cannot leak between actors/runs. Planned functional counts: one controller, three assemblies, one main board, one existing hub sign updated in place, one HUD, two ordinary buttons, three progress lights, one feedback effect and one existing audio reference. Target label boards are additional to the one main board. Reuse the global blaster/granter, existing progress/tracker/round settings and hub destination. Bounds polling avoids adding enrollment/bay zones or a replay teleporter. All three choices remain fixed and visible during play; scoring is locked during transitions and inactive hit surfaces are parked on reset.

Choose existing project icons or qualified native assets; raw mesh catalog hits are not proof of Creative eligibility. No image generation or asset import is needed for this planning task. Full actor rotations/scales, mesh front axes, pivots, collisions, native setters and exact removal identities belong to serialized preflight. Record expected/actual transforms and dependencies before mutation, checkpoint, apply one group, read back, then save. Any missing eligible object equivalent or materially changed layout/lesson returns to planning.

## Shared lifecycle, feedback and badge contract

Auto-ready one in-bay player, retaining their current character identity. No claims, enrollment, cooperative credit or roster. Ignore non-owner/out-of-bay hits. Entry within 0.5 s; leave, elimination/respawn, disconnect and round reset cancel the run generation before hiding effects/restoring objects. Return cancels before teleport. Replay is enabled only at finish and starts all teaching steps. Leaving the bay and returning is the supported mid-run restart.

On accepted hit, lock correctness synchronously before any suspended work. Show result/cue within 0.25 s and hold result for at least 1 s. Keep the old result during the 1.5 s minimum transition. Re-enable hit observation under a scoring lock after 1 s; require 0.5 s with no owner hit before arming the next decision. Continued fire keeps the current result and a short `Release fire to continue` cue; never award the next answer from a held burst. Wrong-hit debounce 0.4 s; one hint after first mistake and explicit useful answer/reason after second. Hints do not hide current evidence/object. Reset hint count on accepted decision.

Run-local sections drive lights. Persistent managers expose `complete(player)`, NOT `complete(player, index)` and do not advance `state.challenge` themselves. On valid final completion, if not already badge-earned, obtain `ensure_player(player)`, assign `state.challenge` to each section 0,1,2 in order and call `complete(player)` for each in one non-suspending guarded block. Retain final challenge=2 and manager identity. No partial write on abandoned runs; existing earned badge survives replay; manager round reset clears persistent state. Test with clean, partial legacy and already-earned states. Preserve existing tracker, journal and finale consumers; never synthesize a second badge.

## Verification and handoff

Run `check`, inspect preview and generated plan, and record planning evidence. After approval, require exact scene readbacks, Verse build, UEFN validation/cook and normal solo AC-01..09. Test all target edges, muted audio, held fire, wrong actions, departure during feedback, death/respawn, return/replay, round reset, partial legacy state and badge/journal. Capture eye-level views, not just overhead blockout. A first-time tester's explanation/enjoyment supplies educational evidence; no invented pass from compilation. Leave individual untested scenarios visible. Stop the active game and confirm non-running state with editor open.
