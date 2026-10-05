# R04 and production collision assessment

Offline Planner assessment, 2026-10-04. No editor access, original map/digest/approval changes or implementation. Current authorized temporary tests continue on their existing geometry.

## Actual R04 finding and bounded source repair

The cooked three-deck harness permits ordinary AutoRun across400cm decks separated by50cm gaps, grounded at unchanged height and without Jump input. That violates `spec.md` R04's essential shoot/create/jump behavior; physical gap walkability cannot be claimed as mandatory parkour.

The approved bounded source repair—airborne departure with normalized feet more than35cm above the accepted deck, bound to owner/generation/checkpoint—is implementation of the existing requirement, not a new geometry/mechanic design. New-node credit requires that token plus valid ordered grounded arrival. Anchor departure to the accepted checkpoint and clear credit on every subsequent grounded landing, including return to the same checkpoint, and on recovery/release/reset. Otherwise jump-in-place could bank credit for later AutoRun. Measured real jump rise~190cm supports testing the35cm threshold. Prove grounded walking denied, actual jumps accepted, jump-in-place then walk denied, and recovery cannot grant credit. The token enforces intentional jump progression; it does not make50cm seams physically impassable.

## Actual protected ownership and obstruction

`nursery_planter_wing_4` is a Cube component of `campus_nursery_canopy_garden`, root actor `/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.Actor_UAID_E89C2592D1B5C20303_1632818152` (planning-inspection.json). Feature011 plan lines77–78 explicitly defines that shared campus shell as four round canopies with planter wings. Feature039 plan line11 explicitly excludes campus-shell edits; line23 allows primary gameplay controls/gardening demonstration reconciliation. Spatial overlap with primary gameplay does not turn a shared shell component into an explicitly authorized gameplay fixture.

Actual wing bounds worldX[-4550,-2250],Y[-18610,-18090],Z[2400,2920], QueryOnly/BlockAllDynamic, overlap the approved production starter world[-3500,-18200,2520]. Exact native evidence is recorded in harness-placement-review.md. The progress AgencyComputer has real convex collision nearX[-3626.7,-3373.3],Y[-18551.1,-18445.1],Z2502..2609. Early null traces originating inside the wing were inconclusive, not clearance proof. Do not remove/disable/move the wing or shared root under primary-controls permission.

## Minimal provisional course revision

Separate files `../provisional-course-draft.yaml` and `../provisional-course-draft.svg` propose a compact full course inside the same34×37m bay while preserving the protected shell. This is a **material geometry revision**, not current map approval or an executable plan. Original module/badge/Return authority, eight shot receivers, three-instruction lesson, five jumps and two equal branches remain.

Keep deck toplocalZ1.2/world2520cm, stable4m minimum clear landing depth. Move initial teaching/first-pop segment sideways north of the wing, then curve both branches into one finish. Straight gaps2m; branch outward/inward closest-edge diagonal gaps~1.998m. These are proposed forgiving ordinary-jump dimensions, not proven to force jump or demonstrated playable. Full native/cooked tests must establish walking cannot complete, ordinary jumps work without sprint/mantle, misses recover safely and both corner approaches are readable. Source token remains necessary as a robust requirement guard.

Candidate floor footprints all have localY≥9.6/worldY≥-18040, giving50cm separation from wing's north edge-18090; controller's20cm landing inset adds player-space margin but native capsule/decoration clearance still needs proof. Computer lies far south of all footprints. Finish endslocalY36.6,40cm from floor north edge; keep explicit bounded catch/recovery and test this edge, rather than assuming edge safety. Existing primary control rowY13 overlaps the revised starter/first footprints and must be retired as already intended in the final primary-game replacement; existing Return atlocal5.3,13 stays outside decks/ramp and must remain clear. Existing gardening props nearlocalY27 and other canopy primitives are unresolved obstacles, to inventory before any adoption.

The current reusable validator caps gap_cm at120. This proposed200cm revision is **unsupported by that current limit**; no ready claim or silent editable override. After measured jump testing and concrete revision approval, update/verify the reusable safe gap capability explicitly. Exact source metadata and newly checked geometry would enter the future regenerated bundle; nothing here alters original map.yaml or digest.

## Concrete next review preparation

1. Finish the unchanged authorized diagnostic tests and source token repair.
2. Read-only inspect all candidate footprint/ramp/support volumes, including canopy primitives and legacy primary controls/props. Record physical collision/shot clearance from outside candidate solids; do not rely on actor aggregate AABBs/null rays starting inside.
3. If those footprints clear after the already intended primary-controls/gardening reconciliation, prepare a separate full pattern-backed revised map, stage/receiver bindings and offline generated preview. The draft SVG already shows exact deck/ramp/jump layout; it does not replace the authoritative review bundle.
4. Present that actual revised geometry and unsupported gap capability plainly for human review. Do not ask approval of unchanged temporary tests or source repairs again. If2m jumps fail ordinary-play testing, return actual movement evidence and one exact alternative, rather than removing jump intent or altering protected shell silently.
