# Independent QA — 033 navigation + 037 solo Academy

Worker `/root/gameplay_verifier`, explicitly GPT-6.1 Sol. Offline review and fresh native/cooked check 2026-10-04 local time (2026-10-03 UTC). Scope reviewed with delegated authority recorded in both authorization.md files. Both plan --ready checks passed;033 digest cafb12ef59c9ea2cf777a92838515e2ccbe16278d433fc5d3932a8ae26141ad8;037 digest0fb9032f563b0c290f50b3fcff2451b22586a7784f94abd4a3572687a856cf5a. QA did not edit source, assets, approved design, settings or task checkboxes.

**Partial acceptance only.** Fresh normal-spawn HUD, basic walking/menu return, final scene transforms and solo settings pass focused checks. No complete eight-module normal journey, earned-progress lifecycle or admission-path proof. The confirmed sign-copy defect is closed by the focused native/cooked retest below.

## Fresh independent evidence

- Native readback `qa-native-final.json`: all25 final actor positions/scales agree with implementation-native-final.json (9 markers,8 labels,8 lights). Canonical scalar savedActor subset resolved: markers0/7/HUB8, Core labels0/7, lights0/7, journal Open button. Full25 binding audit is referenced Implementer evidence, not freshly rerun QA coverage.
- Native solo settings freshly read all player/session/team/party/min/target caps1, socialJoining Disabled, joinInProgressBehavior WatchOnly; descriptionData empty. These establish configuration, not actual second-account/platform admission.
- Fresh Session StartSession Completed; game initially CanStart, then StartGame Completed with no PlayFromHere coordinates or positioning fixture. Normal spawn screenshot `qa-normal-spawn.png` shows readable0/8 and Next:1 Prompt Workshop. No timed2s spawn measurement made, so timing criterion is not passed.
- Real equal-key autorun then W stop changed actual world/player view; count remained0/8 and guidance persisted. `qa-walk-minimap.png` shows numeric1/2/3/4/5 andHUB readable away from spawn, with player arrow separated. This tests ordinary walking only, not every destination route.
- M opened scoreboard; clicked actual MAP tab. `qa-overview-away-spawn.png` shows all1..8/HUB distinguishable at default overview scale after moving away. HUB/2/3 cluster is tight but no static3/4 occlusion defect was reproduced. Earlier pre-iconScale.45 screenshot concern is superseded by this fresh observation. Escape closed the map and returned gameplay view. Journal open/close was not attempted after walking away from its button; it remains untested.
- Read final fixture-free source: no diagnostic positioning/view/caption functions; canonical module mapping and later tracker order{0,1,2,3,5,4} correct, optional Prompt source8 maps module0. Reports do not award badges. Missing-binding selection bug identified offline was corrected: skip unavailable incomplete modules, Agent requires first7, incomplete count never falsely selects Replay/Explore, missing completion diagnostic names module and deduplicates. Runtime controlled missing-binding test remains not run.
- Feature036 final repair source hash unchanged4290341256c8fe68a7d2a465769dfaf5a6f3cbfbc6a13d755ab4cc191fad30d7. Native/source preservation is not a fresh hangar playtest.

## Referenced evidence, explicitly not fresh QA runs

Implementer fixture-free final BuildAll[]/SaveAlltrue/full production cook Completed and source hashes in implementation-progress.md. QA's own ordinary session launch also Completed but no separate project-validation command was executed.

Directly inspected cooked-core-eight-readable.png: all8 numbered WAITING labels legible simultaneously, in canonical order. This capture used temporary camera positioning before final fixture cleanup; not proof of walking access or RESTORED/light transitions.

Directly inspected cooked-tool-real-badge-hud.png: board3/3 TOOL MASTER BADGE, HUD1/8 and6 AI Tool Lab Step3/3 visible. Scanner/Speaker/Light real K inputs and original Error Return real E recorded by Implementer with temporary positioning only, no seeded events/badges. Those are referenced dependency tests, not independent QA replay or a normal eight-module journey. Fire baseline restoration is reported/captured in test-fire-binding-restored.png.

## Scenario dispositions

