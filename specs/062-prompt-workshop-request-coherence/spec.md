# 062 — Prompt Workshop request coherence

Status: ready for human design review; unapproved, unimplemented. Date: 2026-10-10.

Improve the main Workshop's choose → send → observe → revise lesson for ages 8–10. A changed instruction must have an intelligible relationship to Pix's result. Source establishes contradictory correction advice and mutable displayed choices during a captured submission; no new player observation is claimed.

Inputs: [Producer](../../docs/producer/prompt-lab-improvement-brief.md), [Learning Designer](../../docs/specialists/prompt-lab-improvement/learning_designer.md), [Player Experience Reviewer](../../docs/specialists/prompt-lab-improvement/player_experience_reviewer.md), [Scout](../../docs/specialists/prompt-lab-improvement/technical_scout.md).

## Scope and requirements

- **FR01 Truthful correction:** all seven wrong complete combinations retain selections, award nothing and use the exact matrix below. Do not certify a wrong unmentioned value. The two RED+SMALL combinations reject immediately before movement; this is an explicit exception to 027's every-complete-request demonstration behavior.
- **FR02 Stable submission:** six selectors cannot change or queue values during fetch, carry, result hold or either return move. After a wrong demonstration completes, editing resumes. After success, the successful values stay through Connect/completion until Replay. Existing Inspect stays available.
- **FR03 Accurate guidance:** existing request HUD, feedback and journal agree about waiting, wrong result, ready revision, Connect and completion. The correction persists at readiness; no new HUD device/widget. Rejected input must not say wait for a result already shown.
- **FR04 Safe lifecycle:** reserve one owner synchronously; double Send starts once. Replay, actual exit/departure, respawn and round reset invalidate prior work. Before success commitment, canceled work cannot later show a result, award or displace the replacement attempt. After legitimate commitment, earned DATA stays. Never assume teleport interrupts an in-flight MoveTo.
- **FR05 Preserve success/rewards:** BLUE+LARGE+REACTOR demonstrates and grants 5 DATA once per run; Connect is available immediately on successful delivery, including return, and grants 3 once per run. Repeated Connect grants nothing. Existing shared Prompt badge guard remains unchanged. Replay preserves earned total/badge and permits the existing next-run 5+3 policy; round reset follows existing progress policy.
- **FR06 Preserve scene/integration:** zero spatial delta; no actor, scale, native device setting, binding, floor, walkway or entry-volume change. Preserve ten buttons, existing two HUDs/two boards, three cores, Pix, destinations, module, hub/journal and west return. Solo product scope. Optional Arena, other modules, 061 and unrelated baseline assets remain outside scope.
- **FR07 Human learning/visibility:** record neutral prediction, revision explanation, destination transfer and ordinary-position readability/pacing with an unfamiliar intended-age player. These manual checks remain separate from cooked functional QA; completion alone does not establish learning or enjoyment.

## Complete-request feedback matrix (FR01)

All text refers to this clue, not general AI accuracy. R=REACTOR; S=SCANNER. Supported wrong demonstrations show the result text below and then the phase cue specified in plan.md. At ready, persist the correction text. Correct slot affirmation occurs only for known correct slots.

| WHAT / WHICH / WHERE | Result behavior and exact correction |
| --- | --- |
| BLUE / LARGE / R | Existing successful delivery: “The LARGE BLUE core powered the module. Press CONNECT.” |
| BLUE / LARGE / S | Demonstrate scanner. “Pix went to the SCANNER. Change WHERE to REACTOR; keep BLUE and LARGE.” |
| BLUE / SMALL / R | Demonstrate small blue at reactor. “Pix moved the SMALL BLUE core. Change WHICH to LARGE; keep BLUE and REACTOR.” |
| BLUE / SMALL / S | Demonstrate small blue at scanner. “Pix moved the SMALL BLUE core. Change WHICH to LARGE. Then check WHERE against the clue.” |
| RED / LARGE / R | Demonstrate red at reactor. “Pix moved a RED core. Change WHAT to BLUE; keep LARGE and REACTOR.” |
| RED / LARGE / S | Demonstrate red at scanner. “Pix moved a RED core. Change WHAT to BLUE. Then check WHERE against the clue.” |
| RED / SMALL / R | Reject before owner reservation/animation: “Pix cannot show a SMALL RED core here. Change WHAT to BLUE. Then check WHICH against the clue.” |
| RED / SMALL / S | Reject before owner reservation/animation: “Pix cannot show a SMALL RED core here. Change WHAT to BLUE. Then check WHICH and WHERE against the clue.” |

Unsupported rejection names an available next revision without promising one change will solve all remaining errors. Changing only SMALL→LARGE permits the normal wrong-red demonstration; changing only RED→BLUE permits the normal small-blue demonstration.

## Given / When / Then acceptance

- **AC01 (FR01):** Given each matrix row, when Send is pressed after Inspect, then record values, movement/absence, object/destination, exact text and DATA/badge deltas against the row. All seven unsuccessful rows preserve values and award zero.
- **AC02 (FR02–03):** Given a supported request, when each of six selectors is attempted in fetch, carry, result hold, core return and Pix return, then no value changes/queues and persistent guidance identifies the current phase. After wrong readiness, one edit changes the visible request and next submission together. Repeat after successful delivery, return, Connect and completion: successful values stay until Replay.
- **AC03 (FR03):** Given a wrong result during return, when Inspect, edit or Send is attempted, then the request/journal retain the correction and accurate wait/return state. At readiness the correction remains actionable. Inspect may temporarily show the clue without erasing persistent correction.
- **AC04 (FR04):** Given each motion phase plus immediate Send-before-spawn and result hold, when Replay, actual exit/departure, normal respawn or round reset occurs, then token invalidates, props recover and a replacement attempt receives no stale movement/result/reward. Capture each return move separately. Cancellation after committed success keeps legitimately earned DATA. Record native interruption behavior explicitly.
- **AC05 (FR04–05):** Given rapid double Send, early Connect, and valid success, when controls are used, then one execution starts, early Connect grants nothing, valid Connect during return grants 3, repeated Connect is inert, and 5+3 occurs once per run. Replay→complete permits next-run DATA and no duplicate shared badge.
- **AC06 (FR06):** Given approved source implementation, when current bindings/counts/transforms are read back and the cooked journey is played solo, then existing geometry/bindings remain unchanged, arrival/Inspect/progression/reset/re-entry/respawn and west return work. Native Verse build, project validation and cooking must pass; record warnings.
- **AC07 (FR07, manual pending):** Given BLUE+SMALL+REACTOR, before changing to LARGE ask “What will change if you choose LARGE and send again?” Then ask “What changed in your request? What did Pix do differently?” Record words and help. Use BLUE+LARGE+SCANNER as an uncoached destination probe. Record whether clue, request, full result, wait/ready and return are visible from ordinary positions and actual timing. No automatic acceptance of this criterion.

No approval.yaml exists; specialist reports and this review are not approval. Actual geometry, runtime movement interruption, current binding/representation and playtest shutdown state are unverified. See review.md and evidence/supervisor.md.
