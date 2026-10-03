# Teach Pix a Route — implementation plan, revision 1

## Measured site and chosen geometry

Current level verified live as `/fn_shoreline_island/fn_shoreline_island`. The new Hangar root identity/transform and attached shell inventory are inherited with provenance from feature 035; no old A-frame site is reused. Fresh 036 evidence contains 35 floor traces and 18 corridor traces at three heights. All floor traces hit Z=2314 cm; all route rays were clear. Bounds query over the playground returned world/aggregate bounds only, no local furnishing. Rays are samples, not swept character proof.

Map origin (5400,-14400,2314) cm, unrotated XYZ meters. Entry envelope X5400..6400, Y-14400..-12800; playground X6400..8200, Y-14400..-12800 (18 x 16 m). All are annotations, not new walls. West route center Y=-13600, width 3 m. Preserve nearby toolbox east of X8285 and stairs north of Y-12763; new mounts stay inside playground and do not move them.

| Element | World XY cm / extent | Function |
|---|---|---|
| Home pad | (6650,-13600), 2 m diameter | Start of recorded path and Pix home |
| Load pad | (7950,-13600), 2 m diameter | Stop recording; endpoint for both deliveries |
| First practice strip | X6400..8200, Y-13900..-13300 | Six-meter physical width; actual center samples remain 0.75 m inside edges |
| Safety closure | X7150..7450, Y-13900..-13300 | 3 x 6 m striped hologram, appears after delivery 1 |
| Lower bypass example | home → (6650,-14150) → (7950,-14150) → load | Five-meter physical corridor south of closure; not a forced route |
| Upper bypass example | home → (6650,-13050) → (7950,-13050) → load | Five-meter physical corridor north of closure; equally valid |
| Home control | (6500,-13700), interaction height 1 m | Show Route / Show Again / Show New Route |
| Test control | (8050,-13700), interaction height 1 m | Try My Route / Try Old Route / Replay |
| Cancel control | (6500,-13950), interaction height 1 m | Owner releases/reset; route west stays open |
| Main board | (6800,-12900), center 2.8 m | Brief instructions/state and recap |
| Delivery lights | (7700,-12900), (7950,-12900), height 2 m | Delivery count, not route checkpoints |

Player center samples use floor rectangle inset 0.75 m for the combined robot/crate envelope; closure expands by the same 0.75 m for segment checks. Robot/crate horizontal shape together fits inside a 1.2 m diameter circle at every yaw, with 0.15 m extra radial clearance. Thus bypass center space remains 3.5 m wide. First recording restricts centers to Y-13825..-13375; closure crosses every continuous initial home-to-load path. This restriction is an explicit visual training-strip rule, not an arbitrary preferred path. Bypass floor outlines are dim before the closure and become bright after it; first-phase HUD says “Stay in the bright practice strip.”

Direct route is 13 m; a rectangular bypass example is about 24 m. No per-delivery movement score. Player returns to home by either safe side to revise, roughly 24 m. Routes may be indirect up to 60 m. Watch positions are anywhere outside the robot footprint; robot, crate and hologram are non-colliding so no escort obstruction or trapped player occurs.

## Runtime feasibility and bounded recorder

Required new controller: `fn_shoreline_island_route_demonstration`. No existing recorder is claimed. Reuse supported character GetTransform/IsOnGround, creative_prop TeleportTo/GetTransform, arrays and generation ownership patterns. Existing Workshop carries paired props; Rescue's `rescue_travel` performs 0.05 s synchronous steps and verifies real robot/crate endpoints. Local Fortnite digest confirms these APIs. This is deterministic prop animation and mathematical floor validation, not navigation, live physics avoidance, arbitrary terrain following or machine learning.

Sample owner at 10 Hz while grounded. Retain a point when moved at least 0.5 m from the last saved point or heading changes by at least 20 degrees after 0.1 m travel. Never append duplicates for stationary pauses. Validate every observed sample and the segment from the previous observation, not only retained points. Keep a maximum of 128 retained points and accumulated observed travel 60 m. Reject transform displacement >1.5 m between 0.1 s observations (warp/lag/teleport), rather than bridging it. No clamping out-of-bounds points back onto the floor. Use floor Z for stored waypoints; grounded state prevents recording jumps. If timing stalls, reject/retry rather than inferring an unobserved shortcut.

The retained polyline is an approximation of observed motion, not an exact foot trajectory: corners can differ by up to the 0.5 m spacing. Validate each retained chord before display/use as well. The first point is home center; connect from owner within the 1 m home pad only after validation. When owner enters the 1 m load pad, append the actual endpoint and a <=1 m connector to load center if valid. These two explicit connectors are the only snapping. At limit or unsafe observation, stop with visible last-safe footprint and reason; require re-demonstration from Home, preserving earned delivery 1.

