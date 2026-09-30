# Blockout review: revision 1

2026-09-30. Roles: map-planner and blockout-reviewer in the same serialized workflow. This review is not human approval.

Reviewed spec.md, plan.md, map.yaml, generated/preview.html and generated/implementation.yaml. Generated SVG was rasterized with Pillow and visually inspected in evidence/preview-review.png; fonts, opacity and dashes are approximations. Browser runtime reported no available browser, so interactive HTML rendering was unavailable; HTML content and the generated SVG were inspected directly. Height/sightline calculations supplement the top-down preview. No cooked gameplay review is claimed.

| Finding | Requirements | Disposition/evidence |
|---|---|---|
| Existing floor is much larger than needed, but game requires one compact viewing/interaction area. | R-01/02 | Keep first floor, place all answers six meters ahead of one firing point. Arrival to spot ~13.6 m; no travel between rounds. A 3 m route and walking return are explicit. Unused space does not become extra puzzle stations. |
| Initial low tabletop behind center target would risk hiding Pix. | R-02/08 | Resolved in this revision: track raised to 3 m, evidence board center 5.3 m. Analytical lines from eye 1.7 m clear target top 2.25 m and Pix top 3.9 m. Board face bottom 4.7 m; see plan.md. Verify crouched/normal views and actual bounds in cooked client. |
| All nine possible replacements need safe, understandable outcomes. | R-03/04 | Offline arithmetic checked all intermediate tiles 0..4, one unique correct endpoint per round, success IDs [2,0,1]. evidence/offline-route-check.json records exact wrong/correct paths. This is authored design validation, not runtime execution proof. |
| Choosing a pre-labelled right answer could erase debugging. | R-03 | No correct color/pre-mark. Keep faulty plan, boxed editable slot, goal and initial actual together; rerun full edited plan and gate completion on endpoint. STOP is explicitly a zero-distance instruction, not cancel/run/end. |
| Interaction density and reset need one meaning throughout. | R-04/05/06 | Three stable correction targets, automatic demonstration/rerun/hints/advance, two local buttons. Locks, distinct mistakes, 0.5 s quiet rearm and generation cancellation specified. Real hit/held-fire/lifecycle tests remain required. |
| Cleanup by `debug` label would damage neighboring infrastructure. | R-01/07 | Inventory includes shared structural/support floors and a gameplay debugger. Preserve all floors/walkway and shared refs, especially debug_station_4_floor5. Exact four-controller/26-unused-button delta must be audited by identity/component dependencies before deletion. |
| Existing adapter does not implement this YAML. | R-03..06 | Scoped refactor of existing debug_station with stage records is explicitly planned. Reuse shared data_target/fixture/progress APIs and solo lifecycle reference; no incompatible Prompt target_sequence or contract-only pattern. Build and cooked verification remain required. |
| Progress identity must survive replacement. | R-06 | Retain debug_progress/tracker and its journal/Agent Mission consumers; only verified round endpoint can invoke complete. Replay preserves badge/retained flags; physical 0/3 reset independent. |
| Top-down markers overlap if reward is placed on board anchor. | R-08 | Offset reward annotation to side of board; not an extra reward object. The held 3/3 badge result is board text. |
| Generic generated verification checklist mentions multiplayer. | R-05/09 | Explicitly not applicable. User's solo scope and AC-01..10 override this generic line; no multiplayer support/testing added. |

## Accepted tradeoffs and required observations

Three fixed authored examples prioritize clear causality over procedural variety. The former repeat-count/classification lessons are intentionally replaced; the original debugging learning goal is preserved. The raised display is a sightline solution with no additional walking/jumping mechanic. Modest rings/short pulses, words+symbols and persistent evidence support muted-audio access. First attempt/finish time, learning explanation and enjoyment are future solo observations.

No unresolved design blocker remains. Exact native transforms/settings, cleanup dependencies, collision, shot attribution/face coverage, board glyph/size, animation cancellation and badge consumers are mandatory implementation/readback/cooked gates. Passing offline checks does not complete any gameplay acceptance task. Human approval is pending; approval.yaml must remain absent until the user approves the actual review bundle.
