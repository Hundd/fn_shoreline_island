# Cargo Circuit review and solo redesign ? 2026-09-29

Revision 2 is ready for human design review. It is not approved or implemented. The user reported cumbersome, counterintuitive play and non-gameplay assets, specifically cargo_circuit_conveyor, then explicitly requested single-player only. This review uses planner and blockout-reviewer roles in one agent.

## Findings about the current version

| Severity | Evidence | Player impact | Revision-2 response |
|---|---|---|---|
| High | Live inventory has 21 conveyor actors. No conveyor reference appears in pattern_line controller cargo/binding arrays; the earlier plan calls them static line bodies. | Machinery suggests a working conveyor game but gives no corresponding action. The player must distinguish decoration from goals. | S-07 removes all conveyors and cargo machinery. Every prominent retained object has an instruction, action, feedback, lighting or safety role. |
| High | Controller requires 15 targets, 12 cargo refs, four boards and 11 buttons; phase counts are 3/6/3/3. | The interaction changes from moving answer to numbered exception to replacement symbol to shuttle stop. Players repeatedly learn a new local interface. | S-02/03 uses the same three stationary symbols and one missing-symbol action for every round. |
| High | Original route is approximately 76 m across four tiles; demonstration, movement, repair and dispatch delays occur between decisions. | Walking, aiming and waiting compete with pattern reasoning. | S-01/04 puts every round at one firing point, about 7 m from the proposed arrival anchor, with a 1.5-second feedback transition. |
| High | Five-second enrollment, participants map, late spectator handling and shared credit are implemented in source. | Unnecessary rules for the user's requested solo activity. | S-05 removes the entire team flow; automatically ready on entry, one active player and individual credit. |
| Medium | Moving answers require Slow/Freeze/Help/Watch Again support. | Tracking skill and control discovery are extra prerequisites for answering a simple pattern. | S-02/04 uses persistent examples, stationary choices and automatic hints; only Replay/Return remain. |
| Medium | Original FR-09 mandates a 75% native prop-instance quota. Live scene includes eight decorative stacks, two planters and six lamps. | Asset quantity is rewarded independently of clarity or useful interaction. | S-07 removes the quota and surplus dressing; at most two bay lamps, necessary boundary rails and useful shelter remain. |
| High evidence gap | Production cook and scripted solo probe succeeded; original tasks leave physical rifle use, readability and human acceptance open. Earlier review called fixed puzzles intuitive without such evidence. | Technical success was treated too optimistically as a proxy for usable play. | S-09 requires actual rifle tests and three first-time solo testers, with time and confusion recorded. No current fun/readability claim. |

Sources: current Content/fn_shoreline_island_pattern_line.verse, data_target and loop_progress; evidence/full-controller-bindings-2026-09-29.json; evidence/depot-dressing-readback-2026-09-29.json; evidence/final-production-cook-2026-09-29.md; evidence/blaster-respawn-binding-2026-09-29.md; archived v1 spec/plan/tasks; fresh evidence/simplification-live-inventory-2026-09-29.json (166 actors). No new cooked playtest was performed during this review.

## Concrete design review

- S-01: all gameplay fits the first 22 m tile. The original 88 x 25 m structural envelope is preserved. Proposed approach (6,4)->(6,6)->(10,9) measures 7 m; route width is 3 m. No stage gate or inter-round walk. Remaining tiles have no leftover puzzle machinery. Shared field-note/promenenade dependencies need exact preflight reconciliation.
- S-02/08: three 1.5 m stationary answer faces at 3 m centers leave 1.5 m clear between faces. Center firing distance is 6 m; outer answers about 6.7 m. All use letters, symbols and words. Board sits behind/above the choices. Marker 8 is an offset diagram annotation for the reward, not a new reward station. Camera/FOV, native glyph coverage, board contrast and shot clearance remain cooked checks.
- S-03: answers B/A/C exercise two-symbol completion, internal-gap repair and a three-symbol group. One correct answer each, same operation and fixed answer order. Movement prediction and exception hunting are deliberately removed; human approval must cover this learning-scope change.
- S-04/05: auto-ready replaces Start/enrollment. Immediate gap-fill makes a correct action visible. Automatic rule/answer hints prevent control hunting. No penalty, moving target, timer, cargo animation or audio dependency. Reused surfaces require verified held-fire locking and cancellation, not an assumption based on staggered answers.
- S-06: use existing ordered loop_progress guard and badge/journal identity. Replay resets presentation but does not duplicate badges. Departure/respawn reenters puzzle 1; saved progress remains until round reset. Return is always available.
- S-07: cleanup covers all 21 conveyors and obsolete machinery, redundant targets/boards/buttons and surplus dressing. Bounds are not ownership: preserve shared routes/field notes and remove actors by exact identity after reference checks.
- S-09: solo only. No new multiplayer systems or multiplayer acceptance gate. Three first-time testers are sequential solo sessions. Enjoyment remains a qualitative playtest finding; fixed puzzles trade long-term replay variety for a clear short first run.

## Offline evidence and remaining gates

- `python tools/map_workflow.py check specs/028-pattern-scanner-cargo-circuit/map.yaml`: exit 0, zero execution/design blockers; generated complete draft bundle.
- `python tools/map_workflow.py validate specs/028-pattern-scanner-cargo-circuit/map.yaml`: exit 0.
- Read generated HTML/SVG marker/stage tables and implementation.yaml; visually inspected evidence/solo-blockout-review-2026-09-29.png. Fixed marker/text overlap and regenerated. The PIL raster is approximate: dashed lines are solid; arrowheads/opacity are omitted. Authoritative preview is generated/preview.html and preview.svg, not this raster.
- Current review digest: `3cbb0c2c2814c891c71e22a90189269d9ef6c08cf8a9b570c80c9d594f9a5de2`.
- `python tools/map_workflow.py plan specs/028-pattern-scanner-cargo-circuit/map.yaml --ready`: expected exit 1, `approval is stale: review_digest does not match current artifacts`. Root approval.yaml is unchanged v1 evidence, also preserved in history/cargo-circuit-v1/. No approval was fabricated.
- Source capability is explicitly pending the approved refactor. Native full transforms, ownership reconciliation, collision, visuals, actual rifle traces, lifecycle and enjoyment are implementation/acceptance work, not findings proven by the offline validator.
- Final serialized SessionToolset.GetGameState returned `Unconnected`. No game needed stopping; UEFN remains open. Only planning documents/review evidence changed; no Verse, scene or binary asset was edited.

## Approval boundary

Present the new preview, generated implementation plan and plan.md delta. The uefn-map-planning skill explicitly says: ?Wait for explicit human approval of the concrete design before map-design mutations.? This revision changes layout, lesson sequence and solo behavior, so old Cargo Circuit approval cannot apply. After actual approval, record its evidence/current digest, pass plan --ready and invoke $uefn-map-implementation to apply and verify the solo redesign.
