# Tasks — feature 033

Status: Authorized autonomous implementation; planning evidence recorded. Check gameplay tasks only after linked evidence is recorded.

Final delivery (2026-10-04): HUD, journal, markers, activity reports and copy are saved and built/cooked. Independent focused QA passed normal spawn, map readability, walking and actual journal open/close; final Agent lock guidance fits. See evidence/qa-report.md and evidence/supervisor.md. The mixed implementation/acceptance tasks below stay unchecked where their full progression, lifecycle, timing, controller or route criteria have not been exercised; this does not mean their source changes are absent.

- [x] P-01 (FR-001,003,006): Audit live module ownership and duplicate Prompt credit;
  record exact bindings and source references.
- [x] P-02 (FR-004): Survey entrances, routes and existing indicators; replace schematic
  map coordinates, resolve native per-player pulse behavior and exact device counts.
- [x] P-03 (FR-002,005,008): Inventory HUD and actual stage totals/events for every
  controller; define adapter and placement details.
- [x] P-04 (all): Resolve blockers, regenerate/review bundle, record actual user-delegated authority in authorization.md/approval.yaml and current digest; run readiness gate.
- [ ] I-01 (FR-001,003,010): Reuse authoritative progress and implement lifecycle-safe
  destination selection; evidence AC-01,02,03,08,11,12.
- [ ] I-02 (FR-002,005,007,009): Implement compact HUD, journal states, consolidated
  handoff and finale messages; evidence AC-01,02,06,07,10.
- [ ] I-03 (FR-003,008): Integrate entered/stage/exited reporting in each activity;
  evidence AC-05 and controller-specific step table.
- [ ] I-04 (FR-004,006): Reconcile markers and update signs, then record settings,
  transforms, bindings and cooked route evidence AC-01,04.
- [ ] V-01 (all): Build Verse, full project validation, cook and record all solo ACs.
- [ ] V-02 (FR-002,004,010): Superseded AC-09: verify solo admission and lifecycle under037 SA-01/04; do not claim two-player testing.
- [x] V-03 (all): Record unresolved warnings/limitations; stop game and verify shutdown.

Offline planning checks are recorded in review.md; none establishes implementation.

Planning P01..04 evidence: planning-live-inventory.json, planning-live-bindings.json, planning-resolved-survey.json, plan.md stage contract, review.md; check and plan --ready both passed 2026-10-03. Gameplay tasks remain unchecked.

Closeout evidence: implementation-progress.md current production checkpoint; final build/cook successful, unresolved tests/warnings recorded, game Unconnected/session Disconnected. All mixed implementation/full-AC tasks remain unchecked pending complete acceptance.
