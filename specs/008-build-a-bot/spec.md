# Build-a-Bot Specification

- Status: Approved
- Authorization: User requested implementation of the full post-MVP roadmap.
- Source: [Post-MVP Roadmap](../post-mvp-roadmap.md)
- Date: 2026-09-11

## Scope and requirements

- `FR-001`: The capstone MUST provide a guided delivery mission with three stages: deliver a seed, light the dock, and route a parcel, using predefined command choices.
- `FR-002`: Seed delivery MUST combine an ordered pickup/move/drop program and a repeat count; dock lighting MUST combine a changing energy value with repeated Move/Light commands.
- `FR-003`: Parcel routing MUST combine an event-triggered launch and a cargo condition. The player MUST test the program against both leaf and plain cargo.
- `FR-004`: Completing the mission MUST award one Bot Badge per player per round, show a final academy restoration celebration, and offer replay and hub return. Prior badges MUST remain intact.
- `FR-005`: The mission MUST remain completable solo without earlier badge gates, offer concept hints and worked answers, and preserve completed stages through retries and respawn.
- `NFR-001`: All progress, hints, execution, and rewards MUST remain independent for 1-4 players. Respawn preserves completed work and cancels active execution; new rounds reset progress; departure releases owned stations.
- `NFR-002`: Essential cues MUST use labels or symbols in addition to color and remain understandable with audio muted. No punitive failure, combat, or timed input is permitted.
- `NFR-003`: Verse build, Launch Session acceptance tests, project validation, and memory calculation MUST pass with evidence before the feature is marked Validated.

## Acceptance scenarios

### AC-001 (FR-001)

Given a fresh player, when they enter the capstone, then the three mission goals and available command choices are visible with optional explanations of prior concepts.

### AC-002 (FR-002)

Given either mission stage, when the player runs a correct program, then visible execution reaches its stated goal; an incorrect program shows the first unmet goal and permits revision.

### AC-003 (FR-003)

Given the route program, when the launch event fires for both cargo types, then leaf cargo reaches Garden and plain cargo reaches Storage; only passing both completes the stage.

### AC-004 (FR-004)

Given the three solved stages, when the finale plays, then the player receives exactly one Bot Badge and can replay without duplicate rewards.

### AC-005 (FR-005)

Given a first-time or returning player, when they need help or fail an attempt, then the mission remains recoverable without another player or lost completed stages.

### AC-006 (NFR-001)

Given two players, when one fails, respawns, leaves, or completes, then the other's state stays unchanged; after round restart both start fresh. Repeat station-access testing with four players.

### AC-007 (NFR-002)

Given muted audio, when the zone is played from entry to return, then every required cue remains understandable and mistakes cause no damage.

### AC-008 (NFR-003)

Given the final revision, when required checks are run, then diagnostics contain no errors, memory has no publishing blocker, and test records identify revision and player count.

## Exclusions

No cross-session persistence, competitive leaderboards, daily rewards,
procedural generation, public publishing, or Ukrainian translation in this
implementation. Keep instructional messages localizable for future translation.
