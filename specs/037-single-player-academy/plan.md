# Plan — Solo Academy

Implement with033 as one coordinated source/native change. Exact requesting-user authority is in authorization.md. Read033 plan.md plus evidence/planning-live-bindings.json and planning-resolved-survey.json. Do not duplicate journal/progress owners.

## Settings

Native IslandSettings0 ref /fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.IslandSettings_0.
Observed maxPlayers1, matchmaking_MaxPlayersPerSession1, matchmaking_MaxTeamCount1, matchmaking_MaxTeamSize1, matchmaking_MaxSocialPartySize1, matchmaking_MinPlayers1, matchmaking_OvertimePlayerTarget1. .uefnproject maxPlayers also1.
Observed socialJoining Enabled, joinInProgressBehavior SpawnImmediately. Change only to Disabled and WatchOnly, plus gameDescriptionData short solo description: "A single-player adventure. Help Pix restore eight AI abilities. Follow numbered lessons; progress resets each round."
Do not hand-edit serialized internal matchmakingSettings derivations (observed sentinel defaults), IDs or matchmaking service configuration. bUseCustomMatchmakingSettings remainsfalse. Read authoritative native values back and save. Actual second-player admission test remains release evidence requirement; no publication.

## Core placement

Existing centerpiece at [800,1000,2900] cm remains unchanged. Preserve the greenhouse, its extension, journal, paths and all other geometry. Relocate only the existing eight catalogue billboards and eight lights after the old display was obstructed in the cooked game. The old columns [200,500,800,1100] at Y2100 are superseded. See ../033-progress-and-navigation/evidence/cooked-core-obstruction.png and core-relocation-survey.json.

The resolved display is a 4x2 vertical arrangement over the west hub foundation. Exact label centers (world cm):
1[-1500,2300,2850], 2[-1200,2300,2850], 3[-900,2300,2850], 4[-600,2300,2850],
5[-1500,2300,2650], 6[-1200,2300,2650], 7[-900,2300,2650], 8[-600,2300,2650].
Full label actor rotation pitch0/yaw180/roll0, scale0.65; retain current catalogue actors, text16, TwoSided, border off, short two-line number/module plus WAITING or RESTORED. Matching lights use the same X, Y2340, Z(label minus35), retain their actual current rotation pitch0/yaw0/roll0, scale0.25. Counts remain exactly eight labels/eight lights; journal badge mapping is unchanged.

Saved native inventory records academy_foundation bounds X[-1700,2800], Y[0,3000], top Z2400. The expanded proposed panel envelope X[-1660,-340], Y[2270,2370], Z[2600,3055] has no intersecting physical generic mesh, tree or journal in that inventory. Reported intersecting VFX gizmos and formerly oversized Tool interaction bounds are not evidence of a new physical obstruction; the implementer reports that interaction-radius defect fixed separately. The greenhouse bounds X[520,3300], Y[400,2600], Z[2272,4385] explain why floor-only tracing missed the old obstruction. Do not hide or modify it.

Observer review point is approximately [-1050,2800] with the camera near[-1008,3042], looking toward the fixed-Y display. The loop route board atY3100 is behind this camera; the journal atY1000 is behind the panels. These are a proposed viewing setup and saved bounds-clearance analysis, not a new live camera test or proof of cooked visibility. Nominal label width232cm fits300cm columns; nominal height105cm fits200cm rows. Require a fresh cooked frontal view showing all eight labels without structures/other text covering them, and natural walking access to the view. The relocation must not consume the route or add mandatory interactions.

Use existing customizable_light_device TurnOn/TurnOff and billboard SetText/UpdateDisplay. If catalog light shape affects collision, hide fixture/collision as supported native options and retain observable litpanel; record actualsettings. Only authoritative count/state controls segments. On-round resets after managerstate reconciliation; respawn must not briefly erase earnedsegments. Singleplayer allows worldsharedsegments; internal player attribution retained. A missingsegmentbinding logsdiagnostic and doesnot fabricatebadge.

