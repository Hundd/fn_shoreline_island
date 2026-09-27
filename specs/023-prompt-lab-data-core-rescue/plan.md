# Implementation plan

1. Inventory the existing Prompt Lab actors, devices, Verse bindings, and surrounding greenhouse/campus footprint in UEFN. Record transforms and save a recovery checkpoint before editor changes.
2. Build the vertical lab and its routes around the existing Prompt Lab footprint. Use supported Creative devices for rail, boost, carryable and receiver interactions; use props, movers, and effects for Pix's visible executions.
3. Build a separate `fn_shoreline_island_prompt_lab_controller` with three player-local mission stages and discovery/selection flags. Keep `byte_island_game_manager` as the journal's established Prompt Badge and round source. Add a guarded one-time award method there; disable its legacy four-button subscriptions only after the new controller, props, and interactions are bound and verified.
4. Bind new world controls and props through UEFN. Save and read back all changed actors and Verse device references. Update hub, journal, and optional practice wording to match the new required mission.
5. Build Verse, validate the project, cook a fresh session, and play through correct, wrong, retry, replay, reset, respawn, solo, and shared-world multiplayer cases. Record evidence before checking tasks.

The first-stage clue scanners are independent so different players can explore in parallel. Selecting Red Core or a wrong destination preserves all other discovered prompt details. For physical rejection, a movable Red Core travels to the reactor and returns; the Research Scanner and Storage Bay are distinct placed landmarks for later wrong-destination deliveries. These reactions remain subject to build, binding, and in-client verification.

The Green Core is also a complete first-stage choice. Its movable prop should travel to the selected destination, receive the same harmless reactor rejection when applicable, and return to its pedestal. The destination and clue selections stay intact so the player can change only Green to Blue. Verify all three core choices in a client session before accepting FR-003.

The redesign includes sections 26–40. Section 26's powered exit Grind Rail is optional polish; sections 27–40 define device guidance, interaction and text rules, wrong-answer behavior, reward, duration, multiplayer, priorities, and acceptance. Verify those requirements against the completed island rather than treating section 25 as the end of the deliverable.
