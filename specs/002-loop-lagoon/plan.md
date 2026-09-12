# Loop Lagoon Implementation Plan

- Status: In progress
- Specification: [spec.md](spec.md)

## Approach

Entrance flicker correction: the walkway top and both supporting floors are at
Z=2400 cm. Move only loop_hub_walkway upward 2 cm, preserving its rotation and
scale. Verify the transform, inspect both joins, and check traversal in a solo
session. This separates the rendered faces with a minimal transition height.

Build a compact dock zone in the existing map. Prototype one Move challenge
before adding the lantern block and final variation. Keep Path Garden working
throughout. Use labeled buttons for count selection, Run, Help, and Return.

Prefer four separate physical puzzle stations, assigned one per active player,
to make visible robot motion independent without assuming props can be shown
per player. Each station has its own robot, board, lanterns, and controls;
only its assigned player can operate it. Station ownership must be visible.
Assign a free station on entry, release on exit/disconnect, and retain completed
challenge progress for the round. Re-entry restores the player's challenge on a
free station. All four stations support every challenge.

First verify station assignment and moving-prop behavior in the editor. If this
layout is too expensive or unclear, revise the draft to use a personal UI board
before implementation proceeds. Do not use a shared animated board that can
misrepresent independent attempts.

## State and responsibilities

- Add a focused `Content/fn_shoreline_island_loop_lagoon.verse` device for
  challenge rules, station ownership, and per-player state.
- Track selected count, unlocked challenge, current challenge, hint level,
  running state, badge earned, and a run generation identifier per player.
- Keep the existing garden manager responsible for its existing puzzle.
- Execute a snapshot of the selected program; ignore input changes during Run.
- Invalidate pending animation callbacks on respawn, station release, disconnect,
  and round reset so old runs cannot advance progress or award a badge.
- Use an individual, nonpersistent Loop Badge tracker; guard awards in state.
- Target instructional and result messages at the owning player. Clear a board
  when released and restore its initial state before every execution.

Implementation APIs and device capabilities must be checked against the live
project before coding. This plan does not claim a verified API design.

Use one station device per board and one shared progression device. A Claim
button assigns an unoccupied station; moving more than 12 meters from that
station releases it. A polling check also releases inactive/disconnected owners.
Spawn events release active runs while retaining challenge completion. The
station checks a generation token before each step, using short, discrete robot
steps so cancellation cannot leave a long-running movement acting on a new owner.

## Delivery sequence

1. Use the approved behavior and track the MVP's outstanding release checks.
2. Graybox one station; prove counts 1-5, visible stepping, safe failure, and retry.
3. Add Move/Light, the changed target, hints, progression, reward, and return.
4. Expand to four assigned stations; test each station solo and verify ownership
   and lifecycle handling. Defer simultaneous-player isolation checks until
   additional clients are available; the user currently has solo testing only.
5. Add coastal presentation and readable signs after the mechanics pass.
6. Build Verse, launch solo and multiplayer tests, validate the project, calculate
   memory, and record results before marking the feature validated.

## Playtest focus

Run AC-001 through AC-012. Include rapid presses, every wrong count, repeated
completion, leaving mid-animation, respawn, disconnect, join-in-progress, and
round reset during execution. Recheck MVP spawn, garden solve/reset, badge, and
return. Record target-age observations using the roadmap's provisional measures.
