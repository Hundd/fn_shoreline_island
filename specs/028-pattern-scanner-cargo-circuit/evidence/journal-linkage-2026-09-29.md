# Journal and prerequisite linkage — 2026-09-29

Read-only live UEFN `SceneTools.find_actors` confirmed the retained `loop_progress` Verse device and `academy_journal` Verse device. Serialized `DeviceToolset.GetDeviceProperties` readback showed:

- `fn_shoreline_island_pattern_line.configured = true` and its `progress` reference targets the retained `loop_progress` instance (`...VerseDevice_C_UAID_E89C2592D1B5CD0003_1277002985.fn_shoreline_island_loop_progress_0`).
- `academy_journal.lagoon` targets that same `loop_progress` instance. The journal open-button editable is present.
- The progress device retains its `badge_tracker` and `round_settings` editables. Their exact actor bindings were reconciled before legacy station retirement in `legacy-station-bindings-2026-09-29.json`.

Source inspection shows `fn_shoreline_island_academy_journal.has_loop` reads `lagoon.states[player].badge_earned`; `get_loop_status`, `first_seven_online`, `completed_modules` and `recommendation` use that result. The journal labels it “Pattern Scanner.” `fn_shoreline_island_bot_station.agent_mission_ready` calls `academy_journal.first_seven_online`. The cooked solo logic probe separately verified that `loop_progress` sets the badge only after the three ordered stages.

This establishes the saved reference and source route, but not the player-visible journal panel or Agent Mission interaction in a normal Fortnite playtest. T07 and AC-06/09 remain open for those checks.
