# Prompt Lab improvement brief

Status: proposed for planning; no design approval or gameplay changes.
Date: 2026-10-10.
Source request: improve Prompt Lab through Supervisor → Producer → independent Learning Designer and Player Experience Reviewer → Technical Scout → Planner; present a concrete plan and preview for human approval before Implementer and independent QA.
Ownership: Producer `/root/producer`, Codex host, resolved `producer_model.codexcli = gpt-6-astra`. Offline source/evidence review only; Supervisor retains editor ownership and shutdown responsibility. This is the current handoff; the older focused-improvement brief remains historical evidence of completed 049/051/052 work.

## Recommendation

Improve the main Prompt Workshop's **choose → send → observe → revise** loop so the request on screen, Pix's result and the correction advice always agree. Keep the current scene and three-choice task. Give the player one clear correction to make, preserve their valid choices, and make the submitted request stable while Pix demonstrates it. This is a focused teaching/feedback improvement, not a replacement activity.

The main module teaches that the details in an instruction change what Pix does. It should let an 8–10-year-old predict a result, observe it and explain why a changed detail helped. An instruction about keeping choices must be true even when the child has made more than one mistake. This is more valuable now than adding another mechanic to the optional shooting arena.

## Current baseline and evidence

- [Roadmap](../../plan.md), [044 travel spec](../../specs/044-hub-pix-mission-travel/spec.md): Workshop is canonical module 1. The distant shooting activity is optional and shares its badge. The roadmap's 2026-10-05 checkpoint predates 049–061, so later evidence controls their respective changes.
- [027 interaction evidence](../../specs/027-prompt-workshop-redesign/evidence/interaction-clarity-2026-09-28.md): the owner reported being able to play after Inspect/choice/Send guidance was improved. Treat that specific discovery issue as resolved; do not reassert that buttons are unusable. [027 tasks](../../specs/027-prompt-workshop-redesign/tasks.md) still lack comprehensive wrong-result, lifecycle, first-use and visual acceptance. Its draft spec header is stale relative to implementation/task evidence.
- [049 final QA addendum](../../specs/049-prompt-lab-clear-start/evidence/postfix-qa.md): ten ready starts and normal respawn recovery passed after the Arena entry repair. The complete west return and second full-completion guard were not run. These are coverage gaps, not newly proven defects.
- [051 implementation](../../specs/051-prompt-answer-correspondence/evidence/implementation-summary.md): eight actors were saved to align core visuals with hit anchors and separate small blue. [052 tasks](../../specs/052-prompt-retry-hints/tasks.md) record specific wrong-shot hints; [054 tasks](../../specs/054-optional-prompt-arena-header/tasks.md) record an Optional Prompt Arena HUD header. All three retain owner manual acceptance gaps. Do not propose these changes again or claim them runtime-proven.
- [061 spec](../../specs/061-hub-pix-interaction-repair/spec.md): a later hub Pix interaction/collision repair has its own manual acceptance boundary. It is outside this Prompt improvement; a travel failure must be diagnosed against that work rather than disguised as a Workshop redesign.

## Chief problems, ranked

### 1. Correction advice can falsely validate wrong choices

**Source-established inconsistency, not a reproduced client observation.** In [Workshop controller](../../Content/fn_shoreline_island_prompt_workshop.verse), lines 120–122, all three wrong-result messages say to keep the other choices. Lines 393–406 select only the first mismatch: WHAT before WHICH before WHERE. Thus RED + SMALL + SCANNER receives advice to change WHAT to BLUE and keep SMALL and SCANNER, even though both still prevent success. BLUE + SMALL + SCANNER similarly receives advice to retain the wrong destination.

Recommend truthful incremental feedback: identify a specific mismatch and invite a further check where other details are still wrong; never call an incorrect slot correct. Retain existing selections so the child revises rather than rebuilding. Learning Designer should refine short wording and the learning check; the Planner chooses the exact feedback matrix. One correction per attempt is acceptable if the text honestly says further checking may be needed.

### 2. A submitted demonstration can disagree with the visible editable request

