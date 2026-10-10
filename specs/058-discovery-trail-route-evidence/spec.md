# 058 — Evidence for Discovery Trail route choice

Content-only follow-up to022 AC-035; Producer brief docs/producer/discovery-trail-route-evidence.md. Only three localized strings in Content/fn_shoreline_island_field_observations.verse change. No new scenario mechanic, actual island route closure or physical safety claim.

## Requirements

- R1 Both sign and pre-choice question state updated evidence: Route A closed, Route B open. B result connects choice to today's signs, without asserting openness proves safety.
- R2 Direct Human Decision entry and Check Pix's Next field note use the same updated question/results. Existing Route A retry, B answer mapping, Again/Close, generation/lifecycle/input behavior and optional reward-free status remain unchanged.
- R3 Preserve all other strings, widgets/geometry/style, actors/references, branch/state logic, main eight modules and rewards. Do not extend055 navigation or modify022 approval.

## Exact content matrix

Literal `\n` below denotes Verse newline escapes. Sign exactly matches Producer candidate; question/result split at sentence boundaries to limit line length. B result includes Producer's review refinement: the player uses new information instead of just following Pix.

| Identifier | Old value | New value |
|---|---|---|
| human_sign | `AI DISCOVERY TRAIL: HUMAN DECISION\nPix says Route A \| Route A closed\nChoose with new information` | `AI DISCOVERY TRAIL: HUMAN DECISION\nPix says Route A\nToday's signs: A CLOSED / B OPEN\nCheck new information before choosing` |
| human_decision_question | `AI DISCOVERY TRAIL: HUMAN DECISION\nPix suggests Route A. New information says Route A is temporarily closed.\nWhich route should you take?` | `AI DISCOVERY TRAIL: HUMAN DECISION\nPix suggests Route A.\nYou check today's signs: Route A is closed. Route B is open.\nWhich route should you take?` |
| route_b_result | `Route B is the safe choice. AI can offer a suggestion, but people should use new information to make a decision.` | `Route B matches today's signs.\nYou used new information instead of just following Pix.\nAI can offer suggestions; people check the evidence and decide.` |

The escaped table pipe in old human_sign represents the existing literal `|`, not a new backslash in source. Implementation must preserve `<localizes>:message` declarations and substitute only their quoted values.

## Acceptance scenarios — manual runtime checks pending

- A1 Given direct Human Decision entry, when question opens, then A closed/B open appears before unchanged A/B choices (R1,R2).
- A2 Given Check Pix correct answer then Next field note, when Human Decision opens, then same evidence/question and route results appear (R1,R2).
- A3 Given either entry, when A is selected, then existing closed-route retry appears; Again returns to updated question. When B is selected, explanation ties choice to signs and contains no unsupported safe claim (R1,R2).
- A4 Given any panel, when Close/spawn/round/departure acts, then existing cleanup remains; no badge/progress writes or new interaction/layout (R2,R3).
- A5 Given actual sign/panel rendering, then all text fits and is readable; ask what evidence changed the decision. Manual pending; a correct click alone does not establish understanding.
