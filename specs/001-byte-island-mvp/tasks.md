# Byte Island MVP Tasks

- Status: Approved
- Specification: `spec.md`
- Implementation plan: `plan.md`

## 1. Approve the Specification

- [x] `T-001` Resolve `OD-001` through `OD-004` and update `spec.md`.
- [x] `T-002` Review every requirement for observable, testable behavior.
- [x] `T-003` Mark `spec.md` as Approved.

## 2. Graybox the Hub

- [x] `T-009` Configure Island Settings for one to four players (`NFR-003`).
- [x] `T-010` Configure and verify the safe hub spawn (`FR-001`).
- [x] `T-011` Add the initial Path Garden objective (`FR-002`, `NFR-001`).
- [x] `T-012` Build accessible route cues to Path Garden (`FR-003`,
  `NFR-002`).

## 3. Build Path Garden

- [x] `T-020` Place and label the four sequence inputs (`FR-004`, `NFR-002`).
- [ ] `T-021` Create `Content/byte_island_game_manager.verse` and wire
  per-player ordered sequence progression (`FR-005`, `NFR-004`).
- [x] `T-022` Add immediate accepted-input feedback (`FR-006`).
- [ ] `T-023` Add safe incorrect-input reset behavior (`FR-007`).
- [ ] `T-024` Add exactly-once per-player Circuit Badge reward (`FR-008`,
  `NFR-004`).
- [x] `T-025` Add the algorithm recap (`FR-009`, `NFR-001`).
- [x] `T-026` Add the return route to the hub (`FR-010`).
- [x] `T-027` Configure clean round reset behavior (`FR-011`).

## 4. Validate

- [x] `T-030` Pass `AC-001` through `AC-006` in a solo Launch Session.
- [ ] `T-031` Pass `AC-007` and repeat completion testing with at least two
  players.
- [ ] `T-032` Run project validation and a memory calculation with no blocking
  result (`NFR-005`, `NFR-006`).
- [ ] `T-033` Record warnings, screenshots, playtest date, and tester count
  below.
- [ ] `T-034` Mark all three feature documents as Validated.

## Validation Evidence

- Date: 2026-09-11
- UEFN version: Editor title reports Unreal Editor 6.0
- Tester count: 1 (solo client)
- Project validation: Current revision passed launch/upload validation and cooked
  successfully. Standalone Project > Validate Project and memory calculation
  remain outstanding because the UEFN menu could not receive foreground focus.
- Warnings: Client log recorded a loading hitch; MCP client-log discovery failed,
  so the local FortniteGame.log and client captures were used instead.
- Screenshots or captures: See `evidence/` and the dated checkpoints below.
- Notes: Implementation in progress; checklist items remain unverified until
  session and validation evidence is available.

### Implementation checkpoint - 2026-09-11

- Added `Content/byte_island_game_manager.verse`. Initial UEFN BuildAll returned
  an empty diagnostic list. A subsequent build after exposing four individual
  spawn references is pending; the initial success does not validate this revision.
- Placed four sequence buttons, a return button, four spawn pads, HUD message,
  badge tracker, round settings, hub teleporter, Verse manager, and foundation
  in the existing map. Layout, collision, signage, and reference wiring are not
  complete. Editor changes still require a save and readback checkpoint.
- Island property writes returned success for maximum four players, cooperative
  squads, immediate join-in-progress, spawn pads, invulnerability, no building,
  no environment damage, and no pickaxe damage. Runtime behavior is untested.
- Tracker configured for Individual sharing, no persistence, Events (`None`)
  statistic, target one, and detailed HUD. Verse supplies assignment and rewards.
- Native device-property setters accept Verse script devices only. Creative
  actor settings use ObjectTools; Verse reference wrappers expose `savedActor`.
- No solo/multiplayer acceptance scenario, memory calculation, or project
  validation has passed yet. This is not a working-island completion claim.

### Editor integration checkpoint - 2026-09-11 17:45 UTC

- The pending compile was waiting on UEFN's Save Content dialog. Saved the
  selected 16 project assets. The log records `Global Verse compile ... SUCCESS`
  at 17:38:18 UTC for the current four-spawner-reference revision.
- Bound and read back all 13 manager references through their `savedActor`
  properties: five buttons, four spawners, HUD, tracker, round settings, and
  destination teleporter. Renamed the referenced actors by responsibility.
- Added eight billboard signs including hub directions, sequence instructions,
  numbered input labels, and the return instruction. Verified the four numbered
  labels face the approaching player in a player-height viewport capture.
- Set spawn pads to Always, island-start enabled, hidden in game; configured
  unlimited instant button interactions and a single-player destination teleport.