**Source-established reachable logic, physical reachability/runtime impact not tested.** Choice handlers at lines 316–327 change the player's state without an execution-owner guard. Send at line 345 captures the three values for asynchronous `run_request`, while `show_request` at lines 213–219 reads current values. Pix animates the captured request. Editing a choice during delivery can therefore show one request while Pix acts on another, and the result message describes the earlier submission.

Recommend that submitted choices remain visibly stable until the demonstration finishes, with a brief wait cue for an attempted edit. Keep Replay and departure cancellation available. Do not silently queue a different request or leave the child believing an in-flight edit changed the active demonstration. Technical Scout must check the narrowest safe existing-controller change and interactions with result/Connect state.

### 3. Learning and visibility acceptance remain weakly evidenced

**Recorded evidence gap; confusion is a hypothesis.** Existing tasks do not establish that a first-time child can explain LARGE and WHERE, sees the full demonstration from ordinary positions, or understands Workshop versus optional Arena. Existing improvements may already be sufficient. Collect these observations in acceptance; do not use unchecked boxes as justification for relocating the room or adding more signage.

## Scope and preservation

In scope: main Workshop request state, feedback and the minimal presentation needed to communicate waiting/result/revision. Planner must inspect the saved main Workshop and measure existing player positions before proposing any actor change. Default to no geometry change; the offline preview should still show the current activity flow and the exact bounded delta.

Preserve Inspect, six physical choice controls, Send, Connect, Replay, visible Pix/core demonstration, existing safe attempts, valid-slot retention, 5 DATA on accepted Send plus 3 on Connect under the existing replay policy, one shared Prompt badge, solo access, cancellation on departure/replay/reset, walkable west return, existing hub/journal integration, floors and garden walkway. Preserve working lifecycle guards; any regression fix must be explicit in the numbered spec.

Exclude new stages, random missions, optional Arena geometry/mechanics, full room replacement, additional HUD systems, device-host conversion, other modules and reward redesign. Existing 051/052/054 runtime gaps remain separate checks, not silently closed by this feature. Do not revive old multiplayer requirements as a new expansion: current product configuration is solo.

The source represents only one red core although the two independent color/size controls permit RED + SMALL. This is an additional modelling question for Learning Designer and Technical Scout, not evidence that a fourth prop must be added. The plan must explain what Pix demonstrates for that combination without teaching a false causal claim.

## Candidate acceptance for the Planner

- **P1 — truthful correction:** Given each of the seven wrong complete combinations, when Send resolves, feedback identifies an actual mismatch and never tells the player to retain a wrong slot as correct. No wrong submission grants DATA or a badge. Correct selections persist and can be revised individually.
- **P2 — coherent submission:** Given a submitted request, when the player tries each choice during fetching, delivery and return, the visible submitted request and demonstrated result remain consistent; an edit attempt gets an understandable response. After readiness returns, a new selection updates the request and the next Send uses it.
- **P3 — safe control recovery:** Given execution in progress, Replay or actual departure cancels it without a late result/reward or stuck busy state. Re-entry and normal respawn recover. Rapid double Send starts one demonstration. Connect remains usable at its intended point.
- **P4 — preserve success:** Given BLUE + LARGE + REACTOR, completion still demonstrates delivery, awards the established 5+3 DATA, and grants the shared badge once. Repeated Connect and subsequent completion respect existing guards. Replay/round reset and west walking return retain intended behavior.
- **P5 — observed learning:** Given an unfamiliar player who has made and corrected a wrong choice, ask what changed and why Pix's next result differed. Record their words and any assistance; look for a link between the changed instruction detail and outcome, not just memorized button order. Avoid claiming enjoyment or learning from successful automation.
- **P6 — readability and pacing:** From ordinary choice and Send positions, record whether the player can see the request, selected object/destination, result and next action without a contradictory HUD. Time the actual interaction before deciding that it needs shortening.

