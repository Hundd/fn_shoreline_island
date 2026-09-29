# Solo simplification plan ? revision 2

Proposed, not approved or implemented. Read spec.md S-01..09 and review.md. The old approval digest cannot authorize this design. Historical bundle: history/cargo-circuit-v1/.

## Evidence and actual baseline

Live serialized SceneTools.find_actors on 2026-09-29 found 166 cargo_circuit actors, including 21 conveyors, 15 target assemblies, 8 stacked crates, 2 planters, 13 rails and 6 lamps. Full descriptors are in evidence/simplification-live-inventory-2026-09-29.json. Existing controller source requires exactly 15 targets, 12 cargo references, 4 boards and 11 buttons. Its phase-specific demonstrations/accepted handlers and five-second enrollment are hardcoded despite editable phase arrays. Conveyors have no bindings in that controller and are static dressing. Existing cooking and scripted progression evidence does not establish physical rifle usability or fun.

Measured floor origin: (-1100,3000,2400) cm; overall floors 88 x 25 m. Hub walkway enters near local (4.5,3). New anchors below are proposed, not measured placed transforms. map.yaml retains the full site envelope to identify the untouched support floors; only X=0..22 is gameplay.

## Concrete layout

| Element | Local metres | Role |
|---|---|---|
| Arrival | X=0..22, Y=0..6 | Hub approach; short route sign and inventory annotation, no spawn/granter added. |
| Play bay | X=0..22, Y=6..22 | Three rounds and reward in the same view. No wall implied by zone envelope. |
| Comfortable firing point | (10,9,0) | Arrival (6,4,0) via (6,6,0) is 7 m. Stand here for all rounds. |
| Three answer centers | (7,15,1.8), (10,15,1.8), (13,15,1.8) | A/circle, B/triangle, C/square; 1.5 m face/hit size, same fixed order every round. |
| Six-slot pattern board | center (10,17,3.6), max 10 m wide x 2 m tall | Continuous full strip and one-line action; faces toward decreasing Y. Lower edge above target labels. |
| Three progress lights | (8.5,17,5), (10,17,5), (11.5,17,5) | Correspond to solved rounds; numeric 0/3..3/3 text duplicates lights. |
| Replay / Return | (15,9,1), (4.5,11,1) | Outside forward sightline; existing buttons reused. Return uses retained hub destination. |
| Clear routes | 3 m wide approach and Y=6.5..9.5 aisle across original dock | Always open, including all retained floor tiles and shared promenade connections. |

No rails between firing point and answers. Retain only edge rails with an actual fall-prevention role; resolve exact rail ownership/bounds before removal. Board, rings, symbols and physical hit surfaces face the firing point. Mesh-specific rotation, pivot and full scale come from preflight readback; do not equate facing direction with an unverified yaw. Map markers are anchors, not complete mesh transforms. The preview does not model collision, camera FOV or typography in Fortnite.

## Implementation after approval

1. Checkpoint saved scene and source. Export exact references/full transforms for every affected actor; compare with live inventory. Establish removal/retain/reuse table. Preserve four floors, walkway, field notes, promenade, global Data Blaster/granter/spawners, hub destination, loop_progress, badge tracker and journal/finale refs. No prefix-only bulk deletion.
2. Refactor the existing fn_shoreline_island_pattern_line class in place to a three-round solo controller. Reuse data_target Hit/activate/accept/reject APIs, bounds-based character checks, generation cancellation and loop_progress.complete. Remove cargo arrays and animation branches, enrollment/cohort maps, five-second delay, redundant controls and old board references. No second controller or speculative generic engine. Editable arrays hold prompts, hints, answers and success IDs [1,0,2]; validate exactly three targets and matching round data. No gameplay source edit occurs during planning.
3. Ready state detects the sole in-bay player using the already established world-bounds approach: X=-1100..1100, Y=3600..5200 cm, floor-level character allowance Z=2350..3300. Check every 0.1 seconds. Activate round 1 automatically; retain a single current character/player reference. Accept only attributed shots from that active character in bounds. No team state or reward broadcast. Other island sessions/settings are not changed; unexpected outside agents never advance this mission.
4. Each correct hit locks inputs synchronously, disables all surfaces and fills the board gap immediately. Show solved rule for 1 second, then the next prompt, then enable surfaces at 1.5 seconds total. Keep answer letters/shapes readable during feedback. Use generation checks to reject stale callbacks. Because targets are reused, keep a short transition hit monitor: hits on disabled/locked rounds never score; do not rearm until a minimum 0.5-second quiet interval after the last detected shot during reactivation probing. Validate held fire with a real rifle; if the trigger device cannot report hits while disabled, briefly enable under a non-scoring controller lock to observe quietness. The next answer differs each round (B,A,C), reducing accidental held-fire success but not replacing this verification.
5. Wrong shots call existing feedback and show the specific rule in the same board/HUD; second mistake names the answer without auto-scoring. No Hint button. After three accepted rounds, call ordered progress guarded by saved challenge state. Preserve progress indices 0/1/2 and round-reset behavior. Replay re-arms only after completion; Return cancels local activity before teleport. On departure/death/disconnect cancel generations and reset scene; reenter at round 1 while retaining saved per-round progress. No badge reset on replay.
6. Reuse three existing target assemblies (v1 IDs 0..2), one board, HUD, three lights, finale/audio and Replay/entry Return. Remove 12 excess target assemblies and their uniquely owned subdevices after dependency checks. Reuse existing symbols/rings with fixed target transforms, no moving carrier crate. Existing initialization home caches must capture the final placed transforms in a fresh session.
7. Remove all 21 static conveyors, 12 cargo motion props including shutter, 8 crate stacks, 2 planters, obsolete stop signs/direction arrow, three extra boards, nine redundant controls and dock-owned surplus dressing. Remove shared subdevices only when no surviving references use them. Retain at most two practical bay lamps plus safety rails and useful canopy; no decorative machinery. Update hub/journal player copy to Pattern Scanner / Shoot the missing symbol, preserving module and progress identity.
8. Save and read back target count, size, position, settings and refs. Build Verse, validate and full cook, then execute SA-01..09 in normal solo Fortnite play. No multiplayer test plan remains. Verify the three-shot minimum solution from one spot, edge hits, automatic hints, continuous fire, all reset cases, badge/journal and return. Record real first-time observations before calling it intuitive or fun. Stop game/session and verify non-running state.

## Feedback content

| Round | Hint after first wrong answer | Assistance after second mistake | Correct feedback |
|---|---|---|---|
| 1 | Circle, triangle ? the pair repeats. | After circle comes triangle. Shoot B. | A B / A B / A B ? pair complete! |
| 2 | Each pair starts with circle. | The gap starts a pair. Shoot A. | A B / A B / A B ? gap repaired! |
| 3 | Circle, triangle, square ? three repeat. | Finish the group with square. Shoot C. | A B C / A B C ? pattern complete! |

Actual shape glyphs must render legibly; reuse existing ring/shape materials or validated symbol artwork if billboard glyph coverage fails. Letters and words remain available. Completion effect at the board lasts at most 1 second; no moving props or dispatch wait.

## Approval handoff

Run map_workflow.py check on this map, inspect generated preview and implementation.yaml, then present the concrete revision. Per the uefn-map-planning skill, wait for explicit approval of this revision before map/gameplay mutations. Preserve v1 approval as history; replace the root record only with actual new approval and the new review digest. Run plan --ready, then hand off to $uefn-map-implementation for the scoped refactor, scene cleanup and solo verification. Offline readiness is a design gate, not evidence that the controller already supports this behavior.