- Initial launch validation rejected the foundation's Creative cube reference.
  Replaced it with `/Engine/BasicShapes/Cube.Cube`, kept the same walkable top at
  Z=2400, and saved all changes. The next launch advanced past local validation
  into matchmaking/session assignment at 17:45 UTC.
- Launch acceptance, gameplay tests, memory calculation, and polish remain
  outstanding. Passing local launch validation is not proof of runtime behavior.

### First solo playtest - 2026-09-11, one player

- Launch Session completed; Session status Connected and Game state Running.
- Player spawned on the foundation with 100 health and Circuit Badge 0/1.
- Activated Water, repeated Water incorrectly, and observed the retry message
  with health still 100. Retried Water successfully, then Plant, Wait, Harvest.
- Every correct step showed its expected immediate HUD message. Harvest showed
  the tracker completion checkmark and the algorithm definition. Evidence:
  `evidence/water-feedback.png`, `evidence/wrong-input-reset.png`,
  `evidence/plant-feedback.png`, `evidence/wait-feedback.png`,
  `evidence/first-completion.png`.
- This proves the first correct sequence and learning recap (AC-002 and the
  recap portion of AC-005). Duplicate completion, return travel, objective timing,
  round reset, and multiplayer isolation still need evidence.
- Found presentation defects: oversized/clipped signs near spawn and sideways
  buttons. Adjusted text, positions, scale, and button rotation; added 0.6 m
  interaction radius, supports, a marked walkway, and simple garden planters.
  These presentation changes are saved and awaiting updated client verification.

### Revised-layout and rapid-input checkpoint - 2026-09-11

- Updated presentation cooked and ran successfully. Repeated the complete solo
  sequence with readable labels, upright buttons, and step/completion messages.
- Rapid replay exposed missing HUD updates while another message was active.
  Reopened T-022. Changed HUD `show Behavior if Showing` from Reset Display Time
  to Replay; saved the device and pushed the change for regression testing.
- The user confirmed no second player is available. AC-007 and T-031 remain
  unverified; per-player code and device configuration are not a substitute for
  the required two-player test.

### Solo acceptance checkpoint - 2026-09-11 18:18 UTC

- AC-001 PASS: Restarted the game without pushing changes. The first capture
  after StartGame showed Pix's Path Garden objective, named route signs, safe
  spawn, 100 health, and Circuit Badge 0/1. The objective was captured within
  ten seconds of the start command. `evidence/round-restart-objective.png`.
- AC-002 PASS: Current cooked revision accepted Water, Plant, Wait, Harvest,
  showed step feedback and the algorithm recap, and completed the badge tracker.
  Earlier full-sequence captures remain in this folder; repeated-step evidence
  is `evidence/replay-plant-pass.png` and `evidence/replay-wait-pass.png`.
- AC-003 PASS (solo): Incorrect input showed the retry message without damage;
  Water immediately began a new attempt. Rapid reset/retry replaced the active
  HUD message correctly. `evidence/rapid-reset-pass.png` and
  `evidence/rapid-retry-pass.png`. HUD Replay is saved; intro/outro animations
  remain Zoom / Fade and Zoom. Very early captures can precede readable text.
- AC-004 PASS (solo): Replayed all four steps after earning the badge, including
  an intervening wrong-input reset. Completion showed the existing-badge message
  without another reward ceremony. `evidence/replay-completion-pass.png`.
- AC-005 PASS: Completion defines algorithm; the labeled return button teleported
  the player back to the hub walkway with 100 health. `evidence/return-approach.png`
  and `evidence/return-hub-pass.png`.
- AC-006 PASS (solo): StopGame / StartGame cleared the earned badge to 0/1 and
  Water was accepted as step one. `evidence/restart-water-check.png`.
- Readback confirmed maximum 4 players, Cooperative / Squads, immediate joining,
  invulnerability and no building. Tracker readback: Individual, no persistence,
  target 1, Complete Tracker. Actual multi-client behavior is not verified.
- T-021, T-023 and T-024 are implemented and solo-tested but remain unchecked
  because their per-player isolation requirements still need AC-007.
- The map and all dirty assets were saved; the playtest session was stopped.
  No public publishing or IARC submission was performed.
- Remaining gate: Project > Validate Project and memory calculation. The exposed
  MCP registry has no direct command for these. Safe Windows focus attempts,
  including closing Session Inspector and stopping the session, left Fortnite
  as the foreground window; no unverified menu click was issued. User assistance
  bringing UEFN to the foreground is needed to continue those checks.
- Release work remains: two-player testing, target-age readability playtest,
  final decorative polish, and owner-controlled IARC/promotional-media steps.
  This is a working solo MVP, not a fully validated/public-release island.
