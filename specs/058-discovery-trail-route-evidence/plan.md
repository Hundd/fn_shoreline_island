# Content implementation plan

Baseline source SHA256: **079EF1A5612319BBC1F86EBD37F29079AC15D87F368E56D68E52476848F04BB7**. Read2026-10-10 Kyiv. Edit only three quoted message values in fn_shoreline_island_field_observations.verse using spec.md matrix; no global replacement. Preserve all localization declaration identifiers and every non-target byte where practical.

## Consumer/entry trace

- OnBegin's recurring texts array maps human_sign (index3) to human_board, alternating refreshed_sign(text) whitespace every3s. Same reference/refresh stays.
- human_button event -> on_human -> player conversion -> show_human_decision(player,-1). Its initial text is human_decision_question.
- Check Pix is observation0. show_panel creates Next field note only for observation0,answer0. Choice6 enters on_choice with existing panel/generation guard and state.observation0 -> show_human_decision(player,-1). Shared question, no alternate copy.
- Route A button choice3 -> show_human_decision(player,0) -> unchanged route_a_result. Route B choice4 -> answer1 -> updated route_b_result. Again choice5 -> answer-1. Close choice-2 -> close_panel. No branch changes.
- show_human_decision keeps840x290 text area at font22,900x440 background, existing two choice buttons or Again plus Close. No field note adds reward/progress calls.

## Copy and fit decision

Producer's review refines B result's middle sentence to `You used new information instead of just following Pix.` This avoids implying that the player ultimately followed the closed Route A suggestion. Other candidate words are retained. Add sentence-boundary newline after `Pix suggests Route A.` and after `Route B matches today's signs.` / `Pix.` This makes question4 explicit lines and result3, avoiding the candidate's single long evidence/explanation lines in the fixed panel. Sign is4 lines as proposed. This is a text-only precaution, not proven native fit; no widget measurement or runtime readability claim. Return any required further wording revision for concrete Producer review; do not resize UI.

## Geometry exception and delegated review

Three localized text substitutions correct supplied premises/explanation without changing answer, mission flow, state, layout or map design. This uses AGENTS.md small-code/no-layout/no-mission-behavior design-gate exception: no map.yaml, preview generation, readiness digest or editor inspection is needed. This is not a new gameplay adapter. Existing022 artifacts/approval stay untouched.

User said “please work by yourself, review implementation plan by yourself or ask a producer” and “do not use game testings, it will be done manually”; Supervisor relays continued heartbeat delegation and no games/session/cook/push. Producer reviews exact matrix, then Supervisor dispatches implementation. Record actual agent review, never fictitious human approval.

## Verification

Recheck baseline before edit. Source diff must have exactly the three message values changed; all entry/choice/state/layout/reward paths remain identical. Native Verse BuildAll after implementation, retain diagnostics and source hash. No editor asset mutation, session, game, cook, push, gameplay input or testing. Manual A1–A5 remain pending, including child explanation and actual sign/panel fit.
