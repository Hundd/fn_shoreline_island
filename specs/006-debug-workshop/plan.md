# Debug Workshop Implementation Plan

- Status: Approved
- Specification: [spec.md](spec.md)

## Approach

Reuse the visual language of the robot tiles and cargo docks. Supply small authored programs with editable choices, not unrestricted source text. Keep expected outcomes visible during execution. Separate program execution and result comparison so wrong edits produce understandable demonstrations. Specify concrete programs and their valid repairs in this plan before coding.

## Delivery and verification

## Authored fixtures and implementation choices

- Challenge 1: start at tile 0; expected tile 3. Supplied program is
  `East; [West]; East`. Only the bracketed second instruction is editable,
  cycling West, Wait, East. Outcomes are tiles 1, 2, 3 respectively.
- Challenge 2: start at tile 0; expected tile 3. Supplied program is
  `Repeat [2]: East`. Only the count is editable, cycling 2, 3, 4, 1.
  Outcomes are the selected tile counts; exactly 3 succeeds.
- Challenge 3: fixed queue LEAF, PLAIN; expected Garden, Storage. Supplied rule
  is `[If LEAF: Storage; otherwise: Garden]`. The only edit toggles this rule
  with `If LEAF: Garden; otherwise: Storage`. Execute both deliveries before
  comparison; reversed rule yields Storage, Garden and fails safely.

Each supplied fixture has exactly one faulty instruction. Every Run resets the
marker and actual-result display. Show the supplied/current program and bracket
the editable instruction; keep expected results visible throughout. Step a
movable marker along labeled tiles for the first two challenges, then move it
to labeled Garden/Storage destinations for both cargo items. Current cargo and
instruction remain text-labeled during movement. A comparison board records
the actual tile or both actual destinations. Never award from an edit alone.

Use fixtures, personal progress and station classes. Seven controls are Claim,
Edit instruction, Run, Help, Next, Replay and Hub. Guard simultaneous execution;
Replay, departure, respawn and round change cancel using generation tokens.
Preserve completed flags and earned badge when replaying. Each owned station
has its own marker and boards, with shared per-player round progress.
Start with station one, then extend to four after its wrong/correct runs pass.
Place its center at X=-3200, Y=-6400, Z=2450 with a floor and a connected route
from Variable Vault. Keep all controls inside the station's 1400-unit release
radius. Journal Debug occupies later_badge_trackers index 2 after Energy.

Before accepting AC-001/002, run each unedited program, every alternative edit,
then its correction. Check expected/actual text, visible instruction/movement,
Help levels, Next guard, Replay, exact badge count and Hub return. Additional
stations, lifecycle, muted-audio walking route and multiplayer remain separate
acceptance work. Do not infer those results from compilation.

First solo run: all supplied faults and their repairs produced the authored
results and the badge recap. Presentation failed at Edit because the minimap
covered the program board; longer cargo text also clipped. Move the program
board toward the center, lower both high boards below the HUD, use text size
10 on program/results, and compact the cargo comparison into an explicitly
ordered LEAF/PLAIN pair. Raise destination labels clear of the moving marker.
Retest these changes before accepting readability. Reclaiming a solved station
must reconstruct the solved marker/result display; it must not show tile 0
alongside a solved message. This preserves intended completed-work behavior.

The next solo retest passed solved-state reconstruction and compact cargo text,
but the raised Garden destination label covered the instruction board. Lower
both destination labels to Z=2420 and offset each 150 units in +X beside its
destination, leaving the moving marker clear. Retest at every control.
The narrow north connector was walkable, but crossing elsewhere fell into the
400-unit seam. Extend the workshop floor north to Y=-4100 (center Y=-5950,
scale Y=37), retaining its south edge Y=-7800 and top Z=2400. The existing
connector may overlap this continuous floor. Verify walking access after save.

Four-station implementation: retain station 1 at X=-3200 and place stations
2-4 at X=-6000, -8800, -11600, all with controller Y=-6400, Z=2450.
Copy current saved transforms and presentation properties, offset only X by
2800 per station. Each added station owns its controller, seven buttons,
feedback, three boards, seven control labels, five tile labels, two destination
labels, movable marker and floor (28 actors). Share the existing progress,
badge, hub destination and spawners; unique station IDs are 1-3. Floors meet
their neighbors and the corresponding Vault floors at Y=-4100. Keep the
existing shared route sign and connector. Audit all 84 new actors and 51
native references plus three progress/ID pairs, then launch and verify access,
transfer and marker motion. Multiplayer independence needs separate evidence.

Implement this zone after the preceding zone's graybox and gameplay review.
Use the existing map, named routes, and one responsibility per Verse class.
Save before and after editor changes. Verify device references by readback.
Run every acceptance scenario in a launched session, including wrong inputs,
rapid presses, hints, repeat completion, departure during execution, respawn,
join-in-progress, and round restart. Recheck hub spawn and the existing garden.
Record actual multiplayer evidence separately from code inspection. Run project
validation and memory calculation; capture the visible zone and completion.
