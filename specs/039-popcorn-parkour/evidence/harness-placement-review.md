# Temporary B harness placement preflight

Planner offline decision, 2026-10-04. Implementer retains exclusive editor ownership. No production map/digest changed and no approval fabricated.

**Final diagnostic placement decision: translate the same three-deck harness +Y1200cm into the clear northern strip**, using tops `[-4200,-17300,2520]`, `[-3750,-17300,2520]`, `[-3300,-17300,2520]`. The original position is rejected by actual colliding geometry below. Sizes4×4×0.4m, topZ2520cm, two0.5m gaps, target semantics and isolated progress stay unchanged. This is a test-only placement choice within the same measured bay under existing runtime authorization; no new human layout approval cycle is needed. Production map/digest remains unchanged.

Original reviewed deck tops were world cm `[-4200,-18500,2520]`, `[-3750,-18500,2520]`, `[-3300,-18500,2520]`, each4×4m with stable top1.2m over floor and0.5m edge gaps. Production nursery_progress editor bounds overlap the two eastern decks; its known OnBegin Hide() supports invisible device presentation but **does not independently prove every component has no collision**. Tracker/HUD editor icons and a broad canopy aggregate box required component inspection. The original location is now rejected.

## Evidence required before retaining positions

- Record exact overlapping progress/tracker/HUD references and their primitive components. Discover/read their collision-enabled/profile/response and runtime visibility settings; establish that icon geometry is natively noncolliding or otherwise cannot intersect players/shots. Runtime Hide() alone is insufficient collision proof.
- Resolve actual canopy primitives around the footprint; identify bounds/collision of the floor, columns, beams or roof rather than using the parent's aggregate AABB. The original floor is an intentional catch surface, not an obstruction to the new raised decks.
- Sample prospective deck centers and occupied footprint edges with vertical traces from above to floor and horizontal traces through expected character-body/shot space; record coordinates and returned hit distances. Native trace channels may differ from character collision, so combine these samples with primitive collision readback. Do not claim a clear Visibility trace proves capsule clearance by itself.
- Confirm cooked production progress/tracker/HUD remain hidden/nonphysical and production bindings/settings/source unchanged. Fixture self_check r02 return0 establishes pure transitions only; it does not establish these collision/visibility facts.

Those checks found actual obstructions, so the original retain-position condition was not satisfied. The final northern-strip decision below supersedes the original positions and fallback candidates. Later cooked grounded/jump/recovery observations remain required.

## If a real obstruction exists

Do not move, hide, rebind or disable a production actor to make room. First report its actual colliding primitive and height. A candidate **test-only translation**, if needed, is all three decks300cm toward -Y: tops `[-4200,-18800,2520]`, `[-3750,-18800,2520]`, `[-3300,-18800,2520]`. Footprint becomes localX8..21,Y0..4, entirely on the measured primary floor; progress icon bounds near localY4.4..5.6 no longer overlap decks. This is only a fallback candidate until canopy/other collision and safe floor-edge recovery are checked. Keep inset landings, confine catch bounds to existing floor, and verify no miss can escape catch protection near the southern edge. If that clearance/safety cannot be proven, return the actual obstruction to Supervisor rather than guessing another site.

Any accepted translation applies equally to all harness targets, mechanisms, bay/catch bounds and test-spawn position, preserving deck sizes, height, gap, receiver semantics and isolated progress. Record exact complete actor delta and revised runtime test coordinates before placement. A uniform temporary test-fixture translation inside the same bay preserves the authorized diagnostic behavior; it is not a material change to the approved **production** course, whose map remains untouched. Supervisor should decide whether existing authorization covers the factual placement adjustment; no repeated human approval is needed merely for resolving harmless editor icons. A genuinely changed test behavior or production scene intervention remains outside this note's permission.

## Current Implementer readback

`runtime-footprint-traces.json`: vertical traces at X-4200/-3750/-3500/-3300,Y-18500,Z2540→3100 return null; horizontal X-4380→-3120,Y-18500 at Z2540/2640/2750/3000 return null. These support clear sampled space only.

HUD StaticMeshComponent0.staticMesh=null, body QueryOnly with Pawn Ignore. Tracker StaticMeshComponent0.staticMesh=null despite QueryAndPhysics body; other editor-only meshes still need flags/readback. Progress StaticMeshComponent0 is visible, not editorOnly, with QueryAndPhysics/FortBuildingMeshPhysics; exact static mesh was not yet read. Therefore progress collision remains unresolved despite Hide() and clear line traces. Planner requested exact mesh/all relevant primitives from Implementer.

## Final actual obstruction and clearance evidence

Implementer found real non-editor-only nursery_progress mesh `S_Agency_Computer_02`, QueryAndPhysics convex geometry. Desktop spans worldX[-3626.7,-3373.3],Y[-18551.1,-18445.1],Z2502..2542; upper body extends toZ2609. This is not a harmless editor icon.

More decisively, canopy child `nursery_planter_wing_4` is a Cube at[-3400,-18350,2660], scale[23,5.2,5.2], QueryOnly/BlockAllDynamic, boundsX[-4550,-2250],Y[-18610,-18090],Z[2400,2920]. Original harness is inside it. Original traces starting within a solid could return null; those samples are **inconclusive**, not clearance proof. The X-700 candidate hits this cube boundary and is rejected. The -Y candidates leave inadequate southern floor space and are not selected.

Final north-strip footprint is X[-4400,-3100],Y[-17500,-17100],Z[2500,2540] for deck solids. Implementer's actor preflight throughZ3150 shows only broad canopy/promenade/global actor envelopes, with no individually intersecting legacy device/prop. Actual known wing4 endsY-18090, giving590cm separation from the northern strip's southern boundary. Legacy control center rowY-17700 is outside deck footprint; routine supporting-actor readback must still keep those controls untouched.

Implementer sampled horizontal X-4380→-3120,Y-17300 atZ2540/2640/2750/3000 and vertical center traces atX-4200/-3750/-3300,Y-17300,Z2540→3100: all null. Downtrace at[-4200,-17300,2600] toZ2200 hits after188cm, so actual catch floor isZ2412cm, likely a promenade overlay. Relative deck rise is108cm here; deck top and gap geometry remain fixed. Roof bottom sampleZ4490 clears the diagnostic headroom. Native component inventory plus traces supports this placement; cooked character/collision/recovery observations remain required and are the purpose of the harness.

Implementer may now proceed with this exact northern diagnostic strip under existing authorization, subject to routine complete new-actor transform/collision/binding readback and cooked clearance checks. Translate all test receivers/mechanisms/spawn/bay/catch regions consistently +Y1200cm; use measured floorZ2412 when recording recovery. No production actor movement/hiding/binding changes. If a real new obstruction or unsupported collision setting emerges, stop that affected placement; do not silently alter production geometry.

## Separate production-design collision finding

The approved production starter center world[-3500,-18200,2520] and its footprint also intersect the same real wing4 cube. Earlier planning's two horizontal traces and central roof sample did not establish full course clearance; inside-solid null traces cannot resolve it. Do not change production map now or close production collision acceptance on diagnostic success. Before production reconciliation, identify the wing4 exact actor/component ownership and decide whether its primary-bay fixture removal/disable falls within the already reviewed primary-fixture reconciliation, or whether changing the campus shell/approved geometry would require a concrete material-design decision. No such production action is authorized by this diagnostic placement note.
