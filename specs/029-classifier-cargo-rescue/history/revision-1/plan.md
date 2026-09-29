# Implementation plan — revision 1

## Evidence and capability

Live read-only inventory is in evidence/editor-inventory.json. Measured floor AABBs: signal_0 X=-4600..-1800 cm; signal_1 -7400..-4600; signal_2 -10200..-7400; signal_3 -13000..-10200. All Y=-600..2700, top Z=2400. Use origin (-13000,-600,2400) cm, local XYZ meters, envelope 112×33×9. Travel is toward decreasing X. The generated preview is a top-down design, not an editor screenshot.

Current signal_station has ten buttons per station, independent ownership, fixed Apple/Puppy/Car fixtures, MoveTo cargo routing and a 14 m ownership radius. It cannot run this proposed shared game through settings alone. Signal progress already owns the Classifier Badge and three completion flags. Feature 022's apple-intro evidence reports source/build success but defers runtime acceptance; do not treat the old classifier as fully playtested.

Reuse shooting_gallery and knowledge_room patterns with shooting_gallery also used for the SHIP target. data_target already attributes hits to agents and parks inactive triggers; data_blaster handles grant/respawn. prompt_blaster move_core demonstrates generation-cancelled MoveTo and synchronized prop/surface movement. This design keeps hit surfaces static, reducing moving-hitbox complexity. A scoped configurable linear controller must be implemented after approval; YAML parameters do not make the existing station support it. No contract_only classification_arena pattern is claimed implemented.

## Layout

| Area | Local X | Concrete placement |
|---|---|---|
| Entry on tile 0 | 104..112 | Arrival (109,8); Start and Return (107,10.5); short instruction sign (107,12). Preserve field_note_cargo at approximately (110.5,21). |
| LABEL on tile 0 | 84..104 | Firing spot (96,8); gates at (88,17),(94,17),(100,17), centers Z=1.8; scanner (94,23). |
| CHECK on tile 1 | 56..84 | Firing spot (70,8); prediction cards at (62,18),(70,18),(78,18); correction gates at (62,14),(70,14),(78,14), never active together with cards. Repair lift (70,23). |
| TEST on tile 2 | 28..56 | Firing spot (42,8); gates (34,17),(42,17),(50,17); scanner (42,23). |
| SHIP on tile 3 | 0..28 | Firing spot (20,8); SHIP target (20,16); dispatch pallet (20,23)→(6,23); recap/replay/return (16,10.5). |

All target centers Z=1.8 m. Gate faces point toward decreasing Y, full rotation resolved with live mesh front-axis before placement. Main aisle Y=6.5..9.5 remains clear, plus 1 m around controls. Control markers denote stations outside the aisle at Y=10.5; mount buttons toward the aisle without intruding into its clear width. Normal journey is about 93 m, with stops at 96,70,42,20 and no mandatory backtrack. Physical access stays open; inactive targets enforce progression. Each next bay has a lit arrow and progress lamp. No long-range reading from one tile to another. Motion stays in Y=20..29 except gate shutters at Y=15..19; it never crosses the aisle. Keep at least 1.5 m clearance around moving props. Use rail segments outside firing rays, and open-top framing rather than a continuous new roof. Zone envelopes are not wall commands.

## Exact stage table

| Stage | Active targets | Correct target | Result |
|---|---|---|---|
| label_burger | label_food, label_furniture, label_vehicle | label_food | Move burger into Food bay. |
| label_chair | same three | label_furniture | Move chair into Furniture bay. |
| label_car | same three | label_vehicle | Move car into Vehicle bay; learning section 0. |
| find_error | prediction_food, prediction_chair, prediction_car | prediction_chair | Lift chair into repair cradle. |
| repair_label | repair_food, repair_furniture, repair_vehicle | repair_furniture | Reroute chair, replay corrected prediction; learning section 1. |
| test_banana | test_food, test_furniture, test_vehicle | test_food | Deliver unseen food example. |
| test_sofa | same three | test_furniture | Deliver unseen furniture example. |
| test_tractor | same three | test_vehicle | Deliver unseen vehicle example; show test passed. |
| ship | ship_target | ship_target | Lift shutter and ship pallet; learning section 2 and badge. |

Prediction cards show burger/Food, chair/Vehicle/95%, car/Vehicle. All cards use the same neutral frame, with no wrong-answer color before selection. Guidance defines categories by use: food can be eaten, furniture furnishes a room, vehicles transport people/things. A miniature tractor is labeled TRACTOR, not a toy, to avoid ambiguity. Educational confidence value is authored illustration, not measured model output. Never imply one correction retrains a real model.

