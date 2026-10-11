# Prompt Workshop player experience review

Date: 2026-10-10. Advisory input; no design approval or gameplay acceptance.
Request: independently review the main Workshop's clarity, submitted request/result coherence, retry and completion before Planner consolidation.
Host/model/worker: Codex CLI, `worker_model.codexcli = gpt-6.1-sol`, `/root/player_experience_reviewer`. Supervisor owns editor access and shutdown. No live editor, MCP, UI or playtest was used. The desktop is reported locked and MCP unreachable; current runtime state and physical reachability are unknown. No Learning Designer report was read before forming these findings.

## Evidence and journey

Inspected current [controller](../../../Content/fn_shoreline_island_prompt_workshop.verse), SHA256 `CAE20993A515B3C64302A604BDAEFEF214DE4358D37D4EFE9ECBCF07E72516B1`; [Producer brief](../../producer/prompt-lab-improvement-brief.md); project roadmap/workflow; [027 interaction repair](../../../specs/027-prompt-workshop-redesign/evidence/interaction-clarity-2026-09-28.md), [visual finish evidence](../../../specs/027-prompt-workshop-redesign/evidence/visual-finish-status-2026-09-28.md), [tasks](../../../specs/027-prompt-workshop-redesign/tasks.md); 044 travel spec; journal source. Historical manual/no-game restrictions are not adopted as current instructions.

Arrival → Inspect → compose three details → walk east to Send → watch delivery → revise or Connect → Replay/walk west is a coherent existing journey. Ordered labels and persistent NEXT already address discovery: the owner's “nice, i was able to play” closes that specific reported blocker. Do not redesign the room or reassert unusable controls from unchecked broad acceptance tasks. Saved editor visuals show a staged route, but neither their current saved revision nor cooked sightlines are independently verified here.

## Ranked findings and corrections

### 1. High impact, strong source evidence: retry advice can contradict the next attempt

Controller lines 120–122 say “keep the other choices”; lines 401–406 select only the first mismatch. RED + SMALL + SCANNER therefore tells a player to preserve two wrong details. BLUE + SMALL + SCANNER tells them to preserve the wrong destination. Predicted experience: obedient revision yields another failure, making Pix's advice feel unreliable. This is a source-established inconsistency; the player's response is a hypothesis, not observed behavior.

Correction: retain the player's selections but distinguish preservation from correctness. Candidate multi-error wording: “Change WHAT to BLUE. Then check the other details against the clue.” For a single error, affirm only verified correct slots. Keep one immediately actionable correction, preserve access to the clue, and avoid implying the next Send must succeed. Planner should specify every wrong combination's text; QA should verify all seven, not just one example.

### 2. High impact, strong source evidence: visible choices can stop describing the demonstration

Choice handlers at lines 316–329 mutate state and redraw YOUR REQUEST. Send captures choices at line 345 and Pix uses those arguments. An attempted edit while Pix moves can therefore change the visible request without changing the delivery. No measured travel path proves how often a player reaches a choice during execution.

Correction: hold submitted values stable during fetching, delivery and return; respond to attempted changes with a short cue such as “Pix is showing this request. Change it when Pix is ready.” Do not silently queue edits. Keep Replay/departure cancellation available. After readiness, a changed choice must update the displayed request and the next delivery together.

Also resolve the success phase explicitly: after `delivered` becomes true, the same choice handlers remain active even after return, while `next_step` still says CONNECT and Send refuses another delivery (lines 207–208, 316–339). A player can display RED/SMALL/SCANNER beside CONNECT after a correct submission. Preserve the successful request through Connect/completion and offer Replay to start another attempt, or provide an equally explicit completed-submission presentation. Scout/Planner should choose the smallest compatible behavior; do not silently invalidate earned success or reward guards.

### 3. Medium impact, strong source evidence with unknown runtime severity: result invites revision before Send is ready

Wrong-result text appears at lines 401–406, but execution ownership remains until the hold and both return moves finish (lines 407–415). Persistent NEXT continues “watch Pix carry the core” while the result tells the player to change a detail. Send during this interval says “Pix is carrying a core. Wait for the result,” even though the result has already appeared. A blanket busy-edit guard alone would make this timing conflict more noticeable.

Correction: define result/return/ready presentation in the plan. Show the correction while accurately saying when it becomes actionable, then persist the correction or next action at readiness. Use a phase-neutral rejected-Send cue such as “Wait for Pix to finish, then try again.” Connect becomes valid when delivery succeeds under current source: preserve that timing rather than accidentally blocking Connect behind a new busy guard. QA must exercise the hold and return intervals separately.

### 4. Medium impact, evidence gap: detail representation and competing guidance need observation

For any RED request, lines 370–375 select the same red prop regardless of WHICH. A RED + SMALL demonstration cannot independently demonstrate both selectable red sizes with this source alone. This may be an intentional wrong-color demonstration, but the interface suggests every detail controls an outcome. Ask Scout/Planner to define the representation honestly without assuming another prop is necessary.

Request HUD, transient feedback and journal NEXT all convey activity guidance (Workshop lines 213–217, 417 onward; journal `report_activity` and navigation update). Shared `next_step` reduces semantic divergence, but layering, readability and overlap are unknown. Do not add another HUD or move actors without cooked evidence. Preserve the optional Arena distinction already introduced in 054 rather than treating it as unimplemented.

## Observation and verification handoff

1. QA: record submitted values, visible request, Pix object/destination, feedback and next action for all eight complete combinations. Exercise each of six choice buttons during fetching, carrying, result hold, return, ready, delivered-before-Connect and completed states. Note whether physical access is possible; source reachability is not a player-path measurement.
2. QA: rapid double Send; attempted edits followed by Send; Connect during successful return; Replay and actual departure during each phase; re-entry and respawn. Verify no late result/reward, stable submitted values, normal ready recovery, existing 5+3 DATA/shared badge policy and west return. These are acceptance checks, not findings already reproduced.
3. Human first-use observation: allow an unfamiliar player to arrive without coaching. Record first action, any missed instruction, chosen correction, help given and how they know Pix is ready. Ask “What changed in your request, and what did Pix do differently?” after one revision. Record their words rather than infer learning from completion.
4. Cooked views: capture ordinary choice/Send/Connect positions during submit, result, return and completion; inspect legibility of the core's color/size, destination, clue and all HUD guidance together. Measure actual walking and waiting before shortening the activity. Nominal source sleeps are not observed pacing or enjoyment evidence.

Producer priority: truthful correction and stable submissions first; include phase-accurate wait/ready text and successful-request retention in that bounded solution. Planner owns final wording/state policy and reviewable approval bundle. Scout checks controller feasibility. QA owns functional verification; human observations own learning/usability evidence. No actor, source, approval or task acceptance state was changed by this review.
