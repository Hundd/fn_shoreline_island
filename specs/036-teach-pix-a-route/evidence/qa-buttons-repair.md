# Independent focused QA: button and label repair

2026-10-03, worker `/root/gameplay_verifier`, explicitly GPT-6.1 Sol. Exclusive editor ownership granted after Implementer released all calls. Scope is the reported nonworking controls and unreadable control panels; full feature acceptance remains open. No gameplay/source/asset edits, new session/cook, UI input or fixtures made by QA.

**Focused repair supported by source/native checks and referenced cooked evidence. No blocking defect found in this scope.** Real HOME input and readability evidence was captured by Implementer; QA independently inspected it, not independently repeated input. Full walked delivery/bypasses, real TEST input and separate Project > Validate Project remain unverified.

## Independent source and native checks

Final source SHA256 independently matches `4290341256c8fe68a7d2a465769dfaf5a6f3cbfbc6a13d755ab4cc191fad30d7`. No diagnostic positioning/pose fixture function or its startup call remains. The remaining TeleportTo calls operate marks/robot/crate, not players. All five `safe`/`inside` calls now pass raw `delivered_one`; intentional conditional logic queries remain. This addresses the false-query failure before first-delivery geometry. HOME recording still gates actual player within100cm; native interaction radius independently reads2m. Explicit outside-pad/ground/zone feedback exists.

Startup assembles scalar label refs into runtime control_labels, checks props IsValid and label position ranges before enabling controls/subscribing. Invalid bindings disable controls and log a specific error. set_mark returns teleport success; append_point rejects failed new/oriented marks with visible retry. This meaningfully improves the earlier length-only preflight and silent mark failure. It does not independently establish every playback/lifecycle scenario.

Evidence `qa-buttons-repair-data.json`: fresh configured=true; Home/Load/Cancel scalar wrappers' savedActor refs match replacement suffixes1809328293/1809742294/1810246295. Each native transform matches approved positions `(6500,-13700,2524)`, `(8050,-13700,2524)`, `(6500,-13950,2524)`, scale.4, yaw+90. Fresh settings are text24, Two Sided, opaque dark background, borderoff. Native prefix search finds151 hangar_route actors; replacement labels have names `fn_shoreline_island_bot_3_label_home_repaired`, `...load_repaired`, `...cancel_repaired`, so dedicated inventory remains154 when those3 are included. No missing3-actor defect should be inferred from prefix count alone.

## Independent visual assessment of referenced captures

`bugfix-readable-home.png`: HOME / SHOW AGAIN is legible with separate CANCEL panel, no overlapping control cards in this shown view. Real HOME interaction phase0 and POINT0/POINT1 logs are visible; E prompt reads SHOW AGAIN and HUD instructs walking to LOAD. This supports the repaired input transition and Home/Cancel readability. The capture was from Implementer's startup-positioned diagnostic run, not final fixture-free independent play. It does not prove a full footprint chain, actual walking or delivery. Large carried crate occupies the central view in this capture; viewing/escort comfort remains full activity QA, not established by this narrow repair.

Earlier `bugfix-home-recording.png` supports the HOME event/recording transition but lacks visible replacement labels; it is not label-fix proof. LOAD readability is reported by Implementer in bugfix-buttons.md; no supplied LOAD screenshot independently inspected here. Final fixture-free startup/build/cook referenced from bugfix-final-native.json and bugfix-buttons.md: diagnostics[], channels Completed Successfully20:14:40, startup subscriptions/reset20:14:42 without invalid-binding log. No fresh independent build/cook claimed.

The earlier array-specific hypothesis is disproved by recorded same-match scalar failure and successful official-catalog actor replacements. QA did not treat array conversion alone as proof of repair.

## Limitations and documentary discrepancy

No fresh QA real-input run attempted because session was already stopped and focused referenced input evidence was sufficient to inspect this reported fix without repeating cook/positioning. Full AC01..11 not accepted. Actual TEST E, visible walked footprint chain, two deliveries, closure stop, both bypasses, multiplayer and separate Project validation remain unverified. Existing screenshot Performance Warning: See editor remains; no warning resolution claimed.

Nonblocking evidence correction for Supervisor: definitive prose says yaw-90 while final JSON and fresh native reads show+90. Two Sided rendering and supplied Home screenshot support readable repair; report actual+90. Also account for replacement naming when stating154 total rather than154 hangar_route-prefix matches.

## Shutdown and handback

Fresh native GetGameState=Unconnected and GetSessionStatus=Disconnected. No active game needed stopping; UEFN left open. No in-flight editor calls. QA authors only this report/data; editor ownership released to Supervisor after final native status. Findings are verification evidence, not human design approval.
