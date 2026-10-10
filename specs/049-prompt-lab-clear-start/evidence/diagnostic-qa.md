# Existing Prompt Lab diagnostic QA

Date: 2026-10-09. Host: Codex; dispatched QA worker `gameplay_verifier`, configured model `gpt-6.1-sol`. Scope: existing optional `prompt_lab_navy_floor` mission, no approved redesign and no source/asset changes. This report is diagnostic evidence, not approved-design acceptance.

## Fresh session evidence

- Native SessionToolset schemas discovered before use. Initial status `Disconnected`.
- `StartSession(location={7500,-5200,2600}, rotation={0,0,0})` returned `Completed`. Location requests Play From Here according to the live schema; it would not by itself establish normal grounded approach behavior.
- Editor log at `C:/Users/Andrii_Polchaninov/AppData/Local/UnrealEditorFortnite/Saved/Logs/UnrealEditorFortnite.log` records beacon connection at 10:02:39 UTC, content upload completion at 10:02:41, server-platform cook complete at 10:02:43 awaiting client platforms, and authentication verification success at 10:03:06. No authentication blocker was reproduced. Raw launcher arguments contain credentials and are intentionally not copied into this report.
- After launch, native status was `Connected`, game state `CanStart`. `StartGame` returned `Completed`; readback returned `Running`. This establishes a launched running match, not successful Prompt mission enrollment.
- Computer Use selected the unique returned Fortnite client window. Capture failed: `IGraphicsCaptureItemInterop.CreateForMonitor failed: Could not capture the given monitor. (0x80070057)`. A single recovery refreshed returned windows and attempted activation/capture; it failed `GetCursorPos failed: Access is denied. (0x80070005)`. No movement, shooting, replay, or other player input was issued.
- Native `GetClientLogEntries` with a narrow error/Prompt/minigame pattern returned `No client log was found; start a play-in-client session first.` despite native Connected/Running evidence. No Prompt runtime state could be recovered from that tool.

## Scenario results

| Candidate acceptance | Expected | Actual/status |
|---|---|---|
| Normal west/north approach, ten re-entry/replay attempts, respawn | Starts once from ordinary grounded access | **Blocked:** running match reached; desktop capture/input unavailable. Zero approach trials completed. |
| Walk within intended play area | No unexpected stage reset | **Blocked:** no observed player trajectory or runtime occupancy. |
| Every active target, standing/crouched and moving sweep | Visual, label and hit area correspond without hidden obstruction | **Blocked:** no cooked sightline capture or shots. |
| Wrong choice, completion, replay and exit | Safe retry, sequence/rewards retained, return works | **Not run:** dependent interactive steps unavailable. |
| Learning/fun feedback | Player explains LARGE and destination | **Not run:** no human tester feedback. |

Multiplayer was not tested; this task does not add a multiplayer gate to the existing solo scope.

## Confirmed inspection facts and limited implications

Current source `Content/fn_shoreline_island_prompt_blaster.verse` initializes/reset state before subscribing, then scans `entry_zone.GetAgentsInVolume()` once after 0.2 seconds (lines 103–131). It already includes an initial-occupant recovery. The intro sleeps 2 + 7 seconds before choices activate (lines 196–212). A silent wait could be perceived as a failed start, but that perception was not reproduced here.

`on_exit` clears the journal and calls `on_leave`; when the participant map becomes empty, `on_leave` resets the room (lines 150–156, 374–377). Therefore leaving the enrollment volume during play can reset the solo mission by design. Whether normal movement actually leaves it remains untested. Survey settings record center `{7500,-5200,2600}`, width 6, depth 12, height 3, gameplay-only, any team/class. Generic actor bounds for the zone are much larger than the nominal settings and cannot be substituted for measured runtime volume occupancy. Floor bounds in the same survey are X 6000–12600, Y -8500–-2300, top Z 2410. A partial/raised volume remains a candidate, not a demonstrated defect.

