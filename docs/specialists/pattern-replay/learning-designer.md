# Pattern replay — Learning Designer advisory

Date: 2026-10-09. Request: cycle6 independent offline review of the Producer's one alternate authored set, ages8–10, preserving the accepted original run. Host: Codex desktop/codexcli. Configured and dispatched worker: gpt-6.1-sol; worker ID/task: /root/learning_designer. Advisory only; no design approval, implementation, editor calls, agents or gameplay testing.

## Evidence and objective

Read AGENTS.md, plan.md (audience/product direction), docs/AI_MAP_WORKFLOW.md, .agents/specialist-workflow.md, .agents/workflow-models.yaml, docs/producer/pattern-scanner-replay-variation.md, specs/028-pattern-scanner-cargo-circuit/spec.md (S-03/04/06), and Content/fn_shoreline_island_pattern_line.verse:50–73,217–255,302–303. Source defaults are not proof of saved actor editable values; Supervisor/Scout must establish that baseline. 028 is owner-accepted; its optional historical observations are not reopened here. Latest055 compilation was supplied as context, not independently verified by this role.

Observable objective: on a changed six-slot example, the player identifies the repeating pair or group of three and uses the gap's position in that group to choose its symbol. A correct shot alone can reflect guessing, hint following or remembered answer order; it does not demonstrate understanding. This alternate is a near-transfer opportunity, not a proven learning benefit.

## Exact proposed alternate text

Use existing common question: `SHOOT THE MISSING SYMBOL`. Retain the existing progress/question wrapper and target identities A● circle/index0, B▲ triangle/index1, C■ square/index2. All strings below are proposals for Planner consolidation, not source edits.

| Stage | round_patterns | round_hints (first mistake / existing journal guidance) | round_groups | round_answers (second mistake onward) | solved_patterns | success_id |
|---|---|---|---|---|---|---|
| 1 pair continuation | `B▲  C■  B▲  C■  B▲  ?` | `Triangle, square. The pair repeats.` | `B▲ C■` | `After triangle comes square. Shoot C ■.` | `B▲ C■ / B▲ C■ / B▲ C■` | 2 |
| 2 interior pair gap | `B▲  C■  ?  C■  B▲  C■` | `Each pair starts with triangle.` | `B▲ C■` | `The gap starts a pair. Shoot B ▲.` | `B▲ C■ / B▲ C■ / B▲ C■` | 1 |
| 3 three-symbol continuation | `B▲  C■  A●  B▲  C■  ?` | `Triangle, square, circle. Three repeat.` | `B▲ C■ A●` | `Finish the group with circle. Shoot A ●.` | `B▲ C■ A● / B▲ C■ A●` | 0 |

Keep the existing escalation wrapper `REPEATING GROUP: [{group}]` plus the corresponding answer on the next line. Hints identify the intended rule, escalated hints explicitly name the answer, and solved slashes expose group boundaries. No new term such as period or sequence is needed in child-facing text. Proposed text lengths and wording closely match original defaults; actual board/HUD fit is pending manual observation. The existing journal already includes the first hint alongside the pattern; do not describe journal-assisted correct answers as unassisted learning.

Preserve the exact original first-run arrays and answer order [1,0,2]; proposed alternate is [2,1,0]. Every active puzzle, normal board prompt, wrong board/HUD hint, escalation, solved strip, journal pattern/hint and answer check must refer to the same selected set. Particularly inspect report_navigation at302–303; changing only the board would leave an original-example learning cue beside a different puzzle.

## Finite intended-rule audit

Offline Python enumerated each missing-slot candidate A/B/C against all positions of the intended period (two for stages1/2, three for stage3), also checking periods1–3. Results:

- `BCBCB?`: only C works; completed `BCBCBC`; only period2 in1–3.
- `BC?CBC`: only B works; completed `BCBCBC`; only period2 in1–3.
- `BCABC?`: only A works; completed `BCABCA`; only period3 in1–3.

All provided non-gap symbols agree with the groups, all solved strips contain six symbols in the same order, and each answer maps to the existing target index. This establishes one solution within the intended short repeating-group family, not uniqueness among arbitrary rules for finite sequences. The question's lesson context and rule hints supply that constraint. No infinite-pattern uniqueness claim is warranted.

## Action, feedback and misconceptions

The child scans the displayed group, locates the gap's place, and shoots its symbol. Wrong shots retain the same strip and progress, enabling rule revision; first hints name the repeated group, second hints scaffold the answer; solved strips visibly partition the sequence. Stage2 tests position inside the group rather than only the next symbol. Stage3 changes group length, while the alternate changes symbol identities with the same mechanic.

| Likely misconception | Existing/proposed corrective evidence | What an observer should check |
|---|---|---|
| Always shoot remembered original B, A, C order | Alternate answers C, B, A with stable target labels | Child points to the active strip and explains a group, rather than citing round number |
| Choose whichever symbol appears least / the unused target | Stage1/2 correctly use the established pair; A is absent and wrong | Child explains why an absent symbol is not required |
| Every gap asks what comes after the last shown symbol | Stage2 gap is inside the strip; hint says it starts a pair | Child identifies the gap as the first position of a B/C pair |
| All patterns alternate two symbols | Stage3 group contains three symbols | Child identifies B/C/A as the repeating unit |
| Completing after the named answer proves understanding | Existing escalation intentionally supplies that answer | Record hint exposure and ask for the group explanation; retain supportive retry |

## Candidate learning checks for Planner

1. Given original completion and explicit Replay, when the alternate appears, then its stage1/2/3 active examples and answer guidance match this table and original examples do not persist in active views.
2. Given alternate stage2, when C or A is selected, then the same gap remains and the pair-start hint supports revision; after a second mistake, the group B/C and B answer are shown without auto-solving.
3. Given alternate stage3, when solved with A, then the solved strip shows two B/C/A groups, supporting the explanation that the group has three positions.
4. Given a child who completed the original, when they encounter the alternate before an answer-naming hint, then an observer asks “Which small group repeats?” and “How does that tell you the gap?” Record the child's exact explanation, choices, retries and journal/hint use. Explanation linked to positions supports near-transfer; merely shooting the named answer does not.

Checks1–3 are proposed behavior checks, not passed gameplay results. Check4 is an optional manual learning observation, not a new in-game task or required widget. Do not add an unplanned third puzzle set. Manual readability, uncoached understanding, engagement, safe retries and cooked gameplay remain pending under the user's no-automated-gameplay-testing constraint.

## Handoff

The candidate content is internally coherent and preserves the accepted learning progression. Recommend Planner use the exact table above and explicitly constrain uniqueness to the intended repeating-group family. Retain one authored alternate only, stable set selection throughout an attempt, and original first-run values. Learning evidence remains pending; no acceptance status is changed. This role neither started nor inspected a session; Supervisor owns end-of-task shutdown verification.
