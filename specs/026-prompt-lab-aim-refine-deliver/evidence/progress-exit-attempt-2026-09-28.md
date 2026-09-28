# Progressed-stage exit attempt — inconclusive

Native StartSession with a Play From Here location of world (7600,-5450,2520), yaw90, pitch-15 returned Completed. GetSessionStatus returned Connected, then GetGameState returned Running after loading. The observed client spawned at the ordinary hub area with 0 DATA and one Pulse Rifle, rather than an identifiable Prompt Lab replay-button view. The cause of this location discrepancy was not established.

The player walked from the hub across grass without jumping, using the in-game map and visible lab signs to orient. The observed client never displayed an active Prompt Lab stage or gained DATA. Screenshots for this exploratory route are in local Saved/AgentRuns/progress-exit-*.png. No claim of progressed-stage exit/re-entry can be made from this run. It does not contradict prior successful cooked solo progression from the approved area.

Native StopGame returned Completed. Final GetGameState readback is recorded in the current conversation. No map or Verse change was made.

Read-only follow-up: native get_actor_transform confirms that the actual replay button remains world (7600,-5100,2500), yaw90, matching the earlier editor preflight. The requested Play From Here location (7600,-5450,2520) is therefore still near that authored button in editor coordinates. The world anchor did not move, but this does not explain why the connected client spawned at the hub; no false conclusion about player-server coordinates is drawn.
