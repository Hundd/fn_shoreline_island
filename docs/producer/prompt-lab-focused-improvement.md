# Prompt Lab: make the visible answer match the shot

Status: feature051 implemented and compiled; owner manual acceptance pending. Next proposed planning scope: controller-local corrective retry hints.
Date: 2026-10-09, post-feature-050 build cycle.
Source request: owner asks the Supervisor to compile, ask Producer for the next high-level improvement, and continue implementation autonomously. The owner's no-game-testing instruction persists; owner manual acceptance remains pending. This update supersedes this brief's earlier start-repair recommendation; feature 049's approved start-only repair is already implemented.

## Post-implementation decision: explain the detail to retry

2026-10-09, after cycle1. **Recommend one independent, bounded learning improvement: replace generic Prompt shooting retry feedback with short hints about the specific color, size or destination detail the player missed.** This supersedes the initial post-cycle suggestion to wait globally for manual acceptance. Manual051 acceptance remains pending; it is not a gate on this independent feedback work.

The [implementation summary](../../specs/051-prompt-answer-correspondence/evidence/implementation-summary.md) and [tasks](../../specs/051-prompt-answer-correspondence/tasks.md) record all eight exact transforms saved, preserved references/collision/source/entry, native BuildAll with zero diagnostics, and game Unconnected. Do not stack further speculative geometry changes onto that checkpoint. Its visual and projectile acceptance stays with the owner.

### Evidence and value

[Current Prompt shooting source](../../Content/fn_shoreline_island_prompt_blaster.verse) sends stage1 wrong colors, stage3 wrong color/size and stage5 wrong destinations through the same `reject` helper and the same “Not quite! Check the prompt and try another target.” message. Its established five-hit sequence already names BLUE, LARGE and REACTOR. A specific hint can connect an unsuccessful choice to the exact word that matters, improving the existing lesson without adding a mechanic or changing any answer.

[Current Prompt Workshop source](../../Content/fn_shoreline_island_prompt_workshop.verse) already distinguishes `wrong_what`, `wrong_which` and `wrong_where`. This supplies a local product precedent for useful corrective feedback; it does not prove that the new shooting copy will be read or understood. The saved049 wrong-shot test confirms safe generic retry behavior to preserve. This is a source-demonstrated learning opportunity, not a newly reproduced gameplay bug or invented player complaint.

### Small candidate comparison

| Opportunity | Decision |
|---|---|
| Specific Prompt retry hints | Select: source exposes exact mistake context; meaningful link to learning; narrow controller-only scope, independent of geometry acceptance. |
| More onboarding/journal directions | Defer: current journal already reports current actions; no comparably specific missing instruction established here. |
| Broader travel/progress UI changes | Defer: known044 label-click/gamepad defect has narrow owner acceptance; remaining lifecycle cases are unrun, not demonstrated defects. |
| More target geometry / auxiliary conversion | Defer until their current manual checks inform further changes. |

### Planner handoff and bounded scope

Use only the existing Prompt shooting controller's feedback path. Select a localized message from the current stage and target ID; keep a generic fallback for unexpected inputs. Do not change shared `data_target`, the Workshop, journal, native HUD device settings, geometry, target activation, event order, input guards or reward paths.

Candidate copy (Planner may refine for the same meaning and short existing display window):

| Existing wrong choice | Candidate feedback |
|---|---|
| Stage1 red1 or green2 | “Check the color: the prompt says BLUE.” |
| Stage3 red1 | “Check the color: choose a BLUE core.” |
| Stage3 small-blue4 | “Blue is right. Now match LARGE.” |
| Stage5 scanner7 or storage8 | “Check WHERE: the prompt says REACTOR.” |
| Any unexpected reject context | Retain the current generic fallback. |

Preserve `target.reject(input_player)` exactly once per rejected hit, existing2s feedback duration, unchanged safe stage/DATA retention, participants/agent guards, all correct-hit transitions, sequence `[0,3,5,5,6]`, intro/handoff/movement timing, reward/badge/replay/reset and current native bindings. Scope is explanatory text selection, not solving hit attribution: the hint describes the target event the controller actually received. If an owner shot selects an unintended target, diagnose051 separately.