## Solo station copy and retirement

Skills four live Verse actors: fn_shoreline_island_nursery_station, station2, station3, station4. Nativeprimary station_id0 ref ends 1359952783, claimbutton savedActor ends1362067786 at[-2330,-17700,2500]. Makeprimary interaction "Start AI Skills Lab", idleboard goal first, noStationnumber; remove occupied/claim copy but retain owner safetyguards. Add explicit solo_active/configuration guard for duplicateIDs1..3, disable their own boundgameplaybuttons and hide only their own instructionlabels; keep Return access if safely bound. Confirm each savedActor is not shared before mutation. Keepsharedprogress andphysicalcanopies.
Botprimary fn_shoreline_bot_1_station has rescue_mode/configuredtrue and remainsactive. Bot4 at ref ends1582077194 has rescue_modefalse, station_id3 and distinct claimbutton ends1583131196. Disable legacy Bot4 owncontrols / staleownershipinstructions; do not delete source/structures. NonrescueBot2/3 already retired by previous features: inspect actualbindings before any retirement; do not touch their recycledboards,controls,036assets.
Legacy loop_station and repair_station source contain Claim wording; existing retiredinstances can remainretired. Any currentlyreachable retained optionalcontrol gets Start/Optional copy. Do not resurrect or retarget retired games.

## Dependencies and verification

033 localreporting/markers/HUD implemented fully. Inspectcurrent Toolactualrifle failure032 and ErrorReturn031 using trueinput; their source already uses SetInteractionTime0, so do not assume holdingE fixesit. Correctactualbinding/filter/collision ifobserved, preserving approvedmission.
BuildVerse, projectvalidation, cook, focusedcontrols/Core/HUD/map/normalroute tests and independentQA. SA-01 requiressecondaccount/admission tests beyond currenttool access; explicitlyreport unverifiedpaths. Full8/8normalplaythrough/comprehension remainsunverified unlessactuallyobserved. No teleports/seededbadgefixture inproduction. Shutdownfreshstate,noinflight,editoropen.


## Label orientation correction — 2026-10-04

The fresh west-position cooked capture ../033-progress-and-navigation/evidence/cooked-core-relocation-yaw90-failure.png shows the panels edge-on. Placement clearance alone did not establish face direction. Supervisor relays native Billboard_WidgetComp relative yaw -89.985 degrees: actor yaw90 gives a world normal near +X, perpendicular to the viewing direction along -Y. Set only the eight label actors to pitch0/yaw0/roll0 so their normal is near -Y; TwoSided remains enabled. The labels face the observer across the fixed-Y row. Keep all label/light anchors, scales, counts and geometry unchanged; light orientation remains its read-back pitch0/yaw0/roll0; these point lights are nondirectional and their rotation does not control the label face. New cooked frontal readability must still be demonstrated; this mathematical correction is not acceptance evidence.

## Current full-transform facing trial — corrected evidence, 2026-10-04

Critical correction: the worker found that a partial rotation setter reset omitted location/scale to identity. The absent-panel yaw0 cook therefore did not test correctly positioned panels and did NOT prove missing-backface rendering caused the failure. Retract that causal conclusion and the earlier assumption that the yaw0 trial demonstrated a face-direction failure. The prior yaw90 edge-on capture used full poses and remains valid evidence.

The worker now reports all eight labels restored with complete transforms: exact planned west-hub anchors, scale0.65, pitch0/yaw180/roll0, saved and read back before the next cook. Keep this yaw180 trial, which places the panel plane parallel to the viewing plane; its visible face/readability still requires a valid fresh cook. Native backface-null information alone does not establish the earlier disappearance cause. Eight lights remain at their complete planned transforms with yaw0 and scale0.25. Every transform mutation must specify location, rotation AND scale, followed by native readback; omitted fields are unsafe in this tool path.

No design placement/count/scale changes arise from this evidence correction. The planner did not perform live calls; complete-pose restoration is worker-reported pending cooked verification.
