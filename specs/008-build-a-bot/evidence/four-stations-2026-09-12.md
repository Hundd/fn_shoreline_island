# Four Bot stations — 2026-09-12

Added three complete stations at X offsets -3400, -6800 and -10200 from the
first station. Centers are X -3500/-6900/-10300/-13700, Y -14000. Station IDs
are 0–3. Each new station has 39 native devices and seven geometry actors;
138 actors were added, bringing the Bot total to 186.

The original progress device and badge remain shared. Each station uses its
own buttons, HUD feedback, boards, labels, robot, seed, parcel and lamps.
The four hub spawners and Hub teleporter remain shared. All 147 new native
references and three progress/ID pairs passed editor readback. All 138 new
transforms, native property overrides and geometry mesh/material/mobility
settings matched the plan after save. See the accompanying JSON audit and
`four-station-source-2026-09-12.json` for the original saved layout.

Verse Build All returned `[]` after assembly. Station source SHA-256:
`7538F357B5BD5E93FFF8B4A799A2A7EE9C4F7E628AB58F92E4BFDD8DAB8879C2`.
The parking/board revision's first-station solo results are in
[parking retest](parking-2026-09-12.md).

Fresh solo Launch Session completed on the source revision above. The requested
Station 4 start location was honored, and labels appeared before Claim.

## Solo runtime results

- Station 4: claimed; both Seed hints displayed; Pickup / Repeat Move / Drop,
  count 3 delivered the seed and marked Seed done.
- Walked 4 to 3, claimed Station 3, and restored Seed done with Dock active.
  Both Dock hints displayed. Repeat 3 [Move, Light], energy 3 lit all three
  lamps and ended with energy 0 and Dock done.
- Walked 3 to 2, claimed Station 2, and restored both completed stages with
  Parcel active. Both Parcel hints displayed. Connected Launch to Dispatch,
  selected If leaf > Garden; else > Storage, and ran leaf: Garden delivery
  passed while Plain remained to do.
- Walked 2 to 1 and claimed Station 1. The conditional program, Leaf done,
  last successful route message and parcel at Garden were restored. The robot
  remained parked separately. Changing cargo retained Leaf done. Plain reached
  Storage and completed the mission with the restoration message.
- Repeated Run on the completed program: retained-badge message displayed.
  Hub returned correctly; the journal showed **Bot: Earned (1/1)**. Other badges
  were unearned this round, so preservation of earlier earned badges is untested.
- All three connecting walks retained 100 health. This run used one player;
  it does not establish simultaneous ownership or multiplayer isolation.

The 19 captures under `captures/four-*.png` record initial visibility, six hints,
stage results, transfers, finale, repeated completion, Hub and journal.
Station 1's eastern Claim view still puts the program board behind the minimap;
it is readable from Cargo and Run. Full presentation acceptance remains open.
Respawn, active-execution cancellation, round restart, multiplayer, project
validation and memory acceptance remain pending.

After the test, Fortnite was closed: process count 0; MCP session Disconnected.
