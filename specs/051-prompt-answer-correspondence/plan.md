# Resolved eight-actor delta

Use evidence/planning-inspection.json `delta` as exact before/after actor path and full-transform ledger. Only positions change; all scale/rotation, actor identity, bindings, materials and native flags remain. Retain bNoCollision=true on each core (fresh native readback), despite component QueryOnly defaults. No collision changes are proposed.

| Core role | Before world cm | After world cm |
|---|---|---|
| blue / target0 | 9350,-3300,2605 | 9000,-3300,2630 |
| red / target1 | 9350,-4500,2605 | 9000,-4500,2630 |
| green / target2 | 9350,-3900,2605 | 9000,-3900,2630 |
| small_blue / target4 | 10100,-4200,2555 | 9800,-5000,2630 |
| large_blue / target5 | 10150,-3400,2605 | 9800,-3400,2630 |

Target4 hit_surface moves [9800,-4200,2630] -> [9800,-5000,2630]. Its ring moves [9790,-4200,2630] -> [9790,-5000,2630]; its label moves [9780,-4200,2830] -> [9780,-5000,2830]. These latter moves are synchronized editor presentation, not a transient replacement for runtime logic: pulse_cues already derives both positions from the hit anchor. All eight exact actor refs appear in delta. Do not move the target Verse host or other target actors.

Five sphere meshes are already natively noncolliding; retain that policy. Radius125cm (small75) with co-centered Z2630 gives bottoms2505/2555, above measured floor top2410. Small4 new X9800,Y-5000 stays in floor X6000..12600,Y-8500..-2300, east of unchanged enrollment maximum9036. It is not in the west return/ramp region. No entry/return geometry or policies change. Trigger geometry/collision remains same, only target4 Y moves.

1. Re-read baseline and save the eight affected actors as a checkpoint; preserve unrelated dirty state.
2. Apply full transforms, preserving rotation/scale, in a serialized group for five cores and then target4 hit/ring/label. Read each back. Never replace identities or invent mesh edits.
3. Confirm five controller creative_prop bindings resolve to those cores; nine target IDs/ordered references and hit/ring/label bindings equal baseline. Read native core bNoCollision=true. Entry remains [7500,-5200,2360]. Save each changed actor.
4. Build all Verse and record diagnostics; no source edits expected. Use supported editor validation if available, otherwise accurately mark it pending. Do not launch or cook.
5. Update task evidence and manual acceptance checklist. Rollback exactly eight full transforms to `before`; no source rollback required.

Runtime feasibility: controller caches blue/large homes on begin; reset returns them to these new homes. It translates target5 and large core by identical Y +-250 over4s; their new center alignment persists across full sweep X9800,Y[-3650,-3150],Z2630. Finale dynamically uses large core current location and unchanged reactor. Small/red/green are shown/hidden without transforms. Shared pulse_cues uses ring X-10 and label X-20/Z+200; preserve this behavior and ring scale pulse1..1.06. No Verse configuration flags need change.

Before stage3 red/small rings have nearly the same bearing from both ordinary regions. Only small4 is separated to -5000; no whole-room row. Active sets remain [0,1,2], [3], [1,4,5], [5], [6,7,8]. Destinations and LARGE modifier are unchanged. Historical 049 scope and approval files remain untouched.
