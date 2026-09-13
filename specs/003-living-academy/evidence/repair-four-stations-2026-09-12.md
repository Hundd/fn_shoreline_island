# Four repair stations — 2026-09-12

Status: editor reference audit and focused solo checks pass; full acceptance pending.

Source remains `fn_shoreline_island_repair_station.verse` SHA256
`755CF46076558F1EF226E7898F69466796552026655574987BDC8B75031796FF`.
Progress source remains SHA256
`2F75323B8F97FAABC1CF32D96707003820FFB05F133F61029A4FFF91925F0217`.

Duplicated the tested first station's 30 owned actors through UEFN's Edit menu.
Mapped each duplicate to its original by the unique original position plus the
editor's observed (4,4,0) duplicate offset. Replaced that offset with complete
authored transforms, preserving the tested layout at X offsets 2200, 4400, 6600.
Assigned station IDs 1, 2, 3; the original remains ID 0.

- Each new station's 21 native references was explicitly assigned and read back.
  Local controls, board, feedback, and stage markers point at that station's actors.
  Existing hub teleporter and four spawn references remain shared.
- All three shared repair-progress references and IDs read back correctly.
- All 90 new actors were labeled, transformed, and saved; locations read back.
- Final scene query returned exactly 30 actors for each station and one progress
  device. Floors meet at X 5100, 7300, 9500 and share Y -600..2200, top Z 2400.
- BuildAll returned an empty diagnostic array after placement and binding.
- [Full actor, transform, identity, and binding audit](repair-four-stations-2026-09-12.json).

## Solo results

Date: 2026-09-12. Players: one. Revision: the source hashes above and the saved
actor configuration in the linked JSON audit. Fresh Launch Session reached Running.

| Scenario | Expected | Actual / evidence | Result |
| --- | --- | --- | --- |
| Walk from the hub through the new stations | Continuous access without jumping or damage | Walked across the connecting floors; health remained 100 | Pass |
| Claim Station 2 and swap slots 2 then 1 | Owned program becomes Plant, Water, Harvest, Wait | [Edited program](repair-station2-edited-2026-09-12.png) | Pass |
| Leave Station 2 and claim Station 3 | Previous ownership releases; personal program transfers | Claim accepted with the same edited program: [Station 3](repair-station3-transfer-2026-09-12.png) | Pass |
| Run that incorrect program at Station 3 | Stop at step 1, request Water, show no completed stages | Readable failure board and all four stage props hidden: [failure](repair-station3-step1-failure-2026-09-12.png) | Pass |
| Use Help twice at Station 3 | Concept hint followed by worked guidance | Both HUD messages readable: [concept](repair-concept-hint-2026-09-12.png), [worked](repair-worked-hint-2026-09-12.png) | Pass |
| Replay, then leave and claim Station 4 | Reset faulty fixture transfers; previous station releases | Replay followed by accepted claim and full Water, Plant, Harvest, Wait board: [Station 4](repair-station4-claimed-2026-09-12.png) | Pass |
| Use Help at Station 4 after Replay | Hint progression restarts with the concept hint | [Concept hint restored](repair-hint-reset-2026-09-12.png) | Pass |
| Activate Station 4 Hub control | Teleport to the academy hub without damage | [Hub arrival](repair-station4-hub-return-2026-09-12.png), health 100 | Pass |

The Loop badge HUD remained 0/1 throughout these checks. This run does not prove
Garden badge preservation because its HUD was not visible; the earlier Station 1
test records that evidence. Stations 2–4 have not each run a corrected full program.
Distance-release behavior was exercised through sequential claims; simultaneous
ownership by different players was not tested.

Warnings: presentation remains graybox. Buttons appear edge-on, stage markers
float, some grass intersects the Station 4 floor, and floor seams are visible.
The walking check passed despite those presentation issues. Fresh-load signs
were visible in this launch, but one successful launch does not resolve the
earlier intermittent billboard finding.

Rapid input, respawn, player departure, round reset, simultaneous player isolation,
project validation, memory calculation, and presentation acceptance remain pending.

Cleanup: closed Fortnite after testing; the exact client process was absent and
Unreal MCP GetSessionStatus returned Disconnected.
