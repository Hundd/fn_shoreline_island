# Revision 2 tasks - solo Fill the Gap

## Owner acceptance and closure, 2026-09-29

The owner accepted the working/fun playtest and explicitly answered "Yes—close 028 and track 029" when asked whether the remaining detailed regression checks and three-person study should become optional follow-ups. The implementation goal is closed on that revised acceptance scope. Unchecked R2-T05/07/08 detailed scenarios and R2-T09 remain optional follow-ups, not passed tests. Recorded build, cook, scene readbacks, user playtest and shutdown evidence remain authoritative. This acceptance decision supersedes the mandatory three-tester release gate for this delivery; no gameplay change is implied.

The original implementation checklist and evidence remain in history/cargo-circuit-v1/tasks.md. No original gameplay acceptance is retroactively closed. Revision 2 was approved by the user message "looks good"; readiness passed. Implementation is saved and user-playtested successfully. Remaining detailed regression and first-time tester coverage is listed below.

- [x] R2-T01 (S-01..09): inspect original spec, controller, target/progress APIs, bindings and cooking evidence; capture current 166-actor inventory. Evidence: review.md and evidence/simplification-live-inventory-2026-09-29.json.
- [x] R2-T02 (S-01..09): synchronize solo spec/plan/map, generate and inspect preview/plan, validate and record offline findings. Evidence: review.md; final check/validate passed, raster visually inspected, stale approval correctly rejected.
- [x] R2-T03 (S-01..09): obtain explicit approval of revision 2; record actual digest/evidence and pass plan --ready. Evidence: approval.yaml records the actual revision-2 approval; plan --ready passed before edits. Recovery checkpoint eb74e18.
- [x] R2-T04 (S-01/07/08): checkpoint, export exact actor dependencies/full transforms and resolve retain/reuse/removal table.
- [ ] R2-T05 (S-02..06): refactor existing controller for solo auto-ready and three stationary choices; build and validate the three rounds, feedback, hit lock and lifecycle.
- [x] R2-T06 (S-01/02/07/08): implement compact bay; remove conveyors, cargo machines, excess targets/boards/controls and clutter; save and read back all counts/bindings.
- [ ] R2-T07 (S-05/06): verify retained progress/badge/journal and return paths with SA-05/06.
- [ ] R2-T08 (S-01..09): normal solo SA-01..07/09 including real rifle edge hits, held fire, muted audio, hints, departure, respawn and replay; build, validate and full cook final content.
- [ ] R2-T09 (S-09): run SA-08 with three first-time solo testers sequentially; record time, confusion and enjoyment; fix evidence-backed usability issues within approved scope or return material design changes to review.
- [x] R2-T10 (S-09): record final scene evidence, stop game/session and verify shutdown with UEFN left open.

Only offline planning tasks may close with offline evidence. Solo gameplay tasks require corresponding cooked observations. Single-player only: no cooperative enrollment or multiplayer acceptance tasks.

Implementation update after user saved/reopened UEFN: the recovered editor compiled the solo controller without diagnostics. All 134 planned actor removals succeeded; a fresh inventory contained 32 retained cargo actors. All 26 placements were read back, 16 surplus canopy components were removed, and one shelter was resized and read back. The scene was saved. See evidence/solo-removals-2026-09-29.json, solo-placement-readback-2026-09-29.json and solo-canopy-and-label-adjustments-2026-09-29.json. Final visual review exposed stale native billboard previews and overlapping labels; label placement/font refinements are prepared. After the user closed the save dialog, the latest build succeeded. Controller configured=true and native bindings were read back and assets saved. Local validation passed and server cooking finished; the session then shut down because no Fortnite client connected. Final game state Unconnected. Final physical visual verification and gameplay acceptance remain pending; R2-T04..10 remain open. See evidence/solo-final-bindings-2026-09-29.json and solo-implementation-status-2026-09-29.md.


Latest handoff: user reported a working, fun playthrough. Logs confirm successful client/server cooking and InProgress. StopGame completed and GetGameState returned CanStart. Evidence: evidence/solo-user-playtest-2026-09-29.md and solo-user-playtest-session-2026-09-29.log. R2-T04 is supported by checkpoint/preflight/dependency/removal evidence; R2-T06 by removal/placement/final-binding readbacks and validation; R2-T10 by final evidence and shutdown readback. R2-T05/07/08 remain open for their unreported detailed scenarios; R2-T09 remains open for the three-tester study. Earlier connection failures below are historical.
