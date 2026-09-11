# Feature Specifications

This directory is the source of truth for planned player-visible behavior.
`plan.md` remains the product roadmap and idea bank; a numbered feature spec
defines what is approved for implementation.

## Workflow

1. Create `specs/NNN-short-name/` using the next available number.
2. Write `spec.md` with scope, requirements, and acceptance scenarios.
3. Resolve any blocking open questions and mark the spec `Approved`.
4. Write `plan.md` with the UEFN implementation design and validation strategy.
5. Break the plan into ordered, requirement-linked tasks in `tasks.md`.
6. Implement one coherent task group at a time.
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
