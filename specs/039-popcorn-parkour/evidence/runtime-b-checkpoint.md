# Runtime B implementation checkpoint — 2026-10-04

Approved temporary diagnostic scope only; human record `runtime-authorization.md`. Production map/digest unchanged and production gameplay unaccepted. Implementer exclusively owned serialized MCP/Computer Use until stopped handoff; independent QA owns editor afterward. No temporary actor cleanup before QA.

## Saved source / build / configuration

- Controller SHA256 `CE37A9B5F9D9F88B0B612CB8CD5C29F4CB9FB1F90BC6A267E98BB170E8A3C897`.
- Harness SHA256 `DEF46941801F3BCE1F8E5094D85190E5D31840111DF05685786B9270C49B1B7E`.
- Shared data_target SHA256 `AC6431D25453175C5EA355EACEBDE812C3EE52D0CAD88616973B9B041ECB4D06`.
- Last authoritative `ValkyrieToolset.VerseToolset.BuildAll` returned diagnostics `[]` after JQA01 repair. A transient3509 logic-to-string telemetry error was corrected before this successful build. Native full PushChanges returned Completed, cooked r04 actually logged READY and probes. A fresh cook initially retained editable r02 tag; native debug_tag was corrected/read back/saved, then r04 full push executed. Do not confuse native editable tag with source file text.
- 9 Python contract tests rerun successfully; these inspect YAML geometry/constraints and do not execute Verse. Actual Verse fixture result0 is separately recorded in `runtime-diagnostic.md`.
- Exact68 temporary actor refs/labels in `runtime-actor-inventory.json`; saved assemblies/native bindings in `runtime-b-setup.md`. Three deck tops2520, size400x400x40, gaps50; north-strip placement review records collision clearance. Native editable final readback: tag039-B-r04, origin offset77.15, tolerance35, shot inset20. Shared production progress/controls remain unbound to diagnostic. Isolated progress/tracker only.

## Actual cooked observations

All rifle events below are real Pulse Rifle mouse clicks, not Trigger calls. Ammo is configured infinite, displayed∞/0; beam/native target Hit→SHOT plus state change are evidence, not ammo decrement. Raw character telemetry comes from actual GetTransform/IsOnGround; no simulated poses. Exact log exports `runtime-b-r02.log` and `runtime-b-r04.log` preserve UTC timestamps. r02 includes later fresh sessions retaining its editable tag; use timestamps/source checkpoints to distinguish them.

| Observation | Actual evidence |
|---|---|
| Measured surface origin | r02 catch rawZ2489.15 on measured floor2412; starter standing rawZ2597.15 on top2520. Initial feet-origin assumption failed present=-1, repaired by subtracting77.15 rather than widening tolerance. Actual crouch rawZ2572.40 remained on starter with35cm tolerance; this is not exhaustive stance coverage. |
| r02 teach / reuse / finale | 12:05:50 Load prefix1;12:07:30 Heat prefix2;12:07:40 Pop prefix3;12:07:41 creates1. Real AutoRun+Jump produced ground0 then LAND1 at12:08:50. Receiver3 real hit12:09:21→creates2. Second real jump LAND2 at12:13:03; finale real hit12:14:01→COMMIT creates=-2. |
| r02 recovery | Walked off terminal; RECOVER node2 at12:14:14.804 and12:14:15.508, prefix3/built3 preserved. Next stable rawZ2597.15/present2. Continued AutoRun caused second departure; no recovery teleport was counted as a jump. Native teleport failure and <=1s from actual catch-floor contact were not induced/measured. |
| R04 discovered defect | Ordinary walking crossed50cm physical gap at12:14:30–32, sampled ground1/Z2597.15; geometry is physically walkable. Original controller would credit forward walk too. No gap widening or production geometry change. |
| r04 wrong first / named cues | Actual Heat first12:25:23.318 result3 prefix0/checkpoint0. Visible NEXT:LOAD remained; later Load changed NEXT:HEAT, Heat NEXT:POP. HUD puff timing/entire ribbon readability still independently pending; particles partly obscure view. |
| r04 physical mechanisms | Actual Load12:26:07, Heat12:26:32, Pop12:26:54 each logged corresponding prop GetTransform delta_z25 then0, homeZ2570/raised2595. Saved receiver3 hit12:28:59.868 executed steps0,1,2 sequentially, each25→0, then COMMIT creates2 at12:29:00.688. This proves actual props moved, not just VFX. |
| r04 walking denied | AutoRun without Jump reached middle at12:27:12.975: x-3830.177/y-17121.207, ground1/present1, prefix3/checkpoint0. Continued grounded presence never credited1. Jump in place on uncredited middle12:27:24–26 returned grounded, checkpoint0, no JUMP/LAND authority. |
| r04 real jump accepted | Returned physically to starter. Actual AutoRun+Space departure12:28:02.462 logged JUMP from0/feetZ2567.90/token2; airborne pose12:28:03.064, then LAND1 jump_from0 at12:28:03.261. Settled rawZ2597.15/present1/checkpoint1. Exact outer20cm edge contact was not achieved in this run. |
| r04 Replay | Returned by ordinary walking to starter/back control. Actual e interaction on Replay emitted RELEASE token2/prefix3/checkpoint1 at12:31:14.569, restored starter prefix0/checkpoint0 and reset geometry. No scripted interaction function used. |

