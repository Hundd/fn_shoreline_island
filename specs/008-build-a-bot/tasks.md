# Build-a-Bot Tasks

- Status: In progress; four stations implemented and core missions/transfers tested solo
- Specification: [spec.md](spec.md)
- Plan: [plan.md](plan.md)

- [ ] `T-001`: Implement and verify FR-001 through AC-001.
- [x] `T-002`: Implement and verify FR-002 through AC-002 (solo; evidence below).
- [x] `T-003`: Implement and verify FR-003 through AC-003 (solo; evidence below).
- [ ] `T-004`: Implement and verify FR-004 through AC-004.
- [ ] `T-005`: Implement and verify FR-005 through AC-005.
- [ ] `T-006`: Implement and verify NFR-001 through AC-006.
- [ ] `T-007`: Implement and verify NFR-002 through AC-007.
- [ ] `T-008`: Implement and verify NFR-003 through AC-008.

## Evidence

See [first-station implementation and solo evidence](evidence/implementation-2026-09-12.md)
and the [actor/reference audit](evidence/implementation-2026-09-12.json).
All three core missions passed with one player, including first-error feedback,
disconnected Launch, wrong destination, both correct cargo tests and finale.
Tasks remain unchecked: missing static labels and seed/lamp overlap prevent full
visual acceptance; hints, Replay, exact badge count, lifecycle, additional
stations, multiplayer, project validation and memory remain pending.

[Presentation retest](evidence/presentation-2026-09-12.md): all 20 labels now
have audited native references and runtime text refreshes. Labels appeared on
one fresh load; Seed completion, seed/lamp separation and stage-specific props
through Next to Dock passed. Small cell/destination text and board sightlines
still prevent full presentation acceptance. Route message/restoration changes
compile but need live retesting. The first report above records the older
revision's failures, not the current overlap result.

[Readability and badge evidence](evidence/readability-2026-09-12.md): shifted
path and larger cell labels passed from Run; all three correct missions passed;
final route message fixed; Parcel Replay retained all completed stages; Hub and
journal exact Bot 1/1 after reopening passed. Repeat completion and preservation
of earlier earned badges remain untested, so T-004 is still incomplete.
Three follow-up transforms address board overlap/destination size but await
visual retest. No full acceptance task is closed by these partial checks.

[Parking retest](evidence/parking-2026-09-12.md): all three correct stages
passed on the parked-robot revision. Garden/Storage parcels are visible from
Run, the larger destination labels are readable, the board overlap is resolved
in tested views, and Parcel Replay retains the parked pose and completed stages.
The program board's eastern minimap occlusion remains open.

[Four-station runtime evidence](evidence/four-stations-2026-09-12.md): all four
claims, all three connecting walks, six hints, completed-stage transfers and
partial Parcel delivery restoration passed solo. Seed at Station 4, Dock at
Station 3, and Parcel across Stations 2 and 1 completed. Repeated completed Run
and Hub journal retained exactly Bot 1/1. Together with the first-station
incorrect-program evidence and current parking retest, these establish T-002
and T-003. T-004 remains open for prior earned badges; T-005 includes respawn;
T-001/T-007 retain visual acceptance gaps. Multiplayer, lifecycle, project
validation and memory remain pending.
