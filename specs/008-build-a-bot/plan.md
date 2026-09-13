# Build-a-Bot Implementation Plan

- Status: In progress; first station saved and core missions tested solo
- Specification: [spec.md](spec.md)

## Approach

Implement only after the individual concept zones have passed their gameplay checks. Use a focused capstone device with authored command slots, per-player stage state, and owned preview props. Define concrete starting states, command choices, and success predicates for each mission stage before coding. Celebrate personal completion with targeted messaging and a station animation, avoiding a global progression change.

## Exact mission fixtures

All stages start at a labeled Home cell 0. Forward cells 1, 2 and 3 are spaced
240 units apart. A run starts from a fresh preview; it never accumulates a
previous failed attempt. Show the current command, repeat iteration, position,
inventory and energy during execution. Stop at the first invalid action and
keep its explanation visible until the next edit/run. No input is timed.

1. **Seed delivery:** seed at Home, planter at cell 3. Three editable slots
   independently cycle Pickup, Repeat Move, Drop. Repeat count cycles 1–4.
   Starting program is Move / Pickup / Drop, count 2. Repeat Move expands to
   that many individual forward moves. Pickup works only at Home with an empty
   hand; Drop requires a carried seed and the planter cell. Leaving cells 0–3
   stops safely. Solution: Pickup / Repeat Move / Drop, count 3. Completion
   requires the seed delivered and robot at cell 3.
2. **Dock lighting:** three lamps at cells 1–3, all OFF; robot at Home. Two
   editable slots cycle Move and Light, repeated 1–4 times. Starting order is
   Light / Move, count 2, energy 0. Initial energy cycles 0–6. Move advances one
   cell without spending energy. Light requires an unlit lamp at the current
   cell and spends one energy. A repeated Light at an already lit lamp, Light
   at Home, empty energy or movement beyond cell 3 stops safely. Solution:
   Repeat 3 [Move, Light], energy 3. All three lamps must be ON, robot at cell 3,
   and energy exactly 0. Excess energy is explained as an unmet final goal.
3. **Parcel route:** select leaf or plain cargo; fire the Launch event. Its
   connection cycles Disconnected / Dispatch. The routing choice cycles
   All Garden / All Storage / If leaf: Garden; else: Storage / Reversed.
   Start disconnected, All Garden, leaf selected. Disconnected Launch moves
   nothing and explains the missing connection. Dispatch visibly moves the
   selected parcel to the chosen destination. Only leaf→Garden and
   plain→Storage pass. Require both tests against the same connection/rule;
   editing either clears both test flags, while changing test cargo preserves
   them. Solution: connect Launch→Dispatch, select If leaf→Garden else→Storage,
   launch once for each cargo type. The condition is evaluated when Launch fires.

The interpreter returns successful execution frames and the first failure;
the station animates these frames instead of maintaining a second gameplay
simulation. Command identifiers, target positions and error reasons live in
`fn_shoreline_island_bot_fixtures.verse`. Per-player stage/program/test flags,
completed stages and the single Bot award live in a shared progress device.
Replay resets the current attempt and hints, retaining completed stages and
prior badges. Next requires a solved attempt; after stage 3 it starts stage 1
again. Departure/respawn cancels only preview execution and releases ownership.
Each station owns its response props. The finale uses targeted text and a
station-local robot celebration; no global completed scenery changes.

## First station layout

Build and test Station 1 before copying. Center (-3500,-14000,2450), floor
center (-3500,-13450,2325), scale (34,37,1.5): its north edge meets Event
Factory at Y=-11600 and its top is Z=2400. Four later centers are spaced 3400
units apart along negative X. Fourteen controls sit at Y=-14100, X=center+1170
minus 180 per control, inside the 1500-unit ownership radius. Order: Claim,
command 1/2/3, Repeat, Energy, Connection, Rule, Cargo, Run, Help, Next, Replay,
Hub. Robot Home is (center+500,-13300,2460); the three cells extend toward
negative X in 240-unit steps. Lamps and the planter sit 180 units north of
their corresponding cells. Parcel Home is (center,-12800,2450), with Garden
and Storage destinations 480 units north and ±480 units X. Put the three
instruction/status boards along Y=-12050, above the execution props, and
test them from the control row before extending the layout.

