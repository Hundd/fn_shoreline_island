# Feature 012: Path Garden Greenhouse

- Status: Planned.
- Player-visible goal: The entire walk through Path Garden feels like one large, bright greenhouse, from the hub-facing entrance through the last Garden Repair station.

## Scope

Extend the existing `campus_path_greenhouse` language into a continuous roof and side structure above the Garden path and its four stations. Keep the entrance open and recognizable. The greenhouse is environmental dressing; all existing gameplay actors stay in place.

## Functional requirements

- FR-001: A continuous greenhouse silhouette covers the full playable Garden passage, including the approach and all four Garden Repair stations, without an exposed gap between bays.
- FR-002: A player can walk the center path, reach every station, use every control, read every board, and return to the hub without hitting posts, planters, roof pieces, or camera-blocking geometry.
- FR-003: The structure reads as a greenhouse through repeated frames, a transparent or visibly open roof, planted edges, and daylight; the Path Garden sign remains visible from the hub branch.
- FR-004: Existing devices, Verse bindings, puzzle coordinates, progress, and reset behavior remain unchanged.
- FR-005: Greenhouse parts are grounded and use a reusable, low-memory kit that UEFN can validate and cook.

## Acceptance scenarios

### AC-001: Full cover

Given a player enters Path Garden from the hub, when they walk to the farthest Garden Repair station, then every part of the intended Garden passage reads as inside the same greenhouse, with no roof or frame gap over the route.

### AC-002: Clear route and controls

Given the greenhouse is built, when a solo player walks the path in both directions and visits all four stations, then they can reach and read every board and use Claim, slot, Run, Help, Replay, and Hub without jumping or camera collision.

### AC-003: Readable entrance

Given a player approaches from the hub promenade at normal walking height, when they look toward Path Garden, then its sign and a clear, wide entrance are visible.

### AC-004: Gameplay preservation

Given a fresh session, when a player completes and retries a Garden puzzle, then its visible execution, progress, replay, and return behavior work as before the greenhouse extension.

### AC-005: Release safety

Given the structure is saved, when UEFN project validation, memory calculation, and a fresh Launch Session cook run, then no blocking error is introduced; the session is stopped after the playtest.

## Out of scope

- Moving puzzle stations, controls, or the campus promenade.
- New Garden gameplay or Verse changes.
- Enclosing the hub or neighboring game rooms.
