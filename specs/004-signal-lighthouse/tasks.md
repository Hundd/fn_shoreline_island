# Signal Lighthouse Tasks

- Status: Approved
- Specification: [spec.md](spec.md)
- Plan: [plan.md](plan.md)

- [ ] `T-001`: Implement and verify FR-001 through AC-001.
- [ ] `T-002`: Implement and verify FR-002 through AC-002.
- [ ] `T-003`: Implement and verify FR-003 through AC-003.
- [ ] `T-004`: Implement and verify FR-004 through AC-004.
- [ ] `T-005`: Implement and verify NFR-001 through AC-006.
- [ ] `T-006`: Implement and verify NFR-002 through AC-007.
- [ ] `T-007`: Implement and verify NFR-003 through AC-008.
- [ ] `T-008` (FR-005, AC-005): Place and save Harbor 3's persistent Claim-start cue and three-step instruction; build Verse and verify visibility in a fresh solo session.

## Evidence

Initial Verse implementation and first-station editor readback are recorded in
[implementation evidence](evidence/implementation-2026-09-12.md). BuildAll passed;
focused solo checks passed the widened entrance, claim, LEAF delivery, PLAIN
wrong-route explanation, corrected challenge-one completion, and no early badge.
Boat/dock overlap and irrelevant manual rule text were corrected after that test;
the new revision now passes the focused [solo retest](evidence/solo-2026-09-12.md):
all three queues, both incorrect final rules, corrected completion and badge
message, both manual hint levels, Next guard, Replay fixture reset and Hub return.
All four stations are now saved with [binding/transform evidence](evidence/four-harbors-2026-09-12.md).
Journal Signal availability passed a fresh-player check. All four sequential solo
claims and walking joins, Harbor 3 delivery motion, and Harbor 3-to-4 partial
queue transfer passed in the linked four-harbor record. The current
[cargo material solo test](evidence/cargo-symbols-2026-09-12.md) passes visible
LEAF/GEAR motion, unmarked PLAIN, all three queues, and numeric badge retention
through Replay, Hub return and journal reopening. Other copied motions,
remaining presentation and lifecycle checks remain open. All full acceptance scenarios
remain open. Check tasks only after their
acceptance evidence is recorded. Each record needs date, revision, player count,
expected/actual result, pass/fail, warnings, and capture/log paths.

Harbor 3's persistent start cue is placed, saved, and builds cleanly; the
fresh-session route-visibility check remains pending because Play From Here
spawned at the island default location. See the
[implementation readback](evidence/harbor-3-start-cue-2026-09-22.md).
