---
name: uefn-spec-workflow
description: Spec-driven feature workflow for this UEFN island. Use before implementing a player-visible change, to create or update specs/<NNN-feature>/{spec,plan,tasks}.md and record playtest evidence.
---

# UEFN Spec-Driven Workflow

- `specs/` is the source of truth for planned player-visible changes. Create or
  update a numbered feature directory containing `spec.md`, `plan.md`, and
  `tasks.md` before editing the island.
- Write testable requirements and Given/When/Then acceptance scenarios first.
- Record implementation choices in the feature plan, link tasks to requirement
  IDs, and check tasks off only after UEFN validation or playtest evidence is
  saved.
- Store evidence under `specs/<NNN-feature>/evidence/` with date, revision, UEFN
  version, player count, scenario, expected/actual, pass/fail, warnings, and a
  screenshot or capture path.
- If editor work changes the intended behavior, update the spec in the same
  change.
- Keep unresolved failures visible; do not infer multiplayer from solo results.
