# Signal Lighthouse Specification

- Status: Approved
- Authorization: User requested implementation of the full post-MVP roadmap.
- Source: [Post-MVP Roadmap](../post-mvp-roadmap.md)
- Date: 2026-09-11

## Scope and requirements

- `FR-001`: Challenge one MUST show leaf-marked and plain cargo boats. The player MUST route leaf cargo to Garden and plain cargo to Storage; every choice MUST show the boat's movement and explain its result.
- `FR-002`: Challenge two MUST introduce a gear symbol and Workshop destination. Leaf goes to Garden, gear to Workshop, and plain cargo to Storage.
- `FR-003`: Challenge three MUST present a visible queue and three selectable routing rules. Only the rule mapping leaf to Garden, gear to Workshop, and other cargo to Storage MUST route the whole queue correctly.
- `FR-004`: Solving all three challenges MUST award one Signal Badge per player per round and define a condition as a check that chooses what happens. Two-level hints and replay MUST be available.
- `FR-005`: Harbor 3 MUST have a persistent, readable visual start cue at its Claim control that identifies the activity and gives the first three player actions: claim the station, read cargo, and choose a matching destination.
- `NFR-001`: All progress, hints, execution, and rewards MUST remain independent for 1-4 players. Respawn preserves completed work and cancels active execution; new rounds reset progress; departure releases owned stations.
- `NFR-002`: Essential cues MUST use labels or symbols in addition to color and remain understandable with audio muted. No punitive failure, combat, or timed input is permitted.
- `NFR-003`: Verse build, Launch Session acceptance tests, project validation, and memory calculation MUST pass with evidence before the feature is marked Validated.

## Acceptance scenarios

### AC-001 (FR-001)

Given the displayed leaf/otherwise rule, when Garden is selected for leaf or Storage for plain, then the boat arrives at the matching dock; the opposite selection shows the mismatch and permits retry.

### AC-002 (FR-002)

Given a queue containing all three cargo types, when the player routes each using the shown rule, then challenge two completes only after every boat is correctly routed.

### AC-003 (FR-003)

Given the final queue, when a candidate rule runs, then each boat visibly follows it; an incorrect rule stops at its first mismatch and the player can select another.

### AC-004 (FR-004)

Given a completed zone, when replayed or completed using hints, then the player retains exactly one Signal Badge and can return to the hub.

### AC-005 (FR-005)

Given a player approaching Harbor 3 from the campus route, when the Claim control is in view, then a nearby persistent sign visibly identifies Signal Lighthouse and directs the player to press Claim before routing cargo.

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
