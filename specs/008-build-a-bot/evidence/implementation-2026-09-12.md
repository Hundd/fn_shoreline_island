# Build-a-Bot first-station evidence — 2026-09-12

Status: In progress, not validated. Map: `Content/fn_shoreline_island.umap`.
Player count: one, fresh Fortnite session launched at the first Bot station.
No multiplayer result is inferred from this run.

## Revision and editor checks

Three new Verse classes implement exact authored fixtures, per-player progress,
and station controls/animation. SHA-256 at the tested revision:

| File prefix `fn_shoreline_island_bot_` | SHA-256 |
| --- | --- |
| `fixtures.verse` | `0F44FA9B5F666EB2B8D85ED26A46BE217BB650486CA7178D970A4E707A53F3F7` |
| `progress.verse` | `B0D91574F621C964F42179994576C534C6A91264095520E3D8B5EBA4FDF5A95E` |
| `station.verse` | `726296E21635F2899DDB51358153095780D2B27119C7F72DA4A97D679213E677` |

BuildAll returned no diagnostics. Launch Session completed and game was Running.
Forty-eight actors were placed and saved: 41 native/Verse devices and seven
geometry actors. Readback verified transforms, device properties, 31 native
references, station ID 0, shared progress identity, and the fifth journal badge
binding. Mesh/material/mobility readback covered all seven geometry actors.
See [full implementation audit](implementation-2026-09-12.json).

## Expected and observed solo results

Capture paths below are relative to this evidence directory.

| Case | Expected / actual result | Result and capture |
| --- | --- | --- |
| Fresh entry and Claim | Static instructions visible on entry; instead all static billboards were absent. Claim restored the three dynamic mission/program/execution boards only. | FAIL full AC-001 presentation; `bot-initial-002.png`, `bot-claim-002.png` |
| Seed wrong order | Move twice then Pickup stops at first invalid Pickup away from Home, without award; observed. | PASS logic; `bot-seed-wrong-019.png` |
| Seed correct | Pickup, Repeat Move 3, Drop carries seed and completes at cell 3; observed. Delivered seed overlaps lamp 3. | PASS logic, FAIL presentation; `bot-seed-correct-006.png`, `bot-seed-correct-023.png`, `bot-next1-prompt-002.png` |
| Dock wrong order | Initial Light at Home stops with explanation; observed. Seed remains done. | PASS; `bot-dock-wrong-007.png` |
| Dock correct | Repeat 3 [Move, Light], energy 3 lights each lamp and ends at energy 0; observed energy 2/1/0 with lamps 1/2/3 raised. | PASS core execution; `bot-dock-correct-009.png`, `bot-dock-correct-013.png`, `bot-dock-correct-023.png` |
| Disconnected Launch | Parcel stays put and missing connection is explained; observed. Seed and Dock remain done. | PASS; `bot-launch-disconnected-002.png` |
| Wrong route | Dispatch with All Storage sends leaf to Storage and leaves both test flags incomplete; observed with explicit correction. | PASS; `bot-route-wrong-007.png` |
| Correct leaf | If leaf Garden else Storage routes leaf to Garden and marks only leaf done; observed. | PASS; `bot-leaf-correct-007.png` |
| Correct plain / finale | Switching cargo preserves leaf test; plain reaches Storage, all stages done, restoration/Bot Badge earned text appears, robot rises then returns. Observed. | PASS core completion; `bot-plain-run-prompt-002.png`, `bot-final-complete-003.png`, `bot-final-complete-011.png` |

## Remaining acceptance and warnings

Static labels failed again on fresh load, including other zones in the view.
Bot Claim's SetText restored its dynamic boards; this does not establish a fix
for static labels. Cell/destination labels therefore cannot support full muted
audio acceptance. Seed delivery overlaps lamp 3. Inactive stage props remain
visible. Robot Home is partly outside the view from Run, and HUD/minimap can
obscure boards at other controls. Final route trace still says to test the other
cargo after both tests passed; mission board and final HUD correctly show completion.

Only one station exists. Remaining fixture edge cases, all six hints, Replay,
Hub, exact journal Bot count, repeat award, rapid input, departure/respawn/round
restart, station transfer, two/four-player independence, full route walking,
project validation and memory calculation are untested at this revision.
Prior badges were not earned in this fresh round, so badge preservation is not
claimed. Full tasks remain unchecked until their corresponding acceptance passes.

Fortnite was closed after the run: process count 0 and MCP session Disconnected.