No new delay, additional UI widget, escalating hint system, telemetry or button is needed. Provisional small source-only effort. Planner should prepare a numbered bounded spec/plan and record whether this presentation-only source change qualifies for the documented map-design exception; do not fabricate human approval or mutate existing051 artifacts.

### Observable success and verification limits

- Static source review maps each existing wrong branch to the intended hint, keeps the unexpected-input fallback, and establishes no change to answer correctness, stage/DATA mutation, retry effects/count, duration or correct-hit paths. Native Verse compile passes with recorded diagnostics. There should be no native actor delta.
- Owner-manual acceptance remains open: red/green at stage1 produce a color hint; small-blue at stage3 acknowledges blue and directs attention to LARGE; red at stage3 directs attention to color; scanner/storage at stage5 refer to WHERE/REACTOR. A subsequent correct hit progresses normally; wrong attempts retain stage/DATA and do not award a badge.
- A first-time player's explanation of the corrected detail supplies learning evidence. Two seconds of visibility/readability and interference with existing UI must be checked manually, not inferred from short text or compilation.

Dependencies are the existing controller/feedback device and unchanged target ID mapping already read back for051. Unknowns are runtime readability and learning effect, explicitly deferred under the owner's no-game-testing instruction. Do not launch a session, cook, push or gameplay QA. Supervisor owns editor/build/shutdown. Producer changed only this brief; no source or acceptance records were changed.

## Recommended next improvement (implemented in051)

Make the optional Prompt shooting activity's core choices visually correspond to their actual hit surfaces. A child following “Shoot the matching large blue core” should be able to identify one coherent answer object, aim at it, and see that answer respond. Preserve the existing LARGE and WHERE lesson, moving-core challenge and Pix delivery payoff. Scope this to the demonstrated ring/core correspondence and choice overlap on `prompt_lab_navy_floor`; do not reopen the working start or redesign the mission.

This is the next product priority because it addresses the owner's unfinished complaint and interferes with an existing learning action. A confusing presentation can make a correct understanding appear to be a wrong answer. Provisional focused repair effort; exact safe geometry remains a Planner feasibility question.

## Evidence and limits

- **Owner feedback:** intermittent starts and hidden targets were the original problem. [049 tasks](../../specs/049-prompt-lab-clear-start/tasks.md) explicitly leave visibility D01/FR-002 open.
- **Established start repair:** [postfix QA](../../specs/049-prompt-lab-clear-start/evidence/postfix-qa.md) records ten successful mixed grounded starts, a completed sequence and safe wrong retry. These are saved test results, not new Producer playtesting; general target visibility is explicitly not established.
- **Recorded presentation defect:** [diagnostic QA](../../specs/049-prompt-lab-clear-start/evidence/diagnostic-qa.md) measures an approximately 350 cm X difference between a hit anchor and decorative core, with equivalent offsets on other cores. It observes red/small-blue ring overlap near Replay and separate ring/core motion. I reviewed [the saved overlap capture](../../specs/049-prompt-lab-clear-start/evidence/diagnostic-core-overlap.png): choices appear interleaved, and the cyan rings are visually detached from colored spheres. This supports a correspondence repair; it does not identify a collision blocker or prove every viewpoint fails.
- **Current source constraint:** [data target](../../Content/fn_shoreline_island_data_target.verse) repositions rings and labels from the hit surface in `pulse_cues`; default labels sit 200 cm above it. Merely moving an editor ring or billboard can be overwritten during play. [Prompt controller](../../Content/fn_shoreline_island_prompt_blaster.verse) moves the large core and target home by the same ±250 cm Y translation, preserving their existing offset. Inspect actual bindings and effective runtime transforms before choosing a delta; do not change shared target defaults for the whole island.
- **Prior cycle:** [050 tasks](../../specs/050-auxiliary-device-pilot/tasks.md) record the single support-host pilot and pending owner gameplay; [cycle build](../../specs/050-auxiliary-device-pilot/evidence/cycle0-build.json) records native Verse build success with no diagnostics. This is not evidence for bulk host conversion or Prompt gameplay acceptance.

