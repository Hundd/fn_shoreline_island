# Actual Agency computer inventory

Observed 2026-10-10 through serialized native MCP. SceneTools.find_actors returned 3,618 descriptors. All 3,618 could be inspected; zero inaccessible actors/errors. Every actor's StaticMeshComponent (including derived instanced components) was searched for Agency_Computer in its actual mesh path. Exactly 71 matching components/actors, all VerseDevice_C, all S_Agency_Computer_02. No matching decorative or functional-control Agency computer props were found. This statement describes the open level, not unplaced assets in Epic libraries or other maps.

41 target logic hosts + 30 other auxiliary hosts. Actual buttons, triggers, rings, cones, labels, robots, scenery and VFX are separate editable references; do not replace them. Retired-looking actors stay because this is representation work, not dependency migration/removal. Full GUID/class/mesh census: evidence/agency-census.json. Complete transforms, script identity, native flags, editable values and OFPA paths: evidence/instance-baselines.json. All native ListEventBindings results are empty; this does not imply Verse subscriptions are empty.

| Actor label | Actual script class | Purpose | Measured XYZ cm |
|---|---|---|---|
| fn_shoreline_bot_1_progress | fn_shoreline_island_bot_progress | Badge/progress state | {"x":-3500,"y":-14800,"z":2450} |
| cargo_circuit_target_predict_b | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-100,"y":4500,"z":2400} |
| fn_shoreline_bot_1_station | fn_shoreline_island_bot_station | Mission or effects controller | {"x":-3500,"y":-14000,"z":2450} |
| rescue_run_target_0 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-4700,"y":-14300,"z":2580} |
| rescue_run_target_1 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-4400,"y":-14300,"z":2580} |
| rescue_run_target_2 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-4100,"y":-14300,"z":2580} |
| rescue_run_target_3 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-6900,"y":-14300,"z":2580} |
| rescue_run_target_4 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-6600,"y":-14300,"z":2580} |
| rescue_run_target_5 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-6300,"y":-14300,"z":2580} |
| rescue_run_target_6 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-9300,"y":-14300,"z":2580} |
| rescue_run_target_7 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-9000,"y":-14300,"z":2580} |
| rescue_run_target_8 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-8700,"y":-14300,"z":2580} |
| academy_journal | fn_shoreline_island_academy_journal | Journal UI/navigation | {"x":-300,"y":600,"z":2410} |
| byte_island_game_manager | byte_island_game_manager | Global spawn/progress/controller; separate buttons | {"x":0,"y":0,"z":2500} |
| loop_progress | fn_shoreline_island_loop_progress | Badge/progress state | {"x":500,"y":3600,"z":2450} |
| signal_progress | fn_shoreline_island_signal_progress | Badge/progress state | {"x":-3200,"y":200,"z":2450} |
| energy_progress_0 | fn_shoreline_island_energy_progress | Badge/progress state | {"x":-3200,"y":-3300,"z":2450} |
| debug_station_1_progress | fn_shoreline_island_debug_progress | Badge/progress state | {"x":-3200,"y":-7100,"z":2450} |
| event_station_1_progress | fn_shoreline_island_event_progress | Badge/progress state | {"x":-3200,"y":-10900,"z":2450} |
| fn_shoreline_island_nursery_progress | fn_shoreline_island_nursery_progress | Badge/progress state | {"x":-3500,"y":-18500,"z":2450} |
| error_lab_solo_controller | fn_shoreline_island_debug_station | Mission or effects controller | {"x":-4200,"y":-7300,"z":2450} |
| error_lab_target_left | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-3500,"y":-5700,"z":2550} |
| error_lab_target_stop | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-3200,"y":-5700,"z":2550} |
| error_lab_target_right | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-2900,"y":-5700,"z":2550} |
| field_note_controller | fn_shoreline_island_field_observations | Optional observation UI | {"x":600,"y":400,"z":2450} |
| fn_shoreline_island_nursery_station | fn_shoreline_island_nursery_station | Legacy Skills controller (retain bindings) | {"x":-3500,"y":-17000,"z":1800} |
| cargo_circuit_target_predict_c | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":200,"y":4500,"z":2400} |
| hangar_route_controller | fn_shoreline_island_route_demonstration | Mission or effects controller | {"x":6500,"y":-12900,"z":2330} |
| tool_lab_target_light | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-2900,"y":-9500,"z":2580} |
| prompt_blaster_target_0 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":9000,"y":-3300,"z":2630} |
| fn_shoreline_island_pattern_line | fn_shoreline_island_pattern_line | Mission or effects controller | {"x":-500,"y":4100,"z":2450} |
| cargo_circuit_target_predict_a | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-400,"y":4500,"z":2400} |
| fn_shoreline_island_nursery_station4 | fn_shoreline_island_nursery_station | Legacy Skills controller (retain bindings) | {"x":-13700,"y":-17000,"z":2450} |
| fn_shoreline_island_prompt_workshop | fn_shoreline_island_prompt_workshop | Mission or effects controller | {"x":6500,"y":1800,"z":2450} |
| academy_data_energy_manager | fn_shoreline_island_data_energy | Mission or effects controller | {"x":7800,"y":-2400,"z":2500} |
| fn_shoreline_island_bot_4_station | fn_shoreline_island_bot_station | Mission or effects controller | {"x":-13700,"y":-14000,"z":2450} |
| prompt_blaster_target_6 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":10600,"y":-3100,"z":2630} |
| confidence_target_cool | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-3000,"y":-2900,"z":2400} |
| prompt_lab_blaster_controller | fn_shoreline_island_prompt_blaster | Mission or effects controller | {"x":7700,"y":-2500,"z":2500} |
| prompt_blaster_target_1 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":9000,"y":-4500,"z":2630} |
| prompt_blaster_target_2 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":9000,"y":-3900,"z":2630} |
| prompt_blaster_target_3 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":9600,"y":-4700,"z":2630} |
| prompt_blaster_target_4 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":9800,"y":-4200,"z":2630} |
| prompt_blaster_target_5 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":9800,"y":-3400,"z":2630} |
| prompt_blaster_target_7 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":10600,"y":-3700,"z":2630} |
| prompt_blaster_target_8 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":10600,"y":-4300,"z":2630} |
| pop039_target_5 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-4080,"y":-17480,"z":2680} |
| pop039_target_6 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-4080,"y":-16680,"z":2680} |
| signal_station_0 | fn_shoreline_island_signal_station | Mission or effects controller | {"x":-3200,"y":900,"z":2400} |
| classifier_target_food | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-3300,"y":1100,"z":2400} |
| classifier_target_furniture | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-3000,"y":1100,"z":2400} |
| classifier_target_vehicle | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-2700,"y":1100,"z":2400} |
| prompt_lab_data_core_rescue_controller | fn_shoreline_island_prompt_lab_controller | Mission or effects controller | {"x":7600,"y":-3800,"z":2500} |
| pix_travel_controller | fn_shoreline_island_pix_travel | Travel UI/controller | {"x":-100,"y":2700,"z":2500} |
| energy_station_0 | fn_shoreline_island_energy_station | Mission or effects controller | {"x":-3200,"y":-2600,"z":2450} |
| confidence_target_check | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-3300,"y":-2900,"z":2400} |
| confidence_target_release | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-2700,"y":-2900,"z":2400} |
| event_station_1_station | fn_shoreline_island_event_station | Mission or effects controller | {"x":-3200,"y":-10200,"z":2450} |
| tool_lab_target_scanner | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-3500,"y":-9500,"z":2580} |
| tool_lab_target_speaker | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-3200,"y":-9500,"z":2580} |
| pop039_production_controller | fn_shoreline_island_popbridge_production | Mission or effects controller | {"x":-4800,"y":-17000,"z":1800} |
| pop039_target_0 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-2580,"y":-17440,"z":2680} |
| pop039_target_1 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-2580,"y":-17280,"z":2680} |
| pop039_target_2 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-2580,"y":-17120,"z":2680} |
| pop039_target_3 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-3080,"y":-17280,"z":2680} |
| pop039_target_4 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-3580,"y":-17080,"z":2680} |
| pop039_target_7 | fn_shoreline_island_data_target | Target logic; separate hit surface/ring/cone/label | {"x":-4900,"y":-16800,"z":2680} |
| fn_shoreline_island_data_blaster | fn_shoreline_island_data_blaster | Weapon grant support | {"x":7500,"y":-2400,"z":2500} |
| fn_shoreline_island_nursery_station3 | fn_shoreline_island_nursery_station | Legacy Skills controller (retain bindings) | {"x":-10300,"y":-17000,"z":2450} |
| fn_shoreline_island_nursery_station2 | fn_shoreline_island_nursery_station | Legacy Skills controller (retain bindings) | {"x":-6900,"y":-17000,"z":2450} |
| hub_static_sign_refresh | fn_shoreline_island_hub_signs | Sign refresh | {"x":600,"y":200,"z":2450} |

Source inspection: all represented script classes except byte_island_game_manager call unqualified Hide() in OnBegin; 70 instances share that existing auxiliary intent. Data target subscribes hit_surface.TriggeredEvent rather than host damage; its visible target and movement logic operates separate ring/cone/hit_surface objects. Bot station uses its own GetTransform for a proximity check, and other controllers use device transforms as reference validity checks: preserve complete transforms exactly. Byte manager owns spawn/button/round subscriptions and reward state, no own-mesh interaction; its separate buttons identify actions. It lacks Hide(), so assigning a nonphysical runtime-hidden locator there is an explicit representation correction, not evidence it was already invisible. Manual gameplay acceptance remains required.

