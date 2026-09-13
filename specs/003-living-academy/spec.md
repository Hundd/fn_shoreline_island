# Living Academy Specification

- Status: Approved
- Authorization: User requested implementation of the full post-MVP roadmap.
- Source: [Post-MVP Roadmap](../post-mvp-roadmap.md)
- Date: 2026-09-11

## Scope and requirements

- `FR-001`: A personal hub badge board MUST display Garden, Loop, Signal, Energy, Debug, Event, Nursery, and Bot badge states for the current round and recommend the first unfinished zone in that order. Nursery remains optional and does not gate Bot or change the Bot ending.
- `FR-002`: Named paths and landmarks MUST connect the hub to each implemented zone, and every zone MUST offer a return to the hub.
- `FR-003`: An optional Path Garden repair board MUST start with Water, Plant, Harvest, Wait. Players MUST select two command slots to swap, then Run; only Water, Plant, Wait, Harvest succeeds.
- `FR-004`: The repair challenge MUST offer a concept hint followed by a worked answer, visible step results, and safe replay without duplicating the existing Garden badge.
- `FR-005`: The personal board MUST explain that the player is helping Pix restore the coastal academy. Recommendations MUST name an available destination without locking other routes.
- `NFR-001`: All progress, hints, execution, and rewards MUST remain independent for 1-4 players. Respawn preserves completed work and cancels active execution; new rounds reset progress; departure releases owned stations.
- `NFR-002`: Essential cues MUST use labels or symbols in addition to color and remain understandable with audio muted. No punitive failure, combat, or timed input is permitted.
- `NFR-003`: Verse build, Launch Session acceptance tests, project validation, and memory calculation MUST pass with evidence before the feature is marked Validated.

## Acceptance scenarios

### Hub journal stand (FR-002, NFR-002)

Given a fresh player walking from spawn or returning to the Hub, when they
approach the journal, then its control is visibly attached to a small stand,
with the journal sign above it. The stand must leave the Garden walkway and
Hub destination clear. The button remains reachable from the walking floor;
opening and closing the journal must still work without jumping. The stand
must not display shared completion or change any player's progress.

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

### AC-008 (FR-005)

Given a fresh player, when they open the journal, then they see the restoration
purpose and Path Garden recommendation. After Garden completion, Loop Lagoon
is recommended. Later implemented zones follow the listed badge order. During
development, an unimplemented zone is labeled unavailable and is not recommended.

### Nursery integration acceptance (FR-001, FR-005)

Given a player with an unearned Nursery badge, when the journal opens, then
Nursery is available and unearned. After all three Nursery challenges and Hub
return, the journal shows that player's Nursery count as exactly 1/1. Replaying
Nursery and reopening the journal preserves 1/1 and all earlier badge states.
Opening the journal never awards, assigns, or resets a tracker. A player may
visit Bot before Nursery; completing Nursery does not replace the Bot ending.
Verify the complete eight-zone panel is readable and its Close control works.

## Exclusions

### Journal approach acceptance (FR-001, FR-002, NFR-002)

Given a player arriving from a hub spawn or the shared Hub return, when they
approach and look toward the journal button, then its labeled interaction is
available without precisely aiming at its thin edge. The button still requires
an explicit interaction to open the personal journal. Closing returns control,
and walking past the journal does not open it automatically or obscure nearby
Garden controls with its interaction target.

### Fresh-launch sign acceptance (FR-002, NFR-002)

Given the first solo launch immediately after a Verse build, when gameplay starts
and the player approaches the hub and Garden sign fronts, then the academy title,
journal cue, route directions and four Garden step labels appear within six
seconds without restarting gameplay. Their wording stays stable while walking
and after respawn. The refresh must not read or write player progression.

The optional Restored work page is specified by
[010 coastal fieldwork](../010-coastal-fieldwork/spec.md), FR-004. The existing
eight-zone Overview, recommendation order and read-only progress contract remain
part of this feature's acceptance coverage.

No cross-session persistence, competitive leaderboards, daily rewards,
procedural generation, public publishing, or Ukrainian translation in this
implementation. Keep instructional messages localizable for future translation.
