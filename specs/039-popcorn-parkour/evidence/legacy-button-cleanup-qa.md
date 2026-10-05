# Independent postcleanup QA — 2026-10-04

Verifier: original gpt-6.1-sol QA, exclusive serialized editor ownership. Approved production digest remains `809dcd27d05f7e0711635d560f2615ab543ffb18195ea0e5008e386395d8087a`. No gameplay/source/placement fixes or approval/task changes made.

## Native cleanup result (R01)

Fresh complete actor query returned 1857 actors. All 13 exact candidates in legacy-button-cleanup-candidates.json are absent; all 183 expected production course actor paths remain present. Fresh old-primary `retired_primary=true`; each of the 13 obsolete button wrappers has `savedActor=null`. Fresh Replay `1369950800`, entry Return `1371014802`, and production finish Return `1562485838` are visible, enabled at game start/currently enabled, not hidden and not NoCollision. Raw independent readback: legacy-button-cleanup-qa-native.json. The implementer's 1870 baseline/135 other wrappers/133 profile bindings and validation19:44:12 are reference evidence, not repeated independent broad audits.

No cleanup defect found within the exact removal/preservation scope. Native enabled alone does not accept physical entry Return.

## Current cooked real cycle (R02–R05, R07–R08)

Normal current-session hub spawn began Core0/8. Real camera, rifle clicks, AutoRun `=` and Space worked; no synthetic trigger, actor/player teleport setup, position injection or helper code was used. Initial visual route calibration was bounded but imprecise. One authorized observer-only update changed production debug_tag from blank to `039-cleanup-qa`, supported PushChanges Completed and auto-started the game at normal hub. Existing observer reads actual poses/state only. This cook reset precedes the accepted award lifetime; no subsequent session/round restart occurred.

Actual normal navigation then followed measured promenade/corridor: approximately(-294,-15867), west entry(-1671,-16009), real jump onto raised floor, west(-4583,-16018), grounded ramp to starter(-4668,-17147,2597), present0. This is actual arrival, not viewport setup.

| Case | Actual result / exact UTC events |
|---|---|
| Wrong prefix | Actual Pop2 and Heat1 rifle hits result3/prefix0. Successful prefix not invented; tiny-puff visual animation not separately captured here. |
| First learned skill | Load0 result1/prefix1, Heat1 result1/prefix2, Pop2 result2/prefix3; COMMIT creates1 at20:15:07.087. |
| First full left route | Real anchored jumps LAND1 20:15:30.309, LAND2 20:17:40.932, LAND3 20:18:39.631, LAND4 20:20:02.902, LAND6 20:22:19.530, token2. Real reuse hits3/4/5 and commits precede successors. |
| First earned finale | Real receiver7 result2 at20:24:45.445, COMMIT creates−2 at20:24:46.270; actual Core1/8. Capture cleanup-qa-first-finale.jpg. |
| Physical earned Replay | Actual REPLAY POPCORN PARKOUR prompt, real E; RELEASE token2 at20:25:39.294. Actual starter(-4800,-17280), prefix0/checkpoint0; actual Core1 retained. Capture cleanup-qa-earned-replay-prompt.jpg. |
| Second learned/reuse cycle | Real Load/Heat/Pop and reuse3/4/6 accepted token3; commits built successors anew after Replay. |
| Second full right route | Actual LAND1 20:28:16.777, LAND2 20:29:04.446, LAND3 20:29:52.942, LAND5 20:31:01.461, LAND6 20:31:31.630, token3. |
| Second earned finale / one award | Real receiver7 result2 at20:32:29.378, COMMIT creates−2 at20:32:30.205. Actual Core remains1/8. Capture cleanup-qa-second-finale.jpg. This closes the previously missing earned Replay→second full completion award-retention cycle. |
| Owned physical finish Return | Bounded real approach/aim corrections eventually established actual RETURN TO HUB prompt near(-2051,-16868). Real E produced RELEASE token3 at20:37:57.397; actual hub(-700,1500,2489), prefix0/checkpoint0. HUD module attempt cleared, Core1/8 retained and hub 7 SKILLS RESTORED visible. Captures cleanup-qa-owned-return-prompt.jpg and cleanup-qa-owned-return-hub.jpg. |

Actual anchored air/ground samples, SHOT/COMMIT/LAND/RECOVER/RELEASE events are preserved in legacy-button-cleanup-qa.log. Successful commits alone are not a blanket acceptance of every mechanism/comedy animation; this run physically observed built decks and movement, existing route/art evidence remains separately applicable.

Rim/inset evidence: first token2 LAND1 followed by the first observed grounded sample88ms later at x=-4393.556,y=-17214.982, with deck1 minX=-4400 (6.44cm inside). No further movement was issued until reuse aim; the character stayed at that pose. Actual receiver3 hit returned0 there, then a real27.2cm walk to x=-4366.357 allowed result2/commit. This supports actual forgiving near-rim landing plus stricter shooting inset; exact controller landing-event position was not logged, so the 6.44cm figure is the immediately following grounded sample, not an invented exact event position.

Two actual first-cycle misses recovered to checkpoint3 and4 with prefix3/built7 retained; health100 remained visible. These are valid misses, not defects. Every-gap/crouch recovery and exact threshold timings were not exhaustively repeated here.

No reproducible new gameplay defect was found in the exercised cleanup/earned-cycle cases. Physical entry Return is still unverified; current enabled/visible native state is insufficient to close that separate case. Existing unfinished runtime teleport-failure, stale/round/departure/final-beat cancellation, crouch/every-gap recovery, full Agent prerequisites and journal isolation remain explicit. Foreign-player runtime remains conditional N/A for previously verified configured solo cap1/social join disabled/JIPWatchOnly; no multiplayer admission test claimed. Muted/new-player learning/enjoyment and child validation remain unobserved. No blanket R01–R10 acceptance.

## Shutdown and ownership

StopGame Completed; fresh GetGameState CanStart. Observer debug_tag restored blank, read back blank; targeted level SaveAssets true and IsDirty false. Final fresh GetGameState CanStart. No camera/SpawnAtViewportCamera setting was changed this run; no restoration needed. Current cooked observer tag remains only in the already cooked session until a future normal cook; saved native tag and source default are blank. UEFN left open. No pending tool calls. Editor ownership explicitly released to Supervisor after this checkpoint.
