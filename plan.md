# AI Island Academy — Project Roadmap

## Product Direction

Build a bright, non-combat UEFN adventure for ages 8–10. Players help Pix, a friendly AI assistant, restore the academy's damaged AI Core by completing short, visual challenges. Each zone teaches one useful idea about AI. The experience should show a task, let the player try it, show the result, explain the idea in plain language, and allow an immediate retry.

The shoreline terrain and existing puzzles remain the foundation. Preserve working device bindings, individual progress and one-time rewards while simplifying interactions. The [AI Island Academy implementation plan](docs/AI%20Island%20Academy%20%E2%80%94%20Implementation%20Plan.md) and [feature 022](specs/022-ai-island-academy-migration/spec.md) describe the theme migration baseline; later numbered features supersede their respective activity designs. See the current status below before treating a proposal as implemented.

## Current Migration Status — 2026-09-29

| Area | Status |
|---|---|
| Prompt Workshop, 027 | Implemented; user confirmed playability. Detailed acceptance remains tracked in its tasks. Earlier Prompt shooting activity 024/026 also remains configured; route/role clarity needs review. |
| Pattern Scanner, 028 | Compact single-player game implemented and user-playtested as working and fun. Detailed follow-up coverage remains documented separately. |
| Classifier, 029; Confidence Core, 030 | Simplified solo revision-2 specs, plans and previews prepared. Not yet approved or implemented. |
| Error Lab; Tool Lab; Skills Lab; Agent Mission | AI-themed older station gameplay remains. Prioritized findings and suggested migration direction are in the remaining-area review. |
| Discovery Trail; hub/journal | Supporting consistency and navigation work; no automatic new gameplay scope. |

See [remaining-area review](docs/remaining-area-review-2026-09-29.md) for live inventory evidence, source findings and proposed order. Each future gameplay migration still needs a concrete numbered design bundle and explicit approval.

## Product Decisions

- **Audience:** approximately ages 8–10; use brief sentences and explain unfamiliar terms.
- **Release:** public Discover island after private playtesting and the required publishing checks.
- **Language:** English for this release; Ukrainian localization is a later feature.
- **Players:** current legacy systems retain per-player support for up to four players. The requested simplification direction is single-player activities, implemented in 028 and proposed in 029/030. This does not claim island matchmaking or every older module has been converted.
- **Interaction:** use clear, stable actions with visible consequences. The Data Blaster selects large answer targets where appropriate; the working Prompt Workshop uses physical composition controls. Keep automatic hints, safe retries and short routes. Follow each feature's actual implementation/acceptance status rather than assuming the whole island uses the same controls.
- **Safety:** the blaster sends data and instructions rather than fighting enemies. Players are invincible, ammunition is unlimited, and PvP, environmental destruction, elimination and punitive timers are disabled. Wrong shots preserve the puzzle and earned Data Energy for an immediate retry.
- **Rewards:** each main module grants its badge once per player per round. Replays do not duplicate rewards.
- **Accuracy:** Pix can be uncertain and make mistakes. Important AI answers should be checked by people.

## Player Journey

The hub introduces Pix's damaged AI Core and points to the Prompt Lab. The personal AI Core Journal reads the existing player progress and recommends an unfinished zone. Agent Mode starts locked until the first seven modules are restored.

1. **Prompt Lab / Prompt Workshop** — compose what, which one and where, watch Pix attempt the request and revise it. **Prompt Badge**. Workshop implementation is tracked in 027; the earlier 024/026 shooting activity remains separately present.
2. **Pattern Scanner** — shoot the missing symbol in three patterns from one spot. **Pattern Badge**. Implemented solo revision: 028.
3. **AI Classifier** — sort incoming items into Food, Animal, and Vehicle. **Classifier Badge**.
4. **Confidence Core** — use clues to revise Pix's confidence. **Confidence Badge**.
5. **AI Error Lab** — compare expected and actual results, correct one mistake, and rerun. **AI Detective Badge**.
6. **AI Tool Lab** — choose a tool response for a task. **Tool Master Badge**.
7. **AI Skills Lab** — build and reuse the GrowPlant skill. **AI Skills Badge**. Some runtime messages still use the old Care name; the review records this source inconsistency.
8. **AI Agent Mission** — combine earlier abilities to restore the Research Station. **AI Agent Badge**.

The old **Fix the Prompt** repair activity is replaced by feature 027 on its repair tiles; its remaining reconciliation tasks are tracked there. **AI Discovery Trail** is optional exploration and does not block the main route or award another badge. Classifier and Confidence descriptions above reflect existing gameplay; the simpler proposed replacements are in 029 and 030.

## Implementation Architecture

Existing Verse classes, device references, tracker bindings, and persistent IDs may retain older internal names. Player-facing text, signs, dialogue, badges, journal, and the island description use the AI Island Academy terms. UEFN owns the binary map and assets; make and save those changes in the editor.

The personal journal derives module state from the existing per-player progress sources. The hub centerpiece is shared decorative art, while personal module status and the final restoration message appear in each player's UI. See the implementation choices in [feature plan 022](specs/022-ai-island-academy-migration/plan.md).

## Remaining Delivery Gates

The migration's source and world-label changes are tracked in [feature tasks 022](specs/022-ai-island-academy-migration/tasks.md). Before release, inspect the visual presentation in a running client; play through correct, wrong, retry, replay, badge, and round-reset paths; and test two players with separate progress. Confirm the final Agent Mission branch and the optional Discovery Trail. Run UEFN project validation and a memory calculation after the final asset changes. Record results and any accepted warnings in the feature evidence before checking off the tasks.

The project owner reported successful validation, memory calculation, and project push on 2026-09-23. A full solo and multiplayer playthrough remains unrecorded; that report does not replace the final checks above.

## Historical Design

The earlier coding-island MVP and expansion specifications remain in `specs/` as implementation history. Their old names and educational framing do not supersede feature 022 or the AI Island Academy implementation plan.
