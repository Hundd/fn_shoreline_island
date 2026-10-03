# Implementation plan — revision 1

## Evidence and placement

Live native MCP on 2026-10-03 confirmed `/fn_shoreline_island/fn_shoreline_island`, game `Unconnected`. The new `Hangar` FortPlaysetRoot is at (6144,-14336,2304) cm, yaw -100 degrees, scale (2,2,2); 116 attached actors were returned. It is distinct from the old `campus_bot_aframe_hangar`. See existing `evidence/live-inspection.json` and refreshed `evidence/planning-measurements.md`.

Map frame: world origin (5400,-14300,2314) cm, unrotated XYZ meters. This is an axis-aligned gameplay envelope inside the rotated prefab, not a proposed shell replacement. Arrival: 10 x 14 m; play bay: 18 x 14 m. Stance at (7500,-13900,2314); target centers (6900,-13100,2484), (7400,-13100,2484), (7900,-13100,2484). Targets face the player toward -Y. Code board center (7400,-12900,2734); Start/Replay at (6700,-13700,2414), Cancel (6700,-14000,2414). Beacons at X=7050,7400,7750; Y=-12900; Z=2514. These anchors are fixed design decisions; pivots/full actor transforms are resolved from measured mesh bounds, with 0.25 m position tolerance.

An existing toolbox begins at X=8285,Y=-13281; the eastmost hit face ends at X=7975, leaving over 3 m to the toolbox. No target assembly extends beyond X=8050. The stairs begin near X=8012,Y=-12763, outside the bay's Y maximum -12900. Keep effects non-colliding and do not place props in the route. Suggested start-to-stance movement is under 10 m; no movement is required between codes. West arrival to stance is about 24 m. Retain the rest of the large hangar as atmosphere/exploration.

## Reuse and explicitly required code

Reuse `shooting_gallery` for the three noncombat targets and `corridor` for walk-in/out. Do not claim the fixed Prompt target_sequence adapter or current pattern_line can execute this design. `fn_shoreline_island_pattern_line` has useful ownership, bounds, generation, quiet-input and light APIs, but hardcodes three single-answer rounds and Pattern Badge calls. It cannot simply be duplicated/configured for ordered codes.

After human approval, add one focused `fn_shoreline_island_launch_sequence` device, with editable targets, code board, HUD, Start/Replay, Cancel, three lights, completion VFX, optional audio and round settings. Implement the specified fixed three-code data plus reusable index/slot sequence evaluation; expose code arrays only if Verse editable structs are supported by live schema. A hardcoded reviewed code table is acceptable; do not build an arbitrary YAML interpreter. Existing shared target code remains unchanged unless a narrow compatibility fix is proven necessary and documented.

States: Idle → Active(code,slot) → one-second code confirmation → next Active → Complete. Start claims an active character; bounds monitor and disconnect events release it. Owner-only Replay and Cancel. Target Hit carries the actual agent. Use target.accept(agent,false) / reject(agent), keep targets visually stable, and keep each target's inactive hit surface parked through existing deactivate(). Correct/wrong transitions take the input lock, retain hit observation, and arm only after 0.5 s quiet. Reset cancels generation, hides personal feedback, disables targets, ends VFX and turns lights off. Completed beacons persist on a wrong-code reset but not a full reset. No progress-manager subscriptions or reward calls.

## Scene delta

Create a dedicated `hangar_launch_` actor group: one controller; three full data_target assemblies with damage-only trigger surfaces, ring meshes, label billboards and their existing required VFX/audio/hidden objective references; one code billboard, one HUD, two buttons with two instruction labels, three customizable lights and one final burst. Match existing target assembly bindings, then assign unique refs and `reward_value=0`, `objective=false`, `stationary_y_facing=true`, `stationary_positive_y=false`. Each assembly uses a 1.5 m wide visual ring and aligned 1.5 m square face, shallow depth. Target labels use A-circle/B-triangle/C-square, offset below rings. Reuse available project ring materials, existing native device assets and primitive mounts; no downloads needed. Discover and bind shared Data Blaster/round settings without altering them. Resolve all required target reference fields explicitly; do not use unconfigured defaults.

Do not move, delete or rename any current actor. Do not duplicate shared blaster, item granter, spawners, round settings or Academy progress devices. Existing blaster actor was found live; its source equips on spawn/join and makes characters invulnerable. Target blueprint paths and native properties must be discovered/read back during implementation, not guessed from this intent document.

## Serialized delivery and checks

1. Human reviews this bundle; record actual approval and digest only then. Run `plan --ready`.
2. Inspect/save checkpoint; export current hangar identities and device dependencies. Recheck anchor clearances and ground heights before additions.
3. Implement controller, build Verse, discover live class/settings schemas. Place dedicated devices in small serialized groups and read back counts, full transforms, properties and bindings. Align visuals/hit faces; save.
4. Run UEFN validation, cook, independent solo and two-player AC-01..10 playtests. Verify unchanged adjacent activity and shared grant. Record first-run duration and hint readability. A failed walkability/aim check is a defect, not permission to move the user's shell.
5. Stop game/session, verify not Running, leave editor open. Mark tasks only against evidence. Material design changes require new review.
