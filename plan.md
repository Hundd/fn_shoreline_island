# Code Quest: Byte Island — Project Roadmap

## Product Direction

Build a bright, non-combat UEFN learning island where children restore a glitched computer world by solving short computational-thinking puzzles. The experience should feel like an adventure first: demonstrate a concept, let the player solve it, name the concept, add one variation, and reward completion.

The existing shoreline terrain becomes **Byte Island Academy**. Do not convert this project to a LEGO Island; LEGO content requires a separate brand-template project and ruleset.

## Locked Decisions

- **Audience:** ages 8–10; use short sentences and explain every technical term.
- **Release:** public Discover island after private playtesting.
- **Language:** English for MVP; Ukrainian localization is a later feature.
- **Players:** solo or 2–4 player co-op; configure the island maximum to four.
- **Interaction model:** each player has independent puzzle progress and rewards.
- **Technology:** UEFN with Creative devices plus a small Verse state manager.
- **Content:** no combat, weapons, elimination, horror, or punitive failure.
- **Rating:** design for young audiences and report content accurately in IARC; accept the regional ratings IARC assigns.

## MVP: Hub and Path Garden

The first release slice contains one complete learning loop:

1. The player spawns safely in the Academy hub.
2. Pix presents a brief objective within 10 seconds.
3. A labeled path leads to Path Garden using text or icons as well as color.
4. The player activates **Water → Plant → Wait → Harvest**.
5. Correct inputs provide immediate feedback; a wrong input resets only that player's attempt.
6. Completion awards exactly one Circuit Badge per player per round.
7. A short message defines an algorithm as an ordered set of steps.
8. The player returns to the hub through an obvious route or teleporter.

The detailed, testable requirements live in `specs/001-byte-island-mvp/`.

## Implementation Architecture

Use Creative devices for visible interaction and feedback:

- Player Spawner and Island Settings
- HUD Message or Pop-up Dialog for Pix and learning text
- four Button or Trigger devices for sequence inputs
- VFX, lights, prop movement, or audio for step feedback
- Tracker for the Circuit Badge
- Teleporter or a clearly marked return path

Create `Content/byte_island_game_manager.verse` to hold per-player sequence state, reject incorrect inputs, prevent duplicate rewards, and clear state on round reset. Expose device references with `@editable`; keep labels and visual presentation editable in UEFN.

Use descriptive Outliner names such as `hub_player_spawner_01`, `path_water_button`, and `path_badge_tracker`.

## Build Milestones

### 1. Foundation

- Set Island Settings to 1–4 players and confirm join-in-progress behavior.
- Graybox the hub and Path Garden on the existing shoreline terrain.
- Place the spawn, route cues, four inputs, tracker, and return route.

### 2. Gameplay

- Implement and compile the Verse state manager.
- Connect device events and per-player feedback.
- Add soft reset, exactly-once rewards, and round reset.

### 3. Validation

- Pass every acceptance scenario in `specs/001-byte-island-mvp/spec.md`.
- Test solo, two-player interference, duplicate completion, and round restart.
- Run UEFN project validation and a memory calculation with zero blocking errors.
- Record test dates, player count, warnings, and screenshots in `tasks.md`.

### 4. Polish and Release

- Replace graybox art only after the full loop works.
- Verify text readability, icon-plus-color cues, and fail-soft behavior with target-age playtesters.
- Complete IARC and promotional-media steps using the island's actual content.

## Future Releases

After the MVP is validated, specify and build one zone at a time:

1. Loop Lagoon — repetition and stop conditions
2. Variable Vault — values that change
3. If-Then Fortress — conditions and Boolean choices
4. Event Factory — event-and-response relationships
5. Debug Dungeon — expected versus actual behavior
6. Build-a-Bot — capstone combining prior concepts

Each zone must receive its own numbered feature directory under `specs/` before implementation.
