# Verse host computer replacement — feasibility diagnosis

2026-10-10. User correction: “we were talking about replacing this computer asset with something more appropriate but prompt_blaster_target_0 and all new use this computer”. This is the current corrective task; autonomous improvement automation remains paused. Read-only Planner inspection; no source/assets changed or games/sessions/cook/push started.

## What was missed

050 changed only nursery_progress visibility/collision and folder. Its plan explicitly excluded mesh changes and class defaults, and its review accepted Agency as an editor locator. That did not deliver the requested replacement or prevent computers on new devices. It must not be presented as completing this request.

## Current measured target

prompt_blaster_target_0 is VerseDevice_C_UAID_E89C2592D1B5860503_1527752703, GUID E34FDE8E-4CA2-8AA3-6877-63B83BBFA019. Full transform remains [9000,-3300,2630]cm, rotation0/0/0, scale1. Actor staticMesh override is null, but StaticMeshComponent0 renders /Game/Environments/Apollo/Sets/Agency/Props/Meshes/S_Agency_Computer_02.S_Agency_Computer_02. That component is NOT editor-only. EditorOnlyStaticMeshComponent is editor-only but has null mesh. Native visibleInGame=true, bNoCollision=false; data_target source calls Hide() in OnBegin. These observations do not establish cooked collision behavior.

The host owns the fn_shoreline_island_data_target script, target_id0/mission_id0/display_label `◆ BLUE CORE`. hit_surface, ring_mesh, cone_mesh and label_board are separate bound objects; they render/handle the actual shooting target. Replacing the host representation should preserve this actor/script identity, complete transform, all references and the target graphics. Replacing the blue-core prop alone would miss the user's correction.

Evidence: evidence/diagnostic-baseline.json. Earlier050 census counted71 loaded VerseDevice actors with Agency components; that historical count is not a fresh complete059 inventory.

## Native capabilities and unresolved support

Current ObjectTools schema exposes actor staticMesh and component staticMesh with StaticMesh reference types, and the editor-only mesh component. Generic set_properties exists. This demonstrates reflection access, not proof that the setting is a supported UEFN Device Mesh customization, that it updates the component through the intended construction path, or that it survives Verse compile/save/reopen. There is no separately named Device Mesh/icon/default field in the inspected actor schema. No raw component or class-default mutation has been attempted.

Epic's [creative_device API](https://dev.epicgames.com/documentation/en-us/fortnite/verse-api/fortnitedotcom/devices/creative_device) documents Show/Hide/transform operations and placing compiled derived classes, but no SetMesh or user-defined default-mesh member. This is evidence of the documented Verse API boundary, not proof that every possible editor mechanism is unsupported. The native creation tutorial did not provide readable mesh-customization documentation through the web tool. No safe project-owned default/template mechanism has been established from this inspection. Do not edit Epic's shared VerseDevice Blueprint/class defaults.

A narrow project mesh search for SM_ returned only an academy cat asset, unsuitable for infrastructure; no arbitrary decorative replacement has been selected. Asset discovery alone would not resolve persistence/support.

## Bounded next decision

1. Resolve an intended native instance mesh setting and its persistence before promising rollout. A reversible isolated editor-only representation pilot would need an exact approved neutral locator asset and baseline, then readback after save/native Verse compile/reload. This is a potential follow-up, NOT an approved/executed mutation in this report. No session/cook/game needed for that editor-persistence investigation.
2. If native instance customization is supported, retain all existing actor/script identities and apply to one target host first. Only after persistence is established inventory remaining same-class host instances for bounded rollout. A neutral noninteractive locator is the intended representation; hide-only or underground placement does not satisfy replacement.
3. For newly placed devices, use a supported project template/default only if confirmed. Otherwise an explicit project placement/configuration step with readback could prevent omissions operationally, but must not be claimed to change UEFN's generated class default automatically. Duplication that accidentally copies live target bindings is not a safe generic factory.
4. If no supported persistent representation customization exists, report that exact limitation and discuss a different architecture separately; do not silently replace stateful Verse actors, migrate to Scene Graph or force engine defaults in this corrective task.

No full executable map/implementation bundle is created because the replacement mechanism, suitable locator asset and future-placement behavior remain unresolved. Delegated agent review permits autonomous review but does not establish technical support. Supervisor specifically requested bounded diagnosis rather than a speculative full059 plan. Final native GetGameState returned Unconnected. Current source/assets untouched; editor ownership released, no call in flight.
