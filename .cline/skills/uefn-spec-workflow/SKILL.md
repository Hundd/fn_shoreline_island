---
name: uefn-spec-workflow
description: Spec-driven feature workflow for this UEFN island. Use before implementing a player-visible change to update the numbered feature spec, plan, tasks, map review bundle and playtest evidence.
---

# UEFN Spec-Driven Workflow

For map/room/challenge/mission design, follow `docs/AI_MAP_WORKFLOW.md` and
`AGENTS.md`'s map-planning gate. Produce `map.yaml`, pattern-backed parameters,
offline preview and implementation plan before requesting design approval.
Use the uefn-map-planning skill. A Markdown `Approved` status
alone does not authorize MCP: require explicit human approval for the current
artifact digest and a passing `plan --ready` check. Read-only discovery is allowed.
For tooling/documentation tasks, recorded offline validation can complete tasks;
keep actual gameplay checks pending until UEFN/playtest evidence exists.

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
