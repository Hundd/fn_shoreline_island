# Bot ending and restored-work journal

Date: 2026-09-13. One player, one uninterrupted game.
Session: `3c037be1a8ee40cc9dd811a938837e77`.
Scope: FR-004/FR-005, AC-003/AC-004; focused solo journal coverage.
No Verse or editor asset changes were made for this test.

## Tested revisions

| Source under Content/ | SHA256 |
| --- | --- |
| fn_shoreline_island_bot_fixtures.verse | 0F44FA9B5F666EB2B8D85ED26A46BE217BB650486CA7178D970A4E707A53F3F7 |
| fn_shoreline_island_bot_progress.verse | B0D91574F621C964F42179994576C534C6A91264095520E3D8B5EBA4FDF5A95E |
| fn_shoreline_island_bot_station.verse | 7538F357B5BD5E93FFF8B4A799A2A7EE9C4F7E628AB58F92E4BFDD8DAB8879C2 |
| fn_shoreline_island_academy_journal.verse | 645DA93E6DFEFE3785EC5378A744E95F7B9E389806CD86B49C3CB93D6DEEF5F6 |

StartSession completed, GetGameState returned Running, and Fortnite finished
loading at Bot Station 1. All progress was earned with normal button inputs.
There were no runtime state injections, PushChanges or gameplay restarts.

## Expected and actual

| Check | Observed | Result |
| --- | --- | --- |
| Seed solution | Pickup, Repeat Move 3, Drop completed at cell 3; seed marked done | PASS |
| Dock solution | Repeat 3 [Move, Light], starting energy 3; final energy 0, lamps 3/3; seed retained | PASS |
| Parcel leaf | Launch connected to Dispatch, correct conditional rule; leaf reached Garden, only leaf marked done | PASS |
| Parcel plain and ending | Plain reached Storage; all stages and both tests done; full academy restoration/Bot Badge message visible | PASS |
| Hub return | Normal return button teleported to hub | PASS |
| Journal Overview | Bot Earned (1/1); seven other zones Ready to try; Path Garden recommended | PASS |
| Work page | Bot says academy mission completed with your robot; other seven rows Not yet restored; all text fits | PASS |
| Back and Close/reopen | Overview retains Bot 1/1 and all other states | PASS |
| Second Work visit, direct Close, third Overview | Same contribution and exact Bot 1/1, no new ending message during page visits | PASS |

Source inspection supports the observed journal behavior: badge reads use
GetValue(input_player), page callbacks only replace/remove widgets, and there
are no Assign, Reset or SetValue calls in the journal. This is supporting code
evidence, not multiplayer or full reward-system instrumentation.

## Captures

- [Seed](captures/bot-journal-seed-024.png), [dock](captures/bot-journal-dock-024.png),
  [leaf](captures/bot-journal-leaf-011.png), [ending](captures/bot-journal-finale-011.png).
- [Hub return](captures/bot-journal-hub-005.png),
  [earned Overview](captures/bot-journal-earned-002.png),
  [Work](captures/bot-journal-work-002.png), [Back](captures/bot-journal-back-002.png).
- [Reopen](captures/bot-journal-reopen-002.png),
  [second Work](captures/bot-journal-work-repeat-002.png),
  [Work Close](captures/bot-journal-work-close-002.png),
  [final count](captures/bot-journal-final-count-002.png).

## Limits

Nursery remix was not entered after Bot in this session. Preservation of other
already-earned badges was not exercised because only Bot was earned. No muted
audio setting, multiplayer, departure, respawn, round reset, memory calculation
or full project validation is claimed. No new compile was necessary for this
unchanged-source test. The HUD tracked Nursery 0/1 throughout; exact Bot count
was checked in the journal, not inferred from that unrelated HUD.

Approaching the journal from the Hub return required several camera adjustments
to target the edge-facing button. This is a remaining route/usability observation,
not a failed journal callback. Repeated open floating signs and distant zone
clutter remain presentation work under the extension plan.

Fortnite closed after testing. Final process count: 0. MCP session: Disconnected.
