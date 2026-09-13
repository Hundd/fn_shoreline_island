# Hub instruction refresh: focused solo evidence

Date: 2026-09-13. Players: 1. Requirements: FR-002, NFR-002.
Session shown in Fortnite: `69e5fae993d4d2bbefc73210eca8eeb`.
Controller SHA256: `2421EFCD9E112835DF9411FCCB53CD893CF6DDF87628EAF6B4AAAE8ACD7540A7`.

Added `Content/fn_shoreline_island_hub_signs.verse` and one hidden controller in
the hub at (600, 200, 2450). It refreshes 13 existing static signs every three
seconds with alternating trailing whitespace, ShowText and UpdateDisplay.
Authored wording is preserved in localizable messages. No progression or
dynamic station display references are present. Existing native sign settings
and transforms were not edited. All 13 wrapper savedActor references matched
readback; see [binding audit](hub-sign-bindings-2026-09-13.json). Saved controller
and Save All succeeded. BuildAll returned an empty diagnostics array.

This was the first launch following that build. StartSession completed; a
CanStart query was followed by automatic game start. The subsequent StartGame
request reported not startable, and GetGameState confirmed Running. No StopGame,
restart or PushChanges occurred during the test.

| Check | Actual result | Status |
| --- | --- | --- |
| First game after Verse build | Academy title, journal cue, hub Garden direction, Garden sequence board, Water/Plant/Wait/Harvest labels and repair route were visible | PASS |
| Walk toward journal | Garden directions and step labels stayed visible; journal interaction prompt appeared | PASS |
| Native menu Respawn | Returned to hub with the same title, journal and Garden instructions visible | PASS |
| Turn toward Loop | LOOP LAGOON route visible | PASS |
| Turn toward Lighthouse | Complete Lighthouse route wording visible; Vault route visible in the distance | PASS, Vault close readability not accepted |

Captures: [first game](captures/hub-refresh-first-011.png),
[walking](captures/hub-refresh-walk-002.png),
[respawn](captures/hub-refresh-respawn-024.png),
[Loop](captures/hub-refresh-loop-002.png),
[Lighthouse](captures/hub-refresh-signal-front-002.png).

This supports retaining the candidate refresh. It does not establish the cause
of the earlier intermittent issue or prove every fresh launch is fixed. The
capture did not measure time from the exact gameplay-start instant, so the
six-second requirement remains unverified. Return-to-Hub sign front and close
Vault route inspection, repeat fresh-launch coverage, multiplayer, full project
validation and memory calculation remain pending. No gameplay objective was
completed in this session. Compile diagnostics are not full project validation.

Fortnite was closed after testing; final process count was 0 and MCP session
status was Disconnected.
