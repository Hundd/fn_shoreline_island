# Concrete implementation plan

## Direction and measured basis

Use installed Fortnite Neo architecture: cream sidewalk panels, segmented silver columns, teal window sections and silver projecting trims. Real asset images are in evidence/Neo_*.png. The first two player-eye captures are evidence/before-hub.png and before-lab.png. Existing scene is a large open pavilion with primitive posts and rafters, so retain its open lower sides and lesson staging.

The authoritative exact delta is scene-delta.json; its SHA256 is embedded in map.yaml and therefore bound into the generated review digest. build_plan.py reproducibly expands every approved full world XYZ centimeter transform. Envelope rectangles are review annotations, never instructions to create solid walls. Reuse corridor pattern for unchanged physical circulation; no new Verse adapter.

## Placement groups

1.54 hub paving panels,9 columns x6 rows. World footprint X[-1700,2800],Y[0,3000]; nominal500cm square. Sidewalk native pivot corner has bounds X[0,512],Y[-512,0],Z[-6.418245,8.965888]. Scale(500/512,500/512,0.05), Z2400.8 gives visible shell Z2400.479..2401.248, above retained foundation top2400. Raised garden path2404 and spine2412 remain clear above hub paving. This is a ground skin, never a new collision floor.
2.24 promenade panels, covering30m of approach plus30m continuing through the hub,2 columns x12 rows. X[-750,-50],Y[-3000,3000], each350x500cm, scale(350/512,500/512,0.05),Z2412.8. Existing spine collision top2412 stays authoritative. Combined with plaza:1770 square meters of paving modules, including210 square meters of intentional overlap above hub paving;1560 square meters of unique ground coverage.
3.18 Neo conduit columns replace rendering of the18 exact primitive post components listed in scene-delta.json. Installed S_NeoTilted_Conduit_Pole is157.4x155.0x1249.167cm: a segmented silver shaft, collars and bolted base (evidence/Neo_conduit_pole.png). Pivots X3200,4300,5400,6500,7600,8700,9800,10900,11700 at Y-450/2350. Full rotation0, scale(1.5,1.5,1.0406934), minimumZ2400,maximum3700. Height is near native scale. XY1.5 estimates a roughly100cm main shaft from the captured silhouette; exact shaft shape has not been measured and original100cm-square collision remains. Base maximum236cm expands visible footprint68cm each side; the open bays retain at least5.64m even at the shortest800cm post spacing. Main lesson routeY200 is650cm from the south posts. Source components bVisible=false,bHiddenInGame=true; retain their BodyInstance, pose, mesh and all other properties. This is a visual replacement, not collision replacement. Owner checks body/collision mismatch; no13m-stretched wall panels remain.
4.32 clerestory windows: two rows at Y-450/2350, X3456+512*i for i0..15,Z3300,unit scale,yaw0/180. Native width556.768cm overlaps neighboring512cm modules44.768cm at trim edges. Bottom is9m above floor, above lesson signs and all inspected gameplay props; leaves lower open bays.
5.32 cornices: same row/index positions atZ3700,unit scale,yaw0/180. Projected native depth111.857cm faces inward for shade; bottom3645.707 and top3806.613. These partly mask existing eaves and enrich the roof edge. Existing rafters/ridge stay visible.

Total160 new static mesh actors, four shared Fortnite meshes, zero new lights/gameplay devices/materials/Verse. Labels prefix campus045_; exact placements in JSON. Retain all originals; only18 specified post components become invisible. No deletes or material mutations. This pilot deliberately leaves other labs and remote promenades for later measured batches. It does not claim full-campus art completion.

## Builder execution

After Supervisor records delegated review and readiness passes, checkpoint current level and original state. Discover current schemas. Spawn/reconcile short serialized groups; no blind bulk replacement. Set full approved transforms, component StaticMesh, empty OverrideMaterials and native BodyInstance NoCollision. Read back actual collisionEnabled rather than assuming spawn defaults. If property writes cannot reliably create these decorative meshes, stop and return the concrete problem to Supervisor. Never substitute colliding props.

Read counts, meshes, transforms, original-material settings and NoCollision after each group; save affected actor packages and level. Capture hub/Prompt from the recorded same cameras to assess seams, visual coverage, signs and bay openings. This is editor inspection, not cooked gameplay testing. Stop on visible z-fighting, missing mesh, giant pivot offset or obscured signs; report adjustment for Supervisor review. No actor pose changes outside delta and no new lighting.

No tests/project validation/cook/push/session launch per latest user instruction. Memory baseline and cooked platform cost are unknown; bounded actor/asset counts are a scope control, not a memory measurement. Owner later checks collision feel, foot contact, all eight travel anchors, solo lesson progression/retry/reset/Return and memory/performance. Preserve044 pending UI acceptance.

## Authority

The owner's current message explicitly asks Supervisor to verify the plan while unavailable and then run Builder. This supersedes the ordinary human-preview waiting step for this task. Record actual Supervisor review under that delegation; do not claim the owner personally saw a future digest. See evidence/supervisor.md. No approval is written by Planner.


## Dated grounding defect correction — 2026-10-09

Correct the original grounded-support intent using the measured ten-column transform delta in `evidence/post-grounding-2026-10-09/correction-plan.json`. Preserve the decorative mesh top and extend its lower end into sampled terrain by adjusting only Z translation and Z scale. Use the minimum measured terrain elevation minus 2 cm as the bottom target. North terrain sample range is 2303.746124–2304.477890 cm; the exposed south-east half is 2303.745728 cm. Nonterrain trace hits at 2442 cm are excluded. The south-east base will intersect the existing slab on its supported half; retain the slab and original physics.

Supervisor approved this repair direction under the owner's correction request and existing review delegation. Supervisor approved the exact correction-plan.json hash ae57bc24b1d2585b5250b8cf797a1816b373afc0859bd0d8aecd596cccbadb67 before execution; root-review.md records actual delegated approval. Execute only after that review, save and read back every changed actor, inspect matched before/after cameras, and audit the eight unchanged posts, original collision, 046 and Verse. No validation, cook, session launch or gameplay tests under the owner's standing instruction.
