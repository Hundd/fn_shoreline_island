# Plan - Confidence Core: Check Before You Trust, revision 4 player correction

## Rail-mounted controls and completed-state cleanup

The player's cooked screenshot `evidence/player-review-controls-and-finish-2026-09-30.png` confirms the wallward row is clearer and shows Replay/Return suspended beside the walkway. The user explicitly requested both controls on the retained rail and the circles hidden after the run until restart. This is a localized presentation correction within the same solo bay; it does not change target locations, evidence order, progress, Return route, or shared rail ownership.

Live readback: `campus_vault_station_identity.vault1_control_mount` is centered world (-3110,-2750,2495) cm and spans X=-4040..-2180, Y about -2772.5..-2727.5, with top Z≈2513. The Creative Military Switch mesh bound to each existing button has local Z bounds -22.98..22.96 cm. Seat the pivot at Z=2536 cm so the switch bottom meets the rail top. Set Replay to world (-2620,-2750,2536), Return to (-2340,-2750,2536), both yaw180 and scale1. This spaces them 2.8 m apart near the rail's right end, keeps their meshes over the mount, and preserves the open yellow-floor firing position. Do not alter or duplicate the rail, switch bindings, hub teleporter, or target assemblies. Inspect the editor readback and cooked appearance; a small height correction is allowed only to seat the mesh on the measured surface, with evidence recorded.

On final RELEASE, retain the target hit burst and core finish effect, then after 0.85 seconds hide all three target rings and labels and park their hit surfaces. Guard the delayed cleanup by the current run generation and completed phase so an immediate Replay cannot hide the new run's targets. Existing `begin_solo` already resets and activates all three targets on Replay/reentry. Keep final board, progress lights, badge, Return and Replay available while the targets are hidden. No new device or gameplay branch is needed.

## Player-reported layout correction approved and placed

The 2026-09-30 cooked screenshot in `evidence/player-review-layout-2026-09-30.png` shows the B COOL label crossing the lower main-board copy. The user wants the entire activity closer to the rear wall and playable while standing on the beige/yellow floor. Revision 3 moves existing scene groups only; the approved solo four-action lesson, device meanings, and progress contract stay as implemented. The user approved the revision-3 preview with `go ahead`; `approval.yaml` records the current digest, and `plan --ready` passed before editor relocation. See `evidence/revision-3-implementation-2026-09-30.md` for saved scene readbacks and cooked validation. Actual player-eye acceptance remains open.

Live read-only measurements: the back wall is centered at world Y=-4200 cm with an approximately -4110 cm front surface; first-floor bounds are X=-4600..-1800, Y=-4100..-600. The current row centers are world Y=-2100; the board is world (-3000,-2300,2700), approximately 3.57 m wide by 1.62 m high; target labels are centered at Y=-2080, Z=2610. These transforms explain the observed overlap. The firing-strip location is inferred from the player's screenshot and floor view; its exact material boundary needs a cooked eye-level check.

Proposed world coordinates are obtained from the established origin (-13000,-4100,2400) cm. Shift target assemblies 8 m toward the wall to Y=-2900 (local Y=12), retaining X spacing, ring/face heights, and the 1.5 m faces. Target labels remain 20 cm forward of their rings and dynamically face the solo player on either side. Move the core, support, cooling and finish effects to approximately Y=-3000. Move the main board behind them to world (-3000,-3700,2960), local (100,4,5.6) for the actor pivot; its content-center marker is local (100,4,7.2). Double the board scale to 7.14 m wide by 3.23 m high, with lower edge near Z=2960 and top near Z=3283. Move three progress lights into a vertical stack beside the board at X=-2500, Y=-3650, Z=3000/3100/3200, so they cannot cover a board line. Move Replay to world (-2400,-2500,2500) and Return to (-2400,-2100,2500). These are proposed transforms, subject to editor readback and collision checks; no new floor, targets, or barrier is proposed.

The new firing point is local (100,20,0), world (-3000,-2100,2400), on the yellow strip and 8 m in front of the fixed row. The board is 16 m away. Enlarging it 2x retains roughly its old angular size. From an estimated player eye Z=2550, a line to the board's lower edge reaches about Z=2755 at the label plane Y=-2880, roughly 40 cm above the current label top. This is only a planning clearance estimate; use cooked views at standing/crouched height and from behind the circles to confirm every line, then adjust within the reviewed wallward arrangement if needed. Any substantive position/scale departure returns to planning.

## Inspected basis and floor safety

Historical read-only `evidence/editor-inventory.json` records energy_0_floor, energy_station_2/3_floor at top Z=2400 cm, X=-4600..-1800, -7400..-4600 and -10200..-7400; Y=-4100..-600. energy_station_4_floor had zero X scale and supplied no floor. debug_station_4_floor5 supplies X=-13048..-10248, Y=-4108..-408 at the same height. The 48 cm seam X=-10248..-10200, Y=-4100..-600, Z=2250..2400 was reconfirmed and bridged with one matching cube; no coplanar 28 m floor was added. Main gameplay uses the already valid first floor and never requires traversing the distant seam; unused public floor must still be safe.

