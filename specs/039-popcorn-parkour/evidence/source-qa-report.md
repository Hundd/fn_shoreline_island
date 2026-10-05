# Independent source QA — feature039, 2026-10-04

Worker `/root/gameplay_verifier`, dispatched as `gpt-6.1-sol`, under Supervisor `/root`. Scope: authorized source-development review only; no source fixes, scene edits, binding, harness placement, cook or game launch. Read the role/safety/workflow instructions, feature spec/plan/tasks/map/review, adapter-development authorization and implementation evidence.

Verdict: **source review has actionable defects; runtime acceptance not run**. A01/A02 remain open. This report is not map approval or full feature acceptance.

Reviewed controller SHA256 `3547A5DDB779A303F6C6CAAB3B0CCBEE839EA03969A1090BFDE82AAB4AEB80B0`; fixtures SHA256 `FE67B9A46C57B8777E23B9EBC317A7967C393AB06E3B10B7018123B4FDD2B928`.

## Executed checks and evidence limits

- Independently reran `python -m unittest tools.tests.test_popbridge_contract -v`: 9 tests passed, 0.797s. These execute Python YAML geometry/contract checks only, not Verse or the controller integration.
- Independently ran `python tools/map_workflow.py plan specs/039-popcorn-parkour/map.yaml --ready`: INVALID, missing approval.yaml; A01/A02 reported open. No bundle or approval was regenerated. Readiness remains blocked as intended.
- Implementer's `source-development.md` records authoritative BuildAll with empty diagnostics. This is referenced compilation evidence, not a fresh QA compile or behavioral pass. The compiler-checked `self_check` is never called; its assertions are not executed evidence.
- Serialized native MCP toolset discovery and SessionToolset schema discovery succeeded. Fresh `GetGameState` returned `CanStart`. No game was running, so no StopGame was needed. UEFN remains open; no pending MCP call; editor ownership released to Supervisor after this report.

## Source defects

### QA01 — P2: first early Heat/Pop shot has no wrong-order feedback

R02/R06; starter teaching zone. `Content/fn_shoreline_island_popbridge_controller.verse:127–129` permits initial ownership only for instruction0. Reproducer by source trace: reset/unowned attempt, player grounded on starter, shoot Heat or Pop. The handler returns before fixtures.shot and wrong_puff.Begin; prefix stays0, but no tiny puff/message appears. Expected: early Heat/Pop gives visible tiny puff while retaining prefix. Fixtures.self_check at `...popbridge_fixtures.verse:207` tests Heat with owner_matches=true and therefore misses this integration failure. Deterministic source path; runtime reproduction not run. Implementer should allow an eligible starter player's wrong teaching shot through the feedback path without accepting an instruction or allowing foreign takeover. Add a controller-level initial wrong-shot check in the later authorized harness.

### QA02 — P2: expected teaching instruction is not highlighted or named

R02/R06 and approved course skill.wrong_order contract; starter zone. `...popbridge_controller.verse:143` renders `Next: 1` / `Next: 2`, while `:252–255` activates every teaching target identically until all three are saved. No method changes the expected mechanism cue after prefix advances; OnBegin also never initializes the ribbon text (`:93–103`). Reproducer: begin fresh attempt, hit Load, inspect generated state commands. All three surfaces retain the same activate cues and the only next-step text is a number; wrong-shot feedback says “next glowing instruction” although none is distinguished. Expected: clear next named instruction and expected mechanism highlight, plus readable initial ribbon. Deterministic absence in source, visual runtime untested. Implementer should initialize teaching presentation and update an explicit expected-instruction cue/name on reset and prefix changes while retaining wrong-order clickability.

### QA03 — P1: departure can retain delayed execution authority until monitor poll

R08/R09; any invoked machine, especially finale. `...popbridge_controller.verse:148–150` checks player activity, owner, generation and round, but not current character activity or bay presence. The only bay departure check is the 0.1s polling monitor at `:214,223–224`. Source schedule reproducer: monitor accepts owner inside bay; owner leaves bay during final execution Sleep; execute resumes before next monitor iteration. valid returns true, then `:172–178` commits geometry/finished state and can call complete_challenge(2) outside the bay. A later release clears attempt but cannot undo an awarded badge. This is a reachable scheduling defect inferred from guards, not an observed cooked race. Return/removal callbacks synchronously release and are covered separately; they do not close the plain-departure gap. Implementer should check live active character/bay authority at delayed continuation and immediately before commit/award, releasing/restoring effects on failure. Verify boundary departure during final beat in the authorized runtime phase.

