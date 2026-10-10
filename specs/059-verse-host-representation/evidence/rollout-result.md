# Feature 059 editor rollout result

2026-10-10. Implementer `/root/implementer`, Codex worker model `gpt-6.1-sol`, resolved workflow configuration. Supervisor explicitly released exact 71-host scope in supervisor-rollout-release.md after independent qa-r2-report.md PASS and Planner rollout-review.md. Manifest `5702182f0f647db3dbdf0f40685d2812d1dac5ed89b671ee0ce44e30b99371e2`. Actual task-specific agent review, not human revision approval. No approval.yaml/global rule/tool modifications.

## Changes and preservation

All 71 original ledger actors now use their existing StaticMeshComponent0 with `/VerseEngineAssets/Cube.Cube`; actor.staticMesh remains null. Exactly 70 mesh writes occurred; the already-converted prompt_blaster_target_0 received flags only. Every actor received visibleInGame=false and bNoCollision=true. Native material refresh automatically supplies a WorldGridMaterial-derived MID; no overrideMaterials clearing or material asset edits needed. No actor/component recreation, source edits, target/control/graphics edits, class defaults, or new devices.

Serialized groups were 1,10,10,10,10,10,10,10. Each group first captured full native actor/component/transform/editable/resolved savedActor/native event state, compared original ledger identity/settings, saved the exact actor checkpoint and confirmed clean. Distinct backup of each package is under rollout-checkpoints/; before/after SHA256 paths are in rollout-file-hashes.json. Pilot rollout backup contains its proven Cube state; earlier original Agency checkpoint remains pilot-r2-original.uasset.backup. Native exact-path save after each actor succeeded, clean. No broad save/reload requested, preserving unrelated dirty work.

All 71 full native actor snapshots changed ONLY visibleInGame and bNoCollision. All transforms, enabled flags, script instances, actor overrides, tags and all remaining native properties unchanged. Every editable field, resolved savedActor wrapper reference and native event binding is unchanged. Original census GUID/path/class/name/label/folder/data-layer/spatial/editor-only descriptor identity also matches all 71 after rollout. Actual external graphics/control collision was never targeted; editor preservation does not establish owner-manual cooked interaction.

Native derived component changes are explicitly audited: mesh; automatic WorldGrid MID; cachedMaxDrawDistance refresh from mesh bounds; bHiddenInGame false→true from visibleInGame; BodyInstance from actor bNoCollision. All 71 body readbacks are QueryOnly/Custom; collision responses ignore channels except Visibility overlap. Body changes are limited to collisionEnabled, collisionProfileName and collisionResponses; every other body property unchanged. No direct body/cache/hidden component property writes occurred. Do not infer cooked collision disabled from this editor query state. Full diffs in rollout-native-audit.json.

## Validation and persistence

Native VerseToolset.BuildAll after all groups returned [] diagnostics. Then ALL 71 clean external actor packages were individually reloaded through AssetTools.reload_asset in serialized bounded loops. Native source scopes reload_packages to [the exact asset package], re-resolving after reinstancing. Each returned fresh same actor path; full actor/component/transform/device/resolved wrapper/event/package audit exactly equals its post-edit saved snapshot; every package clean before and after reload. Coverage 71/71, no errors or drift; rollout-persistence.json. Whole editor restart was not tested.

Final whole-scene census inspected all 3,618 actor descriptors and 8,250 StaticMeshComponents including derived types: zero Agency_Computer mesh matches, zero scan errors. Total Cube components=105: exactly 71 original ledger host components plus 34 other scene cubes. All 71 original identities configured, no missing/extra ledger replacements. rollout-final-census.json preserves descriptors and matches. This census concerns the current open level, not other maps or unplaced Epic assets.

Native viewport capture gave a clear neutral gray checker cube on existing fn_shoreline_bot_1_progress with surrounding robot/control graphics retained. CaptureViewport arguments: captureTransform location [-3200,-15100,2630]cm, rotation pitch=-23,yaw=135,roll=0. Inline native image inspected; tool returned no artifact file path. No target graphics moved/hidden for capture. The earlier target-pilot view remains occluded by its actual target sphere; this other host supplies practical material/geometry appearance evidence.

No verified non-cook project-validation operation is exposed by discovered toolsets. Project validation remains unavailable, not passed. Native compile, complete preservation audits, package saves, all71 reload persistence and census are the available editor checks. Owner-manual gameplay remains pending: spawn; shooting/control response; progression/badges; replay/Return; fresh round; solo/shared state; collision/visibility. No game/session/cook/push/playtest ran, and paused automation untouched.

docs/verse-host-placement.md now records proven existing-instance auxiliary flags and all71 persistence, preserving explicit future-placement checklist. No fresh device placed or global default/template changed; new placements still require configuration/audit.

One offline hash-manifest command initially used an unanchored mount replacement, causing read-only path errors. It was corrected to prefix substring conversion; final rollout-file-hashes.json has all 71 valid before/after hashes. No asset path or bytes were changed by that diagnostic error.

Final native GetGameState=Unconnected, all71 affected packages clean, UEFN open. Editor ownership released to Supervisor/QA with NO pending call; subsequent work offline only. Editor rollout objective complete; independent final QA and owner-manual gameplay acceptance remain separate.

## Evidence index

- rollout-native-audit.json — 71 complete before/after snapshots, per-actor native changes/save results and diffs.
- rollout-persistence.json — all71 exact clean reload outcomes and complete fresh readback equality.
- rollout-final-census.json — whole scene census, 0 Agency/0 errors, 71 expected identities.
- rollout-file-hashes.json and rollout-checkpoints/ — original checkpoints and saved hashes.
- rollout-programmatic-scripts.json — exact native orchestration logic; only json import, run()->dict, sequential execute_tool; no engine/Python bypass.
