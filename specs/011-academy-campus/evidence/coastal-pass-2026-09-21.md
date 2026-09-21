# Coastal material and promenade pass, 2026-09-21

- UEFN editor: saved `M_CampusMatte` and ten color instances under
  `Content/Campus/Materials`; applied them selectively to the eight room
  shells. Editor approach captures showed distinct rooflines, entrance
  frames, and readable dark plaques.
- UEFN editor: shifted the main promenade spine from world X -1200 to X -400
  and extended its six west branches to keep them connected. The Vault's east
  wall ends at approximately X -1110; the revised spine's west edge is
  X -750, leaving a 360 cm lateral gap at that wall.
- UEFN editor: shifted the five east boundary trees from X 1000 to X 2600.
  The trees, promenade actor, and all four bench actors were saved.
- UEFN editor: four 1000 by 420 cm cream rest decks connect to the spine's
  east edge at Y -3900, -7900, -11900, and -15900. Four Apollo Coastal
  Boardwalk Bench actors sit with their bases at playable floor Z 2400.
  A viewport capture of the second nook showed the bench grounded on its
  cream deck between the shifted trees.
- The session status was `Disconnected` and the game state `Unconnected`
  during this editor pass. In-game route collision, station use, memory, and
  project validation remain unverified.
- Verse `BuildAll` completed after the coastal pass with no diagnostics.
- A fresh `StartSession` attempt then failed UEFN local validation. The
  editor log identifies all four `campus_promenade_bench_*` actors: their
  `/Game/Environments/Apollo/Sets/Coastal/Props/Meshes/S_Coastal_BoardwalkBench_01`
  reference is disallowed by `AssetValidator_AssetReferenceRestrictions`.
  These actors must be removed through UEFN and replaced with allowed geometry
  before the next validation. The editor MCP stopped responding to subsequent
  calls after the failed validation; no further actor edit is credited.
- A follow-up connection check found the UEFN process still running and port
  8000 listening, but a direct HTTP probe of `/mcp` timed out after five
  seconds with no response. The editor log had no newer entries. This points
  to an unresponsive editor/server rather than a missing project or port.
- The MCP endpoint later recovered. UEFN `remove_from_scene` returned true
  for each of the four disallowed bench actors. Four backed benches, each
  made from six approved cube components, were saved on the promenade actor.
  A viewport capture of the second nook showed the teal seat and navy back
  on its cream deck.
- A new `StartSession` returned `Completed`; subsequent session and game
  checks returned `Connected` and `Running`. The editor log recorded
  `FlowStep_RunLocalValidation(): Complete` with no new disallowed-reference
  error. `GetClientLogEntries` reported no client log, so this session does
  not establish traversal or device interaction.
- `StopGame` returned `Completed`, then `StopSession` was called. Final
  checks returned session `Disconnected` and game `Unconnected`; the UEFN
  editor was left open.
- A walking-height editor viewport along the revised promenade showed a
  continuous teal route, the cream bench deck to one side, and room landmarks
  ahead. This is a visual check only; player collision is still untested.
