# Prompt Workshop learning review

Date: 2026-10-10. Advisory input; no design approval or acceptance claim.
Request: independently assess the primary Workshop's educational quality before Scout and Planner consolidation, particularly multiple-error advice and submitted-request stability. Host: Codex; resolved worker model: `gpt-6.1-sol` from `.agents/workflow-models.yaml`; worker: `/root/learning_designer`. Supervisor owns the editor and shutdown. This review used offline source and recorded evidence only; no live inspection, gameplay edits or playtest.

## Focused objective

After observing a failed delivery, the player can identify an instruction detail that disagrees with the clue, change that detail while retaining correct details, predict the changed result, and explain how the changed instruction affected the next delivery.

The intended evidence is a child's prediction and explanation, supported by the visible demonstration. Pressing the hinted button or receiving a badge alone does not establish understanding. Keep the existing choose → send → observe → revise activity for ages 8–10; another mechanic is unnecessary for this repair.

## Evidence and independent findings

- The current clue names LARGE BLUE and POWER REACTOR (`Content/fn_shoreline_island_prompt_workshop.verse:95–98`). Six controls expose independent color, size and destination choices (`:85–91`, `:316–327`). This supports a concrete instruction-to-outcome lesson if all three details remain intelligible in the demonstration.
- The first mismatch wins (`:393–406`), but every error message says “keep the other choices” (`:120–122`). Three or two simultaneous mismatches therefore receive false reassurance. This is established source behavior, not a newly observed child response. The pedagogical risk is teaching that advice certifies every unmentioned detail.
- Send captures values (`:345`) while selection handlers can mutate the state (`:316–328`) and the request HUD reads that state (`:213–217`). The child could see a revised request while Pix executes an earlier one. This breaks the experiment's controlled relationship between an instruction and its result. Physical access and frequency remain unmeasured.
- A second coherence boundary deserves Scout inspection: selection handlers also remain active after successful delivery, whereas `delivered` permits Connect (`:296–304`, `:338–340`). The display could show a changed request beside a module earned by the earlier correct request. Preserve a clearly identified successful submission through Connect, or otherwise resolve the display/state relationship explicitly; do not expand into reward redesign.
- RED takes precedence over size and always selects the same `red_core` (`:368–375`). RED + SMALL and RED + LARGE do not produce distinct size demonstrations. The source does not establish the saved red prop's perceived size. This limits claims that all three fields are faithfully demonstrated for every possible request.
- Historical interaction discovery was repaired and the owner confirmed playability (`specs/027-prompt-workshop-redesign/evidence/interaction-clarity-2026-09-28.md`, final paragraphs). Broad wrong-result, visual and first-use checks remain open in 027 tasks T08/T12/T13. Those gaps do not prove present confusion. Optional Arena hint/header work in 052/054 has its own manual evidence gaps and cannot validate Workshop learning.

Context inspected: `plan.md` Product Direction/Product Decisions and Prompt journey; `docs/AI_MAP_WORKFLOW.md`; 027 spec/tasks and interaction evidence; 044 canonical mission order; 052/054 tasks; `docs/producer/prompt-lab-improvement-brief.md`; latest Workshop source available locally. Later solo direction controls over historical multiplayer tasks. Historical no-game restrictions are not adopted as current user instructions. The Supervisor reports a locked desktop and unavailable MCP; current runtime state and sightlines remain unknown.

## Action, feedback and retry

| Player action | Learning purpose | Feedback requirement |
| --- | --- | --- |
| Inspect and choose three details | Compare a request with a concrete goal | Preserve the clue and selected values; do not rely only on category names WHAT/WHICH/WHERE. |
| Send and watch | Test a prediction | Keep the submitted request stable through fetching, delivery and return. An attempted edit can say “Pix is trying this request. Wait, then change it.” |
| Compare result with clue | Locate a mismatch | Name a real mismatch and the next correction; distinguish partial correction from readiness. |
| Change one detail and Send again | Revise rather than restart | Retain all selections, including still-wrong selections, without describing those wrong values as correct. |
| Explain the changed outcome | Demonstrate causal understanding | Ask a neutral question and record the child's words and assistance. |