Before approval, the Planner should turn these into requirement-linked Given/When/Then scenarios and resolve the two feedback/state decisions in a fresh numbered bundle. After approval, meaningful verification needs native build, validation and cooked independent QA plus explicitly identified human learning observations; the current user requests independent QA after approved implementation. Historical no-game restrictions in older feature evidence are not adopted as current instructions. Never mark manual criteria passed by source inspection.

## Alternatives and dependencies

| Opportunity | Decision and tradeoff |
| --- | --- |
| Request/result coherence and truthful revision | Priority 1: two concrete source contradictions affect the central lesson; likely bounded controller work, effort provisional until Scout review. |
| Close existing Arena visual/manual acceptance | Valuable parallel evidence collection when permitted; no further geometry recommendation until current changes are observed. |
| Compact or restyle Workshop | Defer: physical walking/sightline problems require current measurement and player evidence; regression surface is larger. |
| Add transfer challenge or randomized prompts | Defer: potentially stronger learning, but first make one existing request dependable and understandable. |

Required specialist inputs: Learning Designer independently checks the misconception, multiple-error wording, red/size representation and observable learning criterion; Player Experience Reviewer independently checks wait/retry clarity, actionable result and potential HUD conflicts; Technical Scout establishes exact controller/binding reuse and lifecycle feasibility. Producer resolves any resulting scope tradeoff; Planner owns geometry, schema feasibility, preview and final implementation design. No specialist or Producer report constitutes human approval.

Verification of this brief: read relevant current source, specs, tasks and recorded QA/implementation evidence offline. No new playtest, editor access or first-hand player observation; no gameplay file or acceptance checkbox changed. Supervisor reports native Unreal MCP tools absent, the local MCP endpoint unreachable and the desktop locked in the current session; therefore fresh live inspection and cooked checks are currently unavailable. These environment limits do not invalidate the offline source findings or establish the saved actors as current verified runtime state.


## Specialist consolidation — 2026-10-10

Reviewed the independent [Learning Designer](../specialists/prompt-lab-improvement/learning_designer.md) and [Player Experience Reviewer](../specialists/prompt-lab-improvement/player_experience_reviewer.md) reports. The following decisions refine and supersede less specific wording above. Scope remains the existing Workshop controller and presentation; no geometry or new prop is proposed.

### Stable request until the attempt is resolved

Accept the reviewers' extension through successful completion. Hold submitted values stable while fetching, carrying, showing the result and returning. After a wrong demonstration finishes, allow revision again. After a successful demonstration, retain the successful request through Connect and completion until Replay starts a new attempt. Do not let a new wrong selection appear beside an earned successful module. Do not erase delivered success or alter rewards to accommodate an edit.

Choice edits are the actions to guard; do not install a blanket busy guard in front of Replay, cancellation or valid Connect. Connect remains usable as soon as the existing successful-delivery condition permits it, including the successful return interval. Preserve DATA 5 on accepted Send and 3 on Connect once per run, existing replay earning policy and existing shared badge guard.

### Result and readiness must agree

Accept phase-accurate guidance as part of the coherence fix. The player may read the reason for failure while Pix returns, but the instruction must distinguish 'wait' from 'change now'. When Pix is ready, the selected correction must still be available in existing guidance; it must not disappear before the child can act. A rejected Send must not say 'wait for the result' after the result is already on screen. Reuse current feedback/request/journal surfaces and avoid another widget. Planner owns the minimal phase representation and exact copy matrix; runtime display timing remains a QA observation.

### Unsupported RED + SMALL

Select **pre-demonstration rejection**, at either destination, with retained choices, no movement, no DATA/badge and immediate editing available. Candidate factual copy: 'Pix cannot show a SMALL RED core here. Check the clue.' The existing controller has only one red prop and no red size selection; the message describes this activity's capability, not a universal fact about AI or a claim about unseen inventory. Planner may shorten/refine copy while preserving that meaning and clear next action.

This is preferable to partial demonstration: moving the one red prop while silently ignoring SMALL would preserve the visual contradiction being repaired, and explaining that only part of a submitted request was demonstrated adds a second interpretation rule for a child. Adding a fourth prop would expand geometry and asset scope. Do not automatically change SMALL to LARGE or RED to BLUE: the child should make the revision. The clue comparison still supplies the route to the correct request.

