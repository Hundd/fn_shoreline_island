# Tasks: revision 1

Planning completion uses offline/read-only evidence. Implementation and acceptance tasks remain unchecked until their corresponding UEFN/readback/playtest evidence exists.

- [x] P-01 Inspect latest specs/review, Error Lab source/fixtures/progress, shared shooting adapters and current actor bounds (R-01..08; plan.md, evidence/live-debug-inventory-2026-09-30.json).
- [x] P-02 Generate/check map bundle, inspect preview/implementation plan, record requirement-linked review (R-01..09; review.md, evidence/preview-review.png, evidence/offline-route-check.json, evidence/planning-checks.md).
- [x] P-03 Obtain actual explicit human approval of revision 1 and digest; record approval.yaml and pass plan --ready (R-01..09; approval.yaml, evidence/implementation-status.md).
- [x] I-01 Checkpoint and resolve exact actor/component/binding cleanup manifest and protected infrastructure (R-01/06/07; implementation-preflight.json, removed-controls.json, removed-displays.json, final-readback.json).
- [x] I-02 Refactor existing controller with solo stage data, verified endpoint execution, attribution, reset and quiet rearm; build Verse (R-03..06; verification-2026-10-01.md; final BuildAll returned no diagnostics).
- [ ] I-03 Configure bay, three target assemblies, entry detection, track/Pix/goal, readable boards/HUD and progress lights; read back full transforms/settings (R-01/02/03/08).
- [x] I-04 Bind retained badge/journal/Agent Mission/Replay/Return; retire four old station controllers and 26 obsolete buttons plus audited lesson remnants; save/readback protected structures (R-05/06/07; final-bindings.json, journal-integration-mcp.json, removed-controls.json, removed-displays.json, final-readback.json; runtime consumer behavior remains V-04).
- [ ] V-01 Validate and cook final revision; record actual errors/warnings (R-09; AC-10).
- [ ] V-02 Solo arrival/readability and all three demos/correct corrections; verify muted audio and track endpoints (R-01..04/08; AC-01..03/09).
- [ ] V-03 Every wrong correction, automatic hints, held fire and old callback cancellation (R-03..05; AC-04/05).
- [ ] V-04 Leave/death/respawn/disconnect/reentry/replay/round reset; Return during rerun; badge and consumers (R-05/06; AC-06/07).
- [ ] V-05 Exact cleanup counts/protected transforms and cooked visual sightlines (R-01/02/07/08; AC-08).
- [ ] V-06 Record first-time solo learning/enjoyment observations and unresolved gaps; no multiplayer acceptance scope (R-09; AC-09).
- [x] V-07 Stop any running playtest, verify state and leave UEFN open (R-09; AC-10; verification-2026-10-01.md: StopGame Completed, final Unconnected/Disconnected).
