# Hit-surface coverage correction

Native inspection with game stopped returned CanStart. Trigger damage settings read back triggeredByDamage=true, triggeredByPlayer=false, bReceiveDamageWhenInvisible=true, visible in Game=false, bNoWeaponCollision=false and bNoCollision=false for LARGE.

The trigger's Mesh component uses SM_CreativeTrigger. Its BodySetup convex hull spans approximately92.8cm across its front face and128cm across its back. Original transverse actor scale2 gave approximately185.6–256cm coverage. The ring scale2.8 gives280cm diameter, reaching296.8cm at the6% pulse maximum. This demonstrates insufficient ring coverage independently of the previous missed shots.

Saved before editing. Increased all nine trigger local X/Y scales to3.5; retained local Z scale2, location and rotation. All nine full transforms read back correctly and save_assets returned true. Full PushChanges call445 returned Completed; subsequent GetGameState returned Running.

Cooked solo client, one player:

- Walking from the west ramp activated the Knowledge intro without jumping.
- BLUE: [before-shot aim](solo-blue-outer-third-aim-2026-09-27.png) places the crosshair approximately60px left and25px below a ring centered near1020,515 with roughly85px radius. A100ms shot accepted BLUE and displayed GOOD DETAIL / +1 DATA. [Response](solo-blue-outer-third-hit-2026-09-27.png). Later capture showed1 DATA. This is one off-center hit, not broad target acceptance.
- LARGE: [before-shot aim](solo-large-outer-third-aim-2026-09-27.png) and a100ms shot did not advance the stage. [Later capture](solo-large-outer-third-no-advance-2026-09-27.png) still shows1 DATA. Further inspection must distinguish target collision, occlusion and firing-path effects; the correction is not claimed to resolve this case.
- Other targets, neighboring-choice separation in gameplay, moving edge hits, return ride and cooperative checks were not tested in this run. No feature task was checked off.

Shutdown: StopGame returned Completed, GetGameState returned CanStart; UEFN remained open.

Additional editor traces toward LARGE center(9850,-5000,2775) from(7600,-5200,2570), (7600,-5000,2570) and(8200,-5000,2570) returned2237.04,2221.58 and1625.14cm respectively, near the target rather than an early obstruction. These are estimated starts, not measured player muzzle poses, and use the editor trace channel; they do not explain the cooked miss.
