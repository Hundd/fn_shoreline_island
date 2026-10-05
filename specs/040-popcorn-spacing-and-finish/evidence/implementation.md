# Feature040 implementation evidence — 2026-10-05

Human approval recorded in ../approval.yaml for digest 60d77e01330e8a58a815c77c7ee1d22d7b728ea03f5acecf6a4ac9cc5873fc4d; the ready gate passed before mutations. The approved generated bundle was preserved.

R01: saved a native checkpoint of30 supports, then moved15 supports for LOAD by worldY=-40cm and15 for POP byY=+40cm. Every full transform was read back against scene-delta.json before saving. Final native readback includes all45 teaching supports:30 moved exactly and15 HEAT supports unchanged. Ring centers are (-2580,-17440,2680), (-2580,-17280,2680), (-2580,-17120,2680)cm, scale(0.12,1.4,1.4); adjacent160cm center spacing leaves20cm clearance. Evidence: native-checkpoint.json, moved-assembly-0.json, moved-assembly-2.json, final-native-readback.json.

R02: the generic controller now derives used LOAD/HEAT machines from the accepted prefix, with a per-machine animation flag to preserve the current250ms instruction beat even when shots overlap. POP/reuse/finale derive usage from committed consumed state. Used targets deactivate their ring, cone, label, hit surface and target cues; the production geometry hook hides every mechanism. Teaching cue refresh never restarts used-machine cues. Teaching completion refreshes geometry after its animation. Replay/release clears animation flags and restored state shows all machines. Existing deck/popcorn cosmetics and rewards remain governed by their existing hooks. Generator synchronized with emitted production source.

R03: catch-floor monitor requires an unfinished attempt; recover() also returns immediately for finished state. Completion does not release ownership; existing Replay/Return ownership and reset remain.

R02-R03: native Verse BuildAll returned an empty diagnostics list, isError=false (verse-build.json). This is compilation only. No tests, QA dispatch, Project Validate, cook, PushChanges, StartGame or gameplay session was run, in accordance with R04 and the owner's explicit instruction. Runtime/gameplay acceptance, including Replay behavior, is unverified.

Current feature039 receiver/marker positions and production scene targets were synchronized. Its historical approval and generated review artifacts remain unchanged and describe the prior revision; feature040 is the approval authority for this delta. Feature040 approved artifacts remain unchanged. Local recovery/source checkpoints are in ignored Saved/CodexCheckpoints and are not deliverables.

Shutdown: before-game-state.json and final-game-state.json both report CanStart. No active match required stopping; editor remains open. All30 changed native actors were saved via SceneTools.save_actor, each returning null without error. No deviations from approved scope.
