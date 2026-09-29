# Legacy dock retirement — 2026-09-29

The exact actor set was selected from `evidence/editor-inventory.json` by labels `^loop_[0-3]_` and `^loop_station_[0-3]$`. Serialized `SceneTools.remove_from_scene` returned true for all 128 actors ({"0":31,"1":31,"2":31,"3":31,"station":4}), and `AssetTools.save_assets([])` succeeded. This removes each station controller and its 30 local controls, labels, board, tile markers, and robot/parcel/lantern props. The broad `campus_loop_dock_sheds` actor was left intact for separate component inspection.

`SceneTools.find_actors(name="loop_", collision_channels=[])` showed `loop_progress`, `loop_badge_tracker`, `loop_dock_0..3`, `loop_hub_walkway`, `hub_loop_route`, and shared/identity actors still present. The shared hub teleporter, four spawners, round settings, global audio, and journal dependencies were excluded from the removal predicate. Existing bindings were recorded before deletion in `legacy-station-bindings-2026-09-29.json`.

The new controller's 36 required non-target references were read back without a missing `savedActor` (see `full-controller-bindings-2026-09-29.json`), and its 15 ordered target refs and phase arrays were read back. It was enabled only after a clean Verse build and full UEFN cook of the disabled assembly.
