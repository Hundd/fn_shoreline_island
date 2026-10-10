# Implementation plan

WITHDRAWN FROM APPROVAL REVIEW, 2026-10-09. Do not implement the row relocation, retirement ledger or broad lifecycle changes below. Independent Producer review recommends diagnosing the start failure and repairing only confirmed target/visibility problems while preserving the existing layout, timings and mission. This historical draft must be replaced by a smaller measured delta before approval; see [Producer brief](../../docs/producer/prompt-lab-focused-improvement.md).

Planning only. Reuse target_sequence, knowledge_room, corridor and reward_room. The generated implementation.yaml is an intent plan; implementation must resolve native wrappers and complete transforms before each mutation.

## Coordinates and scene delta

Local XYZ metres, origin world [6000,-8500,2410]cm. Floor and west ramp remain. Firing rectangle X14..20,Y27..33, floorZ0; face east (+X). Add a noncolliding thin outline and short SHOOT FROM HERE label using existing project-owned geometry/materials. This is guidance, not a restrictive invisible player boundary. Every active answer must be visible from the entire rectangle. Targets can be approached safely, but the marked area is the designed view for all choices together.

All nine hit anchors move to X50,Z2.2. Ordered Y values by target ID: [12,24,36,54,42,48,6,18,30]. Preserve existing complete hit-surface rotation/scale until coverage readback; do not use transform partials. Move owned rings, cones, labels and optional VFX with their corresponding anchors. Labels face west; stationary clearance uses the existing target settings. No added targets or extra weapon dispenser.

Recenter BLUE, RED, GREEN, SMALL BLUE and LARGE BLUE visual bounds on their own hit anchors (X50.3, sameY, Z2.2; preserve native pivots and relative small/large sizes using measured bounds). The visual geometry must not protrude into the player side of the trigger. Move REACTOR, SCANNER and STORAGE machine centers to X53 at their targetY; retain their surveyed floor-relative Z. Move their subordinate lens/floor VFX with those machines. Put the existing instruction board at [52,30,6.5], yaw180, retain scale3 initially; cooked readable fit is required. Preserve finale door, wall, module and optional return rail; reactor_home and large_home must be captured after placement so delivery follows the revised layout.

Reuse entry volume at native actor world[9300,-5400,2360]cm (50cm below floor), full transform rotation0, scale1. Proposed native zoneWidth13, zoneDepth13, zoneHeight3; no weapon restriction, all teams/classes, Gameplay Only. Its actual runtime overlap must include the whole platform plus a small edge margin without enrolling Prompt Workshop or the hub. The planned 13x13 tile box is66.56m square, versus floor66x62. Confirm actual native FNE volume bounds in cook; do not derive them from visual actor bounds or the zero-extents editor BoundingBoxComponent. Arrival must trigger while grounded.

Move existing Replay button to local[12,30,0.9], rotation yaw180, scale1; native max interaction distance2m, no hold, unlimited triggers. Idle label Start mission; live label Restart mission; complete label Play again. Preserve its controller binding. This is one control with an explicit reset action, not a second controller.

Retire the following exact passive objects from the shooting presentation by native bHidden and mesh NoCollision, after confirming no foreign ownership: blue/red/green pedestals; blue/red/green selector pads; reactor/research/storage selector pads; send pad; final_green/final_cell/final_generator pads; prompt_console_base; old green_core, green_delivery_cell; blue_bolt_lower/middle/upper; red_heat_flame; green_leaf_left/right/stem. All labels carry prefix prompt_lab_. These are decorative remnants of old button/platform tasks. Do not delete their actors. Keep other old device actors disabled under existing use_blaster_mode; no new deletion of buttons, rails, cube devices, target-step assemblies, route floors or outside campus assets. Resolve exact refs from live-survey.json. If an object is referenced by current active gameplay or a different feature, preserve it and return the conflict to planning.

## Code changes, inside existing controller

1. Wait boundedly for all nine existing target startup_ready handshakes and validate required references before enrolling; never enter an intro that cannot activate targets. Surface a readable not-ready message and a useful log on missing setup. Startup readiness checks must recover automatically once valid, without hidden player movement.
2. Centralize enrollment/current-instruction display. Use automatic grounded room entry plus occupant reconciliation after initialization and readiness/respawn. Repeated overlap callbacks are idempotent. Show current state to late arrivals. Existing entry_zone remains the sole occupancy boundary; enlarged to full platform.
3. Keep actual room departure removal/reset, but never clear a live occupant merely for crossing the old interior boundary. Restart increments generation/cancels work, then reenrolls current occupants, not only the pressing player. End-of-round and player removal retain cleanup. Shared restart affects the shared room and is labelled accordingly.
4. Keep fixed five hits and target IDs. Shorten welcome/knowledge to1+4s, retain persistent board and HUD. Use stage-specific mismatch explanations: wrong color; size mismatch; destination does not power the reactor. Keep timing cancellation and two-second reacquisition handoff. Ensure all currently active ring/label visuals are shown before accepting hits. No mission-specific fork of shared data_target.
5. Update final copy to point to the west walking exit and explain the successful detailed request. Preserve badge and DATA arithmetic and optional branch activity index8. Prompt Workshop remains module0 and is untouched.

## Verification and implementation boundary

Before mutation, checkpoint source, exact affected packages, bindings and full component properties. Reconcile target-owned assemblies using live native wrappers, with feature026 group evidence as history only. Calculate sightlines for center/corners at standing/crouched muzzle heights against rendered meshes, collision and full moving sweep. Editor captures contain edit-only device bodies and are not proof of cooked obstruction. If other owned scenery blocks the proposed row or a required supported asset is missing, stop and amend the concrete delta; do not hide arbitrary actors.

Save/read back incremental groups; build Verse; Validate Project; clean-source cook. Feature048's most recent recorded upload failed login before cook, so verify current authentication when testing. No temporary reward seeds, forced completion or player-position code may remain in production. Use the acceptance scenarios in spec.md; user feedback on first-time learning is a separate human observation. Record remaining multiplayer or learning gaps instead of accepting them. Finish nonrunning, editor open.



