# Tasks

Only check a task after the named evidence exists. Planning tasks may close on offline evidence; gameplay tasks require editor/cooked evidence.

- [x] T01 (FR-01–08): inspect feature-023/024/026 source and the actual repair-station source; measure repair_0_floor through repair_3_floor and garden_repair_walkway through read-only MCP; record evidence and corrected scope.
- [x] T02 (FR-01–08): define scenarios and pattern-backed `map.yaml`; run offline `check` and inspect the generated preview/plan; record findings in `review.md`.
- [x] T03 (FR-01–08): obtain explicit approval of this exact review bundle and record digest/evidence in `approval.yaml`; pass `plan --ready`.
- [x] T04 (FR-07): export live actor/binding/transform inventory, recovery checkpoint and exact keep/move/retire delta for the repair-station area before mutation; protect four floors, walkway and shared dependencies.
- [x] T05 (FR-01–03/07): reconcile and save walkable stations, props, controls and readable board; read back positions, properties and bindings.
- [x] T06 (FR-03–06): refactor/configure one active controller and reward hooks; build Verse and inspect device references.
- [ ] T07 (FR-07): adapt or remove every old repair-game activity actor; retire old subscriptions and verify AC-11 (no legacy mode or parallel old game); update the owning route-sign source; preserve shared Garden/hub systems and keep main Prompt changes within the resolved scope.
- [ ] T08 (FR-01–06/08): validate, cook and playtest AC-01–06 and AC-08 and AC-10 with screenshots/video and expected/actual notes.
- [ ] T09 (FR-06/08): test AC-07 with two real players, alternating sends, replay, join/leave and reward attribution; record any explicit user waiver as skipped, never passed.
- [ ] T10 (FR-07/08): verify AC-09, save, stop active game, read back non-running state and leave editor open.

- [x] T11 (FR-07): record the user's replacement decision in spec/plan/map, add AC-11, remove the old-game preservation blocker, and regenerate the offline review bundle.
- [ ] T12 (FR-01/02/03/05/08): verify the saved visual-finish pass in a cooked player view: legible four-station progression, Pix face moving with the prop, independently usable controls, clear 3 m walking aisle, and no stage geometry blocking the old walkway.
- [ ] T13 (FR-03/04/08): in a cooked player view, verify ordered interaction labels and persistent NEXT guidance lead a first-time player from Inspect through all three choices to Send; Send visibly moves Pix and the chosen core together and returns a readable wrong or correct result.
- [x] T14 (FR-03/08): resolve the reported first-time playability blocker around the Inspect and choice controls. The player confirmed in the cooked client, “nice, i was able to play,” then asked to mark the issue done; see `evidence/interaction-clarity-2026-09-28.md`.
