# Debug Workshop Tasks

- Status: Approved
- Specification: [spec.md](spec.md)
- Plan: [plan.md](plan.md)

- [x] `T-001`: Implement and verify FR-001 through AC-001 (solo supplied faults on current source).
- [x] `T-002`: Implement and verify FR-002 through AC-002 (first-station solo; retest evidence below).
- [x] `T-003`: Implement and verify FR-003 through AC-003 (solo retries, all six hints and retained completions).
- [x] `T-004`: Implement and verify FR-004 through AC-004 (solo Replay, Hub return and exact Debug 1/1).
- [ ] `T-005`: Implement and verify NFR-001 through AC-005.
- [ ] `T-006`: Implement and verify NFR-002 through AC-006.
- [ ] `T-007`: Implement and verify NFR-003 through AC-007.

## Evidence

The [first-station evidence](evidence/implementation-2026-09-12.md) records 32
saved actors, verified references, clean Verse builds and solo supplied-fault /
repair results for all three challenges through the badge recap. Challenge-one
Wait also fails safely. The [retest](evidence/retest-2026-09-12.md) verifies all
three repairs on the current Verse revision, repeat alternatives 1/4, solved
reclaim, cargo comparison text, Replay and exact Debug 1/1 after Hub return.
The [four-station record](evidence/four-stations-2026-09-12.md) adds 84 saved
actors, 51 verified native references and unique IDs; all four claims, transfer
4-to-3-to-2-to-1, all supplied faults/repairs, six hints, badge award across
stations and the repaired first-station walking seams pass solo. Lifecycle,
full presentation, multiplayer and final checks remain pending. Check tasks only after their
acceptance evidence is recorded. Each record needs date, revision, player count,
expected/actual result, pass/fail, warnings, and capture/log paths.
