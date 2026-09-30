# Feature 030 read-only preflight — 2026-09-30

This is editor inspection for revision 2, before design approval. No scene, Verse, asset or gameplay mutation was performed. The generated plan remains a draft, and `approval.yaml` is absent. `python tools/map_workflow.py plan specs/030-confidence-reactor-rescue/map.yaml --ready` failed for that specific reason.

- Current level: `/fn_shoreline_island/fn_shoreline_island` (Unreal MCP `SceneTools.get_current_level`).
- `SceneTools.find_actors` with `name: energy_` found 116 matching actor labels, including the four old Verse controllers: `energy_station_0`, `energy_station_2_station`, `energy_station_3_station`, and `energy_station_4_station`. This is a label search, not a complete ownership or dependency manifest.
- The existing `energy_progress_0`, `energy_0_badge_tracker`, `energy_0_feedback`, `energy_0_board`, and legacy controls are present. The editor results do not yet establish their bindings or suitability for reuse.
- Live actor bounds reconfirmed these floor X ranges in world centimeters, all with top Z=2400: `energy_0_floor` -4600..-1800; `energy_station_2_floor` -7400..-4600; `energy_station_3_floor` -10200..-7400; `debug_station_4_floor5` -13048..-10248. The gap between the debug support and station 3 is 48 cm (-10248..-10200). `energy_station_4_floor` has zero X width at -11600. Collision and traversal remain untested.
- Local `Content/fn_shoreline_island_energy_progress.verse` currently exposes `ensure_player(player)` and `complete(player)`; its three `completed` flags are indexed by `state.challenge`. The old `energy_station` source still contains percentage/claim/Start behavior. The new CHECK/COOL/RELEASE lesson therefore still needs the scoped controller change described in the plan.
- `SessionToolset.GetGameState` returned `Unconnected`; no playtest game was running at inspection.

Before any editor mutation: obtain explicit approval of the current preview and plan, record its manifest digest, pass `plan --ready`, inspect exact actor dependencies and full transforms, then save a recovery checkpoint. This preflight does not satisfy any gameplay or validation acceptance scenario.
