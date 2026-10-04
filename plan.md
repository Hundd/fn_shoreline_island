# AI Island Academy — Project Roadmap

## Product Direction

Build a bright, non-combat UEFN adventure for ages 8–10. Players help Pix, a friendly AI assistant, restore the academy's damaged AI Core by completing short, visual challenges. Each zone teaches one useful idea about AI. The experience should show a task, let the player try it, show the result, explain the idea in plain language, and allow an immediate retry.

The shoreline terrain and existing puzzles remain the foundation. Preserve working device bindings, individual progress and one-time rewards while simplifying interactions. The [AI Island Academy implementation plan](docs/AI%20Island%20Academy%20%E2%80%94%20Implementation%20Plan.md) and [feature 022](specs/022-ai-island-academy-migration/spec.md) describe the theme migration baseline; later numbered features supersede their respective activity designs. See the current status below before treating a proposal as implemented.

## Current implementation checkpoint — 2026-10-04

Features033 and037 are implemented under the owner's delegated autonomous authority: the compact personal HUD/journal follows the numbered eight-module route, nine map indicators use1..8/HUB, and eight Core panels/lights derive existing badge state. Native player caps are one, social joining is disabled and join-in-progress watches only. Confirmed duplicate Skills/legacy Agent controls are retired while primary games and Return access remain.

Focused cooked evidence proves original Error Return E and real Tool Scanner/Speaker/Light shots, resulting Tool badge and HUD1/8. Tool decorative collision and transactional movement rollback were corrected without changing the puzzle. Final validation, production cleanup and independent QA status are tracked in033/037 evidence and tasks; full normal eight-module completion, reset and actual second-account admission are not established by this checkpoint. The native description field rejected its write and remains a delivery gate.

## Historical migration status — 2026-09-29

| Area | Status |
|---|---|
| Prompt Workshop, 027 | Implemented; user confirmed playability. Detailed acceptance remains tracked in its tasks. Earlier Prompt shooting activity 024/026 also remains configured; route/role clarity needs review. |
| Pattern Scanner, 028 | Compact single-player game implemented and user-playtested as working and fun. Detailed follow-up coverage remains documented separately. |
| Classifier, 029 | Solo Sort and Check implemented, built, validated, cooked and owner-accepted; closed 2026-09-30. Detailed optional checks remain in its tasks. |
| Confidence Core, 030 | Simplified solo revision-2 draft prepared; unapproved and not implemented. |
| Error Lab; Tool Lab; Skills Lab; Agent Mission | AI-themed older station gameplay remains. Prioritized findings and suggested migration direction are in the remaining-area review. |
| Discovery Trail; hub/journal | Supporting consistency and navigation work; no automatic new gameplay scope. |

See [remaining-area review](docs/remaining-area-review-2026-09-29.md) for live inventory evidence, source findings and proposed order. Each future gameplay migration still needs a concrete numbered design bundle and explicit approval.

## Product Decisions

- **Audience:** approximately ages 8–10; use brief sentences and explain unfamiliar terms.
- **Release:** public Discover island after private playtesting and the required publishing checks.
- **Language:** English for this release; Ukrainian localization is a later feature.
- **Players:** the current island is configured for one player under037. Per-player attribution remains in legacy controllers for safety; actual second-account admission checks remain pending.
- **Interaction:** use clear, stable actions with visible consequences. The Data Blaster selects large answer targets where appropriate; the working Prompt Workshop uses physical composition controls. Keep automatic hints, safe retries and short routes. Follow each feature's actual implementation/acceptance status rather than assuming the whole island uses the same controls.
- **Safety:** the blaster sends data and instructions rather than fighting enemies. Players are invincible, ammunition is unlimited, and PvP, environmental destruction, elimination and punitive timers are disabled. Wrong shots preserve the puzzle and earned Data Energy for an immediate retry.
- **Rewards:** each main module grants its badge once per player per round. Replays do not duplicate rewards.
- **Accuracy:** Pix can be uncertain and make mistakes. Important AI answers should be checked by people.

## Player Journey

The hub introduces Pix's damaged AI Core and points to1 Prompt Workshop. The personal HUD and AI Core Journal read existing progress and recommend the first incomplete available module. Agent Mission starts locked until the first seven modules are restored. The earlier Prompt shooting activity is optional and shares the same Prompt badge.

1. **Prompt Lab / Prompt Workshop** — compose what, which one and where, watch Pix attempt the request and revise it. **Prompt Badge**. Workshop implementation is tracked in 027; the earlier 024/026 shooting activity remains separately present.
2. **Pattern Scanner** — shoot the missing symbol in three patterns from one spot. **Pattern Badge**. Implemented solo revision: 028.
3. **AI Classifier** — shoot Food, Furniture or Vehicle for seven examples, check Pix's prediction and try new examples. Implemented solo revision: 029. **Classifier Badge**.
4. **Confidence Core** — use clues to revise Pix's confidence. **Confidence Badge**.
5. **AI Error Lab** — compare expected and actual results, correct one mistake, and rerun. **AI Detective Badge**.
6. **AI Tool Lab** — choose a tool response for a task. **Tool Master Badge**.
7. **AI Skills Lab** — build and reuse the GrowPlant skill. **AI Skills Badge**. Some runtime messages still use the old Care name; the review records this source inconsistency.
8. **AI Agent Mission** — combine earlier abilities to restore the Research Station. **AI Agent Badge**.

The old **Fix the Prompt** repair activity is replaced by feature 027 on its repair tiles; its remaining reconciliation tasks are tracked there. **AI Discovery Trail** is optional exploration and does not block the main route or award another badge. Classifier now uses the accepted solo revision 029; Confidence retains its older gameplay pending approval of 030.

## Implementation Architecture

Existing Verse classes, device references, tracker bindings, and persistent IDs may retain older internal names. Player-facing text, signs, dialogue, badges, journal, and the island description use the AI Island Academy terms. UEFN owns the binary map and assets; make and save those changes in the editor.

The personal journal derives module state from the existing per-player progress sources. The hub centerpiece is shared decorative art, while personal module status and the final restoration message appear in each player's UI. See the implementation choices in [feature plan 022](specs/022-ai-island-academy-migration/plan.md).

## Remaining Delivery Gates

The migration's source and world-label changes are tracked in [feature tasks 022](specs/022-ai-island-academy-migration/tasks.md). Before release, inspect the visual presentation in a running client; play through correct, wrong, retry, replay, badge, and round-reset paths; and test two players with separate progress. Confirm the final Agent Mission branch and the optional Discovery Trail. Run UEFN project validation and a memory calculation after the final asset changes. Record results and any accepted warnings in the feature evidence before checking off the tasks.

The project owner reported successful validation, memory calculation, and project push on 2026-09-23. A full solo and multiplayer playthrough remains unrecorded; that report does not replace the final checks above.

## Historical Design

The earlier coding-island MVP and expansion specifications remain in `specs/` as implementation history. Their old names and educational framing do not supersede feature 022 or the AI Island Academy implementation plan.
