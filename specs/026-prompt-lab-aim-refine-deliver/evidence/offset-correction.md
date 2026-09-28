# Implementation preflight and proposed correction - 2026-09-27

Human instruction: "implement spec 026, it is approved". Original digest 6f89a309cd1812dbc6f4c88332ccd7f7654aa755ba8b21b95b09032aed2f153e is recorded in approval.yaml. This authorizes the original scope, but not this newly discovered offset exception. No editor mutation, save, build or session launch occurred.

## FR-001/004: reconciled ownership and coverage

Fresh native ListDeviceProperties/GetDeviceProperties confirms configured=true, nine target references in the original order, target_id0-8, reward_value1 and objective=true only for target3. Every native wrapper was schema-discovered and resolved through savedActor. Null optional selectable_ring/objective_cone fields are intentional: the actual cues use ring_mesh and target3 cone_mesh. Shared hit/retry sounds point to one pair of audio actors; leave them fixed. All full transforms and actor bounds are recorded in implementation-preflight.json. Scenery and lane candidate readbacks are in scenery-survey.json and clearance-survey.json.

The trigger actor's overall bounding box includes editor components and is not its damage footprint. Actual Mesh is SM_CreativeTrigger, QueryOnly, blocking weapon/projectile channels. Its native convex hull extends approximately +/-64cm in mesh XY. Pitch90 and scale3.5 produce approximately4.48m YZ damage coverage, whereas the ring has diameter2.8m and a maximum 6% pulse gives2.968m. The 8cm rejection shake still lies within damage coverage. At anchor2.2m the ring's lower edge remains0.716m above the floor. The invisible damage hull reaches about4.4cm below the floor; retain it rather than shrink coverage. Final outer-third acceptance still requires cooked shots.

Proposed color/destination center spacing6m exceeds the4.48m damage footprint. Active RED is offset from SMALL BLUE and LARGE BLUE. Decorative/core props can overlap projected visual lines; RED's native StaticMeshComponent0 has NoCollision. Geometry intersections alone are not weapon blockers. Record target visibility/readability in cooked acceptance rather than claiming visual clarity from native calls.

## FR-002/008: entry, replay and walking survey

Entry native properties are zoneWidth6, zoneDepth12, zoneHeight3, Box. Actor bounds include editor volume components; do not interpret those as exact gameplay volume extents. Replay center is world7600,-5100,2500 near entry, with bounds7472..7728,-5228..-4972,2372..2628. Existing floor top2410, west ramp top2409.99945 confirm an essentially flush join. Old elevated destination-step/scanner props occupy the west edge around y-4750/-5300; use the clear west crossing near localY40 (worldY-4500), consistent with the approved walking exit. The send pad on the approach is15cm above floor; selector pads are10cm and route stripe5.5cm. These are small walking steps, not a newly required jump. Exact reverse walking, zone enrollment and replay interaction remain cooked checks.

## FR-004: definite floor-height conflict and concrete correction

Applying the full anchor Z delta (-145cm) to the three destination machines would bury them:

| Part | Measured bottom cm | Full-delta bottom cm | Proposed world XYZ cm |
|---|---:|---:|---|
| Reactor |2400|2255|10850,-3100,2550|
| Scanner |2460|2315|10850,-3700,2520|
| Storage |2410|2265|10850,-4300,2570|
| Reactor energy |VFX bounds are not solid geometry|not applicable|10850,-3100,2850|
| Cable A |floor VFX anchor2450|2305 anchor|10250,-3100,2450|
| Cable B |floor VFX anchor2450|2305 anchor|10430,-3100,2450|
| Cable C |floor VFX anchor2450|2305 anchor|10610,-3100,2450|
| Cable D |floor VFX anchor2450|2305 anchor|10790,-3100,2450|

Preserve the machines' measured Z and translate XY only, including reactor energy/cable effects. Preserve their rotation and scale. The reactor retains its existing10cm floor embedding; this revision adds none. The cable devices are authored floor energy points, not surveyed physical splines or a route to the distant module. Their XY delta retains relative spacing near the reactor; the module, door, lights, rail, delivery beam home and legacy actors stay fixed. Runtime delivery beam endpoints are computed from actual core/reactor transforms in existing source.

The correction leaves every approved target anchor, board anchor and all gameplay rules intact. It changes destination machinery offsets, which plan.md explicitly returns to design review. The reviewable execution delta contains87 unique actor operations with full before/after transforms. No sound actor is included. This delta is a proposal until actual approval of the corrected revision is recorded.

## Acceptance and shutdown

Preflight is evidence, not gameplay completion. Validate/cook and AC-01 through AC-09 remain required, including simultaneous two-player attribution and first-time-player feedback. No gameplay task is checked. GetGameState returned Unconnected before preflight; no playtest was started.
