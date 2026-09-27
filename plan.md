# AI Island Academy — Project Roadmap

## Product Direction

Build a bright, non-combat UEFN adventure for ages 8–10. Players help Pix, a friendly AI assistant, restore the academy's damaged AI Core by completing short, visual challenges. Each zone teaches one useful idea about AI. The experience should show a task, let the player try it, show the result, explain the idea in plain language, and allow an immediate retry.

The shoreline terrain and existing puzzles remain the foundation. Adapt their presentation and teaching goals to the AI story while preserving working device bindings, individual player progress, and one-time rewards. The detailed direction is [AI Island Academy — Implementation Plan](docs/AI%20Island%20Academy%20%E2%80%94%20Implementation%20Plan.md); [feature 022](specs/022-ai-island-academy-migration/spec.md) is the current implementation specification.

## Product Decisions

- **Audience:** approximately ages 8–10; use brief sentences and explain unfamiliar terms.
- **Release:** public Discover island after private playtesting and the required publishing checks.
- **Language:** English for this release; Ukrainian localization is a later feature.
- **Players:** solo or up to four players; puzzle progress and rewards belong to each player.
- **Interaction:** Creative devices and Verse use the Data Blaster to select large holograms, symbols and data targets. Objective beacons use orange cones; answer choices use equal cyan rings. Feature 024 converts Prompt Lab first, then the remaining missions after its playtest gate.
- **Safety:** the blaster sends data and instructions rather than fighting enemies. Players are invincible, ammunition is unlimited, and PvP, environmental destruction, elimination and punitive timers are disabled. Wrong shots preserve the puzzle and earned Data Energy for an immediate retry.
- **Rewards:** each main module grants its badge once per player per round. Replays do not duplicate rewards.
- **Accuracy:** Pix can be uncertain and make mistakes. Important AI answers should be checked by people.

## Player Journey

The hub introduces Pix's damaged AI Core and points to the Prompt Lab. The personal AI Core Journal reads the existing player progress and recommends an unfinished zone. Agent Mode starts locked until the first seven modules are restored.

1. **Prompt Lab** — shoot the requested blue core, add LARGE to clarify an ambiguous prompt, acquire a slowly moving core, and select its reactor destination. Pix's delivery powers the reactor, lights and Prompt Module, then enables a return ride. **Prompt Badge**. See feature 024 for implementation and validation status.
2. **Pattern Scanner** — spot repetition and predict what comes next. **Pattern Badge**.
3. **AI Classifier** — sort incoming items into Food, Animal, and Vehicle. **Classifier Badge**.
4. **Confidence Core** — use clues to revise Pix's confidence. **Confidence Badge**.
5. **AI Error Lab** — compare expected and actual results, correct one mistake, and rerun. **AI Detective Badge**.
6. **AI Tool Lab** — choose a tool response for a task. **Tool Master Badge**.
7. **AI Skills Lab** — build and reuse the Care skill. **AI Skills Badge**.
8. **AI Agent Mission** — combine earlier abilities to restore the Research Station. **AI Agent Badge**.

**Fix the Prompt** is optional practice within Prompt Lab. **AI Discovery Trail** is optional exploration and does not block the main route or award another badge.

## Implementation Architecture

Existing Verse classes, device references, tracker bindings, and persistent IDs may retain older internal names. Player-facing text, signs, dialogue, badges, journal, and the island description use the AI Island Academy terms. UEFN owns the binary map and assets; make and save those changes in the editor.

The personal journal derives module state from the existing per-player progress sources. The hub centerpiece is shared decorative art, while personal module status and the final restoration message appear in each player's UI. See the implementation choices in [feature plan 022](specs/022-ai-island-academy-migration/plan.md).

## Remaining Delivery Gates

The migration's source and world-label changes are tracked in [feature tasks 022](specs/022-ai-island-academy-migration/tasks.md). Before release, inspect the visual presentation in a running client; play through correct, wrong, retry, replay, badge, and round-reset paths; and test two players with separate progress. Confirm the final Agent Mission branch and the optional Discovery Trail. Run UEFN project validation and a memory calculation after the final asset changes. Record results and any accepted warnings in the feature evidence before checking off the tasks.

The project owner reported successful validation, memory calculation, and project push on 2026-09-23. A full solo and multiplayer playthrough remains unrecorded; that report does not replace the final checks above.

## Historical Design

The earlier coding-island MVP and expansion specifications remain in `specs/` as implementation history. Their old names and educational framing do not supersede feature 022 or the AI Island Academy implementation plan.
