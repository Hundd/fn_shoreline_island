# Variable Vault Specification

- Status: Approved
- Authorization: User requested implementation of the full post-MVP roadmap.
- Source: [Post-MVP Roadmap](../post-mvp-roadmap.md)
- Date: 2026-09-11

## Scope and requirements

- `FR-001`: The first challenge MUST display energy starting at 0, expose +1 and -1 controls, and open the preview door only when Start is pressed with energy equal to 3.
- `FR-002`: The second challenge MUST start energy at 2 and require 5. Every adjustment MUST update the named energy display immediately.
- `FR-003`: The third challenge MUST start energy at 0 and let players choose 1-5 repeats of Add 2, then Run, to reach 6. Each addition MUST visibly update energy.
- `FR-004`: The zone MUST offer two-level hints, safe retries, replay, one Energy Badge per player per round, and the recap 'A variable stores a value that can change.'
- `NFR-001`: All progress, hints, execution, and rewards MUST remain independent for 1-4 players. Respawn preserves completed work and cancels active execution; new rounds reset progress; departure releases owned stations.
- `NFR-002`: Essential cues MUST use labels or symbols in addition to color and remain understandable with audio muted. No punitive failure, combat, or timed input is permitted.
- `NFR-003`: Verse build, Launch Session acceptance tests, project validation, and memory calculation MUST pass with evidence before the feature is marked Validated.

## Acceptance scenarios

### AC-001 (FR-001)

Given energy 0, when the player reaches 3 and presses Start, then the door visibly opens; other values keep it closed and invite an edit.

### AC-002 (FR-002)

Given challenge two, when the player changes energy to 5 and presses Start, then it completes; the starting value is restored for a fresh attempt.

### AC-003 (FR-003)

Given challenge three, when count 3 runs, then energy visibly changes 0, 2, 4, 6 and the door opens; other counts fail safely.

### AC-004 (FR-004)

Given a player who solves all three challenges, when they replay, then their badge remains exactly one and their previous completion is preserved.

### AC-005 (NFR-001)

Given two players, when one fails, respawns, leaves, or completes, then the other's state stays unchanged; after round restart both start fresh. Repeat station-access testing with four players.

### AC-006 (NFR-002)

Given muted audio, when the zone is played from entry to return, then every required cue remains understandable and mistakes cause no damage.

### AC-007 (NFR-003)

Given the final revision, when required checks are run, then diagnostics contain no errors, memory has no publishing blocker, and test records identify revision and player count.

## Exclusions

No cross-session persistence, competitive leaderboards, daily rewards,
procedural generation, public publishing, or Ukrainian translation in this
implementation. Keep instructional messages localizable for future translation.
