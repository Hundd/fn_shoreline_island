# Bot presentation correction — 2026-09-12

Status: in progress; no acceptance tasks closed by compilation alone.
Map: `Content/fn_shoreline_island.umap`, Bot Station 1.

Station source SHA-256:
`3196BFB6CFA66957AB06FEDCBFE43E2D8E735D7A6EF22C34FD94D454571607D0`.
Fixtures and progress source remain at the revisions in
[the first implementation record](implementation-2026-09-12.md).

Changes: bind and refresh the 20 existing control/cell/destination labels at
startup, after player join and on Claim; explicitly ShowText for displayed
boards; hide inactive-stage props; separate delivered seed from lamp 3 by
120 additional units; restore the last parcel result when reclaiming; replace
the stale final route instruction once both cargo tests pass.

BuildAll returned an empty diagnostic array. All 20 added native label
references passed savedActor readback and the station actor was saved.
The first-station actor count remains 48; native references now total 51.

Fresh Launch Session completed; GetGameState returned Running. One player
tested the changed Seed presentation and transition to Dock, without earlier
badge gates. The source was unchanged after that launch.

| Check | Expected / actual | Result and capture |
| --- | --- | --- |
| Fresh entry | Bot labels and three boards visible before Claim; observed. Other zones' static labels also loaded in this session. | PASS this run only; `bot-presentation-initial-002.png` |
| Claim and controls | Claim opens Seed objective; named command/repeat/run controls remain visible. Observed. | PASS; `bot-presentation-slot1-002.png`, `bot-presentation-repeat-002.png`, `bot-presentation-run-002.png` |
| Seed props | Seed and robot visible; lamps and parcel hidden. Correct Pickup / Repeat Move 3 / Drop still completes. Observed. | PASS; `bot-presentation-seed-023.png` |
| Delivered seed | No seed/lamp overlap; seed separate from robot in side view. Observed. | PASS overlap correction; `bot-presentation-next-002.png` |
| Next to Dock | Seed remains done, seed/parcel hidden, three lamps visible at their starting positions. Observed. | PASS; `bot-presentation-dock-002.png` |
| Readability | All cell and destination names comfortably readable from controls. They render but remain too small. HUD/minimap also obscure boards at some controls. | FAIL full presentation acceptance; initial/repeat/run captures |

The intermittent fresh-load issue is not established as fixed by one successful
run, especially since other zones' labels loaded too. Route completion text,
route restoration on reclaim and parcel-stage visibility have compiled but have
not been retested live at this revision. Full muted-audio acceptance, remaining
stations, hints, Replay/badge count, lifecycle, multiplayer, project validation
and memory remain open. Tasks remain unchecked.

Fortnite was closed after testing: process count 0, MCP session Disconnected.
