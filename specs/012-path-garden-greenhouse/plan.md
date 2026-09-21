# Plan

- Status: Structure built and saved; client traversal, explicit validation, and memory checks pending.

## Existing layout

The saved `campus_path_greenhouse` actor currently spans approximately world X 520..3300, Y 400..2600, Z 2272..4385. The hub Garden walkway lies around X -800..1700, Y 1350..1650. Four Garden Repair support kits extend east to about X 11500. The campus audit records a 700 cm wide Garden branch at Y 1150..1850 and earlier frame/planter interference there. These are planning bounds, not final construction dimensions; inspect the actual path, station controls, and far-end turnaround in UEFN before placing pieces.

## Build sequence

1. Survey the complete Garden walking route in the live editor. Mark the west entrance, farthest usable station, return turn, roof span, and clearance envelopes around boards, buttons, signs, and planters. Capture a top view and walking-height views. Resolve whether the roof should start at the current arch or at the hub-side path junction; include the whole Garden passage while keeping the promenade outside the room.
2. Keep the existing greenhouse entrance, side plaque, and planters. Extend its repeated frame and ridge rhythm eastward in modular bays until the last station and exit/turnaround are under one continuous silhouette. Put columns outside the walking strip and outside control interaction areas. Use crossbeams high enough for normal third-person camera movement.
3. Add a light roof with transparent-looking or open glazed panels and regular ventilation gaps, plus low planted side edges. Repeat a small native or already approved material/mesh kit. Avoid a heavy opaque ceiling that darkens the puzzle boards. Ground each post visibly and keep station fronts open.
4. Inspect the completed structure from the hub approach, each station, both path edges, and the far end. Adjust any occluding roof rib, post, leaf, or panel before saving. Preserve the existing Path Garden signage and all gameplay actors.
5. Save affected actors in UEFN, run Project > Validate Project and memory calculation, then launch a fresh session. Walk both directions, test all four stations and a complete puzzle/retry/return flow. Record screenshots, validation, memory, cook, and client findings in this feature's evidence folder. Stop the game/session and verify it is no longer running.

## Placement guardrails

- Treat the recorded 700 cm branch as the minimum unobstructed walking lane at the entrance. Existing frame posts were previously moved outside Y 1150..1850; do not repeat that collision.
- Preserve the 1100 cm planter gap and 1300 cm arch opening recorded in Feature 011. Measure station aisle clearances in editor and client before choosing the new bay width.
- Build roof and sides around station access. Do not use a continuous wall across the south-facing Garden Repair controls or the hub-side entrance.
- Use separate, descriptively named greenhouse extension actor(s) so the new work can be inspected and adjusted without disturbing the existing entrance actor.

## Dependencies and evidence

Feature 011's Garden entrance and station-support work remains in progress. Coordinate with its open route and station checks; this feature adds the full greenhouse envelope and its own acceptance evidence. The fresh session cook is recorded below; physical player tests and explicit project validation are still pending.

## Implementation checkpoint — 2026-09-21

The saved extension uses the planned open-roof variant: repeated sage posts and pitched rafters, a continuous ridge and eaves, narrow cream roof slats that retain daylight, and spaced low side planters. It overlaps the original entrance frame and reaches the last Repair bay. Editor inspection and three aisle traces were clear, and a fresh session cooked successfully. See `evidence/build-2026-09-21.md`. Physical player and control tests, explicit Project > Validate Project, and memory calculation remain required before final acceptance.
