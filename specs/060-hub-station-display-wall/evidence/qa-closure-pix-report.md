# Independent closure and Pix QA

Approved revision: b203b91362a43179afd9fd835f356109d881458e8f29c69b432c7baa1aba1cee. Readiness command `python tools/map_workflow.py plan specs/060-hub-station-display-wall/map.yaml --ready` passed. QA made no scene/source changes.

## Results

- PASS, scoped visual: relocated Pix faces the player, PIX label is readable, and the former lower opening is visibly solid cream with navy plinth. `qa-closure-pix-front.png`, `qa-closure-pix-normal-talk.png`, and `qa-closure-pix-wall-frame.png` show this. These captures do not frame the entire bank or prove all eight titles in this revision. Visible 6/7/8 titles and WAITING remain readable, including Pix's Popcorn Parkour.
- NOT ACCEPTED, actual navigation menu: fresh targeted StartSession requested (-1050,1900,2480), yaw90 and completed. Running game showed E TALK TO PIX. Two ordinary E taps did not open a panel; after one W tap a third E tap also did not. A StopGame/StartGame normal spawn supplied the normal rifle; another E tap with visible prompt still did not open a panel. See `qa-closure-pix-talk-attempt.png`, `qa-closure-pix-closer-talk.png`, and `qa-closure-pix-normal-talk.png`. This is a reproducible regression candidate, not a proven proximity/controller root cause: actual character coordinates were unavailable.
- PASS, limited configuration: native controller readback returned configured=true, eight destination_enabled=true, and retained journal reference. The talk reference returned a Verse wrapper property path. Requested destinations field was omitted from readback; no claim of independent eight-reference verification. Native SessionStatus was Connected. LogVerse search PIX TRAVEL|ErrRuntime returned no entries; absence of entries does not prove controller startup.
- NOT VERIFIED: exact independent 55-mesh/closure transforms and all child label transforms in this run. Implementer records native saved readbacks in `closure-pix-implementation.md`; QA visual agrees with intended closure and orientation but does not substitute for independent transform evidence.
- NOT VERIFIED: full-wall screenshot, all-eight current-revision text, old-spot nonactivation, lesson progression/rewards/reset. Earlier restoration QA covers the previous full-title revision only.

Source inspected: near eligibility center (-1050,1925), radius125/rearm200, feet-height range2350..2650; on_talk requires near and owner_clear. Local Pix source SHA256 8d602dc9b4bd3bcd274fd8deabb8032ef5f5c2ab618bb636cba7f88e98e8e32f. Native fresh StartSession uploads project by documented schema and completed; no pending-changes or precise running compiled-source identifier is exposed by SessionToolset. No unsupported runtime commands used. Editor camera coordinates were not treated as player coordinates.

## Shutdown and release

StopGame Completed; StopSession returned null normally; final GetGameState Unconnected. Editor remains open. No native/UI calls remain in flight. Independent acceptance of the menu is withheld pending diagnosis/fix and observed successful panel opening.
