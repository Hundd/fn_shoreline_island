# Error Lab: confirm Pix movement before credit

Status: proposed for planning; 2026-10-09, autonomous cycle7.
Source request: continue Producer-led independent improvements after successful builds, with delegated review and no automated gameplay tests.

## Recommendation

Make Error Lab's route result depend on confirmed Pix marker movement. If its start placement or a route step fails to move to the intended tile, stop that attempt without progression or penalty, explain that Pix could not move, and safely re-arm an ordinary correction retry. A successful physical rerun reaching the goal retains the current lesson, timings, lights and reward.

This reinforces the lesson's central idea—check the actual result—and fixes a source-level failure-handling gap. It is not a claim that a teleport failure has occurred in a player's game.

## Evidence and priority

[Current Error Lab source](../../Content/fn_shoreline_island_debug_station.verse) has `move_pix(tile)` returning void and discarding `marker.TeleportTo` failure in an empty conditional. `execute_plan` advances `actual_tile` arithmetically, calls that helper, then permits progress/light/phase completion when the computed tile equals the goal. Thus the current failure path can claim a verified match even when the visible marker did not reach the tile. The approved [031 spec](../../specs/031-ai-error-lab-shoot-to-fix/spec.md), R-03/R-06, requires a verified rerun endpoint, not answer-ID credit.

[Current Tool Lab source](../../Content/fn_shoreline_island_event_station.verse), `animate` and `execute_action`, checks TeleportTo success and destination readback before accepting output/progress. It reports a tool movement failure with no credit. This provides a local API/recovery precedent, not proof that its exact helper can be copied unchanged into Error Lab.

Compared with more authored replay content, this guards the integrity of an existing result the child is being taught to trust. It is independent of the new056 Pattern set, pending journal input checks and recent Prompt geometry. [056 implementation](../../specs/056-pattern-replay-variation/evidence/implementation-summary.md) remains unchanged; do not add another alternate set in this cycle.

## Bounded Planner scope

Work only on Error Lab's Pix route movement confirmation and the resulting failure branch. Inspect current saved marker reference/transform, track origin/spacing and stage configuration before defining the concrete readback tolerance. Tool Lab's5cm precedent is a candidate, not permission to assume every current bound is identical. No new scene placement or asset is expected.

A route attempt must confirm its start placement and every step, including STOP's same-tile placement, using supported TeleportTo return and actual marker position. Only confirmed movement may update the reported reached tile; only a completely confirmed rerun ending at the goal may invoke current progress/light/phase-success logic. Preserve existing run_valid checks before/after waits and normal0.5s instruction cadence. Never bypass a failed return value merely because the intended coordinates look correct.

On an active attempt's failed move/readback, show a short system-recovery message such as `Pix couldn't move. Try your correction again.` and no MATCH/success recap. Do not increment the learner's mistake count, award credit, advance the phase or overwrite the expected goal. Cancel the remainder of that execution path and use the existing quiet-fire/owner/generation mechanism to re-arm the same stage. The next correction reruns from the authored start. If movement continues to fail, repeat a safe no-credit result; existing Return remains available. No automatic retry loop, new button or teleport workaround.

Apply the same no-false-result rule to the automatic faulty-plan demonstration: a failed demonstration must not be presented as observed evidence. Planner must specify how it safely returns to existing correction interaction without inventing a successful BEFORE/NOW position. Cosmetic idle reset placement may remain best-effort, but no later scored attempt may rely on it without confirming its own start. Goal-marker/label relocation is not part of this proposal; any discovered separate defect returns for review.

Preserve the exact three stage programs, editable slot, intended answers, target IDs, props/labels/layout, instruction timing, normal success delay, quiet interval, hint escalation for genuine wrong endpoints, active owner/character guards, reset/respawn/departure/Return cancellation, Replay, progress manager and one-time badge. Keep shared movement/target/progress classes and other lessons unchanged. A cosmetic target-hit acknowledgment is not badge credit; do not redesign existing shot feedback.

This is a gameplay-verification behavior change. Prepare a separate numbered spec/plan and required concrete review bundle, not a text-only exemption or alteration of031's approval. Resolve every movement-result consumer and error/re-arm path before implementation. No engine/plugin additions.

## Success and verification limits

- Source/control-flow audit: failed start, failed intermediate step, failed STOP and readback outside tolerance cannot reach MATCH, light/progress award or phase advancement; cancellation exits silently without a stale recovery message. Confirmed correct and wrong endpoints preserve current branches.
- Native compile passes and loaded source/diff show only bounded movement confirmation/recovery. Read back unchanged actor settings/bindings. If a useful offline failure-case model is used, label it static evidence; do not claim a simulated mock is native execution.
- Owner manual checks remain pending: normal three-stage demonstration/correction, genuine wrong endpoints/hints, completion/Replay badge guard, Return/reset during execution; observe a controlled movement-failure case only through an owner-approved reversible diagnostic. No destructive marker removal or production fault injection.
- A child should see that credit follows the result; learning effectiveness is not established by code checks.

No session/game/cook/push or gameplay input is authorized. Current050–056 manual checks remain open independently. If the installed source cannot safely distinguish movement success from failure without broad changes, return a concrete feasibility blocker.

## Alternatives considered

| Opportunity | Decision |
|---|---|
| Error Lab movement-confirmed credit | Select: precise source failure path conflicts with existing verification intent; local supported precedent; no new content/layout. |
| Additional Pattern variants or journal interaction | Defer extension until new056/055 manual feedback; no need to duplicate recent features. |
| Broad lesson redesign | Defer: existing Classifier/Confidence/Tool paths already teach their intended distinctions; no stronger evidence for replacement. |

Local-only Producer review inspected current Error/Tool execution and recovery paths,031 intended contract and056 evidence. Wrote only this brief; no source, editor, assets, specs or acceptance changes. Supervisor owns editor/shutdown and subsequent dispatch.