Revised P1/P2 acceptance: test all eight complete combinations. The two RED+SMALL combinations receive the explicit unsupported-request response before animation; the five other wrong combinations receive truthful outcome/correction feedback; BLUE+LARGE+REACTOR follows success. All unsuccessful cases retain choices and award nothing. After a rejected RED+SMALL request, changing the size to LARGE permits the normal wrong-red demonstration, while changing color to BLUE permits the normal small-blue demonstration; neither change is falsely promised to solve every remaining mismatch.

The sole red prop's perceived size is not verified offline. RED+LARGE must not be accepted as a faithful size demonstration without checking current representation; its wrong-color result must avoid asserting an unverified size. Technical Scout/Planner should establish whether known saved evidence can resolve this before final review. No invented fourth prop or scale change is authorized by this brief.

### Bounded cancellation safety

Accept a cancellation repair only where necessary to make the above request lifecycle true. Replay, actual departure, respawn and round reset must invalidate an old attempt before it can begin or continue a later movement, change state or award. In particular, Scout reports potential stale-token windows before or between suspending movement calls. Planner must specify checks at these boundaries and distinguish preventing later work from interrupting a movement already running. Do not expand into a general movement-engine refactor or claim cancellation correctness from compilation.

Extend P3 with Replay/departure immediately after Send, during pickup, carrying, result hold and each return move; then start another attempt. Observe no stale displacement of the replacement attempt, no late result or reward, and a usable ready state. Add successful delivery before Connect and Connect during return to P4. QA must record the exact tested phases and any movement-interruption limitation.

Learning observation follows the Learning Designer's neutral prediction probe: before correcting BLUE+SMALL+REACTOR, ask what LARGE will change; afterward ask what changed in the request and result. Then use existing BLUE+LARGE+SCANNER to ask which detail should change while others stay. These are human observation probes, not extra gameplay stages or new reward gates.

### Final Scout resolution and Planner scope

Read [Technical Scout report](../specialists/prompt-lab-improvement/technical_scout.md). Its historical 027 readback records red and large-blue scale 2.5 versus small-blue scale 1.5. That supports the existing RED+LARGE demonstration as the planning baseline, with fresh representation/binding verification required before implementation and cooked acceptance. It does not justify a new prop or transform change. Retain the selected early rejection for RED+SMALL; this deliberately changes 027's 'every complete wrong request is demonstrated' behavior and must be an explicit requirement and human-approved exception in the new bundle. Do not use the Scout's alternative partial demonstration for these two combinations.

Final priority order inside this one feature:

1. Truthful seven-case error handling, including two unsupported RED+SMALL cases rejected before movement and five demonstrated wrong requests.
2. Stable values throughout execution and through successful Connect/completion, with Replay as the explicit new-attempt action.
3. Existing HUD/journal guidance that distinguishes waiting, the observed result, readiness to revise and successful Connect. Preserve current valid Connect timing.
4. Narrow token-boundary/cancellation safety required to prevent one attempt's work affecting another; no movement-system redesign without demonstrated necessity and a reviewed concrete implementation.

The no-late-reward criterion applies when cancellation occurs **before** success commitment. DATA already earned by a valid successful delivery remains earned if the player leaves or replays during return; cancellation must not revoke it. A new run may earn again under current policy. Token checks before and after suspensions are feasible source work, but the behavior of a native MoveTo already in progress remains an explicit runtime test, not an offline guarantee. Planner must specify a supported cancellation strategy or a concrete fallback/stop condition before implementation; it must not assume teleport automatically cancels motion.

No remaining product choice requires another user question before planning. Planner can prepare the bounded existing-layout preview, exact feedback/state table, implementation delta and requirement-linked acceptance now. Label spatial anchors as historical and state the live binding/representation and movement-cancellation preconditions. Technical access restoration and cooked checks are execution/acceptance prerequisites. The preview and plan still require the user's explicit approval; this Producer resolution supplies no approval record.
