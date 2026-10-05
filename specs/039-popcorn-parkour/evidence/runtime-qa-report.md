# Independent temporary-harness runtime QA — r04

2026-10-04 UTC; verifier `/root/gameplay_verifier`, dispatched gpt-6.1-sol. Scope: authorized temporary three-deck harness only, per runtime-verification-scope.md and runtime-authorization.md. No production map implementation or acceptance. No source, actor, design, approval or task edits.

Checkpoint controller SHA256 CE37A9B5F9D9F88B0B612CB8CD5C29F4CB9FB1F90BC6A267E98BB170E8A3C897, native tag 039-B-r04. Fresh independent StartGame used already cooked checkpoint; no new push. Actual keyboard/mouse Fortnite inputs and local cooked Verse log are evidence; no synthetic Trigger calls. Raw fresh events: [runtime-qa-r04.log](runtime-qa-r04.log). Physical observations used fresh sky screenshots; screenshots were inspected directly, not persisted.

## Expected / actual scenarios

| Requirement | Setup and actual steps | Expected / actual and disposition |
|---|---|---|
| R02 | Grounded starter; real rifle Heat shot before Load at 12:34:29.754 | result3, prefix0, checkpoint0; visible “Tiny puff! Next: LOAD.” Wrong-first rejection and next cue passed for this shot. Full ribbon/comedy/muted-audio acceptance remains unverified. |
| R02 | Real Load, Heat, Pop shots at 12:35:55.996, 12:36:22.650, 12:36:32.873 | Prefix1/2/3; each respective physical mechanism GetTransform rises25cm and returns0; COMMIT creates1 only after Pop motion ends, 12:36:33.152. Passed bounded teaching sequence. |
| R04 | AutoRun without Jump across created deck1 and existing deck2 | Grounded probes present1/2 but checkpoint0; walking did not earn a landing. Passed walk rejection. |
| R05 | Walked off course/front while owning checkpoint0 | RECOVER node0 at 12:37:34.605 retaining prefix3/built3; next grounded starter probe12:37:34.703. Safe return observed; health remained100. Passed starter recovery behavior only. Exact time from crossing recovery threshold to return cannot be measured from0.5s probes, so <=1s guarantee unverified. |
| R04 | Returned to starter, actual AutoRun+Space | JUMP from0 at12:39:11.694; airborne probe12:39:11.894; LAND node1 at12:39:12.397 with jump_from0, then checkpoint1. Passed actual jump credit. Practical rim attempt landed in interior, so JQA01 exact20cm rim physical regression remains not verified; source fix is separately reviewed. |
| R03 | At credited node1, real rifle shot reuse target3 at12:39:41.269 | Three ordered mechanism motions each25cm up/down, COMMIT creates2 at12:39:42.090 after final motion. Screenshot also showed raised mechanism. Passed bounded reuse motion/commit ordering. |
| R03 | Shot same consumed receiver again12:39:54.504 | result4 and visible “Already popped!”; no repeated execution. Passed consumed guard. Pending rapid-shot case not freshly tested. |
| R08 | Walked off node1 toward+Y; probe12:40:24.009 x-3697.052,y-16970.239,feet2429.68; RELEASE12:40:24.426 | Actual catch ymax-17000 excludes this miss position; continued departure crosses bay ymax-16800. Attempt resets, owner releases, created deck1 disappears and prefix/checkpoint0 on return. Passed ordinary departure reset. This is not evidence of recovery1 failure or success. |
| R08 | Returned physically to starter after release | Independent physical Replay was not completed within bounded run. Implementer prior r04 Replay evidence remains implementation evidence only, not independent pass. |

Native device GetDeviceProperties readback, rather than assumed source defaults: bay min(-5000,-17800,2300), max(-2900,-16800,3500); catch min(-4800,-17700,2300), max(-2950,-17000,2480); origin offset77.15cm, grounded tolerance35cm, shooting inset20cm. The tested +Y miss lay outside catch. Three deck tops2520cm at x-4200,-3750,-3300,y-17300. Layout remains a diagnostic harness, not the full approved course.

## Disposition and limits

No new reproducible actionable defect observed in these bounded scenarios. This is partial runtime evidence, not full feature acceptance. Existing source/static acceptance does not establish physical acceptance.

Not verified independently: exact rim landing JQA01; recovery from checkpoint1 and <=1s timing; native teleport failure/retry; finale and cancellation during final beat; Return, Replay, round reset/removal; banked-jump/external-teleport adversarial cases; both full production branches; cross-player attribution; all production milestones/one-time badge/Core/HUD/Agent integrations; muted-audio comedy; first-time learning/enjoyment/child validation. Existing diagnostic-A self_check and earlier worker terminal/Replay runs are separate implementation evidence, not this fresh run. Python YAML contract tests are not Verse execution.

UEFN Verse build and cook were previously recorded by Implementer. Project > Validate Project was not independently run in this bounded handoff; cook is not project validation.

## Shutdown / ownership

QA StopGame returned Completed; subsequent fresh GetGameState returned CanStart (non-running) at end of run. UEFN left open; harness preserved for authorized Implementer cleanup. No pending editor/MCP/UI calls. Exclusive editor ownership explicitly released to Supervisor before writing this report offline. QA did not change saved editor content.
