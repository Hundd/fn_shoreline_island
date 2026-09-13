# Variable Vault Tasks

Route follow-up: the [Debug retest](../006-debug-workshop/evidence/retest-2026-09-12.md)
exposed the seam toward Signal Harbor. Four Vault floors were extended and
saved with exact readback; fresh walking acceptance remains pending.

The subsequent [four-station Debug run](../006-debug-workshop/evidence/four-stations-2026-09-12.md)
walked through Vault station 1 into Signal Harbor without jumping, falling or
health loss. Other parallel north routes and full presentation remain pending.

- Status: Approved
- Specification: [spec.md](spec.md)
- Plan: [plan.md](plan.md)

- [x] `T-001`: Implement and verify FR-001 through AC-001. First-station solo opening, safe failure and both bounds recorded in the implementation, solo-matrix and badge-journal evidence; wider station coverage remains T-005.
- [x] `T-002`: Implement and verify FR-002 through AC-002. First-station solo completion, Replay and recompletion recorded in the solo matrix below; additional stations remain under T-005.
- [x] `T-003`: Implement and verify FR-003 through AC-003. First-station solo count matrix 1–5 and visible 0/2/4/6 recorded below; additional stations remain under T-005.
- [x] `T-004`: Implement and verify FR-004 through AC-004. First-station solo hints, recap, Replay and repeat completion retain exactly one badge in the journal; lifecycle/multiplayer remain T-005.
- [ ] `T-005`: Implement and verify NFR-001 through AC-005.
- [ ] `T-006`: Implement and verify NFR-002 through AC-006.
- [ ] `T-007`: Implement and verify NFR-003 through AC-007.

## Evidence

The three Verse classes compile, and the first station's 29 actors are saved
with audited bindings and transforms: [implementation evidence](evidence/implementation-2026-09-12.md).
Focused solo results pass claim, +1 updates, safe failure at energy 1, corrected
door opening at 3, and the next fixture at energy 2/target 5. Board orientation
was corrected and retested; overlapping boards/hidden door status were then
repositioned and passed the focused overlap retest. The [solo matrix](evidence/solo-matrix-2026-09-12.md)
records subtraction/lower boundary, challenge-two Replay and recompletion,
all repeat counts, challenge-three hints, badge recap, Replay reset and Hub return.
The [badge-journal follow-up](evidence/badge-journal-2026-09-12.md) records the
upper boundary, challenge-two hints, repeat completion and exact Energy 1/1
after Replay, Hub return and journal reopening. Full acceptance remains pending.
The [four-station placement audit](evidence/four-stations-2026-09-12.md) now
records the remaining three stations and saved Energy journal binding. Their
focused runtime checks pass station-four door motion, claims on all three new
stations, completed-work transfer 4-to-3-to-2, two floor joins and station-two
Hub return. Static billboards failed to appear on this fresh launch; fixing and
retesting initial visibility remains required. This does not complete T-005.
Check tasks only after their
acceptance evidence is recorded. Each record needs date, revision, player count,
expected/actual result, pass/fail, warnings, and capture/log paths.
