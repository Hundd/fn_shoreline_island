# Bot readability, Replay and journal — 2026-09-12

Status: in progress. One player. Map: `Content/fn_shoreline_island.umap`.
Station source SHA-256:
`EB768DD29A6032C463F2B0E7B6B9969221A204060F0F1B4013359A8C7CDA00CC`.
Fixtures/progress and journal source unchanged from the earlier evidence.

## Implementation and build

BuildAll returned no diagnostics. Thirteen saved actor updates passed transform
readback: robot/seed/lamps/cell labels shifted 450 units toward negative X,
six location labels enlarged with dark text/transparent backgrounds, and two
upper boards lowered/moved. See [tested actor audit](readability-2026-09-12.json).
Verse uses text size 24, short Home/planter captions, and stage-specific label
visibility. The first station still has 48 actors and 51 native references.

## Live checks

Fresh Launch Session completed; game state Running. Requested start location
was not honored: the player spawned at the hub. Bot was reached on foot via
the connected zone floors, with health 100 and no damage. Captures document
sampled route positions, not a complete recording of every seam or independent
wayfinding acceptance.

| Expected / observed | Result and captures |
| --- | --- |
| Labels appear on approach without Claim; observed. Other zones' billboards also appeared in this run. | PASS this load only; `bot-readable-front-002.png` |
| Home and cells 1-3 readable and full robot path fits Run view; observed. | PASS focused readability; `bot-readable-run-align-002.png` |
| Pickup / Repeat Move 3 / Drop completes at cell 3 after the path move; observed. | PASS; `bot-readable-seed-023.png` |
| Repeat 3 [Move, Light], energy 3 completes with all lamps raised and energy 0; Seed stays done. Observed. | PASS; `bot-readable-dock-complete-023.png` |
| Parcel hides cells/lamps/seed and shows Garden/Storage; observed, though destinations remain small at distance. | PASS visibility, FAIL full readability; `bot-readable-link-002.png` |
| Dispatch with If leaf Garden else Storage: leaf reaches Garden and marks only leaf done. Plain then reaches Storage and completes the mission. Observed. | PASS core routing; `bot-readable-leaf-007.png`, `bot-readable-cargo-002.png`, `bot-readable-final-011.png` |
| Final route result no longer asks to test the other cargo; observed both-tests-complete text. | PASS message fix; `bot-readable-final-011.png` |
| Replay resets connection/rule/cargo/test flags and parcel while retaining all three completed stages; observed. | PASS; `bot-readable-replay-002.png` |
| Hub returns player to academy; journal reports exactly Bot Earned (1/1) after Replay and reopening. Observed. | PASS; `bot-readable-hub-002.png`, `bot-readable-journal-002.png`, `bot-readable-journal-reopen-002.png` |

## Findings and follow-up revision

The lowered mission board covers the first line of the execution board. Program
content is also outside the view or behind the minimap at the eastern controls.
Garden/Storage labels need more size because they are farther away. The robot
partly obscures the Garden parcel from Run; a side view shows it at Garden.
These prevent full presentation acceptance despite correct gameplay results.

After closing Fortnite, three further actor changes were saved and read back:
execution board Z=2440 (was 2530), Garden/Storage label scale=1.2 (was 0.6).
See [follow-up transform audit](readability-followup-2026-09-12.json).
These three transforms are **not live-tested**. Source hash is unchanged.

Remaining: route restoration on reclaim; all six hints and fixture edge cases;
repeat completion and prior earned badge preservation; rapid input and lifecycle;
additional stations, multiplayer, full muted-audio presentation, project
validation and memory calculation. Journal 1/1 after one completion and Replay
does not prove repeated-completion or multiplayer reward independence.

Fortnite closed after the run: process count 0, MCP session Disconnected.
