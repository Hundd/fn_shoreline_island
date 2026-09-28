# Tasks

Planning-only completion may use offline evidence. Gameplay boxes require corresponding UEFN/playtest evidence. Human approval is separate from assistant review.

- [x] P01 (FR-001/007/009) Inspect legacy/current source, assets and latest evidence; record fresh read-only anchor/controller observations and limitations. Evidence: evidence/inspection.md and read-only-inspection.json.
- [x] P02 (FR-001 through FR-008) Author synchronized spec, plan and map with measured/proposed provenance and explicit unsupported capabilities. Evidence: review.md and offline validation.
- [x] P03 (FR-002/004/009) Run map check and reviewer validate; visually inspect generated HTML/SVG and implementation plan; record review and command evidence. Evidence: evidence/validation-2026-09-27.md and preview-browser.png.
- [x] P04 (FR-009) Present concrete review bundle and unresolved decisions; verify no running playtest and source unchanged. Evidence: accompanying user handoff and evidence/validation-2026-09-27.md.
- [x] G01 (FR-009) Receive actual human design approval; resolve survey/design blockers and obtain renewed approval for material changes; record exact current digest. Evidence: approval.yaml and evidence/approval-record.md, including the actual floor-height correction approval.
- [x] G02 (FR-009) Pass `plan --ready` after valid approval; checkpoint editor state. Evidence: evidence/pre-move-recovery-manifest.json and pre-move-recovery.zip; readiness passed again after implementation, approval matches.
- [x] I01 (FR-002/003/004) Reconcile and move board/complete target assemblies incrementally; read back every full transform/property group and save actors. Evidence: evidence/move-board.json, move-group-0-2.json, move-group-3-5.json, move-group-6-8.json and post-move-bindings.json.
- [ ] V01 (FR-001 through FR-006/008) UEFN validation/cook and solo AC-01 through AC-06; record warnings, bounds/outer-third hits, walking exit and screenshots.
  Partial evidence: evidence/walking-acceptance.md, stationary-solo-acceptance.md and moving-coverage-acceptance.md. Walk in/out/re-entry, isolated acquisition, both wrong destinations, stationary completion, completed-target reward protection and promptly fired moving outer-third aim/freeze observed. Sweep reversals support configured timing; screen samples do not independently measure world-space extremes. Remaining feedback/coverage/readability and manual validation limitations remain open.
- [ ] V02 (FR-005/006/007) Solo replay/round/playspace-departure tests AC-07; two-player AC-08 test gate waived by the user on 2026-09-28, not passed. Record walked-out eligibility policy only if multiplayer testing is later resumed.
  Partial evidence: evidence/replay-respawn-acceptance.md, intro-replay-cancellation.md, rejection-moving-replay.md and finale-badge-replay.md prove accessible replay, intro timer cancellation, wrong-hit and moving-stage reset recovery, finale cancellation without delayed bonus, retained DATA/loadout after respawn, repeated completion arithmetic 5→13→21 DATA, and journal Prompt Lab ONLINE at 1/8 modules after replay/repeated completion. Exact server rejection-overlap timing is limited. Multiplayer/late join/last-participant departure remain open.
- [ ] V03 (FR-003/004) First-time-player learning/readability/enjoyment evidence AC-09. Do not infer it from MCP calls.
- [ ] V04 (FR-009) Record actual deviations and acceptance results; stop game/session and verify state before final implementation handoff.

Implementation is saved. Gameplay acceptance remains incomplete; see evidence/implementation-results.md for proven observations and remaining checks. Rail boarding remains feature024's inherited acceptance gap; this scope makes no repair.
