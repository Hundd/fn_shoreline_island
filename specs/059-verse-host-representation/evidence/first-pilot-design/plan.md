# Concrete implementation plan

Read inventory.md, evidence/agency-census.json, evidence/instance-baselines.json and evidence/technical-scout-review.md. Reuse all 71 existing actors. No actor placement, deletion, movement, script edit, class default, material asset edit or geometry construction.

## Pilot (one actor only)

Actor prompt_blaster_target_0, GUID E34FDE8E-4CA2-8AA3-6877-63B83BBFA019, exact path /fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.VerseDevice_C_UAID_E89C2592D1B5860503_1527752703. XYZ [9000,-3300,2630] cm, rotation [0,0,0], scale [1,1,1]. Script fn_shoreline_island_data_target_0. Baseline actor staticMesh=null; component StaticMeshComponent0 mesh=/Game/Environments/Apollo/Sets/Agency/Props/Meshes/S_Agency_Computer_02.S_Agency_Computer_02. Baseline visibleInGame=true, bNoCollision=false. Separate ring/cone/label/hit surface are untouched.

1. Reacquire GUID, save THIS actor as recovery checkpoint. Preserve unrelated dirty changes. Capture complete current actor/component/Verse/native binding state and actor asset path. Record baseline asset file/hash or backup without editing its bytes.
2. ObjectTools.set_properties on THIS ACTOR path with values JSON {"staticMesh":{"refPath":"/VerseEngineAssets/Cube.Cube"}}. No component path write; no Blueprint/class object input. This is a bounded candidate native instance override, not an already-proven device customization API.
3. Immediately read actor and StaticMeshComponent0 staticMesh, identity, root/component transforms and current overrideMaterials. Require component follows automatically. Baseline has a transient MID_MI_Agency_Computer_02_0 override; confirm construction refresh gives a suitable neutral cube. If actor reports cube but actual component stays Agency or produces broken materials, STOP and reset actor staticMesh to original null via reset_properties. Do not mask failure by raw component/material writes.
4. Save exact actor. Native Build Verse Code through discovered schema; inspect result. Reacquire by GUID and compare script identity/settings, transform, binding references, mesh and flags. Flags stay at baseline throughout mechanism proof.
5. Verify saved persistence using supported targeted actor/package reload only after saving and verifying reload scope cannot discard other dirty actors. If a supported reload cannot isolate the actor, do not reload the whole map and discard unrelated work; document disk persistence evidence and limitation, and stop rollout until Supervisor assesses the required gate. A save acknowledgement or compile alone is not full reopen proof.
6. Fail closed: return to original actor override via reset_properties; read component restoration, save and record result. If any mutation has ambiguous result, inspect before recovery and do not replay blindly.

## Rollout after pilot success and recorded agent review

Exactly the 71 identities in the ledger, including pilot; groups of at most 10 serialized edits with readback then targeted saves. No newly discovered actor is silently added. Actor values: staticMesh cube, visibleInGame=false, bNoCollision=true. The 70 instances with source Hide() are auxiliary logic and use external target/control collision. Byte manager is a separately justified auxiliary: its OnBegin subscribes separate spawn/button/round devices and has no host-mesh interaction; hiding and disabling host collision prevents the new cube becoming an activity/obstacle. This changes native configuration to implement nonphysical support intent, not actual gameplay devices. Preserve all enabled flags, transforms, identities, script fields, folders, tags and native event bindings. Compare each complete baseline after edits; compile once after rollout, save, repeat whole-scene Agency census. Require 0 remaining Agency computer components and 71 configured exact hosts. Any mismatch stops the next group.

## Future placement process

No project-wide default/template was found or verified. For EVERY new Verse host, place the requested class normally, record its identity and intended purpose, then apply the proven actor staticMesh cube override and appropriate auxiliary visibility/no-collision configuration before connecting game logic. Read both actor and component meshes, full transform and script class; set only intentional editable bindings, save and check after native compile. Run the whole-scene Agency census before handoff to catch unconfigured hosts. Interactive/scenery roles require purpose-specific review; do not automatically turn genuine controls into cubes. Never use a configured live device duplicate as a generic factory.

## Validation and rollback

Native Verse compilation; exact actor/setting/reference/transform diffs; available non-cook editor validation only; save and safe targeted reload evidence. User manual checklist: all mission shooting/control responses, progression, badges, replay/Return, fresh-round reset, solo and shared state, no unintended host obstruction. Do not start any session/game or cook. Rollback per actor to saved original actor staticMesh override and original native flags from ledger; no recreation. If original null reset does not reconstruct Agency, report failure rather than raw component changes.

Map preview uses corridor only as a schematic unchanged 10m pilot context; never construct its rectangle. Inventory is the complete island rollout ledger. No walking, targets, lesson sequence, entry/exit, recovery, rewards or learning objectives are added.

