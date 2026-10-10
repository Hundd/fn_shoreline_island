# Technical Scout — component alternative

2026-10-10. Worker `/root/technical_scout`, Codex desktop `gpt-6.1-sol`. Read 059 failed `pilot-result.md` and independent `qa-report.md`. Exclusive read-only editor ownership from Supervisor. This report is the sole owned file. No property edits, compiles, saves, reloads, games, sessions, cooking, pushes, or automation operations executed.

## Concrete new evidence

The failed actor `staticMesh` setter does not establish that component editing is prohibited. Live native UEFN Details exposes a separate, working-looking component editor surface:

- Selected existing `prompt_blaster_target_0` using native EditorAppToolset.SelectActors; no actor recreated.
- Selected its StaticMeshComponent entry in the Details component tree. Tooltip identifies native `StaticMeshComponent0`, inherited C++, Base Building Static Mesh Component, Mobility Static, Editor Only False.
- Component Details contains **Static Mesh > Static Mesh**, Agency asset thumbnail, dropdown, use-selected and browse controls. Clicking only the dropdown opened a native asset picker with **Clear** and selectable mesh entries (Asteria Grass, Boulder Small 01, etc.). No asset or Clear entry was selected.
- Component Details also contains **Materials > Element 0** with asset picker and reset arrow; no material/reset control was activated.
- Native ObjectTools.list_properties describes component `staticMesh` as “The static mesh that this component uses to render”; `overrideMaterials` is a MaterialInterface-reference array.
- Native readback before and after UI inspection: `staticMesh=/Game/Environments/Apollo/Sets/Agency/Props/Meshes/S_Agency_Computer_02.S_Agency_Computer_02`; `overrideMaterials=[/Engine/Transient.MID_MI_Agency_Computer_02_0]`; `bEditableWhenInherited=true`; `bIsEditorOnly=false`; mobility Static.

UI evidence is preserved in this worker's native tool outputs: node_repl **Inspect instance StaticMeshComponent controls** includes the selected component and tooltip; **Inspect mesh picker availability without selecting asset** includes the open picker and Agency path tooltip; **Close mesh picker on category header** shows closed picker and All Saved. Screenshots were displayed by sky; skill instructions prohibit re-saving screenshot payloads solely for inspection, so no separate PNG was written. The computer-use skill's @oai/sky runtime worked despite disabled native cua surfaces.

The inherited-root tooltip also says its properties cannot be edited here, despite an active mesh picker and bEditableWhenInherited=true. Treat this discrepancy as uncertainty requiring a bounded mutation pilot. The picker demonstrates a native editing affordance, not completed persistence or guaranteed UEFN acceptance. This is materially stronger evidence than reflection alone.

## Exact next candidate

Target component reference:

`/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.VerseDevice_C_UAID_E89C2592D1B5860503_1527752703.StaticMeshComponent0`

Candidate existing live-exposed native operation: `editor_toolset.toolsets.object.ObjectTools.set_properties`, exact component `instance.refPath`, `values` JSON string `{"staticMesh":{"refPath":"/VerseEngineAssets/Cube.Cube"}}`. This is an alternate component instance pilot, not a retry of the rejected actor field. Native UI selection of the same asset is another available editor route if a reviewed pilot explicitly chooses it; do not automatically switch setters after rejection.

Official [UStaticMeshComponent API](https://dev.epicgames.com/documentation/unreal-engine/API/Runtime/Engine/Components/UStaticMeshComponent?application_version=5.5) documents native SetStaticMesh as a public BlueprintCallable function. Installed Epic `editor_toolset/tests/test_actor.py:532` invokes `actor.static_mesh_component.set_static_mesh(cube)`, proving ordinary native UE component support. Neither source proves a direct SetStaticMesh callable is exposed by this UEFN MCP surface. ObjectTools schema has no general member-function invocation. Do not invent a tool name, use a Python bypass, or install a helper. The exposed property-edit route and native Details UI are the concrete candidates.

## Materials, rollback and persistence proof

Begin mesh-only, then read back mesh, material overrides, bounds, body collision and complete actor/script/reference baseline. Existing Agency transient MID may remain on a new mesh. If it stays and produces an unsuitable appearance, stop the mesh-only pilot. An explicitly reviewed extension could set component `overrideMaterials=[]` to use the selected mesh's materials, then inspect appearance and confirm construction does not regenerate Agency materials. Do not assume SetStaticMesh clears overrides.

Rollback must use captured original mesh and original material array while that transient MID is still valid. Capture its parent/resolution if a supported native read path permits; after build/reinstance/reopen the transient pointer may change or become invalid. Do not persist a stale transient reference by guessing its name. Safe editor transaction undo or original external actor checkpoint provides recovery when exact in-memory restoration cannot be established.

**Do not assume generic reset_properties(component, [staticMesh]) restores Agency.** Installed object.py:111–116 obtains `get_default_object(obj.get_class())`, the component-class CDO, rather than this component's actual actor/template archetype. The generic CDO mesh could be null. Use explicit captured values, native UI reset only after its actual inherited value is established, or the checkpoint recovery procedure.

Require exact affected external actor save and clean state, native Verse build with no game, reacquire actor GUID and component references, then repeat mesh/material/identity/transform/reference checks. In-memory save readback alone does not prove reopening persistence.

For disk persistence, installed AssetTools.reload_asset uses native reload_packages and returns a re-resolved object; it warns that prior handles become stale. Proposed bounded proof: only the saved pilot's exact external actor asset, no dirty changes in that package, checkpoint verified, unrelated dirty packages recorded/protected, native reload once, reacquire same GUID and rebuild the reference audit. If external-actor targeted reload is rejected or unsafe, stop; a controlled level/editor reopen with unrelated dirty state preserved is the alternative. Neither reload route was executed by this Scout. Do not replace disk bytes while the actor remains loaded, and do not broaden to reload/save all.

Future placement remains an explicit configuration/audit process after pilot success. No project-wide default hook was established. A successful per-instance component override does not alter newly dragged Verse class defaults, and live target duplication can copy bindings/IDs.

## Handoff and editor state

Recommended next step: Planner author/review a new single-host component instance pilot with explicit material and checkpoint recovery limits. Preserve the failed actor-field result as history and revise the old no-component-fallback restriction through this new bundle. Native component editability/persistence remains experimental until measured; no blanket platform impossibility is established.

Picker closed without choosing asset; component remains selected and Static Mesh category collapsed. Final readback matches original Agency mesh and material array. Editor status All Saved; toolbar Session Disconnected. Final native SessionToolset.GetGameState returned **Unconnected**. No operation remains in flight. Editor ownership returned to Supervisor.
