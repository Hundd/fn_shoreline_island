# Revision 2 tasks - solo simplification

Completed under owner-accepted scope on 2026-09-30. Owner reported "the game is working", accepted the repaired feedback/ending with "yes. looks good now", then instructed "fishish this goal". Close implementation using that acceptance; unperformed detailed checks become optional follow-ups, not passing results. See evidence/completion-2026-09-30.md.

## Completed scope

- [x] P-01..03: inspect prior game, prepare/review revision 2, record owner approval and pass readiness. Evidence: approval.yaml, review.md, generated review bundle.
- [x] T-01: checkpoint and reconcile removals/retention while preserving shared structures and progress. Checkpoint 9f93e61; preflight-r2.json, native-bindings-before-r2.json, dependencies-r2.json and scene-delta-r2.json.
- [x] T-02: implement one solo controller with seven decisions, shared targets and retained badge API. Verse builds returned no diagnostics.
- [x] T-03: save three answer assemblies, two controls, main board and six qualified native examples. Evidence: recovered-target-readback-r2.json, native-props-r2-2026-09-30.json and restart-bindings-r2-2026-09-30.json; content cooked successfully and owner accepted the playable scene.
- [x] T-06 (closure scope): build, validate, cook and obtain owner acceptance of basic solo gameplay. Repaired content activated on both platforms at 2026-09-30 05:30:09 UTC. Detailed scenario coverage is listed separately below.
- [x] T-08: record implementation, recovery, substitutions and acceptance; verify final game state CanStart and leave UEFN open.
- [x] T-09: repair feedback and unclear completion. Explicit correct/retry HUD and target text, completed examples/targets hidden, persistent completion and Play Again/Return prompt. Owner accepted the result. Evidence: feedback-repair-2026-09-30.md.

## Optional follow-ups - not performed or not individually reported

These no longer block owner-requested closure. Keep them for future release verification; no additional testers are required for this closed implementation goal.

- [ ] Former T-04: individually document seven choices, two-level hints, face-edge shots, muted audio and held-fire guard (AC-02..04).
- [ ] Former T-05: departure during feedback, death/respawn, disconnect, round reset, Replay/Return, clean/partial legacy/already-earned badge and journal/finale regressions (AC-05..07). Broad owner acceptance is not individual test evidence.
- [ ] Former T-06 remainder: per-scenario solo coverage and warning audit beyond recorded build/validation/cook and owner playtest.
- [ ] Former T-07: first-time uncoached learning study, first-shot/run timings, explanation and enjoyment measures (AC-08). No learning outcome is inferred from visual acceptance.
- [ ] Additional AC-10/11 regression: independently measure feedback latency and replay/return cleanup across resets. Presentation repair is owner-accepted.

Historical records remain under evidence/; revision 1 remains under history/revision-1/. Feature 030 remains a separate unapproved draft.

## Active regression repair — 2026-10-10

- [ ] R-01 S-04/S-05: diagnose cooked startup, actual player bay membership and target events with bounded diagnostics; record concrete cause.
- [ ] R-02 S-04/S-05: repair proven defect within revision 2; build Verse, validate/cook and record exact changes.
- [ ] R-03 AC-01/02/03/10: independently verify entry ready, seven answers, wrong prediction/retry and visible feedback in cooked play; record actual coverage and shutdown.

Implementation worker /root/implementer, host Codex, resolved worker_model.codexcli=gpt-6.1-sol. Existing approval applies to restoration of promised behavior; map.yaml/design remains unchanged. Previously closed tasks remain historical acceptance, not regression passes.

Regression checkpoint: exact Classifier controller host flags restored to pre059 values visibleInGame=true and bNoCollision=false; Cube mesh retained. Runtime OnBegin/configured/init now observed in LogVerse, while player measured at hub outside bay. Clean Verse source restored and BuildAll passed. See evidence/regression-repair-2026-10-10.md and regression-controller-startup-2026-10-10.log. R-01 individual flag/cook mechanism and R-03 actual category-shot acceptance remain open; no gameplay pass inferred from this correction.
