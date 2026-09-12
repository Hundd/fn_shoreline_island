# Post-MVP Implementation Status

- Objective: Implement the full post-MVP roadmap as a fully working island.
- Status: In progress; completion is not claimed.
- User testing availability: Solo only for now (2026-09-11).
- Continue implementation and solo checks within that availability. Two-player
  and four-player acceptance remains pending and must not be inferred from solo
  results; it does not prevent further implementation or solo playtesting.

| Scope | Current evidence | Remaining |
| --- | --- | --- |
| 001: Existing MVP | Historical solo acceptance passes | Multiplayer, standalone validation, memory gate |
| 002: Loop Lagoon | Verse compiles; one station placed and wired; first cook and Claim prompt verified | Corrected props and full solo loop, four stations, presentation, multiplayer, final validation |
| 003: Living Academy | Approved spec, plan, tasks | Implementation and all validation |
| 004: Signal Lighthouse | Approved spec, plan, tasks | Concrete queue/rule fixtures, implementation, all validation |
| 005: Variable Vault | Approved spec, plan, tasks | Implementation and all validation |
| 006: Debug Workshop | Approved spec, plan, tasks | Concrete broken programs, implementation, all validation |
| 007: Event Factory | Approved spec, plan, tasks | Implementation and all validation |
| 008: Build-a-Bot | Approved spec, plan, tasks | Concrete mission programs, implementation, all validation |
| Across the island | Feature specs cover hints, personal badges, replay, routes, non-color cues, and solo support | Coastal visual polish and end-to-end testing across all zones |

## Operational notes

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

Fortnite subsequently exited; process inspection and Disconnected session status
confirmed it stopped. A fresh Launch Session is underway. The latest source
identifier cleanup must be compiled/pushed after that launch completes.

The local Saved/capture-fortnite.ps1 helper uses PrintWindow only on the visible
FortniteClient-Win64-Shipping process. Saved/input-fortnite.ps1 checks that exact
window is foreground before input. Both require desktop access outside the
sandbox. Automatic review rejected full-desktop capture but allowed scoped
Fortnite capture and input. Do not capture the entire desktop.

Avoid raw client log dumps: shutdown HTTP lines can contain account tokens.
Filter to relevant Verse, build, validation, and session categories and omit URLs.
Saved/ files are local test scratch files, not committed evidence. Copy only
verified, relevant captures into each feature's evidence folder.