Use existing confirmed origin (-13000,-4100,2400), site 112 x 35 x 9 m. The old energy_station adds/subtracts percentages and uses claim/start/repeat controls with fixed fixtures. The manager exposes three completion flags and a one-time Confidence Badge. Source APIs were inspected. Neither old controller implements this evidence state machine through settings. Revision 1 proposed twelve assemblies, twenty buttons, a moving valve and about 97 m of walking. Revision 2 needs three fixed targets, two ordinary buttons and 9 m approach. 028's successful user play supports the direction, not a claim that this new lesson has been tested.

## Historical revision-2 layout (already built; superseded by revision-3 proposal above)

Local metres; world_cm = origin_cm + 100 * local_m.

| Element | Anchor/envelope | Role |
|---|---|---|
| Arrival | (109,26,0), zone X=108..112 | Existing hub approach annotation. |
| Firing | (100,26,0), bay X=84..108 | 9 m direct approach, 3 m clear strip Y=24.5..27.5. |
| A CHECK / B COOL / C RELEASE | (97,20,1.8), (100,20,1.8), (103,20,1.8) | Fixed 1.5 m faces with matching hit coverage, toward +Y. |
| Core | (105.5,19,1.6), max 1.5 m cube | Static recognizable canister, unshootable; one low support if needed. |
| Main evidence board | center (100,18,3.8), max 10 x 1.6 m | Prompt, Pix claim, readings/freshness, progress, hint. |
| Lights | X=98.5,100,101.5; Y=18; Z=5 | Contradiction / fresh verification / release. |
| Replay / Return | (106,24,1), (106,28,1) | Outside the clear approach strip. |

Core sits beside the answer row; outer targets are about 27 degrees and core about 38 degrees from forward. Main board lower edge is 3 m, above faces; verify label/font perspective in-game. Core color changes accompany text, never replace readings. No targets behind railings, no machinery aisle, no rides/escort or new enclosing walls. One retained shelter only if useful, with at least 4 m headroom. Three other tiles remain safe shared space without false task signals.

## Four steps with stable action meanings

All three target IDs [0 CHECK,1 COOL,2 RELEASE] remain available in every decision; stage success IDs are [0,1,0,2]. Scoring locks apply during feedback. The authored fictional truth starts inside HOT. The controller distinguishes actual authored state from the player's latest measured state.

| Stage | Evidence before action | Correct action/result | Other actions |
|---|---|---|---|
| check_claim | Pix SAFE/90%, outside COOL, inside UNKNOWN | CHECK reveals HOT, flags claim wrong for this core; run-local section 0 | COOL: measure before choosing a fix; RELEASE: unknown inside, cannot finish. |
| cool_core | Inside HOT, current measured state | COOL takes <=1 s; casing changes and readings become OLD/NOT RECHECKED | CHECK repeats HOT, no new credit; RELEASE explains hot core cannot finish. |
| check_change | Cooling done; inside NOT RECHECKED | CHECK takes fresh outside/inside readings, both COOL; section 1 | COOL: already cooled, measure the result; RELEASE requires fresh check. |
| release_core | Fresh outside/inside COOL | RELEASE marks READY; section 2 and guarded badge | CHECK can repeat fresh readings without new credit; COOL says no extra cooling needed. Neither clears evidence or advances. |

An unnecessary action never changes the authored truth or awards a section. Repeating a valid measurement is acknowledged without being called incorrect. Automatic hints escalate on non-progress actions: principle, then useful action plus reason. Cooling is a brief non-flashing visual pulse (<=1 s), not a moving fan/valve or interactive animation. Evidence board keeps original Pix claim marked OLD/WRONG after contradiction, with current results clearly separate. Following cooling, no new SAFE percentage appears. Final justification is fresh readings, not a larger confidence number. Recap explains this confident answer was wrong; it does not teach blanket distrust of all confident answers.

## Exact scene ownership policy

Preserve three valid energy floors, debug-labeled fourth support, shared promenade, equipment/spawners, energy_progress, energy_0_badge_tracker, round settings, hub destination, journal/finale and neighboring missions. Reconcile energy-owned shell/identity components (campus_variable_vault_shell/campus_vault_station_identity) individually. Disable/retire four old station instances, percentage/claim/start/repeat controls, obsolete door/cat props and boards; use exact dependency manifests, not labels/AABB deletion. Retire zero-width floor only if reference-free. Revision-1 moving machinery was proposed, not proven placed: add none of it. Keep a single eligible core, existing board/HUD, three target assemblies and two buttons. Do not reuse the previously disallowed cat mesh.

## Implementation discipline and reuse

