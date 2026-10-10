# Technical Scout — Verse host representation

2026-10-10. Codex desktop worker `gpt-6.1-sol`, `/root/technical_scout`; resolved from `.agents/workflow-models.yaml`. Advisory feasibility research only. No editor/MCP operations, gameplay changes, sessions, cooking, pushes, or plugin changes. Report ownership is this file only.

## Request and evidence

Replace Agency computer meshes on existing VerseDevice hosts while preserving actor/script identity, complete transforms, references and gameplay. Hide-only does not satisfy the request. Establish an instance override and future-placement process without editing Epic shared defaults.

Inspected 059 `diagnosis.md` and `evidence/diagnostic-baseline.json`; 050 `plan.md` and `evidence/implementation-summary.md`; repository workflow and specialist instructions; installed Epic Python tool definitions; official Epic API documentation. LauncherInstalled.dat identifies the installed editor/game as `D:/games/Fortnite`, Release-42.30-CL-58557680. Relevant native C++ implementations are not shipped as readable source in this installation.

## Findings

| Behavior | Evidence and reusable mechanism | Confidence / constraint |
|---|---|---|
| Replace a host's representation without replacing its script actor | 059 baseline exposes actor `staticMesh` (null) and runtime `StaticMeshComponent0.staticMesh` (Agency computer). Generic ObjectTools edits object instances. | Candidate native instance route; reflection alone does not prove the actor property drives the component or survives construction. |
| Use a supported generic property setter | Epic `Engine/Plugins/Experimental/Toolsets/EditorToolset/Content/Python/editor_toolset/toolsets/object.py:81–94`: `set_properties` resolves the instance, checks editability, calls `unreal.ToolsetLibrary.set_object_properties`. | Verified installed implementation of the generic setter. Native `set_object_properties` implementation is unavailable, so transaction/PostEditChange/construction details remain unverified. |
| Store/reset per-instance overrides | Same file `:98–120`: reset documentation explicitly describes removal of per-instance overrides and reads the archetype's defaults before using the same setter. | Evidence that the generic tool intentionally supports instance overrides; no VerseDevice-specific persistence guarantee. |
| Avoid accidentally editing shared defaults | Same file `:123–127`: passing a Blueprint resolves its generated class CDO; passing an actor returns that instance. | Target the exact level actor, never `/CRD_VerseDevices/VerseDevice` Blueprint/default object. |
| Save and reread persistent state | Installed `asset.py:346–383`: exact-path `save_assets` uses EditorAssetSubsystem.save_asset; `is_dirty` checks package state and disk presence. | Supported generic save path; reuse 050's discovered exact external-actor asset-path convention. Empty save list saves all dirty assets and should be avoided. |
| Reload evidence | Installed `asset.py:386–407`: `reload_asset` calls native reload_packages, reports errors, then resolves a fresh object because the prior handle becomes stale. | Generic tool exists, but reload of this world-partition external actor has not been demonstrated. Planner must establish a safe actor-reload/reopen method before using it; dirty unrelated packages must be preserved. |
| Verse-defined default mesh | Official creative_device API lists no data members or mesh setter. Installed `FortniteGame/Plugins/VerseDevices/ScriptTemplates/DeviceTemplate.verse` contains only ordinary creative_device/OnBegin scaffolding. | No documented Verse default-mesh mechanism found. Adding an editable mesh variable does not bind it to the native host representation automatically. |
| Future new placements | Official API says compiled derived creative_device classes appear in Content Browser and are dragged into the scene. | No verified project-owned default/template path found. Explicit placement + instance configuration + readback is the supported operational fallback, conditional on successful pilot. Do not claim fresh drag-in placement changes automatically. |

Important nuance: `require_editable` in `Engine/Plugins/Experimental/ToolsetRegistry/Content/Python/toolset_registry/helpers.py:203` checks whether the object/owner is in a non-editing level instance. It is not a property-specific UEFN support/validation check. Successful generic set_properties therefore remains insufficient evidence of intended Device Mesh semantics.

UEFN's installed `FortniteGame/Plugins/Toolsets/ValkyrieToolset/Content/Python/valkyrie_toolset/registration.py:1–10` says creator exposure is decided by native ToolsetPolicy; registration of a toolset alone does not establish its exposure. Use only live-discovered operations already exposed to this project.

## Bounded pilot recommendation

The generic per-instance setter/reset contract is sufficient to propose a reversible, one-actor experiment; it is not sufficient to promise all-host rollout. Use `prompt_blaster_target_0` with its recorded GUID and a Planner-selected exact neutral locator mesh after the design gate applicable to this revision. Preserve full baseline and recovery checkpoint first.

1. Inspect the native actor `staticMesh` field's metadata and Details label/read-only state. Prefer the actor-level field if it is the actual intended Device Mesh/Static Mesh override. Write that actor field through ObjectTools with the selected StaticMesh reference; do not begin by patching the runtime component.
2. Immediately reread actor override and runtime component mesh. Require both to identify the selected asset, with unchanged actor GUID/script, transforms, outgoing/incoming references and non-mesh representation settings. If the actor setter does not drive the component, stop the pilot and inspect native construction/Details support instead of layering speculative component writes.
3. Save only the affected external actor. Require successful native save, clean package state and post-save actor/component readback. Build Verse natively under the current no-game/no-cook restriction; reacquire actor by GUID and repeat identity/mesh/reference checks after compilation/reinstancing.
4. Establish a safe supported reload or editor reopen path and reread the same saved actor. Generic reload_asset exists but may reinstance an external actor; do not treat in-memory readback as disk persistence. If reload/reopen cannot be performed safely now, explicitly mark persistence across reopen pending, and withhold the broad rollout claim.
5. Roll back using the captured original actor override (`null`) and any documented native reset pathway, then verify its Agency fallback and unchanged identity; this rollback behavior itself tests that the field is an override rather than a detached component patch. Restore the selected override only as authorized. Record actual results instead of presuming reset reconstructs the mesh.

A direct component edit may be technically possible, but is a lower-confidence fallback: construction/build may replace it, and native Actor Device Mesh semantics are still unresolved. It should not silently substitute for the actor-field pilot.

For future hosts, adopt an explicit post-placement mesh configuration and audit step after a successful persistence pilot. Each newly dragged compiled Verse class gets the verified override, then actor/component readback and save. Avoid duplicating stateful live target actors because duplication can carry target IDs and bound objects. A project-owned template could be researched later, but no supported template/default implementation is established here.

## Sources and limits

- [Epic creative_device API](https://dev.epicgames.com/documentation/en-us/fortnite/verse-api/fortnitedotcom/devices/creative_device): placement lifecycle; functions without SetMesh; no data members.
- [Epic Editable Properties](https://dev.epicgames.com/documentation/en-us/fortnite/editable-properties-in-verse): user-authored @editable fields configure Verse data, not a documented native host mesh hook.
- [Epic Create Your Own Device](https://dev.epicgames.com/documentation/en-us/fortnite/create-your-own-device-in-verse): web retrieval returned only a heading, so its inaccessible body is not used to assert support.

Official-documentation searches did not establish a named Device Mesh customization or project-level default API. This is absence of evidence in inspected sources, not proof UEFN forbids all instance customization. Community posts suggesting component edits were excluded as support evidence. No experiment was executed by this worker. 050 preserved Agency and cannot count as mesh replacement or persistence evidence. This worker started no playtest; Planner/Supervisor retain responsibility for final live session state verification.