## Bounded R04/JQA01 repair contract

Physical grounded contact anywhere inside the deck footprint may earn landing credit only after a qualifying upward airborne departure from the last sampled credited checkpoint. Departure feet must rise above checkpoint top+35cm. Proof binds generation/checkpoint; every grounded observation consumes it, including same-deck jump-in-place and uncredited decks. Recovery/release/Replay/Return/round-reset clear it. Shots still require the20cm inset. This resolves JQA01's source edge-contact rejection without globally banked proof or geometry changes. Actual exact-edge jump remains pending independent runtime verification. Monitor sampling is0.1s; external teleport-between-polls hypothesis is not established. Production prose/map metadata must reconcile physical-footprint arrival versus inset shooting before final map review; this checkpoint does not regenerate/approve map.

## QA recipe and remaining scope

Observed existing bindings: '=' Toggle AutoRun, Space Jump, e interaction; no keybinding edits. Computer Use `sky` window2 inputs only. Session refresh resets pointer center; screenshot-guided mouse deltas drive aim. Starter yaw90. On fresh center pointer: Heat929,562; Load1051,567; Heat929,562; Pop785,572 worked. Face+X before AutoRun+Space;450–800ms then toggle AutoRun off, allow grounded settlement. Coordinates depend on preceding pointer/input and must be re-observed. Replay small yellow control at[-4350,-17550,2550], not neighboring boards; approach while staying on starter then aim down/e. Startup test teleports catch then starter after island routing settles are positioning only, not physical jump evidence.

Pending independent QA: exact edge landing/inward entry, pending/rapid/cancellation/Return/bay exit/round reset and foreign owner cases, isolated one-time milestones/replay prior-earned state, teleport failure, full stance/collision coverage, required full-course branches/platforms, readability/muted feedback. Full production asset presentation and five essential production jumps unverified. Successful cook is not a separate Project>Validate Project result; explicit project validation remains pending. A01/A02 retain these exact unresolved production capability/binding evidence requirements.

## Shutdown / ownership

After Replay, StopGame returned Completed; fresh GetGameState returned CanStart. Harness actor saved; final tag/height settings read back. Existing unrelated dirty state was preserved; no SaveAll or production asset saves. All prior diagnostic actors saved at placement checkpoint; latest affected harness saved again. No editor/MCP call remains in flight. Editor left open and released to Supervisor/independent QA. Local log exports/docs completed afterward only. Enumerated cleanup awaits explicit post-QA handoff; runtime goal remains active until cleanup/shutdown objective fulfilled.
