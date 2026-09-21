# Tasks

- Status: In progress.

- [ ] T-001 (FR-001-FR-007): Record zone bounds, entrances, device clearances,
  and candidate Fortnite assets. Main four-station rows and native Apollo tree
  assets surveyed. A promenade geometry audit now records all branch junctions
  and Loop clearance in `evidence/route-audit-2026-09-21.md`; client collision
  and device clearances remain open beyond a user-reported eight-room smoke
  check with no issue named. The Garden approach frame and planter blockers
  were also corrected and documented there.
- [x] T-002 (FR-001-FR-003, AC-001): Build and save the Variable Vault template
  room without moving existing gameplay actors. The graybox shell is saved as
  `campus_variable_vault_shell`; runtime AC-001 remains assigned to T-003.
- [ ] T-003 (FR-002, FR-003, FR-007, AC-001, AC-002): Solo-test all four Vault
  stations, entry/exit, board readability, retry, Replay, and Hub behavior.
  The east wall now has an 1100 cm doorway aligned to the Energy branch; an
  editor view shows the aisle through it, but collision and gameplay remain
  unverified in a session.
- [ ] T-004 (FR-001-FR-003, FR-008, AC-006): Build seven structurally distinct
  rooms rather than copying the Vault shell, verifying one zone before starting
  the next. Seven distinct graybox structures are saved and visibly different
  in the editor. The Bot end wall and Garden approach planter now have central
  openings. The user reported no issue after an eight-room route smoke check;
  per-station runtime access and gameplay verification remain open, so this
  task is not complete.
- [ ] T-005 (FR-004-FR-006, AC-003, AC-004): Add campus paths, trees, planters,
  lights, benches, fences, signs, and room landmarks. A connected teal promenade
  and twelve native Fortnite boundary trees are saved. Bounds verification
  confirms the promenade and all campus trees meet the common room-shell ground
  surface at world Z 2272; room palettes, windows, signs, lighting, props, and
  runtime route checks remain open. All eight room names are saved and visible
  in editor approach views. Lighting, props, windows, landscaping refinement,
  and in-game route checks remain open.
  A matte coastal palette now distinguishes the eight rooflines and entries.
  The spine was moved clear of the west room walls and four native coastal
  bench nooks were saved beside it. Fresh-session validation rejected the
  coastal bench mesh, so those four actors were removed and replaced with
  grounded primitive benches. A subsequent fresh session passed local
  validation. The user reported no issue during an eight-room route smoke
  check; detailed clearance at each entrance and control remains unrecorded.
- [ ] T-006 (NFR-001-NFR-004, AC-005): Run Verse build, fresh-session checks,
  project validation, memory calculation, solo traversal, and available
  multiplayer tests; record evidence and remaining warnings. A second fresh
  launch connected after a stale client was closed, and Verse built with no
  diagnostics. Client logs include BuildingProp physics-component errors;
  movement and controls could not be exercised through the available tools.
  A later Garden-edit launch passed local validation but failed source upload
  while Epic's URC service reported maintenance mode. A retry failed staging
  because the scratch repository reported login not initiated. See
  `evidence/session-2026-09-21.md` and `evidence/route-audit-2026-09-21.md`.
  A subsequent fresh launch uploaded the project, activated content on all
  platforms, and reached Connected / Running. Its game and session were stopped
  and verified Unconnected / Disconnected. Explicit Validate Project, memory,
  and in-client traversal and gameplay checks are still pending.
  A later UEFN-interface launch again activated content and reached Running;
  the client log had no Verse diagnostics in the observed interval. That run
  was stopped and verified Disconnected / Unconnected. In reply to a request
  to walk all eight rooms and report route, sign, or control problems, the user
  reported "looks fine" with no issue named. This supports a broad smoke
  check, not station-by-station puzzle regression evidence.
  A later UEFN memory result succeeded at 8,542 / 100,000 with one location
  sampled. Its preceding session upload passed local validation and activated
  content. The user reports validation and memory looked okay; a distinct
  Project > Validate Project report is not captured in the available log.
  The remaining checks are enumerated in `evidence/playtest-matrix.md`.
- [ ] T-007 (FR-002, FR-003, FR-009, AC-007): Give all eight games distinct
  non-interactive console surrounds and prop rhythms without moving or
  replacing gameplay devices. Eight room-specific decoration actors containing
  86 primitives are saved, and an aerial editor inspection confirms visibly
  different arrangements with clear control faces; runtime interaction and
  traversal verification remain open.
- [ ] T-008 (FR-003, FR-010, AC-008): Ground all station-identity bases on the
  playable room floor and support any raised parts that appear suspended.
  Eight decoration actors now have visible bases at Z 2400; eight narrow
  uprights connect the Debug tool beams to their grounded rack posts. Editor
  placement is checked; player clearance in a session remains open.
- [ ] T-009 (FR-003, FR-009, FR-010, AC-007, AC-008): Support the exposed
  Energy Station 3 button row with a slim grounded Vault-style console rail;
  a navy base/mount and five gold posts are saved on the Vault identity actor.
  Front and side editor views show a grounded row and exposed button faces;
  in-play interaction verification remains open.
- [ ] T-010 (FR-003, FR-010, AC-008): Add matching floor-mounted supports to
  Energy rows 1, 2, and 4, preserving all nine buttons per row. The three rows
  are saved with seven support components each; Station 4 front/side editor
  views show clear button faces and floor-reaching posts. Runtime play remains
  open.
- [ ] T-011 (FR-003, FR-009, FR-010, AC-007, AC-008): Ground all four Signal
  button rows with segmented beacon-console pods rather than Vault-style rails;
  all four rows now have three saved floor-mounted pods, with nine decoration
  components per row. Front/side editor inspection of the `signal_3_*` row
  shows gaps between pods and visible button faces; in-play clearance and
  interaction remain open.
