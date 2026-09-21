# Feature 011: Academy Campus

- Status: Approved from user direction; implementation in progress.
- Player-visible goal: Replace the empty prototype field with a lively coastal
  academy campus where every game has its own recognizable room.

## Scope

The eight main games are Path Garden, Loop Lagoon, Signal Lighthouse, Variable
Vault, Debug Workshop, Event Factory, Build-a-Bot, and Tidepool Nursery. Each
game receives one themed building or room containing its existing four-player
station layout. Living Academy remains the central hub rather than a ninth game
room.

The environment pass may add room shells, roofs, doors, windows, paths, trees,
planters, lights, benches, fences, signs, and Fortnite-authored decorative
props. Existing gameplay devices, station ownership, Verse bindings, and puzzle
coordinates must not be moved until a separate migration is specified and
tested.

## Functional requirements

- FR-001: Each game has a distinct room silhouette and readable entrance sign.
- FR-002: Every room preserves access to all four existing player stations.
- FR-003: Entrances, aisles, controls, boards, moving props, and return routes
  remain unobstructed.
- FR-004: The hub connects rooms with continuous paths and visible landmarks.
- FR-005: Trees and decoration fill negative space without hiding route signs or
  puzzle feedback.
- FR-006: Essential navigation uses labels and shape/landmark cues, not color
  alone.
- FR-007: Added structures do not change player progress, rewards, or puzzle
  state.

## Non-functional requirements

- NFR-001: Use Fortnite/UEFN-native assets where practical and keep memory in
  view; reuse a small modular kit instead of many unique high-cost assets.
- NFR-002: Keep the bright, friendly, non-combat coastal-academy tone for ages
  8-10.
- NFR-003: Avoid tight ceilings and narrow doors that interfere with the player
  camera.
- NFR-004: Room shells must be saved through UEFN and survive a fresh session.

## Acceptance scenarios

### AC-001: Representative room

Given an existing four-station game zone, when its first room shell is built,
then a solo player can enter from the hub-facing side, reach every station,
read its main board, use its controls, and leave without jumping or mantle-only
navigation.

### AC-002: Gameplay preservation

Given the representative room exists, when the zone's normal success and retry
flows are played, then progress, visible execution, Replay, and Hub behavior are
unchanged.

### AC-003: Campus navigation

Given a fresh spawn, when the player looks around and follows the campus paths,
then every game room has a visible entrance landmark and the hub remains easy to
find.

### AC-004: Presentation

Given muted audio, when the player approaches a room, then its identity and
entrance are understandable from text plus architecture or props, and foliage
does not obscure the route.

### AC-005: Release safety

Given all rooms and landscaping are complete, when Verse build, project
validation, memory calculation, solo traversal, and available multiplayer tests
run, then no blocking error or gameplay regression is introduced.

## Out of scope

- Moving or rebuilding puzzle stations.
- Changing Verse gameplay rules or badge progression.
- Combat props, weapons, locked progression doors, or required parkour.
- Claiming multiplayer or memory readiness without their required evidence.