| Scenario | Setup / expected | Actual and status |
|---|---|---|
|033 AC01|Fresh spawn0/8 Workshop destination within2s, signs/journal agree|**Partial**: fresh HUD/ordinary spawn correct; timing/journal not measured; corrected optional/solo copy retest passed|
|033 AC02|Third distinct completion3/8,<=1s update/4s handoff|**Not run**; referenced first Tool completion only|
|033 AC03|Replay/alternate Prompt no duplicate badge/celebration|**Not run**; authoritative unique source reviewed|
|033 AC04|All module markers/maps/Core names; follow every route, pulse stops on entry|**Partial**: fresh overview1..8/HUB and local minimap readability;25 native poses match; allroutes/pulse behavior not tested|
|033 AC05|Each activity state/actual step/action/retry/exit|**Partial**: nine source integrations reviewed; referenced Tool Step3/3; actual allcontrollers not played|
|033 AC06|Agent locked at6, unlocks at7|**Not run**; source gate correct|
|033 AC07|Actual Agent completion8/8/finale/no pulse|**Not run**|
|033 AC08|Partial earned progress Replay/respawn/round reset and stale messages|**Not run**; fresh0 round alone cannot establish earned retention/reset|
|033 AC09|Superseded multiplayer acceptance|**Superseded** by037 admission/lifecycle; no multiplayer claim|
|033 AC10|Keyboard/controller/compact UI journal/menu input|**Partial**: desktop keyboard walk/map/Escape and readable persistent HUD; journal/controller/compact not run|
|033 AC11|Controlled missing completion binding diagnostic/no false8/8|**Source retest passed**, runtime **not run**; no destructive QA fixture installed|
|033 AC12|Out-of-order recommendation/stale-round handoff cancellation|**Not run**; source canonical selection reviewed|
|037 SA01|Settings1 plus actual second-player admission attempts|**Partial**: native caps/settings pass; party/private/social/JIP secondaccount unavailable/not run|
|037 SA02|Fresh0/8/Workshop/solo copy/no negotiation|**Partial**: fresh HUD/start signs observed; optional/solo copy corrected and retested; fulldescription not set|
|037 SA03|Legitimate completion exactlyone Coresegment/count, no duplicate|**Partial**: referenced Tool1/8 only; actual Core RESTORED/light/replay not verified|
|037 SA04|Return/Replay/respawn preserve earned; newround resets/cancels|**Not run**; source guards retained|
|037 SA05|Sixlocked/sevenunlock/eightactualrescue/finale|**Not run**|
|037 SA06|Three Skills challenges solo; duplicate controls inactive; optionalpreserved|**Native/source only**: retirement audit referenced; actual challenges/optionalregressions not run|
|037 SA07|Normalspawn eightmodule route/shots/Return/replay/no fixtures/shutdown|**Partial**: sourcefixturefree, fresh normalspawn/walk/shutdown; dependencyinputs referenced; fullroute not run|

## Historical defect and remaining limitations

P2 copy/navigation defect, FR006/SP002, hub greenhouse — CLOSED by final focused retest below. Historical pre-fix observation: fresh normalspawn shows dominant blue PROMPT LAB card adjacent to smaller Workshop-start instruction. Native read-only component discovery confirmed actor campus_path_greenhouse at PersistentLevel.Actor_UAID_E89C2592D1B5C20303_1735497153 owns campus_garden_entrance_text text='PROMPT LAB' and campus_garden_branch_text='PROMPT<br>LAB'. Reproduce with a fresh normal spawn looking toward greenhouse. It can direct first-time players to the optional older Prompt area without clear optional wording. Responsible Implementer through Supervisor: narrow text correction only, then saved/cooked copy retest. This is a visible-source copy defect, not an unidentified baked material or evidence for geometry edits.

Existing Performance Warning: See editor visible. Separate Project > Validate Project not exposed in prior bounded menu inspection and not independently run. Unsupported description metadata empty; no claim of a saved solo game description. Full learning/timing/comprehension route, compact/controller and second-account paths remain open. QA did not accept whole features based on native/source success.

## Shutdown and ownership

Native StopGame Completed, StopSession null; fresh GetGameState Unconnected/GetSessionStatus Disconnected. Editor left open. No in-flight calls. Ownership explicitly released to Supervisor before writing report so Implementer may correct the confirmed sign text; this report captures the pre-sign-correction production revision. QA must retest that focused correction before closing this defect.

## Final focused copy retest and bounded journal attempt

Fresh independent native TextRender readbacks: campus_garden_entrance_text = OPTIONAL PROMPT; campus_garden_branch_text = OPTIONAL<br>PROMPT. Current normal cooked spawn/view confirms the lower OPTIONAL PROMPT and readable academy title Solo: restore Pix / Start: 1 Workshop. Directly inspected Implementer cooked-production-solo-optional-final.png also shows all title lines fitting and the older arena optional copy. The high entrance was independently checked natively; no fresh cooked framing of that high sign. P2 FR006/SP002 copy defect CLOSED. Changes were confined to the reported copy; prior geometry/settings coverage remains applicable.

