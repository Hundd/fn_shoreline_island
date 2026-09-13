# Loop Lagoon Tasks

- Status: In progress
- Specification: [spec.md](spec.md)
- Implementation plan: [plan.md](plan.md)

All implementation tasks remain unchecked until their corresponding validation
or playtest evidence is recorded.

- [ ] `T-001`: Review and approve feature behavior and station design (FR-001 through FR-009).
- [ ] `T-002`: Record outstanding MVP multiplayer, validation, and memory results (NFR-003; feature 001).
- [ ] `T-010`: Build the hub route and one labeled dock station (FR-001, NFR-002; AC-001).
- [ ] `T-011`: Implement count selection and visible Move execution (FR-002, FR-005; AC-002, AC-006).
- [x] `T-012`: Verify all wrong counts and safe retries (FR-006; AC-005).
  Evidence: [core regression](evidence/core-regression-2026-09-12.md), all twelve
  wrong counts and three corrected runs on Dock 2, solo. Multiplayer stays pending.
- [ ] `T-020`: Add the Move/Light challenge (FR-003; AC-003, AC-005).
- [ ] `T-021`: Add the changed-target challenge (FR-004; AC-004, AC-005).
- [ ] `T-022`: Add two-level optional hints (FR-007; AC-007).
- [ ] `T-023`: Add unlocks, exactly-once badge, recap, replay, and return (FR-008; AC-008).
- [ ] `T-030`: Provide four owned stations and verify isolation with two and four players (FR-009, NFR-001; AC-009).
- [ ] `T-031`: Verify respawn, departure, disconnect, join-in-progress, and round reset during execution (FR-009; AC-010, AC-011).
- [ ] `T-040`: Verify readable, non-color cues and muted-audio play (NFR-002; AC-012).
- [ ] `T-041`: Record complete solo and multiplayer acceptance results and MVP regression results (FR-001 through FR-009, NFR-001).
- [ ] `T-042`: Record Verse build, project validation, memory calculation, and any warnings (NFR-003).
- [ ] `T-043`: Record target-age playtest observations and revise confusing behavior with matching spec updates (NFR-001, NFR-002).
- [ ] `T-044`: Mark feature documents Validated only after required evidence passes (NFR-003).

## Evidence

- [ ] `T-048`: Hide Verse device consoles during play and verify the labeled
  controls still work on a fresh launch (NFR-002; AC-012).

- [x] `T-046`: Keep unlit lanterns countable, label OFF/ON states, and keep the
  parcel visible at the robot's goal; build and retest in Fortnite (FR-003,
  FR-005, NFR-002; AC-002, AC-003, AC-012).
  Evidence: [2026-09-12 solo record](evidence/solo-2026-09-12.md), final tested
  correction. This closes the targeted visibility fix, not all AC-012 checks.
- [x] `T-047`: Make the concept hint refer to tile 0, so it remains correct
  after a run; build and retest after a wrong count (FR-007; AC-007).
  Evidence: [four-station solo record](evidence/four-stations-2026-09-12.md),
  Dock 4 Repeat 1 followed by Help. Other AC-007 scenarios remain pending.

- [x] `T-045`: Remove coplanar entrance walkway flicker and verify solo traversal
  across both joins (FR-010; AC-013).

### Entrance flicker correction - 2026-09-11

- Cause: loop_hub_walkway top overlapped academy_foundation and loop_dock_0
  at Z=2400 cm. Raised only the walkway actor from Z=2350 to 2352 cm; full
  transform readback confirmed unchanged position X/Y, rotation, and scale.
- Saved the actor through UEFN. Full Push Changes returned Completed; cook log
  recorded successful content activation on all platforms and game state Running.
- Solo check: walked onto the teal entrance and across its dock end without
  jumping. Inspected approach and reverse views; no competing floor patches
  were visible. Health remained 100. AC-013 passed for this solo check.
- Captures: evidence/walkway-fixed-approach.png and
  evidence/walkway-fixed-reverse.png. This is a focused visual/traversal check,
  not full puzzle regression or standalone project validation.
- Session client-log tool returned no client log despite Running status; no
  clean runtime-log result is claimed from that tool.

### Implementation checkpoint - 2026-09-11

- User authorized implementation of the full roadmap. Feature 002 is approved;
  features 003-008 now have separate requirements, acceptance scenarios, plans,
  and tasks. No acceptance checklist is being marked passed from source alone.
- Added dedicated Loop Lagoon progression and station Verse devices. UEFN
  BuildAll returned no diagnostics and the editor displayed Build complete.
- Placed one graybox dock with six controls, step labels, board, robot/parcel/
  lantern placeholders, personal badge tracker, route sign, and shared hub return.
  Read back all 20 native device/prop bindings and the shared progression reference.
- First Launch Session cooked, connected, and entered Running. Fortnite window
  capture confirmed safe hub spawn, access to the dock, and the Claim prompt.
- Runtime logs reported invalid TeleportTo targets: FortStaticMeshActor
  placeholders are not runtime creative_prop objects. Replaced the five animated
  targets through the editor with BuildingProp actors using movable mesh
  components; saved and began Push Changes. This fix is not yet runtime-verified.
- Added station ownership guard, initial coroutine cancellation check, and
  explicit tracker reset in source after that push began. These latest source
  changes still require compilation and a subsequent push.
- Current local test helpers are under ignored Saved/: capture-fortnite.ps1
  captures only the Fortnite process window using PrintWindow; input-fortnite.ps1
  sends input only after verifying Fortnite is foreground. Full-desktop capture
  was rejected by automatic approval review; scoped Fortnite capture was allowed.
- Remaining: verify corrected props and all solo scenarios, replicate four
  stations, improve presentation, test multiplayer, validate project, calculate
  memory, and implement/test all later roadmap features.

For each test, record date, revision,
UEFN version, player count, scenario, expected/actual behavior, pass/fail,
warnings, and a screenshot or capture path. Keep unresolved failures visible.

- [ ] T-PRESENTATION-RANGE (PR-001): save and audit station billboard viewing distances; verify distant text culling, near control/execution readability and return into range in a solo session.

  Partial evidence: [2026-09-13 sign range](evidence/sign-range-2026-09-13.md). All 52 saved at 4 tiles; Hub distant culling, Dock 1 claim/run readability and Dock 2 approach visibility passed. Same-dock repeated out/back travel with progress retention and Dock 3/4 nearby checks remain open.