The user approved the solo-only revision 2 on 2026-09-30. `approval.yaml` records that historical review digest and `plan --ready` passed before revision-2 editor mutation. The intended scene and Verse work was implemented; actual solo gameplay acceptance remains open. That approval excludes multiplayer and does not cover revision-3 relocation.

Reuse `corridor` and `shooting_gallery`, the shared Data Blaster, attributed `data_target` hit surfaces, and the solo bounds/generation/quiet-hit approach now used by `pattern_line`. This is a reusable basis, not an existing drop-in adapter: the old station's button/ownership controller cannot implement these semantics through YAML settings alone. Refactor one existing mission controller for this scoped sequence after approval; disable/remove the other three placed controllers and all old runtime subscriptions. Do not duplicate the complete mission framework or alter other missions' target behavior. Reuse `stationary_y_facing` only after verifying forward offset/sign for this bay; the Confidence bay faces the opposite Y direction from 028.

Each target assembly has a Verse target, damage-only trigger, ring visual and label; reconcile optional cone/VFX/audio dependencies explicitly. Three assemblies are not three engine actors. Share feedback only where it cannot leak between actors/runs. Planned functional counts: one controller, three assemblies, one main board, one existing hub sign updated in place, one HUD, two ordinary buttons, three progress lights, one feedback effect and one existing audio reference. Target label boards are additional to the one main board. Reuse the global blaster/granter, existing progress/tracker/round settings and hub destination. Bounds polling avoids adding enrollment/bay zones or a replay teleporter. All three choices remain fixed and visible during play; scoring is locked during transitions and inactive hit surfaces are parked on reset.

Choose existing project icons or qualified native assets; raw mesh catalog hits are not proof of Creative eligibility. No image generation or asset import is needed for this planning task. Full actor rotations/scales, mesh front axes, pivots, collisions, native setters and exact removal identities belong to serialized preflight. Record expected/actual transforms and dependencies before mutation, checkpoint, apply one group, read back, then save. Any missing eligible object equivalent or materially changed layout/lesson returns to planning.

## Shared lifecycle, feedback and badge contract

Auto-ready one in-bay player, retaining their current character identity. No claims, enrollment, cooperative credit or roster. Ignore non-owner/out-of-bay hits. Entry within 0.5 s; leave, elimination/respawn, disconnect and round reset cancel the run generation before hiding effects/restoring objects. Return cancels before teleport. Replay is enabled only at finish and starts all teaching steps. Leaving the bay and returning is the supported mid-run restart.

On accepted hit, lock correctness synchronously before any suspended work. Show result/cue within 0.25 s and hold result for at least 1 s. Keep the old result during the 1.5 s minimum transition. Re-enable hit observation under a scoring lock after 1 s; require 0.5 s with no owner hit before arming the next decision. Continued fire keeps the current result and a short `Release fire to continue` cue; never award the next answer from a held burst. Wrong-hit debounce 0.4 s; one hint after first mistake and explicit useful answer/reason after second. Hints do not hide current evidence/object. Reset hint count on accepted decision.

Run-local sections drive lights. Persistent managers expose `complete(player)`, NOT `complete(player, index)` and do not advance `state.challenge` themselves. On valid final completion, if not already badge-earned, obtain `ensure_player(player)`, assign `state.challenge` to each section 0,1,2 in order and call `complete(player)` for each in one non-suspending guarded block. Retain final challenge=2 and manager identity. No partial write on abandoned runs; existing earned badge survives replay; manager round reset clears persistent state. Test with clean, partial legacy and already-earned states. Preserve existing tracker, journal and finale consumers; never synthesize a second badge.

## Verification and handoff

### Cooked visual correction from player review

The player's completion screenshot showed a persistent `0 DATA` HUD, a Prompt Workshop request HUD outside its zone, low-contrast action labels, ambiguous labels when walking behind the circles, a wrapped final board, and effects too small to reward hits or completion. Keep the approved positions and decision flow. Show Data Energy briefly only when earned; show Prompt Workshop request text only inside its own mutator zone. Use larger white labels on dark backgrounds with no collision border, turn each existing label toward the sole player's side of its circle, shorten board lines, and add a shared target hit burst plus a distinct finish burst at the core. Read back native visual settings and saved bindings, then verify AC-10 in a cooked solo session. These are visibility and feedback corrections to S-04/08, not new actions, gates, or targets.

Run `check`, inspect preview and generated plan, and record planning evidence. After approval, require exact scene readbacks, Verse build, UEFN validation/cook and normal solo AC-01..09. Test all target edges, muted audio, held fire, wrong actions, departure during feedback, death/respawn, return/replay, round reset, partial legacy state and badge/journal. Capture eye-level views, not just overhead blockout. A first-time tester's explanation/enjoyment supplies educational evidence; no invented pass from compilation. Leave individual untested scenarios visible. Stop the active game and confirm non-running state with editor open.
