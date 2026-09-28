# Stationary solo sequence — 2026-09-27

Second launch used native Play From Here at world (8400,-3900,2520), yaw0, matching the approved firing area's XY. common-firing-start.png records that initial location/view. It was outside the enrollment volume, so the player walked to the existing entry and back. Timed movement cannot prove the exact return coordinates; subsequent checks establish a single stationary engagement position in the firing area, not centimetre accuracy. No walking input was sent between common-blue-aim.png and completed-reactor-no-reward.png.

Fresh LogValkyrie local validation completed at 16:15:04.346 and launch signaled success at 16:15:11.991. The cooked game ran. GetClientLogEntries later reported no client log found while GetGameState confirmed Running; that tool limitation is not a failed or terminated session. No manual Project > Validate Project action or warning-free validation is claimed. The performance warning remains visible; narrow editor PhysicsObject warning queries returned no matches and do not establish its cause.

| Scenario | Actual result | Evidence |
|---|---|---|
| BLUE | Short press accepted, +1 DATA | common-blue-aim.png, common-blue-hit.png |
| LARGE | Accepted, 2 DATA before the next correct hit | common-large-hit.png, common-large-blue-aim.png |
| LARGE BLUE | Outer ring aim accepted; 3 DATA and moving round | common-large-blue-aim.png, common-large-blue-hit.png, early-storage-aim.png |
| Early destination | STORAGE visual shot did not advance; 3 DATA, core still moving | early-storage-shot.png |
| Isolated acquisition | 80ms press accepted; destinations activated and acquisition HUD shown | common-acquire-one.png; common-scanner-wrong.png confirms 4 DATA |
| Frozen core | Core remained at its acquired position during subsequent destination checks | common-acquire-one.png, common-scanner-wrong.png, common-storage-wrong.png; different camera rotations preclude a precise screen displacement metric |
| SCANNER | Wrong feedback, 4 DATA preserved | common-scanner-wrong.png |
| STORAGE | Wrong feedback, 4 DATA preserved; peripheral ring hit | common-storage-wrong.png |
| REACTOR | Initial aim missed, then recentered short press accepted and delivery started | common-reactor-hit.png is the miss; common-reactor-hit-b.png is the accepted shot |
| Finale | Reached 8 DATA without moving from firing position; Pix/core at reactor | common-finale.png |
| Completion communication | Camera turn from the same position showed readable board: module online and badge earned | replay-direction.png |
| Duplicate reward protection | 500ms burst toward completed REACTOR left DATA at 8 | completed-reactor-no-reward.png |

The isolated acquisition and two wrong-destination results resolve the earlier uncertainty about whether these stages are independently usable. The earlier 1s burst can still advance acquisition and REACTOR without a deliberate new aim; record this as a learning/interaction concern for human feedback. No gameplay or layout change was made.

The moving-core pre-shot screenshot and accepted result are separated by tool latency; they do not prove an outer-third impact at the exact shot time. Source and native hull evidence support generous coverage but do not substitute for that acceptance observation. Complete intro timing, all required cue/feedback details and readable labels across intended angles remain open.

## Replay attempt limitation

The player approached a visible button, but its red X showed a disabled legacy selector. This was not an accepted replay interaction. Native readback confirmed the actual bound replay button remains world(7600,-5100,2500), yaw90. The subsequent search did not produce a replay prompt or reset. All replay*.png files from this run record navigation/readability only, not replay acceptance. Next run should identify the actual control from editor geometry before repeating the lifecycle check. Do not count replay as passed.

Final StopGame returned Completed and GetGameState returned CanStart. Editor remains open. Multiplayer, first-time-player feedback, replay during delayed stages, respawn and departure checks remain pending; no human response to the tester-availability request was available during this run.