Started a fresh normal session without fixtures; production HUD again 0/8 Next:1 Prompt Workshop. Journal button saved position (-300,1000,2500), yaw -90, scale1; native InteractionRadius 0.5 m. A real tap A produced negligible displacement. Observed camera drags aligned the visible pedestal; drag incidental rifle shots hit scenery and no completion occurred. Real equal autorun then W stop across separate screenshot calls overshot the pedestal into grass. No E interaction prompt or journal panel was reached. Journal open/close and its two-column/locked-Agent layout remain NOT RUN: bounded input approach did not establish proximity. This is a QA-control limitation, not evidence that the journal is broken. No forced events, badges, teleports or settings changes used. Full feature acceptance remains incomplete.

Final shutdown: StopGame Completed; StopSession null; fresh GetGameState Unconnected and GetSessionStatus Disconnected. Editor left open, no in-flight calls. Explicit ownership released to Supervisor before report update.

## Final authorized short-burst retry

A second fresh normal session automatically reached Running after connection; no fixtures. Observed camera alignment put the journal pedestal near centre. Executed exactly three real equal/W autorun-stop bursts in the same supported node script, with 250/400/400 ms intervals, capturing only after stopping. This avoided the earlier overshoot and moved gradually toward the pedestal. At the authorized three-burst limit the player was still visibly several metres away; no E prompt, panel, or collider contact reached. Saved qa-journal-bounded-retry.png. Journal input/layout remain NOT RUN; this does not prove a button or collision defect. No further sessions attempted.

Latest shutdown independently verified StopGame Completed, StopSession null, GetGameState Unconnected and GetSessionStatus Disconnected. Editor open, no in-flight calls; ownership explicitly returned to Supervisor. Copy defect remains closed; all other coverage limits above remain.

## Completed real journal acceptance retest — supersedes earlier approach limits

Fresh normal spawn, no fixtures, five observed 400 ms equal/W autorun-stop bursts reached the pedestal and visible E OPEN MY AI CORE JOURNAL prompt. Native 0.5 m radius is reachable on this tested approach; no collision/reach defect reproduced. Lowercase e produced no visible panel; capital E opened the actual journal. qa-journal-open.png independently captures 0/8 MODULES ONLINE, all eight canonical module names/states, seven Available and Agent Mission Locked, Next:1 Prompt Workshop with actual choose core/size/destination objective, and WORK/CLOSE controls. All rows, including locked Agent, fit without wrapping/truncation at this desktop resolution; recommendation agrees with persistent HUD.

Clicked visible CLOSE: first click focused it, second click closed the panel and returned gameplay, persistent0/8 HUD and E prompt. qa-journal-close.png captures that return. PASS for this real desktop journal open/close and initial-state layout subset of AC01/AC10 and SA02. WORK action, earned/replay states, compact/controller layout and all other previously unverified scenarios remain unverified; no whole feature acceptance inferred.

Final shutdown after successful interaction: StopGame Completed, StopSession null; fresh GetGameState Unconnected/GetSessionStatus Disconnected. Editor open, no in-flight calls; explicit ownership returned to Supervisor.

## FR005 locked Agent copy/layout closure

Offline independent review of current source and Implementer cooked-journal-locked-final-fit.png closes the remaining FR005 explanation defect. locked_text now says Locked - restore all 7 other modules. Journal formatter places Skills and Agent on separate lines. Direct visual inspection confirms the full Agent condition fits on one readable line, all eight canonical modules remain visible, Next Workshop objective fits, and WORK/CLOSE controls remain unobstructed at the captured desktop resolution. This is referenced Implementer cooked evidence, not a new independent input replay; earlier independent real E/open and visible Close test remains applicable to this copy/newline delta. Compact/controller and actual seven-module unlock are still unverified.

Current journal SHA256: 463B654FAE2B8BCB6E28BFD9F1C0E579C52E30C8A295E5E98BD387EBB34D9031. Source lines120/135 contain the corrected message and split rows; module_status still returns locked_text for Agent before first seven. No QA source/asset edits.

Latest production shutdown is referenced Implementer fresh readback relayed by Supervisor: journal closed, StopGame Completed/StopSession null, Unconnected/Disconnected, editor open AllSaved, no in-flight calls and explicit release. QA independently verified the preceding production shutdown before this copy-only delta; no new QA editor calls made for this retarget. Whole feature acceptance remains incomplete.
