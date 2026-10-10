# Pattern Scanner: one fresh practice set on Replay

Status: proposed for planning; 2026-10-09, autonomous cycle6.
Source request: continue Producer-led product improvements after successful builds, with delegated review and no automated gameplay testing.

## Recommendation and evidence

Add **one authored alternate three-puzzle set** to Pattern Scanner's existing completed-run Replay. Keep the accepted first run exactly as it is. The replay should let a child apply the same repeating-group ideas to different symbols, using the same three stationary answer targets, board, lights, hints and safe retry. No procedural generator or new area.

[028 spec/tasks](../../specs/028-pattern-scanner-cargo-circuit/spec.md) record an implemented, owner-accepted working/fun lesson with three intentionally fixed puzzles. [Current controller](../../Content/fn_shoreline_island_pattern_line.verse) uses editable success_ids, patterns, hints, groups, answers and solved strips, with the same set on every Replay. This is a clear content-extension opportunity, not a claim that the accepted activity is defective or players have been observed memorizing it. Do not reopen028 acceptance or reinterpret its optional historical tests as blockers.

The learning aim is to identify the repeating group and infer the missing symbol in another example. Different examples can support applying the rule rather than only repeating a known answer order; that benefit is a hypothesis requiring player evidence. Preserve the first-play simplicity that the owner already liked.

## Bounded product scope

Only explicit Replay after all three puzzles are completed selects the alternate set. Subsequent completed Replay alternates between original and alternate. Ordinary wrong shots, phase transitions and mid-run departure/re-entry do not switch sets; re-entry restarts puzzle1 of the selected set, retaining the current badge/progress rules. A new round or replacement player begins with the original set. No new Replay access during an unfinished run.

Author exactly three alternate puzzles matching the original learning progression: two-symbol continuation, interior gap in a two-symbol pattern, then three-symbol continuation. Keep six slots, one gap, existing A/circle B/triangle C/square identities, one intended answer and the same difficulty progression. Candidate set for Planner/learning review:

| Stage | Alternate strip | Correct target | Repeating group |
|---|---|---|---|
|1|B▲ C■ B▲ C■ B▲ ?|C / index2|B▲ C■|
|2|B▲ C■ ? C■ B▲ C■|B / index1|B▲ C■|
|3|B▲ C■ A● B▲ C■ ?|A / index0|B▲ C■ A●|

These candidates need an exact synchronized question/hint/escalated-answer/solved-strip table before implementation. The wrong-answer hint should identify the rule; the existing second-mistake hint may name the answer as it does today. All board and HUD views must derive from the same selected set. Avoid displaying the original example alongside a different active puzzle.

Preserve native target IDs/order/transforms, editable bindings, first-run original values, three-stage completion/progress guards, badge once per round, wrong retry, held-fire scoring lock, all timings, owner attribution, journal source/module identity, Replay/Return controls, return path and other lessons. No random seeds, difficulty selector, added widgets, bonus currency, scores, timer, target relocation, art replacement or global controller refactor.

## Planner handoff and dependencies

Create a separate numbered behavior-change spec/plan and required review bundle; **this is gameplay content and replay behavior, not the small text-only exception**. Preserve028's accepted artifacts. Supervisor owns serialized editor access. Read current saved editable values and active actor/bindings before treating source defaults as the baseline. Resolve the smallest supported representation for one additional authored set; keep selection stable for an attempt and cancellation generation rules intact. No new actor should be necessary, but source feasibility must be demonstrated.

Trace exit, respawn, disconnect, round reset and Replay selection separately. In particular, shared reset helpers must not accidentally toggle the set on ordinary re-entry or erase the intended replay selection. Existing [loop progress](../../Content/fn_shoreline_island_loop_progress.verse) remains reward authority; alternate completion must not grant another badge. Planner should return a material feasibility/scope problem rather than quietly broadening the adapter.

## Success and limitations

- Offline review proves both complete six-slot sets, answer indices, hints and solved strips agree; all consumers use one selected set. Review correct/wrong and lifecycle state transitions, including cancellation during feedback and replay selection boundaries.
- Native/source verification preserves the original first-play values and all target/binding/geometry/reward identities; Verse builds with recorded diagnostics. No game/session/cook/push or gameplay input.
- Owner manual remains pending: complete original, Replay into alternate, use deliberate wrong answers and second-mistake hints, complete without duplicate badge, Replay back to original; leave/re-enter/respawn mid-alternate and begin a new round to check the specified set behavior. Check all text fits existing board/HUD and normal Return works.
- A player explains the repeating group on a new example. Compilation or correct answer tables do not prove learning, engagement or cooked playability.

050–055 manual checks remain open independently. No need to stack new journal behavior on055 while waiting; the [055 saved implementation](../../specs/055-journal-controller-navigation/evidence/implementation-summary.md) is retained unchanged.

## Alternatives considered

| Opportunity | Decision |
|---|---|
| One authored Pattern replay set | Select: concrete existing content mechanism, meaningful practice, preserves accepted onboarding, no geometry dependency. |
| More journal/copy changes | Defer: recent guidance and input work already covers the clearest source-backed issues; allow manual feedback to inform further UI changes. |
| Replace Confidence or another full lesson | Defer: current source already has a purposeful check/change/recheck sequence; no new evidence justifies a broad redesign. |
| Bulk auxiliary/target visual work | Defer until existing pilots provide manual evidence. |

Local-only Producer inspection covered055 evidence, current Pattern/Classifier/Confidence/Error controller paths,028 acceptance and loop progress. Wrote only this brief; no editor, source, assets, specs or acceptance changes.
