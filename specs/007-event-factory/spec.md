# Event Factory Specification

- Status: Approved
- Authorization: User requested implementation of the full post-MVP roadmap.
- Source: [Post-MVP Roadmap](../post-mvp-roadmap.md)
- Date: 2026-09-11

## Scope and requirements

- `FR-001`: Challenge one MUST let players connect Bell to Open chute, then ring Bell and observe a parcel released. Selecting a different response MUST visibly demonstrate that response and permit correction.
- `FR-002`: Challenge two MUST expose Bell and Lever events and require identifying which event caused a visible response using a recent-event display.
- `FR-003`: Challenge three MUST connect Bell to Open chute and Lever to Light lamp, then test both events independently without cross-triggering.
- `FR-004`: The factory MUST provide hints, replay, one Event Badge per player per round, and a recap explaining that an event starts a response.
- `NFR-001`: All progress, hints, execution, and rewards MUST remain independent for 1-4 players. Respawn preserves completed work and cancels active execution; new rounds reset progress; departure releases owned stations.
- `NFR-002`: Essential cues MUST use labels or symbols in addition to color and remain understandable with audio muted. No punitive failure, combat, or timed input is permitted.
- `NFR-003`: Verse build, Launch Session acceptance tests, project validation, and memory calculation MUST pass with evidence before the feature is marked Validated.

## Acceptance scenarios

### AC-001 (FR-001)

Given the Bell input and chute goal, when Bell is connected to Open chute and triggered, then the chute opens and the parcel moves.

### AC-002 (FR-002)

Given a demonstrated event and response, when the player selects the triggering event, then a correct selection advances; an incorrect selection repeats the demonstration safely.

### AC-003 (FR-003)

Given both connections, when Bell and Lever are triggered in turn, then only the response bound to each event occurs; reversed connections fail safely.

### AC-004 (FR-004)

Given all three challenges solved, when the player returns or replays, then completion remains recorded without duplicate badges.

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
