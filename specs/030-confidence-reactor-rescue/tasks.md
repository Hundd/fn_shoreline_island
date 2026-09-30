# Revision 2 tasks - solo simplification

Solo design approved and editor implementation underway. Prior revision is preserved under history/revision-1/. Historical editor inventory was rechecked against the live scene before edits. Cook and local validation passed; solo gameplay acceptance remains open.

- [x] P-01 (S-01..09): review previous spec/plan/map/palette, inventory and current station/progress APIs; compare against user-playtested 028 simplification. Evidence: plan.md and review.md.
- [x] P-02 (S-01..09): synchronize revision-2 docs/map, generate and inspect preview/implementation bundle, resolve offline validation findings and record evidence.
- [x] P-03 (S-01..09): user approved the solo-only revision in reply to the feature-030 review request; approval.yaml records the actual response and current digest. `plan --ready` passed on 2026-09-30. 028 approval does not cover this feature.
- [x] T-01 (S-01/07/08): checkpoint and export exact removal/retention/dependency manifest; preserve support, equipment, progress and shared routes. Reconfirm floor conditions. Evidence: `evidence/legacy-scene-decision-manifest-2026-09-30.json`, `evidence/implementation-status-2026-09-30.md`; saved actor readbacks and successful local validation/cook.
- [x] T-02 (S-02..06): refactor scoped solo controller using existing targets/lifecycle primitives; adapt existing complete(player) API explicitly; build Verse. No old controller subscription may remain active. Evidence: `evidence/implementation-status-2026-09-30.md`; final `BuildAll` returned no diagnostics, and only configured controller is retained. Runtime behavior remains under T-04..08.
- [ ] T-03 (S-01/02/07/08): qualify functional palette, reconcile compact bay and obsolete presentation, bind three assemblies/two controls/one main board and read back full transforms/settings. Save.
- [ ] T-04 (S-03/04/08): verify exact decision sequence, persistent evidence, target coverage, wrong-action hints, muted audio and held-fire guard (AC-02..04 and feature-specific AC-05).
- [ ] T-05 (S-05/06): verify lifecycle, replay, Return, clean/partial legacy/badge-earned progress and journal/finale (AC-05..07 as applicable).
- [ ] T-06 (S-01..09): build, validate, cook and run all normal solo scenarios, recording per-scenario actual results and remaining warnings. Multiplayer testing is outside this solo feature scope.
- [ ] T-07 (S-03/08/09): first-time solo usability/learning check without coaching; record timings, confusion, explanation and enjoyment (AC-08). Do not infer understanding from correct shots alone.
- [ ] T-08 (S-09): record final scene/playtest evidence and deviations; end active game and verify non-running state, leaving UEFN open (AC-09).
- [ ] T-09 (S-04/08): verify the screenshot-reported display fixes in cooked solo play from the firing lane and behind the circles; check overlay absence, label contrast/facing, board fit, and stronger hit/finish cues (AC-10).

Only planning checkboxes can close from offline evidence. Keep individual untested gameplay scenarios visible. No extra testers, motion controls or decorative targets should be added merely to satisfy the superseded draft.

Planning evidence: evidence/planning-checks-r2.md; actual rendered preview: evidence/preview-review-r2.png. These close documentation checks only.
