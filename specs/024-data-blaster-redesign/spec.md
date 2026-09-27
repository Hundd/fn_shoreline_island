# Data Blaster interaction redesign

Source: `docs/AI Academy — Blaster Interaction Redesign.md`. This feature supersedes the button-based Prompt Lab interaction in feature 023. Full scope includes all eight AI missions; conversion follows the source's Phase A–D gate.

## Requirements

- FR-001: Every player automatically receives the same permanent Data Blaster, including join and respawn. Infinite ammunition, no meaningful reload, invincibility, no PvP or environmental destruction.
- FR-002: Shared targets validate active mission state, accept ordinary hits without bullseyes, and provide immediate flash, sound, lesson feedback, and automatic Data Energy. Wrong answers retain the puzzle and lose no health, rewards, or progress.
- FR-003: Targets use generous 1.5–2.5 m visuals and accessible shape/icon/label cues. Objective beacons combine orange cone, pulsing ring, and particles; answer choices all use equal cyan selectable cues without revealing correctness. Inactive, active, hit (0.3–0.5 s), and complete states are consistent.
- FR-004: Correct hits create 3–8 Data Orbs flying to Pix/player/core and update a visible Data Energy meter. Existing badge ownership and persistence remain authoritative.
- FR-005: Each mission starts with a 2 s spectacle and a 5–10 s AI Knowledge idea/example, followed by immediate shooting gameplay testing that idea.
- FR-006: Prompt Lab round 1 presents red/blue/green cores; BLUE succeeds. Round 2 presents two blue sizes, requires shooting LARGE before choosing the large core, and updates the visible prompt. Round 3 requires acquiring the slowly moving large blue core then shooting REACTOR among three destinations.
- FR-007: Prompt finale visibly delivers the core, spins the reactor, lights the room sequentially, sends energy through cables, opens the Prompt Module, grants the existing badge, and activates a ride back to the hub. Primary gameplay buttons disappear; replay/hints/accessibility remain permitted.
- FR-008: After Prompt Lab validation, convert Pattern Scanner (color and moving shape prediction), Classifier (conveyor category gates and successive objects), Confidence Core (useful evidence 30/50/70/90%), Error Lab (identify FISH then repair MAMMAL), Tool Lab (scanner crate and physical tool/station combinations), Skills Lab (SCAN/PICK UP/DELIVER then package reuse), and Agent Mission (MEDICAL/SCANNER/TUNNEL/DELIVERY SKILL and core finale).
- FR-009: Shared world reactions support cooperative hits without duplicate reward, stale async actions, or cross-player badge attribution; replay, round reset, departure, and join remain safe.
- FR-010: Build Verse, validate project, cook and playtest spawn/objectives/wrong-hit recovery/reset/solo/multiplayer, record visual evidence, and stop the playtest before handoff.

## Acceptance scenarios

1. Given a new or respawned player, when play begins, then the blaster is ready with unlimited fire and players/world cannot be damaged (FR-001).
2. Given an inactive target, when shot, then mission and reward do not change; given an active wrong answer, when shot, then immediate playful feedback occurs and a correct answer can be retried immediately (FR-002/003/009).
3. Given choice targets, when viewed from normal engagement distance, then each has equal readable cyan cues and can be hit in the outer third of its ring without precision aiming; the correct choice has no exclusive orange beacon (FR-003). The damage surface must cover the maximum pulsed ring extent without overlapping a neighboring choice.
4. Given Prompt Lab entry, when the intro finishes, then shoot BLUE; shoot LARGE then large blue; acquire moving large blue then REACTOR, with prompt updates and a visible finale/return ride (FR-005/006/007).
5. Given a correct answer, when accepted, then 3–8 orbs travel to the receiver and Data Energy increases exactly once; a wrong shot never removes it (FR-004/009).
6. Given the seven remaining missions, when each is played, then its FR-008 physical sequence demonstrates the preceding lesson using the same shooting language (FR-005/008).
7. Given two players and a replay/reset during a reaction, when stale work resumes or another player joins/leaves, then state remains valid and badge attribution follows existing ownership (FR-009).
8. Given implemented content, when validation and playtests finish, then evidence is recorded and game state is CanStart or Unconnected (FR-010).
9. Given a player following the Prompt entrance signs, when they walk from the west or north approach into the arena without jumping, then they reach the engagement platform and its lesson starts (FR-003/007/010).

10. Given Prompt completion and an activated return rail, when a player walks up the boarding ramp and jumps onto the rail, then they can attach and reach the hub safely (FR-003/007/010).
