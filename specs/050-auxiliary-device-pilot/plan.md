# Implementation plan

Reuse the existing actor at world XYZ [-3500,-18500,2450] cm, rotation [pitch0,yaw0,roll0], scale [1,1,1]. GUID 96BE09BE-46A7-B94D-2932-739392FB07F8. Exact path and complete baseline are in evidence/planning-inspection.json.

1. Save this actor as recovery checkpoint; preserve unrelated dirty actors. Its external actor is Content/__ExternalActors__/fn_shoreline_island/C/Z3/G0F6U5CW96NQ3NNEA2DFHL.uasset.
2. With ObjectTools.set_properties on THIS ACTOR ONLY, write values JSON {"visibleInGame":false,"bNoCollision":true}. Both exact properties are discovered native fields: "Determines whether the script device is visible during games" and "Object should have no collision".
3. SceneTools.set_actor_folder to Infrastructure/Skills. Keep label fn_shoreline_island_nursery_progress. Do not change staticMesh, bHidden, enabled at Game Start, editor-only flags, class defaults or components.
4. Read back fields, script, full transform, all components, incoming five progress references and native event bindings. Inspect component body state as corroboration, not a substitute for actor setting or cooked acceptance. No speculative component writes if editor rendering differs.
5. Save actor, read back again, record non-game validation availability/results. If native setting fails or is rejected, stop and report; do not escalate to replacement geometry or class refactoring.

Rollback: same actor properties visibleInGame=true, bNoCollision=false; folder None/empty using supported folder API. Original label and all other state remain untouched. No source build needed because no Verse changes.

Dependency review: four legacy nursery station actors and pop039_production_controller reference the exact same nursery_progress script. Native ListEventBindings returns []. Nursery progress owns tracker/round settings and runs state/once-per-round badge logic. Production strict-reference code checks progress.GetTransform().Translation is nonzero: full transform MUST remain. Root parent is null; root-scoped actor lookup returns only the pilot, no child actors. BoundingBoxComponent and EditorOnlyStaticMeshComponent are editor-only, the latter has null mesh. Primary runtime mesh is S_Agency_Computer_02 and currently QueryAndPhysics. Retaining identity and entire binding state avoids migration risk.

Inspection census found 71 loaded VerseDevice actors, all with Agency mesh; this is not all prop classes or all unloaded world partitions. Targets/controllers cannot be treated as decorative computers; no bulk rollout is authorized by this plan. Pilot's five consumers and baseline are the focused implementation ledger.

The map reuses corridor as an unchanged context envelope; it is a bounded representation pilot, not new floor/route construction. Dimensions are schematic crop around measured actor bounds and must never be translated to geometry. No new interaction, walking requirement, target, stage, reward or gate.