Producer used local files and one saved screenshot only. No live editor access, game, cook or validation was requested. Supervisor owns editor and shutdown verification.

## Planner scope and preservation

First resolve all nine target identities and stage-active sets against the newest native state, including hit surface, ring, label, colored core and any attached or separate decoration. Model effective runtime poses from the current source, not just editor billboard positions. Compare ordinary ramp-side and Replay-near standing/crouched sightlines and the full moving sweep using measured geometry/offline projections. Explicitly label these checks as static predictions.

Prefer a local representation correction that brings the demonstrated core visual and its existing hit surface into one readable answer assembly, preserving the playable hit anchors where feasible. The Planner must choose the exact direction/depth from native dimensions and collision settings; placing a solid decorative sphere directly in the shot path could worsen the issue. Adjust only confirmed affected assemblies. If a local arrangement still overlaps from both ordinary positions, document the smallest alternative rather than silently moving every target into a distant row.

Preserve the repaired entry transform/settings; nine stable target IDs and ordered bindings; sequence `[0,3,5,5,6]`; existing startup/lesson/handoff timing; wrong retry; fresh 8 DATA, Replay policy and one-time badge; moving sweep; Pix finale; west walking return; current solo access. Exclude Prompt Workshop, hub travel, other modules, new stages, scenery replacement, broad lifecycle work and changes to shared target defaults. Use a separate follow-up numbered bundle or otherwise preserve 049's accepted start-repair history and exact scope. This brief must not modify or impersonate human approval.

## Success and candidate acceptance

- **Before implementation:** a bounded before/after actor ledger, stage map and projections show which answer each ring/label represents, expected hit path and moving-sweep envelope from both ordinary firing regions. Any remaining occlusion uncertainty is stated. No unexplained full-room relocation.
- **Editor/source verification:** affected saved transforms/settings and bindings match the planned delta; runtime-derived cues will follow the intended anchors; no unintended other-mission source/default changes. Compile changed Verse (or the final source) and record actual diagnostics. Record project validation as pending if no supported mechanism is available.
- **Owner manual AC-01:** given each stage at standing and crouched ordinary firing positions, the player can distinguish every available choice; deliberate center and outer-third shots select the represented answer without hidden obstruction. Check the full moving sweep separately.
- **Owner manual AC-02:** given deliberate wrong shots, the stage and DATA remain and retry is immediate; given all five correct hits, Pix delivery, fresh reward and badge work. Replay, second completion badge guard, normal re-entry/respawn and west Return remain correct.
- **Owner manual AC-03:** a first-time player explains why LARGE and WHERE changed the result in their own words. Do not infer learning or fun from compilation or a successful shot.

Under the current no-game-testing instruction, only planning, source/native readback and compilation evidence can be collected autonomously. Leave all cooked/owner acceptance criteria open. A compile pass is neither sightline proof nor gameplay acceptance.

## Alternatives and unresolved decisions

| Candidate | Decision |
|---|---|
| Prompt answer correspondence | Select now: explicit unfinished owner complaint, saved visual evidence, bounded existing activity. |
| Full Pix travel / eight-module journey | Higher island-wide reach, but [044](../../specs/044-hub-pix-mission-travel/tasks.md) needs owner runtime lifecycle/final-badge coverage; no new concrete defect established here. Defer new behavior until that evidence. |
| Extend auxiliary-device cleanup | Defer bulk changes until pilot manual acceptance; editor-only organization does not outrank a demonstrated player-facing ambiguity. |

Planner must resolve current actor geometry/collision, exact core-to-hit association, source-derived labels, and whether a local representation-only repair actually removes ambiguity across useful viewpoints. Saved evidence supports investigation and a concrete proposal, not an unmeasured automatic transform. If static inspection cannot support a safe delta, deliver the complete review bundle and specific owner manual check needed; do not manufacture a code fix or fill the loop with unrelated polish.

Documentation verification: read current source, 044/049/050 status and evidence, and inspected the saved overlap screenshot. Changed only this Producer brief; no specs, approval records, source, assets or acceptance checkboxes changed.