### QA04 — P2: reusable validator accepts a finale prerequisite shortcut

R04/R07 and adapter-development fail-closed prerequisite validation. `...popbridge_fixtures.verse:107,121–125` requires finale source to exist but does not require terminal finish source. Reproducer on otherwise valid feature039 records: change receiver7.from_landing from6 to0, retain instruction3/creates=-2. validate still returns true: no geometric producer edge is required for finale. After teaching Pop commits, starter remains visited; fixtures.shot for finale on present0 accepts, and complete sets finished=true (`:153–181`). Controller then awards milestone2 without branch/finish arrival. This does not allege current YAML is wrong: it currently says finish. It demonstrates the runtime editable validator can accept the exact shortcut rejected by Python test_receiver_shortcut, so offline YAML results cannot establish runtime fail-closed capability. Implementer should validate finale against an explicit terminal node/route contract, and add malformed finale-source fixture coverage. Terminal-node metadata can keep this reusable instead of hardcoding feature039 target IDs.

## Requirement review matrix

| Requirement | Source finding | Evidence status |
|---|---|---|
| R02 | Prefix increments only for expected instruction; wrong prefix preserved. Initial wrong-order integration and expected cues fail QA01/QA02. | Static review; Verse checks not executed. |
| R03 | saved=[0,1,2]; later execute iterates same IDs, moves each prop25cm and restores home after0.25s. Deck commit occurs afterward. Pending/consumed guards prevent duplicate routine. Teaching effects can overlap under rapid shots; identical motion/pose and native collision require real bindings. | Static support only; physical sequence not run. |
| R04 | built+IsOnGround+inset XY/top tolerance; fixture land uses checkpoint edge; shot requires visited predecessor. Both fork receivers use same generic logic with feature contract equal routes. Runtime terminal validation fails QA04. | YAML paths independently pass; actual landing/jumps not run. |
| R05 | Catch polling0.1s, retry debounce0.2s, failed TeleportTo leaves state intact and shows Return. Recovery does not change generation/prefix/built/visited/consumed. | Static support; latency, feet-origin/tolerance, recovery landing and native failure not run. |
| R06 | Wrong puff/flourish VFX and prop motion are configured hooks. Expected cue missing QA02; actual moustache/bucket/basket art/collision remains scene phase. | No muted/visual gameplay acceptance. |
| R07 | Milestone0/1 from accepted landings,2 from final completion; shared nursery_progress retains completed/badge_earned guard. No duplicate badge manager. | Static integration support; tracker/Core/HUD/journal/Agent continuity and prior badge not run. |
| R08 | Return, Replay, removal and round monitor reset generation, stop configured effects and restore props; replay retains shared progress, teleport failure leaves cleared attempt. Departure has QA03. | Static review; callback/reset/replay native testing not run. |
| R09 | Handler rejects foreign attributed players; fixtures rejects supplied stale token/pending inputs. Native Hit supplies agent only; controller attaches current generation when processing, so compiler fixture stale-token checks cannot prove stale native event rejection. | Solo/multiplayer and stale event delivery not run. |

Additional capability limits: runtime validator does not establish bay/catch/inset/height-tolerance bounds, unique milestone assignments, equal branch balancing or deck/prop reference identity/non-collision; current YAML data is independently checked but future editable binding must be verified. Do not infer those guarantees from validate=true. self_check covers a feature039 fixed-ID pure transition subset and Replay generation only; it does not cover controller acquisition, monitor departure, recovery native failure, round callbacks or physical props. These unexecuted checks remain required before resolving adapter/runtime gates.

All gameplay acceptance scenarios R01–R10, project validation, cook, actual solo/multiplayer shots, both routes, floor/airborne shortcuts, recovery timing/failure, muted comedy and first-use learning/enjoyment are **not run** in this source-only phase. Fix responsibility for QA01–QA04: Implementer; approval/blockout changes, if needed: Planner and human reviewer through Supervisor.
