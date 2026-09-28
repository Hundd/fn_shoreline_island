# Active-target center-ray clearance

This is a post-move geometric check, not a cooked hit test. The common firing XY is world (8400,-3900)cm from the approved map. The nine actual saved hit-surface locations are in move-group-0-2.json, move-group-3-5.json and move-group-6-8.json. Content/fn_shoreline_island_prompt_blaster.verse activates stages {0,1,2}, {3}, {1,4,5}, {5}, and {6,7,8}. For each multi-target stage, project each other active center onto the segment from the firing point to the aimed center; compute its perpendicular XY distance if that projection lies between endpoints.

| Active stage | Closest other active center to an aimed center ray | XY clearance |
|---|---|---:|
| BLUE/RED/GREEN {0,1,2} | GREEN relative to BLUE or RED ray | 424.3cm |
| RED/SMALL BLUE/LARGE BLUE {1,4,5} | RED relative to SMALL BLUE ray | 461.0cm |
| REACTOR/SCANNER/STORAGE {6,7,8} | SCANNER relative to REACTOR ray | 563.9cm |

All are greater than the approximately224cm half-width of the surveyed, rotated hit-surface convex hull in offset-correction.md. The recorded ring's maximum pulse diameter is296.8cm; the collision hull is wider than the visual ring. This supports no *active target-surface* center-ray obstruction from the approved common firing XY. Inactive surfaces are parked below the arena by existing Verse behavior. The calculation does not prove that scenery, props, VFX, labels or a player's actual muzzle position are clear, nor does it establish peripheral shots or readability. Cooked solo evidence in stationary-solo-acceptance.md proves several intended shots from a stationary position but not every ray at a centimeter-exact point.
