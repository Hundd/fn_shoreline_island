# Independent resumed QA — 2026-10-04

Original required-model gpt-6.1-sol QA worker, reused after user resumed verification. Approved digest remains809dcd27d05f7e0711635d560f2615ab543ffb18195ea0e5008e386395d8087a. Current controller SHA256 freshly confirmed C40A9FB460EC5F90C025428C28C0F13F3CFCAEB187F8D7542E255C08EFE9A0E7. No QA source/gameplay/native setting changes. Supervisor recovered a confirmed earlier client crash before transferring exclusive ownership; that recovery is Supervisor evidence, not QA gameplay acceptance.

## Fresh native configuration and authority (R07/R09)

Supported read-only queries first resolved current IslandSettings_0, academy_journal, nursery_progress and Bot1/Bot4 station actors. Schemas were discovered before property reads. Exact outputs retained in production-qa-resumed-native.json.

- Island maxPlayers1, matchmaking_MaxPlayersPerSession1, MaxTeamCount1, MaxTeamSize1, MinPlayers1 and OvertimePlayerTarget1; socialJoining Disabled, joinInProgressBehavior WatchOnly. This confirms current solo configuration. R09 foreign-player behavior conditional on reachable shared state is **N/A for this configured single-player scope**. No actual second-account admission attempt was made or claimed.
- Journal later_badge_trackers[5] is exactly nursery_progress's badge_tracker wrapper. Its savedActor resolves native tracker Device_Tracker_V2_C_UAID_E89C2592D1B5160103_1361400785. Source module6 mapping therefore uses the same saved Skills authority, rather than an independent tracker.
- Both fn_shoreline_bot_1_station and fn_shoreline_island_bot_4_station bind the same academy_journal instance (...1737524934.fn_shoreline_island_academy_journal_0), and the same Bot progress instance(...1844127012). These are fresh binding facts. Full runtime Agent prerequisite behavior with the other badges, unrelated-activity journal isolation and an owned release/award cycle remain unverified. Refer to production-authority-source-audit.md for separately labeled source guards.

## Actual caption repair acceptance (R02/R10)

Refreshed actual Fortnite client handle7474352 was available and current session Connected/Running. Fresh observation showed the character **already at starter**, despite the normal-session recovery description. This run treats that as retained session test setup and makes no new normal-arrival claim; normal promenade/ramp arrival remains prior independent evidence.

Actual supported camera and rifle inputs worked. Looking slightly upward framed the three high captions. Real Load rifle hit changed the next caption to HEAT; real Heat rifle hit changed it to POP. Saved production-qa-resumed-prefix0.jpg, prefix1.jpg and prefix2.jpg show NEXT on its own line above LOAD, HEAT and POP respectively, with distinct neighboring instruction names and no original overlap. **PQA04 repaired and physically retested in all three prefix states.** The initial straight-ahead view can place a high caption partly under the badge HUD; slight upward look produced the clear saved views. No human first-use/child comprehension or enjoyment observation is claimed.

## Bounded current course progress

Actual Pop rifle hit produced deck1; cyan effects changed and landing appeared. Initial jump from too far back missed and visibly recovered: “Back on your last popcorn. Your bridges are safe!”, health100 and built landing retained. After walking within starter toward its edge, a real Space jump with AutoRun physically landed deck1; HUD advanced AI Skills Step2/3. production-qa-resumed-land1.jpg records the current landing/HUD. This is actual first-jump progression, separate from earlier full left/right route passes. A real reused receiver shot was issued at close range, but its resulting deck commit was visually obscured and is not separately accepted here.

Second-jump input then failed `failed to activate captured window`. Fresh window list still contained client7474352 and MCP reported Running; no client crash was established. One bounded fresh observation failed **`GetCursorPos failed: Access is denied. (0x80070005)`**. The UE editor log at18:34:58 also shows Remote Audio device swap; this is contextual evidence of a desktop/session change, not proof of its cause. QA did not interact through a locked desktop, repeat activation loops, restart the client or invent a jump/pass.

**Not run after this blocker:** remaining current full completion, physical earned Replay→second real completion in the same round, owned finish Return/Core retention, extra rim/crouch/per-gap recovery and final-beat cancellation. Earlier independent both five-jump routes, immediate finale-repeat denial, physical Replay and unclaimed physical finish Return retain their own bounded evidence; none substitutes for this missing earned integration cycle. Native teleport-failure injection was not attempted. No blanket R01–R10 acceptance.

## Shutdown / handback

Supported MCP StopGame returned Completed, fresh GetGameState CanStart. Native debug_tag read back empty (left unchanged this run). Targeted map save true/is_dirty false; UEFN open. Camera/spawn/native settings were not modified in this resumed run, so no UI-dependent restoration was required after desktop access failed. All calls finished; QA explicitly released ownership with no pending calls. Log excerpt production-qa-resumed.log preserves the desktop-change context and shutdown operations. Prior explicit successful Project Validate at17:51:44 remains current same-source/scene evidence; no new validation UI invocation was claimed under Access denied.
