# Production repair checkpoint

The first persistent-material repair incorrectly set bConsiderOverrideMaterialsOnAnimationCleanup=true on 101 BuildingProps; actual UEFN validation rejected that override. All 101 were restored to false. bAllowCustomMaterial remains true; subsequent authoritative upload/cook local validation completed. Persistent approved component materials and final collision match on all 101 props (production-repair-final-101.json).

Rotation-only ActorTools.set_actor_transform reset seven label locations to zero despite its schema saying omitted fields preserve values. This implementation error caused strict startup failure. Diagnostic code2500 isolated target[0].label_board zero transform; native SavedActor still matched the original actor. Seven exact full locations/scales were restored with intended yaw-90 (production-label-restoration.json). Full101 locations match the initial checkpoint except intended ramp numerical correction: positive roll6.2258290644, center[-4800,-16531.0844751,2450.0589782], scale[3,11.0652609549,.2]. Editor surface traces prove increasing height north2400 to south2520, but physical acceptance remains QA pending. No approved bundle regeneration.

Strict reference diagnostic codes preserve existing checks. BuildAll returned no diagnostics. Nine Python contract tests pass; these do not execute Verse. A following upload failed scratch remote branch creation: main already exists, use switch instead. Error acknowledged from observed UI; supported StopSession/disconnect then normal StartSession recovered without cache deletion or remote edits. Fresh actual16:44:18 fixture result0 and READY7/8 prove startup after restoration. Normal hub spawn shows intended Skills HUD. Cooked course materials/first7labels/ramp/right-route acceptance remains independent QA pending, not claimed passed.

Final shutdown: StopGame Completed, fresh CanStart. Native debug_tag readback empty; targeted level SaveAssets true and IsDirty false. Editor remains open. All183 permanent actors preserved. No pending calls; exclusive ownership released to Supervisor for QA. Full production goal remains active.

Current source hashes:
- Content/fn_shoreline_island_popbridge_production.verse: `bbcdfd7e34678a245fa1de54991209d6db3323ff8e5cd913e06711f073f01321`
- tools/build_popbridge_production.py: `7a4a1dee6fe180b99ad7623a6eba2d80a736e128d587eb696c9b7d441617540c`
