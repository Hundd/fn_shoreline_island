# Data Blaster respawn binding — 2026-09-29

The retained `fn_shoreline_island_data_blaster` Verse device initially read back `spawn_pads: []`. Its source subscribes to each pad's `SpawnedEvent` to re-equip a respawned player. The device's `granter` wrapper resolved through `savedActor` to the retained `data_blaster_automatic_granter`; the native granter read back `grantCondition: Only if Not Owned`, `bEquipGrantedItem: true`, and `bGrantOnGameStart: true`.

`SceneTools.find_actors` found the four retained `hub_spawner_0..3` actors. Their Verse wrapper references were read from the existing `byte_island_game_manager` device; wrapper 0's `savedActor` was checked against hub_spawner_0. Direct actor paths were rejected by `DeviceToolset.SetDeviceProperty` as not valid `player_spawner_device` values and a readback confirmed the array stayed empty. Setting `spawn_pads` to the four existing Verse wrapper references succeeded. A subsequent `GetDeviceProperties` readback returned exactly those four wrappers in order and retained the same granter.

`AssetTools.save_assets([])` returned true and `VerseToolset.BuildAll` returned no diagnostics. A fresh `StartSession` completed; the editor log recorded `ValidateProject` and successful activation on all server/client platforms at 10:27:02 UTC. `GetGameState` returned `Running`. `StopGame` returned `Completed`, `StopSession` returned without error, and final state was `Unconnected`.

The saved respawn event route and cooked asset configuration are verified. A human respawn with the rifle in Fortnite is still required to confirm the grant and no duplicate weapon in actual play.
