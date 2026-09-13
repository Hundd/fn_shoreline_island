# Loop Lagoon Specification

- Status: Approved
- Date: 2026-09-11
- Source: [Post-MVP Roadmap](../post-mvp-roadmap.md)

## Objective and scope

Extend the solo MVP with three short puzzles that teach a loop as repeating
steps. Include a labeled hub route, personal puzzle execution, optional hints,
one Loop Badge per round, replay, and a return route. Exclude Repeat Until,
freeform coding, persistence, and changes to Path Garden's solution.

## Requirements

- `PR-001`: Loop station instructions and control/tile labels MUST remain
  visible from their own interaction area while distant docks' text is culled.
  The Hub's named Loop route remains available independently of station labels.
  Given a player at Dock 1, when viewing its controls and running a puzzle,
  then its objective, count, command and destination cues remain readable.
  Given a player beyond a station's authored viewing range, when looking toward
  that station, then its text does not fill the horizon. Walking back into range
  restores the instructions without restarting gameplay or changing progress.

- `FR-001`: Players MUST be able to find Loop Lagoon from the hub using a name
  and a non-color cue. Entry MUST NOT require another player or an existing badge.
- `FR-002`: The first challenge MUST start a robot at tile 0 with a target at
  tile 3. Players MUST choose a repeat count from 1-5 for Move and press Run.
  Only count 3 MUST solve this challenge.
- `FR-003`: The second challenge MUST repeat the supplied block Move, Light on
  a dock with lanterns at tiles 1, 2, and 3. Only count 3 MUST solve it: all three
  lanterns lit and the robot at tile 3, with no extra iteration.
- `FR-004`: The third challenge MUST move the target to tile 4 on a fresh board
  starting at tile 0. Only count 4 of Move MUST solve it. The objective MUST
  describe the target without supplying the repeat count.
- `FR-005`: Run MUST show each command and the resulting position or lantern
  change in order. The chosen count MUST remain visible. Inputs that would
  alter an executing run MUST be ignored until execution finishes.
- `FR-006`: Wrong counts MUST show the resulting position and allow editing and
  retry without damage or lost completed challenges. Every run MUST reset its
  board to its challenge's initial state before executing; overshoots MUST stop
  safely at the board boundary and count as an unsuccessful attempt.
- `FR-007`: Each challenge MUST offer Help: first a repetition hint, then a
  worked answer on a second request. Help MUST NOT reduce rewards.
- `FR-008`: First success MUST unlock the next challenge for that player.
  Completing all three MUST award exactly one Loop Badge per player per round,
  show "A loop repeats steps.", and offer a labeled return to the hub.
  Replaying MUST NOT award another badge.
- `FR-009`: Puzzle inputs, execution, hints, and rewards MUST be isolated per
  player. Respawn MUST preserve completed challenges and badges but cancel an
  active run. New arrivals MUST start fresh; a new round MUST clear all progress
  and cancel old executions. Leaving a station MUST release its active run.

## Quality requirements

- `NFR-001`: Support solo and 2-4 players; no player may block another's access
  indefinitely. Instructions SHOULD be at most 80 characters per message.
- `NFR-002`: Essential states MUST have labels, icons, or spatial cues alongside
  color, and MUST remain understandable with audio muted. No timed input is required.
  In the lantern challenge, all three unlit lanterns MUST be visible before Run
  so the player can count them. The board MUST label each lantern OFF or ON;
  lighting also enlarges its marker. The parcel MUST remain visible above the
  robot when both occupy the target tile.
- `NFR-003`: Verse build and project validation MUST pass without errors, memory
  calculation MUST have no publishing blocker, and gameplay evidence MUST be recorded.

## Acceptance scenarios

| ID | Requirements | Given / When / Then |
| --- | --- | --- |
| AC-001 | FR-001, NFR-001, NFR-002 | Given a fresh solo player with no badge, when they follow the hub's Loop Lagoon label and symbol, then they reach and start the first challenge. |
| AC-002 | FR-002, FR-005 | Given challenge one, when the player selects 3 and runs, then three Move commands execute visibly and the robot finishes on the parcel at tile 3. |
| AC-003 | FR-003, FR-005 | Given challenge two, when the player runs count 3, then Move and Light execute three times, all three lanterns light, and the robot stops at tile 3. |
| AC-004 | FR-004 | Given challenge three, when the player reads the objective, then no repeat count is supplied; running count 4 reaches the target and succeeds. |
| AC-005 | FR-002, FR-003, FR-004, FR-006 | Given each challenge, when each allowed incorrect count is run, then it fails safely, shows its result, and a corrected retry starts from the initial board without losing earlier completions. |
| AC-006 | FR-005 | Given an active run, when the player repeatedly presses Run or changes the count, then the current execution stays unchanged and no overlapping run starts. |
| AC-007 | FR-007 | Given any challenge, when Help is requested twice, then a concept hint and subsequently a worked answer appear; solving still earns normal credit. |
| AC-008 | FR-008 | Given a fresh player, when they solve the three challenges in order, then each unlocks the next and the final success awards one Loop Badge, defines loop, and exposes the return route; replay adds no badge. |
| AC-009 | FR-009, NFR-001 | Given two players on different challenges, when one runs, fails, requests help, or completes, then the other's board, messages, progress, and badge stay unchanged. Repeat with four players to verify station access. |
| AC-010 | FR-009 | Given completed progress and an active run, when the player respawns, then the run cancels and completed progress remains; when the round restarts, then all progress clears and no old animation or reward fires. |
| AC-011 | FR-009, NFR-001 | Given an occupied station, when its player leaves or disconnects, then the run stops and the station is reusable; a newly joining player receives fresh progress and can start without waiting for another player to solve. |
| AC-012 | NFR-002 | Given muted audio, when a player attempts each puzzle, then labels and visible execution communicate all essential state without relying on color. |

## Authorization and validation status

The user's instruction to implement the post-MVP roadmap authorizes this
feature. Four physical stations are the initial implementation choice.

Implementation is beginning. No build, validation, or playtest has passed yet.
# Entrance surface correction

- FR-010: The teal entrance walkway must render without overlapping coplanar
  floor faces and remain traversable from the academy to the dock.
- AC-013: Given the player approaches Loop Lagoon from the academy, when they
  walk across the teal walkway and look around, then the surface remains stable
  and they can cross both joins without jumping.
