# Living Academy Specification

- Status: Approved
- Authorization: User requested implementation of the full post-MVP roadmap.
- Source: [Post-MVP Roadmap](../post-mvp-roadmap.md)
- Date: 2026-09-11

## Scope and requirements

- `FR-001`: A personal hub badge board MUST display Garden, Loop, Signal, Energy, Debug, Event, and Bot badge states for the current round and recommend the first unfinished zone.
- `FR-002`: Named paths and landmarks MUST connect the hub to each implemented zone, and every zone MUST offer a return to the hub.
- `FR-003`: An optional Path Garden repair board MUST start with Water, Plant, Harvest, Wait. Players MUST select two command slots to swap, then Run; only Water, Plant, Wait, Harvest succeeds.
- `FR-004`: The repair challenge MUST offer a concept hint followed by a worked answer, visible step results, and safe replay without duplicating the existing Garden badge.
- `NFR-001`: All progress, hints, execution, and rewards MUST remain independent for 1-4 players. Respawn preserves completed work and cancels active execution; new rounds reset progress; departure releases owned stations.
- `NFR-002`: Essential cues MUST use labels or symbols in addition to color and remain understandable with audio muted. No punitive failure, combat, or timed input is permitted.
- `NFR-003`: Verse build, Launch Session acceptance tests, project validation, and memory calculation MUST pass with evidence before the feature is marked Validated.

## Acceptance scenarios

### AC-001 (FR-001)

Given players with different earned badges, when each opens the board, then each sees only their own badges and a matching next destination.

### AC-002 (FR-002)

Given a fresh player, when following each named route and its return cue, then they can travel safely between the hub and that zone without a puzzle completion gate.

### AC-003 (FR-003)

Given the faulty garden program, when slots three and four are swapped and Run is pressed, then the garden executes correctly; incorrect programs visibly stop at the first invalid step and allow editing.

### AC-004 (FR-004)

Given wrong attempts or repeated successes, when the player retries or asks for help twice, then hints appear, earned badges remain, and no duplicate Garden reward is issued.

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
