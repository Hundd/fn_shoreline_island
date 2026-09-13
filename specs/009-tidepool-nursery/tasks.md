# Tidepool Nursery Tasks

- Status: In progress; four stations saved and compiling; focused solo capacity checks pass; full acceptance pending.
- Specification: [spec.md](spec.md); implementation: [plan.md](plan.md).

- [ ] T-001: Inspect station APIs, confirm fixtures, and specify any feature 003
  integration changes (FR-001 through FR-007).
- [x] T-010: Build and test Care definition and one-planter execution (FR-001,
  FR-002; AC-001).
- [x] T-011: Implement and verify two-planter caller editing (FR-003; AC-002).
- [x] T-012: Implement and verify all four repeat counts (FR-004; AC-003).
- [ ] T-020: Verify snapshots, reset demonstrations, and rapid input (FR-005; AC-004).
- [ ] T-021: Verify hints, progression, badge, replay, and return (FR-006; AC-005).
- [ ] T-022: Verify cancellation, re-entry defaults, and round reset (FR-007; AC-006).
- [ ] T-030: Provide capacity and verify two/four-player isolation when clients
  are available (FR-007; AC-007).
- [ ] T-040: Record muted-audio solo play, build, project validation, and memory
  results; resolve blockers before marking Validated (NFR-001, NFR-002; AC-008).

For each checked task, link evidence identifying date, revision, UEFN version,
player count, expected/actual behavior, warnings, and captures where relevant.

T-010, T-011 and T-012: [three-challenge solo evidence](evidence/three-challenges-2026-09-12.md).
All other tasks remain pending. The first-station history below predates expansion.

## Implementation evidence — 2026-09-12

Three Nursery Verse classes implement first-challenge transition evaluation,
station-local submissions, guarded execution, hints, Replay and Hub return.
The progress device stores per-player completed challenges separately from
attempts. Build All returns no diagnostics. One station with 29 actors is saved;
30 station native bindings, all native overrides and geometry settings passed
readback ([audit](evidence/first-station-2026-09-12.json)). Explicit actor rotations
corrected asset placement offsets. The fresh solo Care test passed initial
Harvest-before-Wait failure, revision to the correct order, visible states,
both hints, Replay defaults and Hub return
([runtime evidence](evidence/first-station-2026-09-12.md)). No task is checked:
T-010 also needs Next/unlock behavior; later challenges, full badge/journal
integration, rapid input, lifecycle, multiplayer and release gates remain open.


Four stations now have saved, audited independent controls and props. Focused
solo claims, joins, copied Care failure/success, completed-work transfer and
Hub return pass: [capacity evidence](evidence/four-stations-2026-09-12.md).
T-030 remains unchecked for two/four-player isolation; T-022 still needs active
cancellation, respawn and round reset. Other open requirements remain pending.