## Delivery and verification

Before wiring animation, compile the execution model. Verify the authored
solutions, wrong order, counts 1/2/4, missing pickup, invalid drop, empty/extra
energy, repeated lamp commands and all four rules against both cargo types.
Live acceptance additionally requires seeing every frame, targeted failures,
hints, replay and stage preservation. Source/model checks cannot close tasks.

Implement this zone after the preceding zone's graybox and gameplay review.
Use the existing map, named routes, and one responsibility per Verse class.
Save before and after editor changes. Verify device references by readback.
Run every acceptance scenario in a launched session, including wrong inputs,
rapid presses, hints, repeat completion, departure during execution, respawn,
join-in-progress, and round restart. Recheck hub spawn and the existing garden.
Record actual multiplayer evidence separately from code inspection. Run project
validation and memory calculation; capture the visible zone and completion.

## First playtest findings

See [2026-09-12 evidence](evidence/implementation-2026-09-12.md). The saved first
station has 48 actors and 31 audited native references. The three Verse files
compile and all three core missions passed solo. Before copying the station,
restore reliable static control/cell/destination labels, separate the delivered
seed from lamp 3, improve the robot Home sightline from Run, and remove the
stale instruction to test the other cargo after both tests have passed.

The presentation correction will bind all 20 existing control/cell/destination
billboards to the station and explicitly set localized text and ShowText at
startup, after a player joins, and on Claim. This is a scoped Bot fix; other
zones' fresh-load reliability remains open. Show only the current stage's seed,
lamps or parcel, keeping the robot visible. Put the delivered seed 300 units
north of cell 3 to separate its target from lamp 3. Restore the saved route
result on Claim and show a final route message when both cargo tests pass.
Verify these changes in a fresh session before closing presentation tasks.

For the next readability pass, shift robot Home, seed, lamps and all four cell
labels 450 units toward negative X so the full path fits the Run sightline.
Enlarge the six location labels from scale 0.38 to 0.6, use text size 24 and
short two-line Home/planter captions. Use dark text with transparent backgrounds
to avoid opaque signs hiding props. Show cell labels only during Seed/Dock and
destination labels only during Parcel. Lower the two upper boards 110 units
and bring their X positions to -3150/-4150, then recheck the control row.

The retest passed cell readability and full path visibility from Run, all three
correct missions, Parcel Replay, Hub, and journal Bot 1/1 after reopening.
It found the lowered mission board covering the execution board's first line.
Lower the execution board from Z=2530 to Z=2440 to separate their vertical
bounds; enlarge just Garden/Storage to scale 1.2 because they are farther away.
These follow-up transforms require a new visual retest. The robot can still
partially obscure the delivered Garden parcel from Run; resolve before final
presentation acceptance. Full four-station and lifecycle work remains open.

During Parcel, park the robot 1000 units north of its Seed/Dock Home, behind
the parcel destinations. Use this same parked pose for reset, reclaim and the
final celebration so the robot does not cover the Garden delivery from Run.
Once that focused view is checked, build three additional complete stations
at offsets X=-3400/-6800/-10200 from Station 1, with IDs 1/2/3 and independent
controls/boards/props/feedback. Keep the progress device, badge, journal, round
settings, spawners and Hub destination shared. Audit every copied native binding
and transform; solo claims/transfer cannot close multiplayer acceptance.

The fresh parking retest passed both Parcel deliveries, the finale, parked
Replay, destination size and board separation in tested views. Three additional
stations are now saved with all 138 added actor transforms, 147 native references,
and shared progress/unique IDs audited. The four-station build is clean. Live
claims, lateral access, transferred work, hints and copied-prop motion are next;
multiplayer and lifecycle checks remain separate pending acceptance.
