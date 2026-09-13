# Event Factory: four stations and solo transfer test

Date: 2026-09-12. Map: `Content/fn_shoreline_island.umap`.
One player; round `3c0f68ed93f84dd08391b38dd3dbceb3`.
Status: implementation and partial acceptance evidence; not Validated.

## Saved implementation

The [editor readback](four-stations-2026-09-12.json) records the first 35 actors
and 96 added actors, for 131 Event Factory actors. Three additional stations
each have 22 audited native references, unique station IDs 1–3, and the shared
Event progress device. All 96 added transforms and native properties were
read back; all 12 new floor/response mesh components were audited and saved.
The original station retains ID 0. Its 24 native references, including the
shared round/tracker references, were audited in the first implementation.

All four centers use 2800-unit X spacing. Floors meet at Z=2400 and meet the
Debug Workshop floors at Y=-7800. Five presentation transforms on Station 1
were revised before copying: goal board, chute, parcel and their two labels.
The same relative layout is used at all four stations.

Verse BuildAll returned `[]`. The fresh Launch Session completed and entered
Running at the requested Station 4 start. No Verse source changed in this run.

| Source | SHA-256 |
| --- | --- |
| `fn_shoreline_island_event_fixtures.verse` | `AE16D697A512480EE5749A925A6015A98025DB79AA9A9E3F90A458FBA93776A9` |
| `fn_shoreline_island_event_progress.verse` | `6A96E89D44464F9626973DB3B46753BFF3F662A8EFAE2B796130CAD4856CC0FB` |
| `fn_shoreline_island_event_station.verse` | `9881845BCA375C300AE37476C5733C1A0C8D3958AAA88A33DE4739CB55D1781C` |

## Observed results

| Requirement / check | Actual result and capture |
| --- | --- |
| Station 4 claim, FR-001 | Claim succeeded. Bell was connected to Open chute; Bell opened the full visible panel and released the parcel while the lamp remained OFF. Challenge complete: `event-four-chute4-011.png`. |
| FR-004, challenge 1 hints | Both hint levels displayed: `event-four-hint1-1-002.png`, `event-four-hint1-2-002.png`. |
| Solo transfer 4 → 3 | Walked across the floor join without jumping. Next had selected challenge 2; Station 3 claim restored example 1 and demonstrated Bell / Light lamp: `event-four-claim3-011.png`. |
| FR-004, challenge 2 hints | Both levels displayed: `event-four-hint2-1-002.png`, `event-four-hint2-2-002.png`. |
| FR-002, correct answers | Bell advanced to example 2, Lever advanced to example 3, Bell completed the challenge: `event-four-answer31-success-011.png`, `event-four-answer32-011.png`, `event-four-answer33-002.png`. Wrong answers were covered by the earlier first-station test. |
| FR-002, explicit Show event | At example 3, the prompted button reset the chute/parcel, repeated their motion and kept example 3 selected. Compare `event-four-show3-success-002.png` and `event-four-show3-success-015.png`. |
| Solo transfer 3 → 2 | Next selected challenge 3. Walked across the join without jumping. Station 2 claim restored challenge 3 with both reversed mappings and neither test passed: `event-four-claim2-002.png`. |
| FR-004, challenge 3 hints | Both levels displayed, completing all six hints in this round: `event-four-hint3-1-002.png`, `event-four-hint3-2-002.png`. |
| FR-003, Station 2 partial result | Corrected both mappings and pressed Bell. Board showed Bell PASS, Lever not tested; chute open, parcel released, lamp OFF: `event-four-bell2-pass-011.png`. |
| Solo transfer 2 → 1 | Walked across the join without jumping. Station 1 claim restored the mappings, Bell PASS, recent Bell event, open chute and released parcel: `event-four-claim1-002.png`. |
| FR-003 / FR-004 completion across stations | Pressed Lever at Station 1. Lamp rose and read ON; chute closed and parcel returned home. Both tests read PASS. HUD awarded Event Badge with the recap “An event starts a response”: `event-four-award1-011.png`. |

All four claims and all three lateral floor joins passed solo. This does not
establish simultaneous ownership or multiplayer isolation. Completion used
challenge 1 at Station 4, challenge 2 at Station 3, and challenge 3 split across
Stations 2 and 1, demonstrating retained challenge progress and completed flags.

## Presentation findings and remaining checks

The Bell position now shows the full raised chute and released parcel. All
static labels appeared in this fresh launch. This single launch does not resolve
the previously recorded intermittent fresh-load billboard issue elsewhere.
The raised chute still covers part of the goal board from Next
(`event-four-next3-prompt-002.png`), and the minimap covers part of the board
from Claim. Full presentation acceptance remains open. The lamp is still a
labeled moving sphere, without a physical light effect.

Some earlier unprompted E presses did nothing. `event-four-show3-*.png` and
`event-four-answer31-011.png` are excluded from acceptance; the explicitly
prompted successful retests above are the evidence.

Repeat completion and duplicate-award retesting, rapid input, cancellation
during execution, respawn, round restart, multiplayer, complete muted-audio
entry-to-return presentation, project validation and memory calculation remain
pending. Historical Replay/Hub/journal Event 1/1 evidence remains in
[the first-station report](implementation-2026-09-12.md).

Fortnite closed after the run: process count 0; MCP reported Disconnected.