- [ ] T-012 (FR-007, FR-011, AC-009): Prototype a native alternate button mesh
  on one Signal device, inspect its visual/state behavior, then apply distinct
  safe button treatments by game only where the original interaction remains
  testable and intact. Pilot found the candidate mesh lacks the required
  `Emissive` state parameter; native ready-color edit was rejected by the
  editor. Mesh override was disabled and saved. Next try decorative housing
  around the original control and playtest before checking this task off. A
  gold beacon crest and grounded stem are now saved above the original Signal
  Station 0 Claim button; its face and label are visible in an editor capture,
  and a fresh session cooked successfully. Runtime prompt/state/action checks
  remain pending before extending the treatment to other buttons.
- [ ] T-013 (FR-003, FR-004, AC-001, AC-003): Move and narrow only the Signal
  and Vault path components to clear their south-edge control collisions,
  then verify editor line clearance, save, cook, and walk both routes in the
  client. Both branches were edited and saved; six edge/center editor traces
  were clear and a fresh session reached Connected / Running. Client walking
  remains pending. Coordinates and evidence are in `plan.md` and
  `evidence/route-audit-2026-09-21.md`.
- [ ] T-014 (FR-001, FR-005, NFR-002, AC-004): Pilot a warm roof-mounted
  fixture over Variable Vault's first control bay, inspect its walking-height
  lighting and camera clearance, save, and validate with a fresh session.
  Extend the rhythm only after the pilot is verified; record the result in
  `plan.md` and campus evidence. Four roof-mounted fixtures are now saved and
  the full pass reached Connected / Running in a fresh session. The editor
  view confirmed the pendant-to-roof join; in-client illumination, camera
  clearance, readability, and memory cost remain open.
- [ ] T-015 (FR-001, FR-006, AC-003, AC-004): Add an Event Factory nameplate
  facing the branch beside its east tower, inspect from the spine and entry,
  save, and cook. Keep the path clear and the existing east-facing sign. The
  second plaque is saved, visible from a normal-pitch branch view, and cooked
  in a fresh connected session; client legibility and walking clearance remain
  pending.
- [ ] T-016 (FR-001, FR-003, FR-006, NFR-003, AC-003, AC-004): Lower the
  existing Debug Workshop entrance plaque and text to a normal-pitch view,
  verify the portal retains at least 440 cm of visual clearance, save, and
  cook; then confirm in-client readability and camera movement. Editor view
  and chest-height line passed; the saved change reached a running session.
- [ ] T-017 (FR-001, FR-003, FR-006, NFR-003, AC-003, AC-004): Make the
  Build-a-Bot label visible from the branch while preserving the wide east
  entrance; inspect, save, cook, and verify in-client clearance. Lowering the
  existing lintel failed the normal-pitch view and was reverted. A separate
  floor-supported side sign was saved north of the branch, visible in the
  editor, and cooked in a running session; client clearance remains pending.
- [ ] T-018 (FR-001, FR-003, FR-006, AC-003, AC-004): Add a walking-height
  Variable Vault sign north of its shifted branch while retaining the high
  doorway name, inspect from the spine, save, cook, and verify player route
  and legibility in the client. The first floor-sign position was hidden by
  the wall; a compact wall-mounted version is now visible in the editor and
  cooked in a fresh session. Client legibility and clearance remain open.
- [ ] T-019 (FR-001, FR-003, FR-006, AC-003, AC-004): Align Tidepool
  Nursery's existing pod sign with its Y -17000 branch and lower the plaque
  to a normal-pitch view while preserving pod/path clearance; inspect, save,
  cook, and verify in-client legibility and collision. The centered assembly
  is saved, visible in the editor, clear on three chest-height lines, and
  cooked in a fresh session; client checks remain pending.
- [ ] T-020 (FR-001, FR-003, FR-006, NFR-003, AC-003, AC-004): Make Path
  Garden's name readable from the branch while preserving its tall entrance
  arch and full path opening; inspect, save, cook, and verify in-client
  traversal and readability. A compact two-line sign on the south arch post
  is saved and readable in a normal-pitch editor view. Three chest-height
  opening traces were clear and a fresh session cooked; the client checks
  remain pending.
- [ ] T-021 (FR-001, FR-003, FR-006, AC-003, AC-004): Relocate Loop
  Lagoon's existing round sign into the gap between the first two sheds,
  keeping its post outside the spur and control bounds; inspect from the
  promenade, save, cook, and verify in-client visibility and clearance. The
  resized sign is saved and readable in a normal-pitch editor view. Center
  and edge traces along the spur were clear and a fresh session cooked;
  in-client visibility and clearance remain pending.
- [ ] T-022 (FR-004, FR-006, AC-003, AC-004): Add a compact south-facing
  Academy Hub guide sign on the grass east of the promenade near Y -15500;
  inspect from the southern approach, verify path clearance, save, cook, and
  check its readability while returning from Nursery in the client. The sign
  is saved, readable in a normal-pitch editor view, clear of three
  chest-height route traces, and cooked in a fresh session. The player check
  remains pending.
- [ ] T-023 (FR-002, FR-003, FR-009, FR-010, FR-012, AC-001, AC-008,
  AC-010): Ground and visually integrate all four Garden Repair stations.
  Leave every gameplay actor fixed; support nine buttons, four stage
  displays/labels, and each board per station with a matching garden kit.
  Inspect from front and side, save, cook, and test Claim, slot, Run, Help,
  Replay, Hub, and stage changes in the client. The four repeated support
  kits are saved and visually inspected from the south aisle. A fresh session
  upload/cook completed. A follow-up aligned all 36 button pedestals directly
  beneath their devices and completed another fresh cook; in-client control
  and progression checks remain.
