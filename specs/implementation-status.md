# Post-MVP Implementation Status

- Objective: Implement the full post-MVP roadmap as a fully working island.
- Status: In progress; completion is not claimed.
- Release validation audit: latest launch-time asset pass covered only
  GameFeatureData, not the full map; standalone validation and memory remain open
  ([workflow evidence](evidence/validation-workflow-2026-09-12.md)).
- User testing availability: Solo only for now (2026-09-11).
- Continue implementation and solo checks within that availability. Two-player
  and four-player acceptance remains pending and must not be inferred from solo
  results; it does not prevent further implementation or solo playtesting.

| Scope | Current evidence | Remaining |
| --- | --- | --- |
| 010: Coastal fieldwork | Three observations placed and bound; all six predictions, Again/Close, walking access and unchanged fresh journal state pass solo ([evidence](010-coastal-fieldwork/evidence/observations-2026-09-12.md)); Nursery remix implemented at four stations; station 1 solo passes unlock, failure, solution, Replay and badge retention ([evidence](010-coastal-fieldwork/evidence/remix-2026-09-13.md)); journal cleanup implemented and solo respawn/restart/reopen passes ([evidence](010-coastal-fieldwork/evidence/journal-lifecycle-2026-09-13.md)); personal Work page builds; fresh eight rows, earned Garden contribution, Work/Back, Close/reopen and Garden-to-Loop recommendation pass solo ([evidence](010-coastal-fieldwork/evidence/journal-work-2026-09-12.md)); compatibility 42.20 fresh-state regression and Verse build pass ([evidence](010-coastal-fieldwork/evidence/fresh-journal-retest-2026-09-21.md)) | Remaining earned contribution rows and numeric neutrality; revised remix text fit and remaining lifecycle/exit checks; observation lifecycle and earned-state retention; lifecycle/multiplayer, presentation and release checks |
| 001: Existing MVP | Historical solo acceptance passes | Multiplayer, standalone validation, memory gate |
| 002: Loop Lagoon | Verse compiles; four stations saved and bindings audited; all four claims/joins passed solo; Dock 2 passed all 12 wrong counts and corrected runs after garden completion in one round; badge and hub return passed; console hidden after restart | Fresh-load billboard reliability, rapid-input/lifecycle checks, complete hint coverage, progress transfer, Dock 3 motion, presentation, multiplayer, final validation |
| 003: Living Academy | Journal full-text, close/reopen, fresh Garden and post-Garden Loop recommendation pass; Nursery sixth tracker saved and readback matched, fresh-to-earned 1/1 after all three challenges and Hub return, eight-zone fit and unchanged other ready states pass solo ([journal evidence](003-living-academy/evidence/nursery-journal-2026-09-12.md)); four repair stations saved and audited; first station passed initial failure/corrected success without Garden award; additional solo checks passed walking access, sequential claims, personal program transfer, step-1 failure, both hints, Replay program/hint reset, and Station 4 hub return | Rapid input and lifecycle, simultaneous ownership, earned Loop journal/lifecycle, later badge integration, presentation, final validation |
| 004: Signal Lighthouse | All three paths compile; four harbors saved with 140 unique station actors and 92 audited native bindings; all four sequential solo claims and walking joins pass; Harbor 3 delivery motion and partial queue transfer to Harbor 4 pass; Harbor 1 passes all queues, both incorrect final rules and corrected success/Signal award message, mooring motion, manual board, two manual hints, Next guard, Replay fixture reset and Hub return; journal fresh-ready and earned 1/1 after Replay/Hub/reopen pass; original LEAF/GEAR materials remain visible during movement and PLAIN is unmarked | Other copied-harbor motions; repeat-completion badge count; remaining wrong destinations/final hint; rapid input/lifecycle; multiplayer; remaining presentation; project validation and memory |
| 005: Variable Vault | Four stations saved (104 actors total), 75 added actors and 57 added bindings audited; Energy connected in journal; Verse build passes; new-station claims, door-four motion, transfer 4-to-3-to-2, two floor joins and Hub return pass ([placement evidence](005-variable-vault/evidence/four-stations-2026-09-12.md)); first-station solo AC-001 through AC-004 pass, including bounds, hints and exact Energy 1/1 after Replay, repeat completion and journal reopening ([badge evidence](005-variable-vault/evidence/badge-journal-2026-09-12.md)) | Intermittent fresh-load static billboard failure remains unresolved; full walking access, presentation, lifecycle/multiplayer, project validation and memory |
| 006: Debug Workshop | Four stations saved (116 actors); 84 added actors and 51 native references audited; current Verse builds clean; four claims, transfer 4-to-3-to-2-to-1, supplied faults/repairs, all six hints, badge award across stations and repaired first walking route pass solo ([four-station evidence](006-debug-workshop/evidence/four-stations-2026-09-12.md)); prior Replay and exact journal Debug 1/1 pass | Rapid/lifecycle cases, full muted-audio presentation, multiplayer, project validation and memory |
| 007: Event Factory | Four stations saved (131 actors), 66 added native references audited; clean Verse build and fresh launch; all core challenges, all six hints, explicit Show event, all four claims and three lateral joins pass solo; progress and Bell test carry across Stations 4/3/2/1 through badge completion ([evidence](007-event-factory/evidence/four-stations-2026-09-12.md)); earlier Replay/Hub/journal exact Event 1/1 passed | Repeat completion, rapid/lifecycle cases, multiplayer, full muted-audio presentation (raised chute and minimap obscure goal board at some controls), project validation and memory |
| 008: Build-a-Bot | Three Verse classes compile; four stations saved (186 actors; 147 added native references and three progress/ID pairs audited); wrong/correct core missions pass solo; all four claims, three joins, six hints, completed-stage transfers and partial Parcel restoration pass; repeated completion and Hub journal Bot 1/1 pass; T-002/T-003 complete solo ([parking evidence](008-build-a-bot/evidence/parking-2026-09-12.md), [four-station audit and runtime evidence](008-build-a-bot/evidence/four-stations-2026-09-12.md)) | Eastern-control sightlines; intermittent fresh-load reliability; remaining edge cases, prior earned badges, respawn/active cancellation/round reset/multiplayer, project validation and memory |
| 009: Tidepool Nursery | All three challenges compile; four stations have 170 actors; 126 additions and 135 added bindings are saved/audited. Solo four claims, three joins, Station 4 Care wrong/correct, Challenge 2 defaults and retained completed work across transfers, and Hub return pass ([capacity evidence](009-tidepool-nursery/evidence/four-stations-2026-09-12.md)). Fresh solo Care wrong/correct and Next, two-bed wrong/correct caller, repeat counts 1/2/4 failure and 3 success, badge 1/1, repeat Run retention and Hub return pass ([evidence](009-tidepool-nursery/evidence/three-challenges-2026-09-12.md)) | Nursery display cache builds and Station 1 fresh/Run/error/success/Next checks pass; lower boards and forward labels saved on all four, copied runtime and intermittent-load causality pending ([readability evidence](009-tidepool-nursery/evidence/readability-2026-09-12.md)). Nursery journal fresh/earned 1/1 and Close/reopen now pass solo ([journal evidence](003-living-academy/evidence/nursery-journal-2026-09-12.md)); remaining six hints/full-set Replay and journal recommendation branches; rapid input/lifecycle; later copied-station execution/multiplayer; navigation, robot/label occlusion and HUD/board overlap; validation and memory |
| Across the island | Feature specs cover hints, personal badges, replay, routes, non-color cues, and solo support | Milestone F authored remix and remaining observation checks; coastal visual polish and end-to-end testing across all zones |

