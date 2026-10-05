# Feature039 source-development checkpoint — 2026-10-04

Original checkpoint; subsequent QA01–QA04 source repairs and current capability corrections are recorded in `source-qa-repairs.md`. Current compiled hashes and shutdown state are in `source-shutdown.json`.

Worker `/root/implementer`, explicitly dispatched `gpt-6.1-sol`, source-only authorization from `development-authorization.md`, reviewed digest `8af651188df0764becfce1f677b1b72e3486756bff77712da9c7fa4b0bccf7b5`. No scene placement, binding, binary asset edit, cook, session start, push or map approval occurred. Existing station/progress/blaster/journal source remains unchanged.

Saved files: `Content/fn_shoreline_island_popbridge_fixtures.verse`, `Content/fn_shoreline_island_popbridge_controller.verse`, `tools/tests/test_popbridge_contract.py`.

## Authoritative compilation

Serialized native MCP `ValkyrieToolset.VerseToolset.BuildAll` returned `{"returnValue":[]}` after final source edits: no Error, Warning or other diagnostics. Earlier diagnostics (reserved `result` / `branch` identifiers and unsupported vector `+=`) were repaired and rebuilt successfully. BuildAll compiles all project Verse; it does not execute fixtures or gameplay.

Read-only editor identity `/fn_shoreline_island/fn_shoreline_island` and initial game state `CanStart` confirmed. Source files saved on disk through workspace editing; no affected scene asset required saving. AgentSkillToolset and project-validation tool are absent from discovered toolset catalog; no unsupported validation command was invented.

## Supported source capabilities

Explicit editable node/edge/receiver/machine/landing arrays; node IDs topologically ordered, feature039 name mapping starter/first/reuse/fork/left/right/finish = 0..6. Inputs are world cm and deck **top**, not prop center. Defaults fail closed until a valid contract and real actor references are supplied. Validator rejects duplicate node/target IDs, nonexistent references, unsupported instruction IDs, invalid/incorrect geometric gap, unequal deck heights, disconnected graph, non-forward edges, missing platform producer and nonunique teaching/finale entries. This is a three-instruction saved routine adapter, not arbitrary language execution.

Teaching prefix survives wrong order. Saved `[Load, Heat, Pop]` is played at each accepted downstream invocation. Each machine has three movable creative_prop mechanisms and three ordered VFX creators. Matching mechanism rises 25cm for a 0.25s beat and returns to its full saved home transform. Deck collision is never animated. Geometry commits only after routine completion. Pending and consumed guards suppress rapid duplicate work; both fork choices use identical predecessor logic, and either may be built from grounded fork. Finish requires actual accepted branch then finish landing and final invocation before milestone2. Existing nursery_progress.complete_challenge(0/1/2) remains sole badge authority.

Landing checks use real fort_character.IsActive/IsOnGround, inset deck XY and configurable top-height tolerance. Landing progression requires current checkpoint edge and built destination. Shots require attributed owner physically grounded on receiver predecessor and its accepted visit. Generation, owner and progress.round_generation cancel delayed execution; departure, removal, Return, Replay and round change reset attempt/effects. Replay retains existing earned badge/progress authority. Runtime mechanisms are restored on cancellation.

Catch recovery polls every 0.1s, attempts failable fort_character.TeleportTo at accepted checkpoint +20cm, debounced at 0.2s. Recovery does not reset skill/built/visited/consumed state. Failed teleport retains progress and offers Return while retrying. Recovery starts after first accepted teaching input; entry ramp is outside configured catch area before that point.

## API evidence

Actual generated `Digests/BuiltIn/Fortnite/Fortnite.digest.verse`: fort_character.IsOnGround line9713, SetVulnerability line9743, failable TeleportTo line9749. creative_prop.Show/Hide lines8996/8999 explicitly enable/disable collision; CanBeDamaged line9002. Controller uses these declared APIs. There is no invented Verse collision setter. Mechanisms must be movable and natively non-colliding; collision and exact actor validity/poses must be read back in the final approved map binding phase.

## Executed offline evidence

`python -m unittest tools.tests.test_popbridge_contract -v`: 9 tests, OK, 0.881s. Tests independently validate approved YAML geometry and both paths; malformed duplicate IDs, invalid instruction sequence, receiver shortcut, missing predecessor, unequal path, gap and floor-height data are rejected. These tests execute Python contract checks, **not Verse transition code**.

Verse fixtures include compiler-checked `self_check` for both routes, wrong-order prefix, foreign/stale inputs, rapid pending input, consumed machine, no platform before commit, airborne rejection, predecessor/finale gating and Replay generation reset. It is **not invoked** in this source-only phase. No executed Verse fixture pass is claimed. Recovery preservation follows source inspection only; native failures need harness/cooked evidence.

## Explicit limitations and remaining gates

A01 remains open: executed Verse checks and cooked runtime mechanism/owner/lifecycle/landing/recovery evidence are missing. Character transform top-height tolerance is configurable but its actual origin and crouch behavior must be measured in cooked play. Native mechanism collision, target attribution, stale native event delivery, arrival dwell/grounded semantics, one-second recovery, failed teleport, physical jumpability, muted comedy and badge continuity are not established by compilation. No claims of enjoyment or child validation.

A02 remains open: offline contract geometry and equal paths validated, compiled transition logic supplied, but `self_check` and equal-route runtime transitions are not yet executed. Independent source review may identify further gaps. Duplicate edges and arbitrary graph branch-balance constraints are not promised by the runtime validator; feature039 data is independently checked.

`python tools/map_workflow.py plan specs/039-popcorn-parkour/map.yaml --ready` returns exit1: missing final approval.yaml plus A01/A02 unresolved. Bundle/digest unchanged. A separately approved concrete harness/map phase is required for execution; after verified adapter evidence, Planner must resolve blockers, regenerate/review and obtain final approval before map mutations.

Final game state is recorded in `source-shutdown.json`. Editor left open; no in-flight MCP calls at handoff.
