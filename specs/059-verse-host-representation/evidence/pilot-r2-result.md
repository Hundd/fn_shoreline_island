# Revision 2 bounded component pilot

2026-10-10. Worker `/root/implementer`, Codex `gpt-6.1-sol`. Supervisor handed exclusive editor ownership; all calls serialized. Actual agent review is evidence/supervisor-review-r2.md, manifest `5702182f0f647db3dbdf0f40685d2812d1dac5ed89b671ee0ce44e30b99371e2`. Readiness failed only for absent human approval.yaml; task-scoped delegation used, no human approval fabricated and no tool/rule changed.

## Exact mutation and checkpoint

Same actor GUID E34FDE8E-4CA2-8AA3-6877-63B83BBFA019, path `/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.VerseDevice_C_UAID_E89C2592D1B5860503_1527752703`; existing `.StaticMeshComponent0`. Fresh full actor (278 properties), component (164 properties), device editable and resolved savedActor reference snapshots recorded in pilot-r2-native-audit.json. Original Agency MID resolves as MaterialInstanceDynamic, parent `/Game/Environments/Apollo/Sets/Agency/Props/Materials/MI_Agency_Computer_02.MI_Agency_Computer_02`. Original mesh/material array captured for explicit restoration; generic component CDO reset was never used.

Exact actor package saved/clean before mutation. Distinct backup `pilot-r2-original.uasset.backup`, original SHA256 `CB8BDA1AA63BCF12A0C5BA9933614D826711D796657365CA77C2D81D46A4133D`. Backup is evidence/recovery copy only; no loaded actor binary was overwritten.

Only setter: ObjectTools.set_properties on EXACT COMPONENT with JSON values `{"staticMesh":{"refPath":"/VerseEngineAssets/Cube.Cube"}}`; returnValue=true. Component immediately reports Cube. Native refresh automatically changed overrideMaterials from Agency MID to `/Engine/Transient.MID_WorldGridMaterial_0`, parent `/Engine/EngineMaterials/WorldGridMaterial.WorldGridMaterial`. Optional overrideMaterials=[] was unnecessary and NOT executed. Actor staticMesh remains null. Original Agency MID still resolved before persistence reload.

## Save, compile and isolated persistence

Exact external actor asset `/fn_shoreline_island/__ExternalActors__/fn_shoreline_island/2/NS/MAOL7TIQUW0V44WSCD7P7H.VerseDevice_C_UAID_E89C2592D1B5860503_1527752703` saved true; is_dirty=false. Native Verse BuildAll returned [] (no diagnostics). Cube and material survived compile.

Installed native asset.py:386–407 checked before reload: it resolves this asset's package and calls reload_packages([package], ASSUME_POSITIVE), then returns a re-resolved object. The explicit one-package list scopes reload to saved pilot package; no broad save/reload or dirty unrelated package discard requested. is_dirty=false immediately before reload. Native reload_asset returned same actor path successfully. Fresh find_actors reacquired same GUID/path/class/folder with cube bounds. Fresh full actor/component/device/wrapper/native binding readbacks followed; old object references were re-resolved from paths by tools.

Saved SHA256 after mutation and after reload `E05A4FE8BB3FDA8D88228485E30983B4A68842739352BA84880BB402D0FE2DB6`. Exact package remains clean. This proves targeted native package reload persistence; whole editor restart and cooked-game behavior were not tested.

## Expected/actual and limits

All actor properties are byte-for-byte identical as JSON values to pre-pilot, including GUID/script instance, tags, root, enabled flags, actor.staticMesh=null, visibleInGame=true and bNoCollision=false. XYZ [9000,-3300,2630]cm, rotation [0,0,0], scale [1,1,1] retained. Every device editable and resolved savedActor reference unchanged; native event bindings remain empty. Target graphics/controls were never edited.

Exactly three component property differences after setter and after reload: staticMesh Agency→Cube; native automatic overrideMaterials Agency MID→WorldGrid MID; cachedMaxDrawDistance 0→5977.2177734375 (native derived cache refresh, no direct write). BodyInstance collision settings and all other component properties unchanged. Bounds now [8950,-3350,2580]–[9050,-3250,2680]cm, confirming centered 100cm cube at unchanged actor transform.

Neutral World Grid material identity is proven by native parent readback. Three native viewport captures were inspected, but existing blue spherical target graphics obscure the locator from those views. No unobstructed visual cube appearance claim is made; this visual limitation requires independent review before rollout. No graphics/visibility changes made to improve captures. One diagnostic get_properties query included unavailable bHiddenInEditor and returned error; subsequent complete schema-derived snapshot read succeeded. This was read-only and did not alter state.

Live-discovered toolsets have no verified non-cook project validation operation. Native full-state verification, exact save/clean, compile and isolated reload passed; UEFN project validation remains unavailable rather than claimed passed. Gameplay remains owner-manual. No session/game/cook/push/playtest, source/default/component replacement or rollout executed. R5 future-placement remains conditional procedure, not verified global default. Representation mechanism succeeded on one actor; Supervisor/QA review must assess visual limitation and derived cache before broader release.

Final GetGameState=Unconnected. Exact actor package clean; UEFN open. Editor released to Supervisor, no pending call. Bounded experiment completed; overall 71-host feature remains incomplete.
