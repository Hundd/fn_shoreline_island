# Concrete bounded implementation

Change only Content/fn_shoreline_island_debug_station.verse; baseline SHA256 781B5809B62AF45D94E0E195E39A48E867BBC954007228150485EC565D06C26D. Preserve debug_progress SHA256 6F3016C7B89DA637482251905B0AFE950F90F0B164D77732F8684D63F6ED6942 and Tool precedent event_station SHA256 F6351254315C57380267611FDDEF1D36271C8849B7416B3229ADCDCAB7667375.

## Measured baseline and tolerance

Configured controller actor ends1755479392, Pix savedActor BuildingProp_UAID_E89C2592D1B5030103_1836922034. Current Pix transform translation[-3600,-6000,2700], rotation0/0/0, scale[0.8,0.7,0.8]. Saved track_origin equals that translation, spacing200cm. Five destinations span x=-3600..-2800 at y=-6000,z2700. Use constant5cm full3D Distance tolerance,2.5% of spacing and well below100cm nearest-tile midpoint; no tile reinterpretation based on proximity. Preserve marker_home rotation/scale. This is destination confirmation, not collision/visual/learning proof.

Current saved stage refs/target refs/progress/control wrappers captured. Inner stage friendly fields list successfully but reads fail; nested DeviceGet returns empty. Preserve parent refs and source defaults; do not claim these inner values were live-measured. No broad workaround or configuration writes. Source valid_configuration already checks stage validity.

## Minimal local changes

1. Change move_pix(tile) to return logic. Check marker.IsValid[] before use. Construct identical marker_home pose with existing track destination. Use positive `if (marker.TeleportTo[pose])` success branch / else false, following Tool Lab's commit-safe precedent; do not wrap TeleportTo in inverted failure context. On successful return, validate marker still valid, read transform and require Distance <=5.0. Return true only for both. No Sleep/new animation. Cosmetic reset may ignore result; no later attempt relies on reset placement.
2. Add before_verified and actual_verified logic flags. reset_bay clears both. demonstrate clears before_verified and actual_verified at stage start; remove arithmetic assignment of before_tile as observed evidence. Prepare commands/goal exactly as now; confirm its initial start before assigning actual_tile/actual_verified, WATCH and existing0.5s pause. If failure: guarded recovery and return. execute_plan independently confirms its existing start placement too, preserving current call/timing structure. A failed placement clears actual_verified; actual_tile integer retains last confirmed tile but is not displayed as current.
3. At execute_plan entry preserve run_valid guard; clear actual_verified for the new attempt. For each step retain show Step, Sleep0.5 and run_valid. Calculate candidate_tile locally. Call move_pix(candidate), inspect returned logic outside failable negation; only success sets actual_tile and actual_verified. Failure invokes guarded recovery then returns before all completion/mistake branches. STOP uses this same call even when candidate==actual. Recheck run_valid before any post-movement presentation/credit.
4. On fully confirmed demonstration completion set before_tile=actual_tile and before_verified=true, then existing MISMATCH prompt. On corrections preserve previous verified demo endpoint. show_result renders BEFORE -- / NOW -- for unavailable observations; integer fields only when flags true. Thus WATCH/early Step may show BEFORE -- until real demo completion, a necessary truthful presentation delta; later successful correction layout/wording unchanged. Unknown BEFORE after failed demo remains -- through correction results, including a real MATCH; do not substitute the correction endpoint as BEFORE.
5. Add one local suspending recovery helper taking token/expected_phase. First require run_valid. Set actual_verified=false; retain stage, commands, goal, before_verified and mistake count. show_result status `PIX COULDN'T MOVE - TRY AGAIN`, HUD exact spec copy with existing persistent DisplayTime0.0; no learner error audio or new penalty. Keep busy=true. Sleep1.0; require run_valid, then await_quiet(token,expected_phase). Return to caller, which immediately returns. No automatic demonstration or correction retry. on_hit's existing accepted-shot cosmetic response remains (not progress credit); next accepted correction hides recovery HUD and reruns authored start.
6. Add run_valid guard at await_quiet entry before last_hit/target activation (existing loop checks after Sleep remain). No failure path increments generation without owning a reset; existing token/phase cancellation remains the owner of delayed work. No new state machine, shared helper or target changes.

## Failure/rearm matrix

| Case | Position evidence | Result/progression | Recovery |
|---|---|---|---|
| Demo initial or execution start fails | BEFORE --, NOW -- | No observed mismatch, no mistake/credit | Same-stage guarded1s+quiet; ordinary correction |
| Demo intermediate/STOP fails | BEFORE --, NOW -- | Abort; do not publish computed endpoint | Same recovery |
| Correction start/step/STOP fails | Preserve only verified demo BEFORE; NOW -- | No mismatch/mistake/MATCH/light/credit/phase | Same recovery |
| Teleport false but already at destination | Still failure | No shortcut via readback | Same recovery |
| Teleport true but readback >5cm/invalid marker | Failure | No shortcut via return success | Same recovery |
| All placements true + in tolerance; endpoint wrong | Verified reached tile | Existing mistake/hint/mismatch | Existing1s+quiet |
| All placements confirmed; endpoint goal | Verified reached tile | Existing progress/light/MATCH/success delay | Existing next stage/Replay |
| Invalid token/owner/phase before/after wait or move | No stale publication | Silent return | Existing reset owns cleanup; never rearm |
| Cosmetic idle reset move fails | No claimed route evidence | No scored result | No auto retry; next route verifies own start |

## Scope, review and validation

map.yaml is preserved031 context using existing corridor/shooting_gallery. No scene creation/move/remove, no goal marker or label fix, no stage/puzzle edits. Generated reconcile steps are inspection/preservation only; local controller adapter is the sole delta. Full behavior bundle used, not a copy-only exception. Static check/gate, source/control-flow audit and native BuildAll after implementation. Read back unchanged exposed settings/reference/marker transform. Manual A1–A6 remain pending; no gameplay/session/cook/push/fault injection.

User's actual delegation: “please work by yourself, review implementation plan by yourself or ask a producer”; “do not use game testings, it will be done manually”. Supervisor relays heartbeat reaffirmation. Standard --ready human approval restriction is recorded honestly; no approval.yaml fabricated, no global tooling changed. Concrete Producer review and Supervisor delegated authorization precede implementation.
