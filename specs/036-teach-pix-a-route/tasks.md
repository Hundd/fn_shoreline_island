# Tasks — revision 1

Agent implementation closed out on 2026-10-03 at the user's explicit instruction: "Finish task, I'll verify manually". Remaining gameplay acceptance and separate Project > Validate Project are handed to the owner, not marked passed. See evidence/manual-verification-handoff.md.

- [x] P-01 Read Producer brief, existing Workshop/Rescue source, APIs, patterns and known QA limitations (R-02/04/08; plan.md).
- [x] P-02 Measure floor and candidate corridors through serialized read-only MCP (R-01/06; evidence/floor-traces.json, corridor-traces.json).
- [x] P-03 Specify actual demonstrated input, bounded recorder, closure, lifecycle, success checks and acceptance (R-01..10; spec.md, plan.md).
- [x] P-04 Generate and review map/preview/implementation bundle; structural review and rendered-review limitation recorded in review.md; check/validate pass.
- [x] P-05 Human replied "Approved" to concrete revision1 preview/plan; approval.yaml records actual evidence and digest. `plan --ready` passed 2026-10-03T18:08:53Z (evidence/approval-readiness.md).
- [x] I-01 Save checkpoint, recheck geometry, resolve dedicated assets and dependencies (R-01/09; evidence/implementation-progress.md).
- [x] I-02 Implement recorder, segment geometry, limits, playback and cancellation; run meaningful geometry tests and build Verse (R-02/04/05/07/08; evidence/final-build.json; cooked behavioral acceptance remains V-02).
- [x] I-03 Place/configure dedicated scene groups, read back settings/transforms/bindings, save (R-01/03/09; evidence/scene-inventory.json, native-audit.json; visual acceptance remains V-02).
- [x] V-01 Native launch validation and final production cook completed; separate Project > Validate Project menu not accessible while desktop locked (R-10; evidence/final-session.json, initial-launch-logs.json).
- [ ] V-02 Owner manual verification: AC-01..08/10 including two different first routes, both bypasses and actual failure/arrival checks (R-02..09). Agent testing not run; handed off at user's request.
- [ ] V-03 Owner manual verification: AC-09 isolation if genuine multiplayer available; otherwise record unavailable. Run AC-11 regression and separate Project > Validate Project (R-08/10). Agent testing not run; handed off at user's request.
- [x] V-04 Native StopGame Completed; final Unconnected/Disconnected, editor open. No validation warning matched native category query; gameplay remains unverified (R-10; evidence/final-session.json).

## Button repair — 2026-10-03
- [x] B-01 Diagnose actual cooked HOME prompt/event and first-route failure; correct five logic argument queries (R-02/04; evidence/bugfix-buttons.md).
- [x] B-02 Repair HOME interaction overlap/feedback without changing endpoint constraint; real E starts recording (R-02/08; evidence/bugfix-readable-home.png).
- [x] B-03 Replace three failed label devices through official catalog, verify correct cooked poses and readable HOME/CANCEL/LOAD text (R-03/09; evidence/bugfix-buttons.md, bugfix-final-native.json).
- [x] B-04 Remove all fixtures, save/build/final cook, verify production startup, stop game/session (R-10; evidence/bugfix-final-native.json).
- [x] B-05 Independent focused QA of repaired source/scene and referenced real-input evidence found no blocking repair defect (evidence/qa-buttons-repair.md). Remaining full gameplay scenarios stay owner manual verification, not passed by repair.
