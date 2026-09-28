# Prompt Workshop plan: corrected repair-tile site

Status: revised draft for review; no island or Verse changes made. The user's 2026-09-28 correction names repair_0_floor through repair_3_floor as the build surface. The previous draft incorrectly inherited feature-026 geometry and retirement scope.

## Measured footprint

Read-only native Unreal MCP measured the four floor transforms and bounds on 2026-09-28. Full actor identities, raw bounds, transforms and repair inventory are in `evidence/repair-footprint-2026-09-28.json`.

| Floor | World X bounds (cm) | Local X (m) | Proposed use |
|---|---|---|---|
| repair_0_floor | 2900..5100 | 0..22 | Arrival and Inspect |
| repair_1_floor | 5100..7300 | 22..44 | Compose |
| repair_2_floor | 7300..9500 | 44..66 | Send, Pix result and revision |
| repair_3_floor | 9500..11700 | 66..88 | Module, Connect and Replay |

All four have world Y bounds -600..2200 cm and top Z=2400 cm. Each is 22 x 28 m, with scale (22,28,1.5), zero rotation and center Z=2325 cm. Preserve these transforms. Map origin is `(2900,-600,2400)` cm; local Z=0 is the top surface, not the floor actor pivot. The complete footprint is 88 x 28 m.

The existing `garden_repair_walkway` spans X=2300..2900, Y=-600..1200 cm, top Z=2402 cm. It abuts repair_0_floor with a measured 2 cm surface difference. The proposed crossing at local (0,8,0) uses that walkway. The old Prompt Lab west ramp, origin (6000,-8500,2410), 66 x 62 m platform, entry volume and module anchor do not describe this site.

## Proposed layout and walking

Arrival occupies the first 6 m of tile 0; Inspect occupies its remaining 16 m. Compose/Test shares an envelope across tiles 1 and 2 so editing and the visible result remain related. Connect occupies tile 3. These are activity envelopes, not new walls.

A 3 m clear aisle runs along local Y=8 from X=2 to X=70. Inspect is at (18,10); the three choice groups are at (26,12), (31,12), (36,12); Send is at (45,12). The core examples at (16,20) and (20,20) and clue at (19,17) must remain visible from the choice positions. Reactor/scanner destinations are on tile 2 at (53,20) and (60,20), visible from Send. The module/Connect is proposed at (70,12) on tile 3; Replay is at (74,12). All marker heights are proposed visual/interaction anchors; determine full mesh transforms from pivots and bounds before placement.

The route is about 68 m from the arrival marker to the Connect approach, plus short lateral steps. Its longest uninterrupted segment is 32 m from the choice approach to Connect, with Send and the result on the way. Walking return retraces the aisle; no rail or jump is required. This length is an explicit tradeoff of using the four existing tiles. Sightlines, readable labels and seam collision still need cooked proof. The 2 cm walkway seam must be tested in both directions.

## Reuse and corrected scene delta

1. Export exact actor identities, full transforms, properties and bindings; save a checkpoint. Preserve the four floor tiles, garden_repair_walkway, hub access and shared systems.
2. Reconcile `repair_station_0` through `repair_station_3`, `repair_progress`, `repair_*` buttons/boards/HUD devices, stage props and labels. The source currently implements optional sequence repair, subscribes to shared hub spawners and uses a hub teleporter/round settings. Adapt useful devices and remove obsolete activity actors; preserving the old game is not a requirement. Retire the obsolete station subscriptions before reusing any control. There must be no legacy mode or parallel old sequence game on these tiles. Do not delete shared dependencies or binary asset files based on a name prefix.
3. Reuse suitable repair controls/boards for Inspect, six choices, Send, Connect and Replay. Reconcile the parent support assemblies as well as individually named props so leftover labels/collision do not remain. Update `garden_repair_route` through its owning hub-sign source after implementation approval; that source currently rewrites the sign to FIX THE PROMPT on start.
4. Reuse `fn_shoreline_island_prompt_lab_controller` source for the WHAT/WHICH/WHERE workbench, with a scoped flow refactor, personal state, serialized Pix execution and generation-safe cancellation. Existing feature-023 routines are an implementation basis, not proof the new flow is supported. A workshop-local entry, props and module need deliberate placement and bindings in this footprint. Reuse asset templates; moving existing distant Prompt actors is not implicitly authorized by this site correction.
5. Replace the repair activity route/sign copy with the new workshop and bind its completion to the existing shared Prompt Badge guard and proposed 5+3 DATA rewards. Reconcile journal integration so the new activity is described accurately. The separate feature-026 shooting area is outside this replacement scope; do not infer changes to its targets, ramp or controller from removal of the repair button game.
6. Read back positions/bounds/settings and all references after each logical group, save, build changed Verse, validate/cook and playtest the acceptance scenarios. Include the four-floor support check, walkway seam, wrong requests, reset, two-player isolation and shared hub/Garden behavior.

## Replacement decision and verification

The user clarified on 2026-09-28: "the old game with buttons should be removed or adapted with a new one, no need to hold the old". Treat this as replacement of the repair game on the four named tiles. Reuse means adapting suitable devices to the workshop; it does not mean retaining the old Claim/swap-slots/Run behavior. Remove obsolete controls, labels, stage props and controllers after ownership and dependency reconciliation. Do not leave a legacy mode or a second old game active.

The earlier mission-coexistence question is withdrawn as a blocker for this repair-game replacement. Retain the draft workshop reward design in FR-05 (guarded Prompt Badge and 5+3 DATA); the historical repair game's no-badge behavior is not a preservation requirement. This is a planning choice within the existing proposal, not a claim that the user separately approved every reward detail or changes to the distant shooting game. Keep shared progression and hub/Garden dependencies intact.

Verify AC-11 with a complete adapted/removed inventory and a cooked check that all reused controls run only the new behavior. Other controller/UI work remains as described by FR-02 through FR-06: six choices, retained correct fields, safe wrong results, no duplicate Send, personal HUD when the physical board cannot be personal, and replay cancellation.

After explicit approval of the revised concrete bundle, record the actual approval/digest and run `python tools/map_workflow.py plan specs/027-prompt-workshop-redesign/map.yaml --ready`. Then use `$uefn-map-implementation` for serialized implementation and verification. This review does not authorize scene mutation.
