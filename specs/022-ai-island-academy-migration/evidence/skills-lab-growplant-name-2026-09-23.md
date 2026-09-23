# AI Skills Lab GrowPlant name — 2026-09-23

Scope: AC-037 / T-034. Plan sections 49–54 name the reusable skill
`GrowPlant` and explicitly permit the retained Water, Plant, Wait, Harvest
actions. The existing `Care` presentation missed that named example.

Verse player-facing text in the Skills Lab station, badge Tracker controller,
and academy journal now says GrowPlant. The fixture evaluator, command IDs,
three challenge plans, station device fields, and per-player badge logic were
not changed. UEFN Verse `BuildAll` returned zero diagnostics.

Through the live UEFN editor, all 36 Skills Lab Billboards whose saved text
contained `Care` were renamed, saved individually, and read back against
their previous text with only the skill name substituted. The Skills Badge
Tracker description was likewise saved and read back. All 60 Skills Lab
Button actors were inspected: their `interaction Text` defaults had been
empty, so each was set to its corresponding Verse prompt (15 controls in
each of four stations), saved, and read back. No actor was renamed or moved.

The label inventory now includes these 60 Button defaults; it has 1,232
rows and no remaining `Care` player-facing text. Two `Care` mentions remain
only in comments in `fn_shoreline_island_nursery_fixtures.verse`. This is a
source/editor readback, not a runtime test. Player-facing readability,
challenge execution, reset behavior, and solo/multiplayer isolation remain
open while the owner has asked to skip playtesting and project validation.