Route memory is one point array plus a preserved first-route array until the old-route test has occurred, maximum 256 vector values total. Render current demonstration with a fixed pool of 128 footprint-pair creative props, each <=0.4 m long, flat and non-colliding; unused props hidden. Each prop may contain two simple foot-shaped/elliptical mesh components. Point index and highlighted next/current footprint make overlaps/backtracking understandable. No per-frame prop spawning, external asset downloads or unbounded actor creation. Use existing project cyan/amber materials and dark outline; do not rely on color alone. Invalid mark shows X; active playback mark shows an arrow/cursor.

## Playback, safety and real success

Stored segments run at 200 cm/s, 10 cm per 0.05 s frame. At a corner pause 0.2 s and interpolate shortest-angle yaw across four 0.05 s frames in place; do not smooth position around the corner. Robot pivot and carried-crate offset are derived from measured prop bounds and captured home transforms. Keep crate above robot within the combined 1.2 m footprint, not trailing outside the validated radius.

For the initial phase, segment endpoints in the convex inset strip imply the whole segment is inside it. For revised playback, require endpoints inside the inset playground and perform a segment/AABB intersection test against the inflated closure. Include grazing boundaries as unsafe. Do the same check per recording observation and for every retained chord. No reliance on decorative collision. Before each segment, find the first boundary entry along it; stop 0.1 m before that point (or at previous safe point if already adjacent), highlight the affected stored segment and keep carrying. Thus an old route stops visibly near the closure rather than at Home. Code/data arithmetic must be independently tested offline after implementation against crossing, grazing, vertical/horizontal and degenerate segments, then cooked spatial checks.

Use synchronous per-frame TeleportTo and generation checks for both props; do not launch uncancellable MoveTo coroutines. Check each move result and each endpoint readback within 5 cm. A failed move/readback stops with a specific retry message. A single tick that moves one prop but fails the other must not credit or resume blindly. Reset invalidates generation first, waits for the old loop to observe it, then restores both home transforms and clears visuals.

Final success requires current generation/owner/state, entire validated path, robot XY within 5 cm of load center, carried crate at its expected transform within 5 cm, and the same dedicated crate instance. Deposit crate onto the loading pad, read back deposit position within 5 cm and expected floor-relative height, then light the delivery indicator. Preserve delivery 1 during old-route test and revision. Reset props home with a visible “New delivery” cue after first success (one-second hold, reset via captured transforms); do not imply autonomous return navigation.

## Reuse, assets and lifecycle

Reuse the corridor pattern for walkable floor flow only. Checkpoint contract is contract_only and not used: there is no respawn checkpoint. No shipped pattern supports demonstration recording. The new bounded adapter and its acceptance checks are explicitly in this approval scope; corridor reuse is not runtime capability proof. v1 map shows the linear teaching lifecycle in one playground and markers for two example bypasses. It does not encode branching missions or claim those examples are the recorded routes.

Create dedicated `hangar_route_` devices: one controller; new robot creative_prop using the existing `prompt_workshop_pix` visual recipe (live actor found), scaled to the combined footprint cap; new cube crate with existing project materials; home/load pad props; three controls and three label boards; main board and owner HUD; two indicator lights; fixed 128 footprint props; closure stripe/base and two posts; floor outline pieces. Primitive-component composite props follow existing Workshop visual construction. Exact mesh/material references and native full transforms must be discovered/read back; no current Pix, crate, control or mission actor is reassigned. Existing shared round settings is a read-only event dependency, no new instance. No Data Blaster target/gameplay wiring is used.

States: Idle → RecordingFirst → ReadyFirst → PlayingFirst → DeliveryOne/ClosureShown → PlayingOld → Blocked → RecordingRevision → ReadyRevision → PlayingRevision → Complete. Invalid recordings go to retry state; invalid playbacks preserve applicable delivery progress. State names are implementation guidance, not extra UI. Test button never chooses a route. Home control starts/replaces the demonstration; Test uses exactly the stored data; Cancel releases. During active play only the owner and original active character are eligible. Departure from full activity bounds X5400..8200,Y-14400..-12800 releases; roaming inside the hangar but outside this envelope also releases with the cancellation message. Rerecord only begins at Home. Round/respawn/disconnect and Replay clear all state; no Academy progress calls.

## Delivery gates

Human approval of this bundle precedes new source or scene edits. Record actual approval and digest, then `plan --ready`. Save checkpoint and inspect current geometry again. Implement bounded recorder/geometry/playback in focused source; meaningful arithmetic/unit tests are warranted for segment safety and limits. Build Verse; incrementally place dedicated props/devices, read back counts/transforms/bindings and save. Validate/cook and independent AC-01..11 playtests on final production revision. Changes that remove physical demonstration, move the shell, reduce both-route validity or introduce navigation assumptions return to planning. Stop game, verify state and leave editor open.
