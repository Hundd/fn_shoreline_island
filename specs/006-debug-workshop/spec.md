# Debug Workshop Specification

- Status: Approved
- Authorization: User requested implementation of the full post-MVP roadmap.
- Source: [Post-MVP Roadmap](../post-mvp-roadmap.md)
- Date: 2026-09-11

## Scope and requirements

- `FR-001`: Every puzzle MUST show expected and actual results, a supplied faulty program, a Run action, and one editable faulty instruction. Exactly one deliberate fault MUST exist per puzzle.
- `FR-002`: Challenge one MUST repair an incorrect move; challenge two MUST repair a repeat count; challenge three MUST repair a reversed cargo routing rule.
- `FR-003`: Players MUST be able to rerun after every edit, receive two levels of optional help, and retry without losing completed challenges.
- `FR-004`: Completing all three puzzles MUST award exactly one Debug Badge per player per round and explain debugging as finding and fixing mistakes.
- `NFR-001`: All progress, hints, execution, and rewards MUST remain independent for 1-4 players. Respawn preserves completed work and cancels active execution; new rounds reset progress; departure releases owned stations.
- `NFR-002`: Essential cues MUST use labels or symbols in addition to color and remain understandable with audio muted. No punitive failure, combat, or timed input is permitted.
- `NFR-003`: Verse build, Launch Session acceptance tests, project validation, and memory calculation MUST pass with evidence before the feature is marked Validated.

## Acceptance scenarios

### AC-001 (FR-001)

Given any workshop challenge, when the unedited program runs, then the actual result visibly differs from the expected result and the player can identify an instruction to edit.

### AC-002 (FR-002)

Given each faulty program, when its single incorrect instruction is corrected and Run is pressed, then the actual result matches the expected result and the challenge completes.

### AC-003 (FR-003)

Given an unsuccessful edit, when the player runs again or requests help, then execution starts from the initial board and the error remains recoverable.

### AC-004 (FR-004)

Given a completed zone, when any puzzle is replayed, then the badge count does not increase and the return route stays available.

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
