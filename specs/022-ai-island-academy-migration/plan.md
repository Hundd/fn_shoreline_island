# Implementation plan

## Current-system audit

| Concern | Existing owner | Dependency chain |
| --- | --- | --- |
| Prompt sequence and Prompt Badge | `byte_island_game_manager` | button input -> `player_states` -> HUD -> tracker |
| Pattern Scanner | `fn_shoreline_island_loop_station/progress` | Claim/input -> per-player state -> station display -> tracker |
| AI Classifier | `fn_shoreline_island_signal_station/progress` | Claim/routing -> per-player state -> HUD/board -> tracker |
| Confidence Core | `fn_shoreline_island_energy_station/progress` | Claim/value buttons -> per-player state -> board -> tracker |
| Error, Tool, Skills, Agent zones | respective `*_station/progress` files | Claim/input -> per-player state -> board/HUD -> tracker |
| Hub labels | `fn_shoreline_island_hub_signs` | static billboards -> alternating display refresh |
| Journal/recommendations | `fn_shoreline_island_academy_journal` | existing managers/trackers -> player UI -> recommendation |

Existing state maps and tracker assignments already scope progress and rewards
to individual players. Presentation changes must not alter those links.

## Delivery order

1. Create and maintain this feature specification, audit, and verification
   record.
2. Convert global narrative, hub labels, journal labels, zone labels, and badge
   display text to the AI Island Academy Theme Shell.
3. Convert Prompt Lab presentation and explanation; build and playtest its
   correct, wrong, retry, reward, replay, and multiplayer paths.
4. Convert the remaining zones one at a time in route order, verifying each
   before moving on.
5. Add hub AI Core feedback and the final Agent Mission presentation only after
   the existing progress model is confirmed sufficient.
6. Perform project validation, memory calculation, solo end-to-end testing,
   and multiplayer testing; record results before marking requirements done.

## Implementation choices

- Keep names such as `byte_island_game_manager` and `energy` internally during
  migration. Their editor bindings and persistence behavior are higher risk
  than the player-facing benefit of a rename.
- Convert UI text first. World props, signs outside Verse, VFX, audio, and
  island metadata require separate UEFN inspection and are not inferred from
  source searches.
- Express Confidence Core's existing integer values as a display-layer percent
  mapping only after inspecting all relevant board strings and station flow.
- Present Pix AI Core's online-module count in the personal journal by reading
  the same per-player badge sources; it does not write, assign, reset, or
  otherwise alter those sources.
- Agent Mission stations use the bound journal only as a read-only authority:
  after the existing one-time Agent Badge completion, the full-Core finale is
  shown only when that player's journal count is 8/8. Otherwise the normal
  Agent Mode completion message is shown.
- First-time Agent Mission claims are locked below seven restored modules;
  earned Agent Badge replays remain allowed. The optional central VFX finale
  remains deferred because this UEFN MCP build cannot type-bind a placed
  classic VFX Spawner to a Verse device setting.
- The 8/8 branch instead shows a personal eight-second cyan UI restoration
  overlay from the existing journal device. It is spawned only from the
  existing first-time Agent Badge completion path and carries no input or
  progress-writing behavior.
