# LARGE decorative cone collision and unsuccessful comparison

One-player cooked Fortnite tests; no cooperative result. Continued after the expanded trigger surfaces were pushed.

Before editing, BLUE accepted a shot and awarded1 DATA. LARGE did not advance from a farther position, a closer position, a side approach or a centered500ms burst. This invalidates treating the previously successful closer approach as a reliable workaround. The intended moving-core/return-rail test could not proceed.

With the game stopped, native inspection showed the LARGE decorative cone actor bNoCollision=true and bCanBeDamaged=false, while its StaticMeshComponent0 bodyInstance was collisionEnabled=QueryOnly, profile Custom. Explicitly changed only that component to collisionEnabled=NoCollision, profile NoCollision. Saved before/after; mutation returned true and both fields read back correctly. Full PushChanges call474 returned Completed; game state then Running.

Cooked comparison: normal walking entry showed the Knowledge intro; BLUE again awarded1 DATA. A centered250ms LARGE shot still did not advance. [Capture](solo-large-no-collision-no-advance-2026-09-27.png). The cone correction is retained to make decorative collision explicit, but is not claimed as the cause or a solution to the LARGE failure. Broad target/readability acceptance remains open.

After shutdown, both BLUE and LARGE damage trigger actors read back identical relevant flags: triggeredByDamage=true, bCanBeDamaged=true, bReceiveDamageWhenInvisible=true, triggeredByPlayer=false, bNoWeaponCollision=false, bNoRangedWeaponCollision=false. These editor flags do not explain the runtime failure. Next diagnostic should establish which collision surface receives the shot and whether a trigger event reaches the mission controller, rather than repeating uninstrumented aim attempts.

StopGame returned Completed; GetGameState returned CanStart. Editor left open. No feature task checked off.
