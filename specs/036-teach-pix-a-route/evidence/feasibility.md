# Planning feasibility evidence — 2026-10-03

Read-only inspection; no runtime prototype, compilation, gameplay implementation or test claim.

## Live site

Verified current level `/fn_shoreline_island/fn_shoreline_island`. Root identity and source component bounds inherited explicitly from 035/evidence/live-inspection.json and planning-measurements.md; refreshed route evidence in this directory supersedes the previous firing-fan rays for this proposal. Thirty-five ground rays from Z2814 to Z2214 returned 500 cm (floor2314). Eighteen rays at Z2364/2514/2714 across central route, two bypass examples, side links and west approach returned null. Playground bounds query X6400..8200,Y-14400..-12800,Z2330..2800 returned only broad aggregate/world-system bounds, not a local furnishing. All raw results saved in floor-traces.json and corridor-traces.json. These are point/line samples, not a swept collision/navmesh proof.

Live lookup found `prompt_workshop_pix`:
`/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.BuildingProp_UAID_E89C2592D1B50B0603_1985166114` (BuildingProp). This identifies a visual construction to reproduce in a new dedicated prop, not an actor authorized for reuse/movement. Other activity actors remain untouched.

## Supported primitives vs new work

- `Content/fn_shoreline_island_prompt_workshop.verse`, move_together/run_request: existing paired core/Pix transforms, per-frame TeleportTo and token checks. Its high-level requests are button choices; there is no player route recorder.
- `Content/fn_shoreline_island_bot_station.verse`, rescue_travel around line1400: 0.05-second synchronous robot/cargo stepping, cancellation checks, failable TeleportTo handling and endpoint distance checks. This is a useful motion/lifecycle basis, not proof of generic recorded-route execution or final QA acceptance.
- `Content/fn_shoreline_island_pattern_line.verse`: character GetTransform, bound ownership, active-character identity, PlayerRemoved and RoundBegin patterns.
- Local read-only Fortnite.digest.verse under Saved/VerseProject/fn_shoreline_island/Digests/BuiltIn/Fortnite exposes fort_character.IsOnGround around line9713 and creative-object transform/TeleportTo/MoveTo APIs around lines8937–8949. Existing source demonstrates these exact API families with Temporary/SpatialMath. No unofficial API, networking service or model inference is needed.
- Existing primitives make bounded sampling, arrays, explicit line/AABB arithmetic, pooled props and deterministic interpolation feasible. The new recorder, geometric validator and orchestration still must be implemented, compiled and tested after approval. No automatic live collision query in Verse is assumed.

## Geometric argument

First path starts at home X6650 and ends at load X7950, both Y-13600. Allowed first center Y lies in [-13825,-13375]. Inflated closure spans X[7075,7525], Y[-13975,-13225]. Every continuous home-to-load polyline within that first strip crosses the closure's X slab, and its allowed Y is wholly inside the closure Y range. Thus even a winding first path intersects after closure; this is not dependent on a secret preferred route.

After change, full center Y range is [-14325,-12875]. Lower bypass Y=-14150 and upper bypass Y=-13050 lie outside the inflated closure with 175 cm to their nearest allowed-space boundary; each has a 3.5 m center corridor inside a 5 m physical gap. Home/load X6650/7950 are outside inflated closure X, allowing the side links. Examples are about 24 m vs13 m direct; 60 m capacity allows ordinary indirect demonstrations. These are authored arithmetic checks, not finished collision acceptance.

## Known limits

Fixed flat ground only; actual polyline approximates movement at 0.5 m/corner samples. Bounded 128 points/60 m; excess/unsafe input safely stops and asks for a new example. No dynamic obstacle avoidance, arbitrary terrain, physics carrying or learned policy. One owner at a time. Genuine two-player QA depends on current island/session support; prior 034 QA explicitly noted one-player production settings. Do not change matchmaking to claim coverage.

Final state: GetGameState=Unconnected, GetSessionStatus=Disconnected. No active game to stop. Editor left open; Planner released editor ownership with no in-flight calls. All changes in this phase are 036 planning/evidence files.
