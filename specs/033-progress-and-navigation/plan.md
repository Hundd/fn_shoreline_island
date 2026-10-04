# Implementation plan — progress and navigation

Status: implementation authorized by the user's explicit autonomous-work request on 2026-10-03. See authorization.md. This is a concrete resolved design, not a claim of user review of its preview.

## Authoritative model and source integration

Reuse academy_journal's garden, lagoon and later_badge_trackers. Native readback resolves every current later tracker to a real savedActor (evidence/planning-resolved-survey.json). Order: Prompt garden, Pattern lagoon, Classifier index0, Confidence1, Error2, Tools3, Skills5, Agent4. Never reorder serialized tracker array. Preserve shared Prompt badge across Workshop and optional arena, eight denominator, current-round lifecycle and first-seven gate. Missing binding is unavailable, never complete.

Extend journal with one presentation state per player: canvas, latest activity context, badge snapshot, active indicator, callback generation, round generation. Keep authoritative badge queries; no second awarded counter. A single 0.25–0.5 s journal refresh may reconcile completions after tracker event ordering and source round resets. No per-widget polling. First completion handoff lasts4s and replaces old transfer popup. Duplicate/replay completion must not repeat it. Spawn initializes for already present players and future SpawnedEvent/PlayerAddedEvent. Respawn clears attempt context but preserves earned badges. Round/departure cancel callbacks and remove widgets/pulses before rebuild.

Add a small explicit reporting API to journal and @editable journal references on controllers that lack one; existing bot academy_journal reused. Report enter/current-step/short-action/exit at actual state transitions, not interactions guessed successful. Token or owner/generation guard rejects delayed previous-attempt reports. No mission rules or badge award functions change. Polling of real controller state is an acceptable equivalent only if mapped explicitly and lifecycle-safe; never infer progress from player location alone.

## Actual local stage contract (FR-008)

| Controller | Total | Mapping and action |
|---|---:|---|
| prompt_workshop |6|Inspect -> choose WHAT/color -> WHICH/size -> WHERE -> Send/test -> Connect. Derive from inspected/what/which/destination_choice/delivered/connected. While animation runs keep step5 and Watch Pix; connected shows6/6 complete. Rejections do not advance.|
| prompt_blaster optional arena |5|stage1 blue selection=1; stage2 large modifier=2; stage3 matchingcore=3; stage4 movingcore pickup=4; stage5 destination=5; delivery stage6 remains5; stage7 complete5/5. Intro stages0/-1 show Get ready, not solved credit. Stage-2 transition retains prior3. Same Prompt ID, optional copy.|
| pattern_line |3|phase0..2 -> step1..3, round_patterns/round_hints actionable missing-symbol instruction; phase3 complete. Actual native success_ids [1,0,2], no legacy loop total.|
| signal_station |7|phase0..6 -> step1..7 from success_ids [0,1,2,1,0,1,2], item_names; phase7 complete. Three labelled examples, one correction, three new examples. Do not confuse three sections with seven decisions.|
| energy_station |4|phase0 Check clue;1 Cool;2 Check again;3 Release;4 complete.|
| debug_station |3|phase0..2 from stages.Length; boxed bad-route command and goal; phase3 complete. Wrong target/retry retains phase.|
| event_station |3|phase0..2 current stages request; animation Watch result, phase changes only after verified tool output; phase3 complete.|
| nursery_station primary |3|challenge0 define GrowPlant;1 reuse on2planters;2 repeat for3planters/exit. Completed challenge shows current solved state until Next; badge only allthree. Remix explicitly optional, same badge.|
| bot_station rescue |5|rescue_phase0 Medical crate;1 Pickup/Move/Drop plan;2 scan route;3 choose supported route;4 check delivery result;5 complete. Three geographical beats are not five decision steps.|

Report resets from reset/release/on_round/on_removed/respawn/Return, plus existing bounds departure checks. Workshop entry zone exits and optional Prompt participants require explicit exit cleanup. Completion may show Completed locally until exit; journal Completed takes precedence during replay.

## Native scene delta

Zero MapIndicator-class actors currently exist, confirmed whole-scene native class inventory. Add exactly9 via official catalog /CreativeCoreDevices/SetupAssets/PID_Device_MapIndicator.PID_Device_MapIndicator. Use complete rotation pitch0/yaw0/roll0 and scale1. Coordinates below are world cm, z2500. Ground traces at all XY succeeded (floor2400 except Hub2412). They are entrance approaches, never targets/roofs. These are indicator-only placements; do not build the campus envelope or add new corridors.