## Motion and interaction

Each item enters a scanner over 3 s across a 6 m local lane and waits indefinitely. A correct gate shutter rises 2.5 m in 0.8 s; cargo moves to the selected bay over 2 s; the gate closes only after cargo clears. Display a ≤2-line reason for 1.2 s before activating the next item's choices. Arrival and delivery use scripted creative_prop motion on static conveyor housings, not physics belts. Repair lift rises 1 m in 1 s, waits for the correction, lowers in 1 s, then a 3 s repeat pass proves the new route. Dispatch takes 4 s and moves a 2×2 m pallet 14 m behind a rail; its shutter raises 3 m. Objects fit in a 3×3×3 m display envelope; miniature vehicles use uniform scale.

Wrong shots flash briefly, play gentle feedback and debounce for 0.5 s without changing the item or deleting progress. Accepting a shot locks the phase synchronously before spawning motion. A minimum 1.2 s inter-phase gap is followed by a 0.5 s quiet-hit arming window: next-phase surfaces can report hits, but correctness remains locked until no current-group Hit event has arrived for 0.5 s. Show ?Release fire to continue? while waiting. This is controller logic, not an assumed weapon-release API; verify held-fire behavior in cooked game. Pause Motion freezes presentation and resumes from the saved pose; for an accepted delivery it may snap to its clearly indicated endpoint after feedback. Help first gives a concept hint and on second press a worked example. Watch Again cannot alter correctness or award twice.

## Scene and source delta after approval

1. Save a checkpoint, export transforms, settings and all incoming/outgoing references for touched actors. Preserve four floors, shared global blaster/granter, signal_progress/tracker, journal, hub spawners, hub destination and field_note_cargo devices. Remove old station ownership subscriptions before activating the new controller. Remove obsolete signal_[0-3] station presentation and controls; reuse suitable boards/HUD/buttons after unbinding. Actor labels are candidates, not permission for a blind wildcard delete.
2. campus_signal_beacon_hall and campus_signal_station_identity overlap the space; inspect their components/children and retire only the signal-owned facade/signage that obstructs the new layout. Preserve campus_main_promenade and other identity roots even where aggregate bounds overlap. Do not delete terrain, water or neighboring energy/debug floors.
3. Implement one configured linear classification controller with editable target groups, stage correct IDs, cargo props/home/end poses, feedback strings, entry zone and progress reference. Keep the state machine to the authored nine decisions above. Existing signal_station can remain source for other references but its four placed actors must stop running. Keep shared data_target changes minimal; any generalized label-feedback improvement must preserve Prompt Lab behavior.
4. Adapt progress through existing ensure_player/complete and challenge indices, only for enrolled eligible players. Mark challenge 0 after LABEL, 1 after repair, 2 after SHIP. Replay runs the full experience even for badge holders but never duplicates a badge. Eligibility requires enrollment and continuous membership through the run; departure/respawn removes membership. If all leave, cancel. Late arrivals join the next start window. Existing journal/finale consumers keep their current signal progress identity.
5. Reconcile 13 target assemblies (3 label, 3 predictions, 3 correction, 3 test, 1 ship), not 13 total engine actors. Per data_target: damage trigger, ring, cone, label, six VFX references and two audio references; share only feedback devices whose playback cannot leak between phases/players. Add one controller, entry zone, five stage boards, one HUD, section-local Help/Watch/Pause/Return controls, Start, Replay, four progress lights and machinery props. Enumerate exact subdevice counts and bind/read back each group during implementation preflight.
6. Qualify palette assets, bounds, pivots and native placeability before placement; record full transforms. Equivalent eligible Fortnite props may substitute within authored category/role/envelopes. If that cannot preserve the lesson, return to planning. Save each serialized group; no parallel editor calls.
7. Build Verse, validate project, cook and run AC-01..10 with solo, two and four players. Record screenshots from each firing spot, moving machinery and finish; compare labels, routes, bindings and count. No gameplay task is complete on MCP success alone.

## Approval boundary

Review generated/preview.html, generated/implementation.yaml, spec.md and review.md. Explicit approval of this revision is required by uefn-map-planning before implementation. Record only an actual human approval with the current review-manifest digest. Then run plan --ready and hand off to $uefn-map-implementation to set the implementation goal and complete verification. No approval.yaml has been authored during planning.
