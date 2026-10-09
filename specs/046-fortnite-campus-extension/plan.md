# Remaining-campus implementation plan



## Scope and evidence



The owner accepted the visual direction of 045 and requested the rest of the map. This is a full measured campus extension. The current authoritative player state is feature 044 plus its follow-up UI fixes; older September roadmap suggestions are historical and do not authorize gameplay rollback. Feature 045 remains intact.



Fresh read-only evidence consists of the live inventory, nine structural assembly exports with complete component properties, all candidate floor materials and six player-eye images. The sand-colored slab candidates use `mi_academy_sand`; the navy Prompt floor is explicitly excluded. The optional eastern Hangar already uses ArcticBase Fortnite modular architecture and the northern cottage already uses Rural House / BrickSimple pieces. Their decorative architecture requires preservation, not a new opaque overlay. Their route footprints, launch-code displays and optional activity controls are gameplay evidence.



`scene-delta.json` contains every full world XYZ centimeter transform, mesh reference, group, role and source surface. It also lists the exact 39 primitive support components whose rendering changes. `coverage.json` records the surveyed actors and exclusions. Both file hashes are in map.yaml, binding the detailed execution scope into the generated review bundle. `build_plan.py` expands this design offline and never calls the editor. Generated map envelopes are survey annotations; they never imply new walls or a long mandatory mission route.



## Architectural treatment



There are 1,457 new mesh actors: 514 paving panels, 594 wall panels, 310 cornice modules and 39 columns. Four existing Fortnite meshes are shared: Neo sidewalk without curb, Neo residential wall, Neo store trim and Neo conduit pole. Their native measurements and original material images are reused from 045. No new lights, textures, materials, devices or Verse are needed. Counts control scope; they are not a measured runtime memory budget.



Neutral floor slabs receive a noncolliding textured skin. Rectangles are subtracted from the union of previously processed slab rectangles, eliminating duplicate skins on overlapping historical slabs. Each tile dimension is at most 1,000 cm, so XY scale stays below 1.96 on the 512 cm sidewalk asset. The native vertical relief is flattened to scale Z = 0.05. With pivot 0.8 cm above the original surface, the skin lies 0.479–1.248 cm above it; original collision stays authoritative. Narrow leftovers below 80 cm are retained as existing surface rather than distorted strips. They are listed in coverage.json.



Promenade and branch skins leave 50 cm of teal on each long edge, keeping the existing wayfinding color. Route rectangles are subtracted from already covered route rectangles and the exact 045 spine footprint. The active Popcorn floor rectangle is excluded. Raised routes stay at their measured original top Z = 2412 cm; floor skins are at the separate slab level Z = 2400 cm. These are intentional different levels, not coplanar duplicate surfaces. Original raised lanes, lesson grids and activity props remain.



Opaque architectural walls receive framed Neo panels only on existing opaque faces. The native wall width 536.0146 cm is fit to modules no wider than 800 cm, and native height 384 cm to tiers no taller than 600 cm. A 1.5 cm face-pivot offset and depth scale 0.05 place visible panel relief only 0.876 to 2.701 cm beyond the existing face, avoiding large protrusion into consoles, signs and circulation. Both broad faces of thin walls are covered; the four existing solid Tool Lab towers receive all four faces. The original wall remains visible wherever no skin is specified and retains all collision. There are no new opaque panels across open bays or entrances.



Native projecting trim modules follow measured roof/header/beam edges and the tops of tiled walls. They are broken into lengths no more than 800 cm rather than stretched over an entire building. Existing roof masses, slopes, chimneys and structural silhouettes remain; new layered edges provide coherent architectural detail. Nursery round canopy disks keep their round silhouette with short paired trim runs within each disk, not floating square corner frames.



Selected narrow primitive support posts are replaced visually by the same detailed Neo conduit columns used in 045. Original support components remain with unchanged physics and transforms; only bVisible becomes false and bHiddenInGame becomes true. Height fits the measured original support, and XY scale estimates a shaft comparable to the original width while capped at 3.2. The larger Neo foot/collar footprint is explicit: the widest base is approximately 5.04 m, on the existing 2.4 m Tool Lab supports. These columns occupy existing opaque support centers and remain noncolliding, but exact rendered shaft/contact correspondence still requires the owner to assess. Do not claim the collision shape now matches the curved shaft exactly.



The Discovery greenhouse has overlapping paired original posts. Eight original render components receive eight Neo posts at their exact original centers; the paired footprints remain visible and both original collision shapes are retained. The two original entrance arch uprights also receive Neo columns. Signs, planters, growth states and buttons are preserved.



## Coverage and gameplay exclusions



See `coverage.md` for counts and per-area treatment. Active Popcorn floor, ramps, landing geometry, machines and visual sequence cues receive no floor skin. Its perimeter architecture and entry uprights receive the campus treatment. All four nursery canopies receive measured trim detail, while their broad original support cylinders remain; changing those contact silhouettes beside parkour is not required to achieve coherent perimeter presentation.



The legacy Prompt navy activity floor, path cubes, gate walls, scanners and delivery geometry are functional surfaces and remain. The modern Prompt Workshop's four neutral repair slabs now receive textured paving, completing the floor treatment below the accepted 045 pavilion architecture. Discovery's existing hub floor was already covered by 045; this feature adds its structural detail and shared route treatment.



Existing authentic cottage and optional east hangar remain as they are. This is a completed inventory decision based on real Fortnite class paths, not an unexamined whole-zone deferral. Their functional controls, doors, route footprints and floors are preserved. Existing trees, teaching identities, sign backboards, animated evidence props, supporting mounts and state-dependent decorations remain.



## Serialized implementation and verification



After Supervisor review and current readiness pass, checkpoint the clean current level and capture counts for 045 and protected devices. Work in bounded groups by `group` and `role`. Discover exact native schemas. Before spawning, reconcile unique campus046 labels; never blindly duplicate an existing label. Place meshes with complete transforms and explicitly empty material overrides and NoCollision. Short batches of 20–40 calls are preferred; inspect each returned result and stop on an ambiguous failure.



Read back each group's assets, complete transforms, collisions and count, then save its actors and the level. Apply render-only changes after replacement columns are present and verified. Compare original support BodyInstance byte-equivalent structured data against architecture-components.json; no physics changes are allowed. Verify original 045 actor count and source baselines remain intact.



Capture each group at the six recorded before cameras, plus a useful three-quarter Confidence entrance view because its before image is close to a wall. Inspect signs, open bays, textured joints, roof-edge placement and no visible z-fighting. Any necessary material design adjustment returns to Supervisor review and updates the exact delta before further edits. Editor visual review and native save/readback are implementation integrity checks, not gameplay tests.



No automatic project validation, cook, content push, game launch or runtime tests. Owner walkthrough must cover all eight arrivals, each changed area, solo progression/retry/reset/Return, instructional visibility, parkour contact and memory/performance. No cooked memory baseline is available. Leave the editor open and confirm the game is not running before handoff.