Recommended short copy for a single mismatch: “The clue needs BLUE. Change WHAT to BLUE.” Equivalent wording applies to LARGE and REACTOR. With more mismatches: “The clue needs BLUE. Change WHAT to BLUE. Then check size and place.” Use the relevant remaining field names rather than an indiscriminate “keep the other choices.” After correcting the named mismatch, the next attempt may still fail; this is acceptable if no advice promised that the correction would complete the task. The Planner should choose the precise matrix with the Player Experience Reviewer and verify it against all seven wrong complete combinations.

Describe requested values and actual observations separately. A clue comparison is safe even where the available prop cannot demonstrate the requested size. Do not claim “Pix moved the SMALL RED core” unless that representation exists and is observable. For RED + SMALL, a bounded proposal is to acknowledge the inventory limitation: “There is no SMALL RED core here. Check the clue: it needs LARGE BLUE.” Technical Scout and Planner must decide whether the existing demonstration can support that claim truthfully and when the message appears. Merely changing the correction hint does not resolve a misleading apparent size demonstration. No fourth prop is mandated by this review, but leaving the ambiguity undocumented is inadequate.

## Misconceptions to avoid

| Possible misconception (prediction, not observed fact) | Corrective teaching response |
| --- | --- |
| Any three filled fields make a good request | Compare each value with this task's clue; a complete request can still request the wrong result. |
| Unmentioned choices were verified by Pix | Say which detail to change and which others still need checking. |
| Changing a control immediately changes Pix's current action | Explain that Send starts one particular request; revise after its demonstration. |
| Size does not matter for red objects | State the scene's available-object limitation, or resolve representation; do not imply that size was successfully followed. |
| AI always obeys perfectly or BLUE is universally the right answer | Frame success as matching this clue in this staged activity. Avoid general claims that specific prompts guarantee real AI accuracy. |

## Candidate observable Given/When/Then checks

1. **Truthful multiple-error feedback:** Given each of the seven wrong complete combinations, when Send resolves, then the correction names an actual mismatch, does not validate another wrong choice, and retains current selections. For RED + SMALL + SCANNER, correcting only RED must not be promised to solve size and destination. Record the exact displayed text and selected values.
2. **Stable experiment:** Given a submitted request, when each choice is attempted during fetching, delivery and return, then the visible active request, actual prop/destination and result refer to the same submission; a brief cue explains when revision is available. After readiness, a changed value affects the next Send. Include the successful-delivery-to-Connect interval in the state review.
3. **Honest unavailable combination:** Given RED + SMALL at either destination, when it is submitted, then the player is not led to believe an unsupported size/color combination was faithfully fulfilled. Record actual prop appearance and wording; source inspection alone cannot pass this check.
4. **One-change prediction:** Given a first-time player who submitted BLUE + SMALL + REACTOR, when asked “What will change if you choose LARGE and send again?” before doing so, then record whether they predict a different sized blue core at the same place. After the attempt, ask “What changed in your request? What did Pix do differently?” Credit the relationship, not exact vocabulary.
5. **Destination transfer without new mechanics:** Given a player who corrected size, when shown the existing BLUE + LARGE + SCANNER request and clue, then ask what they would change and what should stay. Record whether they identify place while retaining color and size, before any corrective hint. This is an observational probe using existing choices, not a proposed new stage.
6. **Recovery preserves learning:** Given a wrong attempt or an attempted in-flight edit, when the player retries, replays or departs and returns, then the next action is clear and no stale demonstration/result is presented as evidence of the new request. QA owns technical cancellation/reward checks; learning observation records whether the child understands which request was tested.

Human observation needed: unfamiliar players near the intended age, ordinary viewing positions, predictions before feedback, explanations after revision, exact help given, and whether the full core/destination result was visible. A facilitator revealing BLUE/LARGE/REACTOR before the transfer probe invalidates an independent-understanding claim. Record individual observations; do not infer population learning, enjoyment or instructional effectiveness from automation or one successful completion.

## Handoff

Support the Producer's central Workshop priority and default of no geometry change. Ask Scout to resolve the in-flight and post-delivery display boundaries and the RED + SMALL representation with existing controller/props before Planner finalizes acceptance. Planner owns copy/state decisions, numbered requirements, preview and explicit human approval. QA can verify the seven-case truth matrix, state coherence and lifecycle after approved implementation; a human learning observation remains separate and pending. This report changes no acceptance status and supplies no approval.
