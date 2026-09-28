# Spec 027 area review - 2026-09-28

The user's concern is confirmed. The original draft covered the feature-026 Prompt Lab platform at origin (6000,-8500,2410) cm, with a 66 x 62 m envelope, its west ramp and distant module. The requested area is the four repair floors beside the garden. The original claim that this was the correct measured platform was wrong.

## Corrected evidence and scope

Read-only native Unreal MCP confirmed repair_0_floor through repair_3_floor: four adjoining 22 x 28 m tiles, combined world X=2900..11700, Y=-600..2200 cm, top Z=2400 cm. Their transforms and actor identities are saved in `evidence/repair-footprint-2026-09-28.json`, together with the repair actor inventory and garden_repair_walkway bounds. The walkway meets the first tile with a 2 cm surface difference. New origin: (2900,-600,2400) cm; footprint: 88 x 28 m.

The revised spec, plan, tasks and map now use those tiles. Tile 0 holds arrival/Inspect, tile 1 Compose, tile 2 Test, and tile 3 Connect/Replay. Proposed controls, props and module anchors are within that strip. The retirement scope now concerns the obsolete repair-station activities and subscriptions. The distant Prompt Lab target assemblies are not an implicit deletion set.

| Requirements | Review finding | Required implementation evidence |
|---|---|---|
| FR-01, AC-10 | Correct footprint and floor-top origin now come from live actor bounds. The proposed 3 m aisle connects all four tiles and returns via garden_repair_walkway. | Preserve floor transforms; verify full prop support, tile seams and both walking directions in a cooked game. |
| FR-02/03 | Core examples and clue are on tile 0; choices are on tile 1. Anchors are proposed, not current native transforms. | Verify clue/core visibility from all choice positions and readable text/shape cues. |
| FR-04 | Send and reactor/scanner result destinations are on tile 2. Editing and visible results share one envelope; no gun hit surfaces are required. | Scope the adapter, retain correct fields after failure, serialize Pix and test replay cancellation. |
| FR-05 | Module and Connect are proposed on tile 3, replacing the incorrect distant module anchor in this plan. | Retain proposed workshop rewards with the shared badge guard; verify attribution and no duplicate badge. |
| FR-06 | Personal state plus serialized shared animation remains intended. | Use personal HUD where a billboard cannot show personal state; test two real players. |
| FR-07 | Repair controllers subscribe to buttons, hub spawners and shared progress/round state. Hub-sign source writes the old route label on startup. | Reconcile exact bindings and support assemblies, retire old subscriptions, update the owning sign source, preserve shared hub/Garden dependencies. |
| FR-08 | Offline structural check passed; scene and Verse were not mutated. | Build/validate/cook and gameplay acceptance remain implementation work. |

Walking tradeoff: about 68 m along the main aisle from arrival to the Connect approach, plus short lateral steps; return retraces this route. Send provides an interaction along the final 32 m segment. Do not claim this proves comfortable pacing or sightlines. Keep the tile-1/tile-2 subdivision from the measured floor table in the plan: v1 draws their shared Compose/Test envelope without a tile seam line.

## Validation and replacement decision

`python tools/map_workflow.py check specs/027-prompt-workshop-redesign/map.yaml` passed and regenerated the HTML, SVG, implementation YAML and manifest. Reviewed marker/world-coordinate mappings and generated intent operations. Rendered the SVG locally with headless Chrome, inspected its image, and widened the arrival envelope to remove cramped dimension text; the floor-0 total remains 22 m. The in-app browser was unavailable. Rendering artifacts/profile are under ignored `Saved/`, not deliverables.

Current review digest: `5d603b90fe315ed87016c7c636522a7d7ac9477d01c8dae519900a408c36a1f0`. The regenerated plan has zero structural execution blockers. The user clarified: "the old game with buttons should be removed or adapted with a new one, no need to hold the old". Recorded this as complete replacement of the repair button game on the four named tiles. Suitable devices are adapted to the new workshop; obsolete activity actors and subscriptions are removed. AC-11 now requires that no old Claim/swap-slots/Run sequence or legacy mode remains active. The previous mission-coexistence blocker is withdrawn; preserving the old repair game's optional/no-badge behavior is not required. The draft retains the proposed guarded Prompt Badge and 5+3 DATA rewards. The separate shooting area is outside the replacement scope.

This revision changes replacement policy and acceptance criteria, not the measured geometry or marker placements. Re-ran the offline check and inspected the generated plan and HTML replacement assumption. The prior visual layout review still applies. No approval record was created; a scope clarification is not recorded as approval of the entire design bundle.

UEFN `GetGameState` returned `Unconnected`; no active playtest game was running and the editor was left open. This is a planning/documentation correction, so no Verse build or new playtest was required or claimed.
