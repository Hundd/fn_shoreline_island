# Four lighthouse harbors: editor evidence

- Date: 2026-09-12. Map `/fn_shoreline_island/fn_shoreline_island`.
- Source remains the station/fixtures/progress revisions in the [solo record](solo-2026-09-12.md).
- After the first harbor's three-queue review, duplicated its 35 owned actors
  three times through UEFN. No binary assets were hand-edited.
- Saved all 105 new actors. Station IDs are 0, 1, 2, 3; centers are
  X=-3200, -6000, -8800, -11600. Floors meet at their X edges, with the same Y
  approach and Z=2400 walking surface. One shared progress device, Signal tracker,
  hub connector and route sign remain.
- PASS: final readback found 140 unique station actor references; each station's
  23 native bindings point to its own controls/boat/boards/docks or the intended
  shared hub destination/spawners. Shared progress and all four IDs matched.
- PASS: full location, rotation and scale readback matched the planned original
  transforms plus each harbor's westward offset, within 0.01 per component.
- The final audit re-read Harbor 1 too, confirming duplication did not replace
  its native references with another harbor's objects.
- Exact actor references, bindings and transforms: [readback JSON](four-harbors-2026-09-12.json).

## Focused solo runtime review

- Date: 2026-09-12; one player; fresh full launch after duplication. Same Verse
  revisions as the linked solo record; journal revision recorded in
  [journal evidence](../../003-living-academy/evidence/journal-signal-2026-09-12.md).
- PASS: walked from the hub through Harbors 1, 2, 3 and 4, crossing all three
  floor joins without jumping, falling or losing health. Claimed each in order;
  each board changed from its harbor availability text to the requesting pilot
  and current queue. Captures: `harbor1-claimed-003.png`,
  `harbor2-claimed-003.png`, `harbor3-claimed-003.png`,
  `harbor4-transferred-003.png` in this evidence directory.
- PASS: Harbor 3 LEAF delivery to Garden visibly moved its local boat toward
  the Garden dock. The settled result displayed `LEAF delivered to Garden`,
  `Boat 2/2`, and `CARGO: PLAIN`. Captures:
  `harbor3-leaf-delivery-004.png` and `harbor3-leaf-delivery-014.png`.
- PASS: after that delivery, walked to Harbor 4 and claimed it. Expected and
  actual: Challenge 1 resumes at Boat 2/2, preserving the first delivery.
  Before/after captures: `harbor4-claim-ready-002.png` and
  `harbor4-transferred-003.png`.
- Presentation findings remain: large plain boards, text-only cargo labels,
  and the Loop tracker occupying the HUD while visiting Signal. Health stayed
  100 and Loop remained 0/1. This run does not verify an earned Signal count.
- Remaining: other copied-station motions, earned journal and badge retention,
  rapid input/lifecycle, multiplayer isolation, symbols/presentation, standalone
  project validation and memory. Full tasks remain unchecked.
- Closed Fortnite after this run; process absence and MCP `Disconnected`
  confirmed.