008 follow-up: [presentation retest](008-build-a-bot/evidence/presentation-2026-09-12.md)
adds 20 audited label references (51 native references total, still 48 actors).
Clean build and fresh solo launch; Bot labels appeared before Claim, Seed
completion and seed/lamp separation passed, and Next to Dock preserved completion
with only the relevant props visible. Intermittent fresh-load reliability is not
proven fixed. Cell/destination names are too small and board sightlines remain
open; route message/restoration fixes compile but await live retesting.

## Operational notes

Latest focused evidence: [core regression, 2026-09-12](002-loop-lagoon/evidence/core-regression-2026-09-12.md).
Fresh client launch again omitted billboard widgets; restarting the round restored
them. This is an unresolved reliability finding. Console Hide calls compile and
the Dock 2 console was absent in the recovered session. All twelve wrong counts,
their corrected runs, and garden-to-Lagoon completion now have solo evidence.
Do not repeat that full matrix without a relevant change; next tests should cover
rapid input, lifecycle, remaining hints and station progress transfer.

Use official Unreal MCP, serialize editor calls, and save editor-owned assets.
The current map is `/fn_shoreline_island/fn_shoreline_island`.
Scope asset registry searches to an explicit content folder: a global search
currently encounters a missing AmbientAudio plugin path.

DeviceToolset Get/SetDeviceProperties takes the outer VerseDevice actor.
ObjectTools can inspect its `script` subobject, but reading Verse fields directly
through ObjectTools fails. Get native device wrappers through GetDeviceProperties
and set/read their `savedActor` through ObjectTools. Bind a custom Verse device
reference through SetDeviceProperty using the target script object's refPath.

FortStaticMeshActor meshes are suitable for static graybox geometry but failed
as runtime creative_prop targets. The pending corrected station uses native
BuildingProp actors with their StaticMeshComponent0 mesh and Movable mobility.
Its full content push completed, followed by a successful Verse build/push of
ownership and cancellation guards. No new invalid-teleport warning was observed
at that checkpoint; physical behavior still needs an interaction test.

2026-09-12 continuation: fresh Launch Session and full pushes worked. The robot
now visibly moves without the earlier invalid creative_prop behavior. Solo tests
found hidden unlit lanterns, parcel overlap, and control signs obscuring props.
The source now keeps unlit lanterns visible, labels OFF/ON states, and raises the
parcel; six control labels were moved below the sightline through UEFN and saved.
BuildAll passed. See [the current solo record](002-loop-lagoon/evidence/solo-2026-09-12.md)
for exact revision, findings, and outstanding retests. Poll the live Session
toolset rather than relying on this note for current client state.

The local Saved/capture-fortnite.ps1 helper uses PrintWindow only on the visible
FortniteClient-Win64-Shipping process. Saved/input-fortnite.ps1 checks that exact
window is foreground before input. Both require desktop access outside the
sandbox. Automatic review rejected full-desktop capture but allowed scoped
Fortnite capture and input. Do not capture the entire desktop.

Avoid raw client log dumps: shutdown HTTP lines can contain account tokens.
Filter to relevant Verse, build, validation, and session categories and omit URLs.
Saved/ files are local test scratch files, not committed evidence. Copy only
verified, relevant captures into each feature's evidence folder.