The retained survey records target 0 hit anchor `{9000,-3300,2630}` while `prompt_lab_blue_delivery_core` bounds center is approximately `{9350,-3300,2605}`: 350 cm X / -25 cm Z offset. Equivalent offsets appear for the red/green cores and small/large blue presentations. This is a measured presentation-to-anchor difference, not proof of the cooked object intercepting a shot. The controller translates the moving visual and hit anchor by the same ±250 cm Y sweep, preserving their initial relative offset. Historical 026 replay evidence independently recorded shooting a decorative blue sphere reaching the wrong answer until the tester aimed at the ring; that is prior-version evidence, not a fresh reproduction.

`fn_shoreline_island_data_target.OnBegin` deactivates then sets `startup_ready`; the Prompt controller does not await that flag. A sufficiently late target startup after activation could deactivate it, but the Prompt intro delays activation nine seconds. No ordering/timing trace demonstrates that race here. Do not label it the cause or add a readiness framework on this evidence alone.

## Narrow next actions

1. Restore a visible usable desktop capture session, then reproduce ordinary west/north approach and actual volume departure before choosing geometry or lifecycle fixes. Record stage/occupancy/reset together. Preserve existing reset behavior unless its scoped change is reviewed.
2. Inspect each stage's ring/core/label correspondence and actual obstructors from normal firing positions. Start with the measured 350 cm presentation offset and historically confusing blue sphere. Align only confirmed mismatches or remove only confirmed blockers; retain unaffected assemblies and the nine target IDs.
3. If startup failure occurs while occupancy remains valid, investigate controller/target readiness ordering with measured timings. Current evidence does not justify a full target row, readiness refactor, or intro retiming.

## Shutdown and ownership

`StopGame` returned `Completed`; `StopSession` returned; final `GetGameState` was `Unconnected`, and `GetSessionStatus` was `Disconnected`. UEFN was left open. Editor ownership returned to the Supervisor with no in-flight calls. Interactive diagnostic acceptance remains blocked by desktop capture/access, not by a reproduced gameplay defect.

## Resumed cooked diagnosis — desktop access restored

The owner requested continuation and the Supervisor transferred exclusive editor ownership again. Original attempt above is retained. A fresh native launch completed; `StartGame` completed, and desktop capture/input now worked. Initial interpretation of the welcome/journal as a hub spawn was incorrect: the island map and nearby `REPLAY PROMPT LAB` control establish the optional navy platform near the requested entry position. Global welcome and journal text alone do not identify the current room.

### Reproduced start defect

Standing on the flat floor near Replay, the journal showed the normal next-module guidance, with no optional activity. Two stationary jumps, with no movement between them, each enrolled the player while airborne (`Step 1/5`, `Get ready for the optional Prompt arena.` and spectacle), then cleared that activity after landing and extinguished the spectacle. This reproduces start/reset failure from vertical movement at effectively the same XY, not an unproven readiness race. Captures: `diagnostic-grounded.png`, `diagnostic-jump.png`.

After stopping the cooked game, fresh native inspection measured the actual overlap component:

- Actor: `Device_MutatorVolume_V2_C_UAID_E89C2592D1B5860503_1590440721`, label `prompt_blaster_entry_zone`; survey transform location `{7500,-5200,2600}`, zero rotation, unit actor scale.
- `FNE_VolumeOverlapComponent` relative location/rotation zero, relative scale `{6,12,3}`, mesh `/CRD_Volume/VolumeDevice_Box.VolumeDevice_Box`, `bAbsoluteLocation=false`, overlap behavior `Game`.
  Full component ref: `/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.Device_MutatorVolume_V2_C_UAID_E89C2592D1B5860503_1590440721.FNE_VolumeOverlapComponent`. Read using discovered `ObjectTools.get_properties` fields `relativeLocation`, `relativeRotation`, `relativeScale3D`, `staticMesh`, `fNEVolumeShapeMap`, `sceneQueryShape`, `enableOverlapBehavior`, `bAbsoluteLocation`.
