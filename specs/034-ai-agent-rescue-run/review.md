# Blockout review - revision 1

Planning review only; not human approval, not gameplay acceptance.

## Evidence and checks

Inspected spec, controller/progress/fixture source, shared damage-only target API, adjacent feature plans, recorded migration gaps, and read-only native scene inventories. Generated and inspected preview.svg/preview.html structure, marker positions, stages and implementation.yaml. `python tools/map_workflow.py check specs/034-ai-agent-rescue-run/map.yaml` and `validate` pass with zero execution blockers. Manifest identifies exact review revision. No approval.yaml exists; readiness must remain unavailable until actual human approval.

Supervisor rendered the generated SVG with the bundled static renderer and visually inspected evidence/preview-review.png: legend readable, three banks separated and 46 m inter-beat route clear, without blocking overlap. The narrow arrival-zone heading was shortened to “Entry” in the final generated revision. Browser file loading was unavailable; no browser workaround was used. Static rendering does not verify in-game scale or collision.

## Findings

- R-01: The user-named floors are three adjacent slabs, not vertically stacked levels. Keep their 102 x 37 m support and the fourth floor. Measured shell columns/roof remain protected. The candidate ledger bounds cleanup to legacy actors from stations1–3; bindings may reduce that set, never enlarge it without review.
- R-03/04/08: Three beats provide a visible start, surprise interruption, intervention and outcome. Only 46 m of inter-beat walking is required; no return trek, timer or escort failure. Pix waits at endpoints, so players need not keep pace. Arrival adds roughly 24 m. This is a consciously larger capstone than Tool Lab's compact three-tool gallery, but avoids using the entire 102 m footprint merely for travel.
- R-03/06: Nine target assemblies, three active at once, keep fixed physical positions at each beat. Three-meter spacing, 1.5 m hit faces and 8 m firing distance are generous. Labels below rings and elevated three-line boards should separate reading layers; eye-level/crouched/muted-audio checks remain mandatory. Board pivots/font cannot be inferred from marker height.
- R-04: Player route Y=-13500 is separate from Pix's Y=-14700 and detour Y=-15000. The gate is an authored robot-lane interruption, not a player door; no movement skill or jump is needed. Native collision and edge safety must be proven in cooked play. If the measured preserved shell or an uninspected shared object obstructs the exact lane, stop and revise rather than silently deleting it.
- R-04/05: Learning is causal: choose goal-appropriate cargo, launch a skill, observe a change, get evidence, replan, then check the delivery. The same Medical prop is physically carried through the story. Final evidence requires an actual position/identity check, not only a bool; AC-11 falsifies the display state to prove that gate. All scenes are authored simulations.
- R-02/07: Seven-module lock remains deployed behavior. Entry owns the whole three-floor bounds; legacy 15 m station release would break walking and must be replaced only for rescue mode. Floor4 legacy fields remain separate, with shared per-player ownership and one badge authority. Round/replay lifecycle and concurrent player rejection must be tested.
- R-01/07: Feature033 progress/navigation remains draft. This feature keeps its expected tracker identities compatible without deploying that work or rewriting global matchmaking.
- R-06: Input gating must observe hits during feedback and require 0.5 seconds quiet. Parking inactive hit surfaces is required to avoid invisible blockers. Async generation checks alone are insufficient if a canceled prop move can later restore the wrong transform; cancel/settle before resetting is an acceptance condition.

## Remaining implementation verification

Exact native refs, mounting, complete transforms and instance eligibility are deterministic implementation checks against the approved anchors/candidate set. Source needs the explicit scoped rescue adapter described in plan.md; pattern reuse is not a claim that current bot_station supports YAML configuration. No unresolved design question remains in this proposed revision. Runtime confidence remains limited until Verse build, project validation, cooking and AC-01..11 evidence. No gameplay task is checked off.

Explicit approval of this concrete preview and plan will hand off to uefn-map-implementation. Material route, behavior or cleanup changes require a regenerated bundle and renewed review.
