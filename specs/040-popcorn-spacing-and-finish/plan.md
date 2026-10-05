# Concrete implementation plan

Reuse feature 039's existing shooting_gallery pattern, data-target devices, production profile and generic PopBridge controller. No new actors or new controller classes.

R01: move all 15 native supports belonging to receiver 0 by world Y=-40cm and all 15 supports belonging to receiver 2 by Y=+40cm, preserving every rotation and scale. `scene-delta.json` records exact current and proposed full transforms from live editor inspection. Ring centers become (-2580,-17440,2680), (-2580,-17280,2680), (-2580,-17120,2680)cm. Each ring is 140cm wide along Y. Update feature039's source contract/scene and target markers only after approval, preserving its historical approval evidence.

R02: introduce a controller helper for successfully used machines: LOAD/HEAT are used when prefix passes their instruction; POP/reuse/finale are used when state.consumed marks their committed receiver. Hide successful teaching machines after their animation and other machines at sequence commit. `refresh_geometry` deactivates used target devices so rings/cones/labels/trigger/cues stop; production `geometry_changed` hides all three mechanisms instead of only index2. Teaching-cue refresh must not restart cues on hidden used machines. Synchronize tools/build_popbridge_production.py. Replay's reset state makes every machine visible again. Leave deck and popcorn presentation intact.

R03: guard catch-floor recovery with `not state.finished?`, with a defensive finished guard in recover(). Keep ownership so Replay/Return work. Never call release() merely on completion: that would reset platforms/attempt presentation. Existing departure/round cancellation remains.

R04: user explicitly overrides end-of-task testing. No QA dispatch, test suite, Project Validate, cook, PushChanges or StartGame. Verse compilation applies changed source; native transform readback and save are editor mutation hygiene. Keep acceptance checks unclaimed.

Before implementation, obtain actual human approval of this concrete bundle and record its generated review digest, then run the ready gate. After approval use uefn-map-implementation with this narrowly bounded delta and no-testing constraint. All editor calls remain serialized. Checkpoint first and save affected actors. Stop active game and confirm non-running; leave UEFN open.
