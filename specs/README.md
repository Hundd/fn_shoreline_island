# Feature Specifications

This directory is the source of truth for planned player-visible behavior.
`plan.md` remains the product roadmap and idea bank; a numbered feature spec
defines what is approved for implementation.

## Workflow

1. Create `specs/NNN-short-name/` using the next available number.
2. Write `spec.md` with scope, requirements, and acceptance scenarios.
3. For map design, write `map.yaml` using `design/patterns/` and run `python tools/map_workflow.py check <map.yaml>`.
4. Review the generated blockout and implementation plan, resolve blocking assumptions, and obtain explicit human approval. Record the current review digest in `approval.yaml`; only then mark the spec `Approved`.
5. Write `plan.md` and requirement-linked `tasks.md`; run `python tools/map_workflow.py plan <map.yaml> --ready` before map mutations.
6. Implement one coherent task group at a time with MCP readback and recorded deviations.
7. Record validation and playtest evidence in `tasks.md`.
8. Update the spec whenever the intended player-visible behavior changes.

## Statuses

- `Draft`: requirements are still being shaped.
- `Approved`: ready to implement.
- `In progress`: implementation has begun.
- `Validated`: acceptance scenarios passed and evidence is recorded.
- `Released`: the feature is included in a published island version.

## Requirement Style

- Give each requirement a stable ID such as `FR-001` or `NFR-001`.
- Describe observable behavior, not editor actions.
- Use MUST for required behavior and SHOULD for a deliberate preference.
- Give every functional requirement at least one Given/When/Then scenario.
- Keep implementation details in `plan.md`, not `spec.md`.

The first feature, `001-byte-island-mvp`, captures the initial playable slice
from the existing roadmap.

See [AI map workflow](../docs/AI_MAP_WORKFLOW.md) and the unapproved
[Prompt Lab migration example](025-map-planning-workflow/map.yaml). Existing
feature approvals are historical records, not approval of a new machine-readable
layout. Tooling-only tasks can use offline test evidence; gameplay still requires
UEFN validation and playtesting.