|Marker|World XYZ|Existing route/entrance basis|
|---|---|---|
|1 Prompt Workshop|3200,200,2500|Existing entry zone center; greenhouse path and garden_repair_walkway|
|2 Pattern Scanner|-650,3700,2500|North approach from loop_hub_walkway into course minY3600|
|3 AI Classifier|-1900,900,2500|signal_hub_walkway west edge; step west into bay minX-2200|
|4 Confidence Core|-1900,-900,2500|energy_0_walkway west edge; bay approach|
|5 AI Error Lab|-2400,-4300,2500|Existing debug_station_1_walkway|
|6 AI Tool Lab|-2400,-8000,2500|North edge of event_station_1_floor, existing promenade|
|7 AI Skills Lab|-2300,-15400,2500|North/east edge nursery_floor; walk south to Start at-2330,-17700|
|8 AI Agent Mission|-2400,-11800,2500|North/east rescue envelope; proceed west/south to Dispatch-4400,-13500|
|Hub|-700,1500,2500|Existing hub_destination and journal access|

Properties discovered on native class: showOnWhichMap Both, enabledOnGameStart true, text exactly 1 through 8 in canonical order and HUB for the Hub, textColor white, iconScale1, showObjectivePulseToInstigatorOnly true, showObjectivePulseToFriendlyPlayers false. Preserve catalog icon when valid; use native numbered icons if available, text carries only its number (or HUB). Full canonical numbered names remain in the next-action HUD and all journal rows, with numbered hub Core labels as the world legend. The table names below/above are semantic identities, not the literal native map text. No custom map artwork. Installed digest confirms ActivateObjectivePulse(Agent)/DeactivateObjectivePulse(Agent). Bind markers0..7 ordered and separate Hub; never pulseHub. Pulse one destination, stop while active or all8complete. Readback after placement and cooked map visibility required.

Update existing hub_signs academy_title/hub_route/path_garden/garden_repair copy and byte_island_game_manager objective_text consistently to Start:1 Prompt Workshop. Older arena sign explicitly Optional Prompt arena — same Prompt badge. Keep existing readable sign transforms unless a concrete defect needs local repair.

## UI placement and clarity

One noninteractive canvas InputMode.None, bottom-left, anchor(0,1), offsets approximately Left24 Top-220 Width430 Height100; 20–22px count and 18–20px action, short wrapped lines. Initial native objective tracker is top-left; minimap top-right; center reticle and lowercenter local feedback remain clear. Validate cooked view and adjust bounded screen margins if needed, recording actual. Journal panel still intentionally modal on opening and restores input on close. Use explicit Available/In progress/Completed/Locked text.

## Verification and dependency repairs

Build Verse and validate/cook after source and native binding groups. AC-01..12 remain exact acceptance except AC-09 superseded by solo admission/lifecycle in037. Verify stage mapping every activity; actual rifle Tool trigger issue from032 and actual Error Return issue from031 must be repaired if reproducible, with evidence in those feature folders. A source fix, native Trigger call, build/cook or forged badge is not real playthrough acceptance. Full normal-spawn route with real earned badges, timing/comprehension and Controller/compact-display checks stay unverified unless actually performed. No developer teleport/seed retained.

Do not relocate activities or change difficulty/rewards. Preserve optional036 hangar/trail and all current uncommitted repair. New journalCore changes belong037 and share these authoritative sources. Native setting tweaks belong037.

## Geometry and readiness boundary

The measured survey envelope is informational and explicitly does not pretend the v1 linear schema models free-order mission logic. All marker placements are resolved; existing floor traces establish surface support, not unobstructed capsule passage across the entirecampus. No new physical path is proposed. Source adapter hooks are deliverables above, not preexisting configurable behavior. Runtime route/readability checks remain verification tasks, not planning assumptions. All editor edits serialized; save/readback; final game stopped/editor left open.


## Cooked-map readability revision — 2026-10-04

The initial full-name map labels visibly overlap in evidence/cooked-map-initial-overlap.png. The compact-name trials are recorded in evidence/implementation-progress.md. Supervisor relayed the implementer's subsequent cooked readback: attempted CreativeMapMarkerComponent font size11 and staggered label offsets reset during cook to size12/default offset-5; adjacent named labels still overlap at normal overview zoom. This planner did not independently operate or observe that live cook.

Final presentation decision under the existing user delegation: native map text is exactly `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `HUB`. Keep all nine actor positions, count, class, icon/pulse behavior and badge mapping unchanged. Remove reliance on font/offset overrides that do not survive cook. The next-action HUD retains the full numbered destination; the journal lists every numbered name; the hub Core labels form the same numbered world legend. Semantic marker labels in map.yaml remain full names for offline review, with literal native display text specified separately under indicator settings. This is a presentation tradeoff: map names move to the existing guidance/legend to preserve distinct locations. It does not drop markers or move their entrances.

AC-04 requires a new cooked screenshot/readback showing distinct numeric labels on both maps at normal zoom and agreement with HUD/journal/Core numbering. The failing named-label screenshot is evidence for the decision, not proof that the final numeric version has passed. Preserve all other acceptance requirements.
