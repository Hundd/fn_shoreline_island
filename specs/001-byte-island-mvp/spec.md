# Byte Island MVP Specification

- Status: Approved
- Owner: Project team
- Source: `plan.md`
- Last updated: 2026-09-11

## Objective

Deliver a complete, kid-friendly learning loop in which a player arrives at
Byte Island Academy, learns that order matters, solves the Path Garden
sequence puzzle, receives a Circuit Badge, and returns to the hub.

## MVP Scope

Included:

- A safe hub spawn with a clear first objective.
- Pix as the named guide, presented through available device-driven text or
  character interaction.
- One playable learning zone: Path Garden.
- A four-step sequence puzzle: Water, Plant, Wait, Harvest.
- Soft failure, retry, completion feedback, and return to the hub.
- Solo play and isolated per-player multiplayer progression for 2–4 players.
- A small Verse state manager connected to Creative devices.

Excluded:

- Loop Lagoon, Variable Vault, and later learning zones.
- Persistent progress between sessions.
- A general-purpose visual coding editor.
- Combat, weapons, player elimination, and punitive fail states.

## Player Stories

### P1 - Understand the goal

As a first-time player, I want to understand what happened and where to go so
that I can start playing without outside explanation.

### P2 - Solve a sequence

As a learner, I want immediate feedback while entering a sequence so that I
can discover why order matters.

### P3 - Recover safely

As a learner, I want an incorrect attempt to reset quickly without eliminating
me so that mistakes feel safe and useful.

### P4 - Complete the learning loop

As a learner, I want a visible reward and concise recap after solving the
puzzle so that I understand what I learned and know what to do next.

## Functional Requirements

- `FR-001`: Each player MUST spawn in the hub at a safe, stable location.
- `FR-002`: Within 10 seconds of spawning, the player MUST be shown a concise
  objective directing them to Path Garden.
- `FR-003`: The route from the hub to Path Garden MUST be visually identifiable
  without relying on color alone.
- `FR-004`: Path Garden MUST present four distinct inputs corresponding to
  Water, Plant, Wait, and Harvest.
- `FR-005`: For each player, the puzzle MUST accept only the sequence Water,
  Plant, Wait, Harvest as a successful attempt.
- `FR-006`: Each accepted input MUST provide immediate visual or audio feedback.
- `FR-007`: An incorrect input MUST reset only the initiating player's current
  attempt without damage, elimination, or loss of earned completion progress.
- `FR-008`: A correct sequence MUST award exactly one Circuit Badge per player
  for the current round.
- `FR-009`: Completion MUST show the term `algorithm` with a brief explanation
  that an algorithm is an ordered set of steps.
- `FR-010`: After completion, the player MUST have an obvious way to return to
  the hub.
- `FR-011`: Restarting the round MUST restore the puzzle and player progress to
  their intended initial state.

## Non-Functional Requirements

- `NFR-001`: Player-facing instructional text SHOULD be no longer than 80
  characters per message where the device allows it.
- `NFR-002`: Required directions and puzzle states MUST use an icon, shape,
  label, or spatial cue in addition to color.
- `NFR-003`: The experience MUST support one to four players and remain fully
  completable solo.
- `NFR-004`: One player's input or reset MUST NOT change another player's
  sequence progress or earned badge.
- `NFR-005`: The project MUST pass UEFN project validation without errors.
- `NFR-006`: The project MUST complete a UEFN memory calculation without a
  publishing-blocking result.

## Acceptance Scenarios

### AC-001 - First-time direction

Given a player joins a fresh round, when the player appears in the hub, then a
Path Garden objective is visible within 10 seconds and the route has a
non-color navigation cue.

### AC-002 - Correct sequence

Given the puzzle is ready, when a player activates Water, Plant, Wait, and
Harvest in that order, then each step responds immediately, the puzzle
completes, and that player receives one Circuit Badge.

### AC-003 - Incorrect sequence

Given the puzzle is ready, when a player activates any incorrect next step,
then the attempt visibly resets, the player remains active, and a new attempt
can begin without leaving the zone.

### AC-004 - Duplicate completion

Given a player already earned the badge this round, when the puzzle is
completed again, then that player's badge total does not increase.

### AC-005 - Learning recap and return

Given a player completes the puzzle, when completion feedback appears, then it
defines `algorithm` in one brief message and exposes an obvious route or
teleporter back to the hub.

### AC-006 - Round reset

Given one or more players interacted with or completed the puzzle, when a new
round starts, then the puzzle accepts Water as its first step and no player
retains the prior round's badge.

### AC-007 - Multiplayer isolation

Given two players are in the experience, when one player makes an incorrect
attempt, then the other player's sequence progress and earned Circuit Badge
remain unchanged.

## Success Measures

- A new playtester identifies the first destination within 10 seconds.
- A solo player completes the full loop without developer intervention.
- Two-player testing shows no cross-player state interference.
- All acceptance scenarios pass in a launched UEFN session.
- Project validation reports zero errors.
- UEFN memory calculation reports no publishing blocker.

## Decisions

- `OD-001`: The primary age band is 8–10.
- `OD-002`: MVP player-facing text is English; Ukrainian is deferred.
- `OD-003`: The release target is public Discover after private playtesting.
- `OD-004`: Puzzle progress and rewards are tracked independently per player.
