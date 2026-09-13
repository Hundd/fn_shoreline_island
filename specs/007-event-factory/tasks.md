# Event Factory Tasks

- Status: In progress; four stations saved, all four claims and transfers passed solo
- Specification: [spec.md](spec.md)
- Plan: [plan.md](plan.md)

- [x] `T-001`: Implement and verify FR-001 through AC-001 (first station, solo).
- [x] `T-002`: Implement and verify FR-002 through AC-002 (all three examples, solo).
- [x] `T-003`: Implement and verify FR-003 through AC-003 (reversed and corrected mappings, solo).
- [ ] `T-004`: Implement and verify FR-004 through AC-004.
- [ ] `T-005`: Implement and verify NFR-001 through AC-005.
- [ ] `T-006`: Implement and verify NFR-002 through AC-006.
- [ ] `T-007`: Implement and verify NFR-003 through AC-007.

## Evidence

[First implementation and solo evidence, 2026-09-12](evidence/implementation-2026-09-12.md)
records 35 saved actors, 24 native bindings, clean Verse build, all three core
challenges, Replay reset, Hub return and exact Event 1/1 after journal reopening.
AC-004 passes for that sequence; T-004 remains open because all six hints and
repeat-completion behavior still need testing in that report.

[Four-station implementation and solo transfer evidence](evidence/four-stations-2026-09-12.md)
records 131 saved actors, 66 additional native references, a clean Verse build,
all four claims and three lateral joins without jumping, all six hints, explicit
Show event, challenge progress across Stations 4/3/2/1, and badge completion.
T-004 remains open for repeat-completion verification. T-005 remains open for
lifecycle and multiplayer checks. Full muted-audio presentation, including the
raised chute obscuring the goal board from Next, project validation and memory
remain pending.
No multiplayer or full-feature validation is inferred from the solo passes.
