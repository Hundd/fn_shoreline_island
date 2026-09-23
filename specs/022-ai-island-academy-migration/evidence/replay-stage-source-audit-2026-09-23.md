# Replay-stage ownership source audit — 2026-09-23

Scope: the leave/reclaim boundary for the seven claimed AI stations. This is
read-only source evidence, not an in-client replay test.

| Zone | Stage selected by Next/Replay all | Reclaim source |
| --- | --- | --- |
| Pattern Scanner | `fn_shoreline_island_loop_station.on_next` now writes the selected `challenge` to that player's `loop_player_progress`. | `on_claim` loads `state.challenge`. |
| AI Classifier | `signal_station.on_next` changes `state.challenge`. | `show_ready` reads that same state. |
| Confidence Core | `energy_station.on_next` changes `state.challenge`. | `on_claim` reads that state. |
| AI Error Lab | `debug_station.on_next` changes `state.challenge`. | `on_claim` reads that state. |
| AI Tool Lab | `event_station.on_next` changes `state.challenge`. | `on_claim` reads that state. |
| AI Skills Lab | `nursery_station.on_next` writes its selected `challenge` to `state.challenge`. | `on_claim` reads that state. |
| AI Agent Mission | `bot_station.on_next` cycles `state.stage`. | `on_claim` reads that state. |

The six non-Pattern stations needed no source change in this pass. This audit
does not prove that a completed challenge resumes with the intended board,
props, reward state, and prompt after release, respawn, or a second player's
claim. Those behaviors remain in the deferred solo/two-player playtest scope.