- `StaticMeshTools.get_bounds` for that exact mesh returned local min `{-256,-256,approximately 0}`, max `{256,256,384}`. Thus the component mesh world lower Z is 2600 and upper Z 3752, with X 5964–9036, Y -8272–-2128. The surveyed floor top is 2410: a 190 cm vertical gap below enrollment. This is a bottom-based volume, not a centered box. Component `sceneQueryShape` read back `SphereVolume` despite the box mesh; no setting change was attempted or justified from that alone.
- Planner candidate: retain X/Y, orientation, dimensions and existing lifecycle; lower actor Z from 2600 to 2360 (−240 cm) so mesh lower bound is 50 cm below floor top. This candidate requires approval and post-change grounded/crouched entry/landing tests; QA has not implemented or accepted it.

Severity P1: ordinary grounded entry can fail and jumping starts then cancels the intro. Responsible role: Planner for scoped vertical delta, Implementer after approval, QA for regression.

### Replay bypass and existing sequence

After observing the nearby explicit `E REPLAY PROMPT LAB` prompt, E enrolled the grounded player. The nine-second teaching intro completed without jumping and reached `Shoot BLUE.` The existing five-hit sequence progressed through BLUE, LARGE, large blue, moving core and reactor; completion displayed `PROMPT MODULE ONLINE!`, `Prompt Badge earned`, and `PIX AI CORE: 1/8 restored` (`diagnostic-complete.png`). Intermediate DATA totals 1, 2, 3 and 5 were visible. The final 8 DATA total was not captured, so do not call exact final reward accounting independently verified.

Wrong feedback occurred at the blue-core stage and retained Step 3; a later correct ring shot progressed. This verifies a practical wrong retry but is not a precision hit-attribution test. Supported camera drag also presses the primary mouse button, producing shots during rotation; LARGE and some later successes happened during those drags. It does not change the source or map, but limits per-shot claims. Direct centered BLUE ring click did clearly advance to Step 2 with +1 DATA.

### Target presentation findings

`diagnostic-color-stage.png` shows all three initial cyan rings visible from the grounded Replay vicinity. They sit visibly apart from the colored decorative spheres. The retained measured 350 cm X offset is now also visible in cooked presentation, including the moving sphere and its ring (`diagnostic-moving-core.png`). Labels float well above the ring/sphere group and are small from this viewpoint. This establishes ambiguous presentation correspondence, not an invisible target or confirmed scenery obstruction.

At Step 3 the red and small-blue choice rings overlap strongly in projection from the Replay vicinity, with the red sphere nearby (`diagnostic-core-overlap.png`, `diagnostic-core-wrong.png`). The separate large-blue ring remains reachable; choosing it continued successfully. QA initially misread the overlapping ring as the large-blue choice, then corrected that identification from the separate ring/progression. No exact collision/blocker actor was isolated. The moving ring remained reachable during its sweep. Destination rings appeared and reactor was hit (`diagnostic-destinations.png`). Do not infer all-stage standing/crouching clearance or full-sweep clearance from these limited views.

Recommend preserving target assemblies for the start-only repair. For later presentation work, inspect an ordinary central firing position and improve ring/core/label correspondence only after target-specific review. No evidence supports wholesale relocation or decorative retirement. A short grounded autorun after completion reached the destination-machine area and cleared optional journal guidance; it did not provide an active-stage alternate firing-position comparison, so that request remains untested.

### Revised scenario status and final shutdown

Grounded start reliability: **failed**, stationary jump/landing symptom repeated twice with measured raised volume. Grounded Replay start and five-hit completion: **passed in one fresh solo run**, with input-attribution limits above. Ten normal approach/re-entry/replay attempts, respawn recovery, active-stage walking stability, crouched target visibility, exact final reward/replay reward guards, walking exit and human learning/fun feedback: **not completed**. No multiplayer claim.

Second-run shutdown: `StopGame=Completed`, `StopSession` returned, `GetGameState=Unconnected`, `GetSessionStatus=Disconnected`. UEFN left open. No source, layout, approval or task-checkbox mutations. Editor ownership returned with no in-flight calls.
