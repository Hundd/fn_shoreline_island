# Four Variable Vault stations — 2026-09-12

Added 75 editor-owned actors: three stations with 25 actors each, west of the
first station. Centers X=-6000/-8800/-11600, Y=-2600, Z=2450; unique IDs 1/2/3.
The existing station retains ID 0. Adjacent 2800-wide floors meet, with top Z=2400.

All 75 full transforms were read back with 0.001 tolerance. The 39 sets of
billboard/feedback settings matched the source station. All 57 native wrapper
bindings were checked against their intended actors; unique station IDs and
shared personal progress references matched. All actors were saved.

Each added door is a Movable BuildingProp with Cube mesh and academy teal;
each floor is static Cube with academy sand. Confirmed UEFN's custom-material
notice for each door and read back all six component configurations.

Added the existing Energy progress tracker wrapper at journal index 1 while
preserving Signal at index 0. Readback matched and journal actor was saved.

[Native audit](four-stations-2026-09-12.json) records actors, transforms,
settings, bindings, geometry and journal tracker array. Verse BuildAll returned
`[]` after placement. Source hashes remain those in the initial implementation
record. Runtime checks for the new stations and journal follow separately;
editor readbacks alone do not prove multiplayer isolation or badge retention.

## Focused runtime after placement

First launch failed with [Failed to connect to beacon](beacon-failure-2026-09-12.png).
Dismissed both UEFN error dialogs; the original call returned Failed and status
was Disconnected before retry. Retry StartSession returned Completed and game
state Running. One player, round `a93f4a7954c64360898e2a2e753af2db`, spawned
near station four. No source changes since the initial implementation hashes.

| Expected | Actual | Result |
| --- | --- | --- |
| Station four can be claimed | [Claim](vault-four-claim-004.png), energy 0 and target 3, correct objective HUD | PASS |
| Station four controls its door | Three +1 inputs, [energy 3](vault-four-start-aim-001.png), Start visibly raises door and shows [OPEN](vault-four-open-011.png) | PASS |
| Floor join four-to-three is traversable | Walked along the control row across the join; [approach](vault-walk43-b-001.png), health 100 | PASS for walked segment |
| Completed first puzzle follows player to station three | [Claim](vault-three-transfer-003.png) restores energy 3 and open door without another solve | PASS for this transfer |
| Floor join three-to-two is traversable | [Walk](vault-walk32-a-001.png), health 100 | PASS for walked segment |
| Station two can be claimed with retained completion | [Claim](vault-two-transfer-003.png): energy 3, target 3, door OPEN | PASS for this transfer |
| Station two Hub returns safely | [Return](vault-two-return-005.png), health 100 | PASS |
| Static labels and directions visible on fresh load | [Spawn](vault-four-spawn-002.png) has no static billboards; nearby Signal and later hub boards also absent. Claim/energy changes make their dynamic boards appear, and changing door status makes its board appear | FAIL |

The missing static billboards persisted through this run, including Hub return.
This is not a passed readability test. The dynamic updates suggest a fresh-load
display/replication problem, but do not establish its root cause. Investigate
initial billboard visibility before treating entry/navigation acceptance as met.
No audio-muted acceptance, complete four-station matrix, numeric Energy journal,
rapid input, respawn, round restart, multiplayer, project validation or memory
acceptance is claimed. Energy remains only partially completed in this test round.

Closed Fortnite after the run; verified process count 0 and UEFN Disconnected.
