# Feature 023: Prompt Lab Data Core Rescue

Source: `docs/Prompt Lab — Interactive Mission Redesign.md` (sections 1–40).

## Goal

Replace the required Prompt Lab's four-command garden sequence with a physical, three-challenge mission in which players discover information, assemble instructions with large world controls, and watch Pix act. Preserve the existing Prompt Badge and journal integration.

## Requirements

- FR-001: The lab is a colorful, vertical, playable room with raised routes, a speed boost, a grind rail, a jump or boost route, visible machinery, three distinct cores, and a clear reactor, scanner, storage, generator, and final door. Important actions can be understood without reading long panels.
- FR-002: A short alarm/arrival introduces Pix and a blue-core target. A traversal route leads to a raised target scanner; scanning reveals Blue, points toward the core yard, and unlocks the physical Blue/Red/Green selectors.
- FR-003: A separate traversal route leads to a destination scanner that reveals the Power Reactor with a brief world beam. Large physical destination selectors and a prominent Send to Pix control form and send `Get Blue Core and take it to Power Reactor`. A wrong but complete instruction remains sendable: Pix acts on the selected details, the reactor safely rejects a wrong core, and the player can replace only the wrong detail.
- FR-004: Sending a complete first prompt starts a short visible, non-locking Pix/core delivery sequence in the play space. Reactor activation gives a large non-damaging pulse, immediate success, and only then a short explanation of what and where.
- FR-005: Challenge 2 shows genuinely ambiguous small and large blue cores plus a red core. Pix asks which blue core; physical Small/Large choices let the player add Large and resend. Pix visibly chooses the large blue core and gives a brief lesson about useful detail. No random wrong pick is staged.
- FR-006: Challenge 3 presents an urgent-looking door without a punitive timer. Green, Energy Cell, and Door Generator clues are discovered in three physical places. A carryable Data Cube must be carried or thrown into a receiver to reveal the destination. Physical prompt components then compose and send the final instruction.
- FR-007: Pix visibly retrieves the green cell and powers the Door Generator; the giant door opens. The player enters and connects the Prompt Module to Pix's Core. The existing Prompt Badge is awarded once per player only on final module connection.
- FR-008: Wrong attempts preserve discovered clues and all correct prompt details, changing only the relevant choice for immediate retry. Replay and round reset restore mission state without duplicate badge awards. State and feedback are player specific; shared effects are cosmetic.
- FR-009: Brief sound, light, hologram, and prop animation feedback accompanies discovery, selector activation, sending, Pix uncertainty, delivery, and module restoration. Players remain free to move during execution.
- FR-010: Updated hub, journal, saved device labels, and optional Fix the Prompt text do not direct players through the old seed/garden sequence. The project validates, Verse builds, and solo/multiplayer playtests cover the full mission.

## Acceptance scenarios

### AC-001: Discover and send

Given a fresh player enters Prompt Lab, when they traverse to both scanners, choose Blue and Power Reactor on world controls, and press Send, then Pix visibly delivers the blue core to the reactor and only afterward explains what and where. The player can move throughout.

### AC-002: Ambiguity and repair

Given the first reactor is active, when Pix sees two blue cores, then Pix pauses and asks which one. When the player chooses Large and sends, Pix selects the large blue core; Small gives clear retry feedback.

### AC-002a: Wrong core is a visible, repairable result

Given both first-stage clues are known, when a player selects Red Core and Power Reactor and sends, then Pix visibly takes the red core to the reactor, the reactor safely rejects it, and the player can replace Red with Blue while retaining the Power Reactor choice and both discoveries.

### AC-003: Final rescue

Given challenge 3 has begun, when the player finds Green and Energy Cell, carries a Data Cube into its receiver, selects all three discovered components, and sends, then Pix delivers the green cell, the generator opens the door, and entering the module grants the Prompt Badge once.

### AC-004: Safe state

Given two players are at different mission stages, when one makes a wrong choice, replays, respawns, or finishes, then the other player's mission and badge do not change. A new round clears temporary choices; no timer eliminates a player.

### AC-005: Release gates

Given the editor changes are saved, when Verse build, project validation, a fresh cook, and solo/multiplayer playtests run, then the route, labels, cue timing, reset behavior, collision, and reward trigger meet FR-001 through FR-010 without blocking errors.
