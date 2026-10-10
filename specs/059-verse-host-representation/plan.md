# Revision 2 — native component mesh pilot

Earlier design and manifest are preserved in evidence/first-pilot-design/. Failed actor-field attempt and independent preservation QA remain in evidence/pilot-result.md and evidence/qa-report.md. This is a NEW review scope, not a fallback silently added to the old approval.

Read evidence/technical-scout-alternative.md: live native Details for the existing StaticMeshComponent exposes an active Static Mesh picker with selectable assets and Materials Element0 picker/reset. bEditableWhenInherited=true; the inherited-root tooltip caveat remains unresolved. These are grounds for a bounded native field experiment, not a persistence claim.

## Exact one-actor experiment

Actor prompt_blaster_target_0, GUID E34FDE8E-4CA2-8AA3-6877-63B83BBFA019. Actor path /fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.VerseDevice_C_UAID_E89C2592D1B5860503_1527752703; component path is that plus .StaticMeshComponent0. Script fn_shoreline_island_data_target_0. XYZ [9000,-3300,2630]cm, rotation [0,0,0], scale [1,1,1].

Preserve actor.staticMesh=null, visibleInGame=true, bNoCollision=false, enabled state, full actor/component transforms, GUID/path/script identity, tags/folder, events and all editable references. Actual ring, cone, label, hit surface and controls remain untouched. No shared class defaults, actor recreation or component replacement.

1. Reacquire exact GUID/component; capture full fresh actor/component/Verse snapshots and resolved wrapper references. Save only exact actor/package; confirm clean. Make distinct checkpoint/hash without overwriting first-pilot backup. Capture original component mesh and overrideMaterials; confirm original transient MID still resolves before changes. Establish original-value restoration or supported checkpoint recovery first.
2. ObjectTools.set_properties on EXACT COMPONENT with values JSON {"staticMesh":{"refPath":"/VerseEngineAssets/Cube.Cube"}}. This matches native Details Static Mesh. Cube is existing measured 100cm gray grid mesh. Native UI selection is an alternative only if deliberately selected and recorded beforehand; no blind UI retry after an ambiguous tool result.
3. Immediately inspect result/readback, component appearance, actor override null, all identities/transforms/flags/bindings. Setter rejection or unchanged Agency mesh means stop and restore original values if needed. Do not retry actor staticMesh, replace components or edit classes.
4. ONLY if component Cube succeeded but retained unsuitable Agency MID, the reviewed native per-instance material reset is allowed: same exact component ObjectTools.set_properties values {"overrideMaterials":[]}. This corresponds to removing the per-instance material override via native Materials reset, allowing Cube material slots. No material asset changes. Read mesh/materials and appearance immediately. If reset rejected, construction regenerates Agency material or appearance is unsuitable, stop and rollback. Do not add other material experiments.
5. Save exact actor/package, confirm clean and read back. Native Verse compile; inspect diagnostics, reacquire GUID/component/script and compare baseline fields. Intentional deltas are ONLY component mesh and optional empty material overrides/native automatic material refresh. Actor staticMesh remains null. Constructor reversion fails the pilot.
6. Prove disk persistence using supported targeted exact external-package reload after clean save/checkpoint and scope inspection; reacquire all object references after reload and repeat full mesh/material/identity/transform/reference checks. Do not reload whole map or discard unrelated dirty work. If isolated reload is unsupported, stop rollout and explicitly report persistence pending. Save/hash/compile alone do not prove reopen persistence. No reload is needed for a rejected setter with proven unchanged state.
7. Rollback uses EXPLICIT original Agency component mesh /Game/Environments/Apollo/Sets/Agency/Props/Meshes/S_Agency_Computer_02.S_Agency_Computer_02 and original captured overrideMaterials (baseline [{"refPath":"/Engine/Transient.MID_MI_Agency_Computer_02_0"}], reacquire/check validity). Do not assume reset_properties(component.staticMesh) restores Agency: it may use generic component class CDO rather than this inherited component archetype. If original MID references are invalid after reload, use only established supported checkpoint recovery; no binary editing or shared-default mutation. Read back complete restored baseline and save. Any restoration failure is a blocker, not success.

## Conditional rollout — separate release required

No rollout is released by the experiment alone. After pilot success and Supervisor review: exactly 71 ledger identities, groups of at most 10, existing component Static Mesh and only proven necessary per-instance material reset; actor.staticMesh stays null. Read back full baselines and save each group before next. 41 target hosts plus 30 other auxiliary hosts; no actual Agency scenery/control computers exist in 3,618 inspected actors.

Subsequent auxiliary actor visibleInGame=false/bNoCollision=true is role-justified separately from mechanism proof. 70 hosts already call Hide() and use external functional devices. Byte manager lacks Hide(), but owns separate spawn/button/round subscriptions without host-mesh interaction; a nonphysical hidden locator is an explicit representation correction. Preserve actual hit/control collision and spatial transforms (bot proximity checks use host GetTransform). Require final census zero Agency computer components, no read errors, 71 configured exact hosts.

## Future placement

No verified global default/template exists. Conditional operational process: normal placement, role classification, configure existing component via proven native field and necessary per-instance material reset, read component mesh and unchanged actor override, preserve correct script/transform and intentional bindings, exact save/build/persistence audit. It remains unproven until demonstrated. Never duplicate live target bindings as a factory. Real controls/scenery need role-specific representation decisions.

## Validation boundary

Native Verse compile, baseline diffs, exact save/reload evidence and available editor-only validation. No session/game/cook/push/playtest; generated generic game/cook checklist cannot override user restriction. Manual gameplay acceptance remains pending for spawn, shooting/controls, progression/badges, replay/Return, fresh round, solo/shared state and collision.

Map corridor is an unchanged schematic context, never geometry. No new route/objective/learning step/target/reward.
