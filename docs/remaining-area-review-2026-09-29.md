# Remaining area review

2026-09-29. Review only: source, specs, historical evidence and fresh read-only editor inventory. No gameplay, actor, asset or Verse edits. Suggestions below are design directions, not approved layouts or implementation instructions. A selected area needs its own numbered spec/plan/tasks/map and reviewed preview before changes.

## What is actually migrated?

AI names and messages were applied across the island in feature 022. That is different from migrating gameplay to the simpler solo approach. An unchecked acceptance task also does not mean its implementation is absent.

| Area | Observed status | Next action |
|---|---|---|
| Prompt Workshop, 027 | Implemented; user confirmed playability after interaction guidance repair. Detailed acceptance remains open. | Keep the working activity; review remaining checks rather than rebuilding it as an untouched area. |
| Earlier Prompt shooting area, 024/026 | Still present and configured=true alongside Workshop. Legacy 023 controller has use_blaster_mode=true and exits its old flow. | Review how two Prompt activities sharing a badge are presented. Their coexistence was outside 027's removal scope; do not silently delete either. |
| Pattern Scanner, 028 | Compact solo redesign implemented; user reported working and fun. | Use as interaction reference; retain its separately documented untested cases. |
| Classifier, 029 | Simplified revision-2 docs and previews prepared; implementation unapproved. Existing station logic remains. | Review the prepared bundle, then implement if approved. |
| Confidence Core, 030 | Same planning-only status as 029. | Review the prepared bundle, then implement if approved. |
| Error Lab, Tool Lab, Skills Lab, Agent Mission | AI-themed but still use older claim/edit/run/next station structures. Four placed station controllers found for each. | Next gameplay migration candidates. |
| Discovery Trail and hub/journal | Supporting interactions; not another required badge module. | Small consistency/navigation review, with optional content clearly optional. |
| Old Fix the Prompt repair game | 027 explicitly replaces it on the repair tiles; the current repair-label scan returned no Verse controller matches. | Finish exact 027 ownership/subscription reconciliation before claiming every remnant is removed. Do not plan a duplicate new migration from historical feature 022 text. |

Evidence: [live inventory summary](evidence/remaining-areas-2026-09-29.json), [027 interaction report](../specs/027-prompt-workshop-redesign/evidence/interaction-clarity-2026-09-28.md), [028 user playtest](../specs/028-pattern-scanner-cargo-circuit/evidence/solo-user-playtest-2026-09-29.md), and current feature task lists. Label matches establish presence, not active ownership, visibility, safe removal or gameplay quality.

## Findings, ranked by design risk

### 1. Agent Mission: too many kinds of decisions before the actual mission

**High priority.** The controller declares 14 button references; live bot-labelled actors include 56 buttons and four stations. Players edit command slots, repeats, energy, scanner connection, route, classification rule and test item. It includes medical practice, lamp/energy practice, then navigation/scan/delivery. Run and Next change meanings through navigation, scan, optional classification, skill execution and Verify. This is an interaction-complexity finding from source; no new failure rate is claimed.

Source: [controls and stage copy](../Content/fn_shoreline_island_bot_station.verse:15), [stage-dependent Next](../Content/fn_shoreline_island_bot_station.verse:996). Verify currently checks completed internal delivery state; it does not ask the player to choose between observed correct/incorrect outcomes ([handler](../Content/fn_shoreline_island_bot_station.verse:979)). This limits the strength of the claimed human-verification lesson, even if the button works correctly.

**Direction:** one concrete delivery goal: identify the needed crate, use a scanner, choose an open route, run a named delivery skill, check the visible destination. Reveal only the next useful decision. Remove redundant mandatory practice and optional classifier controls from the critical path. Preserve visible cause/effect, the seven-module prerequisite, existing badge/finale identity and human check. The exact simplified sequence still needs design approval; do not reduce the finale to an unexplained automatic animation.

### 2. Skills Lab: editing a skill, a calling plan and a loop at once

**High priority.** Fifteen button fields per station cover four definition slots, three calling slots, repeat count, run/claim/help/next/replay/return and remix. Four controllers are present. Historical 022 evidence records 60 physical controls; the fresh nursery-label search is incomplete because the controls use mixed labels, so it is not a fresh 60-button count.

Source: [controls](../Content/fn_shoreline_island_nursery_station.verse:13), [three challenge objectives](../Content/fn_shoreline_island_nursery_station.verse:140), [historical saved control audit](../specs/022-ai-island-academy-migration/evidence/skills-lab-growplant-name-2026-09-23.md).

**Direction:** show a named skill as a visible short sequence, repair one missing/wrong step, then reuse that same skill on another planter. Keep the satisfying growth result. Introduce repetition only after reuse is understood; move the definition/caller/repeat editor and remix out of the required first-run path. Do not turn the lesson into pressing a magic Grow button without showing its steps.

**Confirmed wording defect:** runtime step/error messages still say `Care skill` and `Care step` at source lines 164/166 although the main skill is GrowPlant. The earlier evidence's claim that only comments retain Care is no longer true of current source. The remix sentence `3 plan instructions replace 9 expanded steps` also needs to distinguish compact instructions from executed actions; reuse does not eliminate the underlying work. These are recorded for a scoped correction, not silently changed during this audit.

### 3. Tool Lab: extra wiring controls and an answer-copying exercise

**Medium-high priority.** Ten controls per station; fresh event-label inventory has 40 buttons and four stations. Choosing a tool and testing a request are separate interactions. The test buttons change from executing requests to identifying them in the demonstration stage. The recent-request board explicitly names Scan Object or Announce Result while the player is asked which request occurred: that checks reading/copying more directly than useful tool choice.

Source: [labels/objectives](../Content/fn_shoreline_island_event_station.verse:67), [connection and request handlers](../Content/fn_shoreline_island_event_station.verse:280), [fixtures](../Content/fn_shoreline_island_event_fixtures.verse:1).

**Direction:** a short request and three stable tools: Scanner, Speaker, Light. Choosing a tool immediately performs its visible action. Include a genuine lighting request so Light is useful, not permanently the wrong answer. Keep the crate reveal and visible announcement/status; remove connect-then-test and reverse-request guessing from the basic loop. Ask the player why the tool helped, not just which word was printed.

### 4. Error Lab: a good core lesson behind a button cycle

**Medium priority; likely a good next pilot.** Seven button fields, 28 matching placed buttons and four stations. Claim, cycle edit, Run, Next and Replay add steps around a useful expected-versus-actual comparison. The three challenges change editing semantics between direction, count and routing rule. The third repeats classification already taught elsewhere.

Source: [control and problem copy](../Content/fn_shoreline_island_debug_station.verse:55), [choice fixtures](../Content/fn_shoreline_island_debug_fixtures.verse:1).

**Direction:** show the failed result and goal together; let the player select one concrete correction; automatically rerun and show before/after. Keep one deliberate fault and explain why the corrected result matches. Retain the robot/route markers and expected/actual display that provide evidence. Do not replace debugging with choosing an answer that is visibly pre-marked correct.

## Supporting areas and consistency

- **Discovery Trail:** already short, optional and non-blocking; no full reconstruction justified by this review. Its crate count and human-decision notes support evidence checking. Pattern copy says lanterns flash; actual physical sequence/sightline needs observation before asserting that it does. Food/Animal/Machine is a different category set from the current Classifier and proposed Food/Furniture/Vehicle set; this is not inherently incorrect, but should be clearly presented as a different set or aligned during 029 implementation. Avoid accidentally teaching a required extra badge. [Current prompts](../Content/fn_shoreline_island_field_observations.verse:51).
- **Hub/journal:** recommendations should give one concrete next action and accurately identify which Prompt activity they lead to. Current energy guidance says to improve confidence, which would be wrong guidance after 030's check-evidence redesign; update it with that implementation, not ahead of it. Current Prompt guidance names Workshop while the overview still calls the module Prompt Lab; distinguish activity name from badge/module name. [Journal copy](../Content/fn_shoreline_island_academy_journal.verse:51).
- **Roadmap:** root plan still treated 024/022 as the latest whole-island direction and named the Skills lesson Care. Its status summary is updated with this review, keeping implemented versus proposed work separate. Historical approved specs are not retroactively rewritten as if new layouts were approved.
- **Scenery:** do not equate actor count with clutter. Robot paths, expected-result markers, the mystery crate, planter states and delivery destination are gameplay evidence worth retaining. Shelves, façades and spare station furniture need eye-level and dependency inspection before removal. Aggregate bounds can include shared supports, as 030's debug-labelled floor already demonstrates.

## Recommended order

1. Review/implement the already prepared 029 and 030 bundles when approved.
2. Plan Error Lab, then Tool Lab as small migrations with immediate visible consequences.
3. Plan Skills Lab around visible skill reuse, then simplify Agent Mission using those established actions. Agent has the highest complexity risk but depends on clear tool/skill lessons.
4. Reconcile hub guidance, optional trail copy and the two Prompt activities alongside those changes.

Use the successful solo principles: automatic entry, stable action meanings, brief persistent instructions, automatic useful hints, safe retries, local replay/return, short walking and no decorative-object quota. Three targets are a useful reference, not a rule that must erase a lesson's meaningful decisions. Preserve earned progress, round reset, badge identities, shared infrastructure and functional teaching props.

## Limits and handoff

This audit did not inspect cooked player views, test interactions, measure walking distances or prove any unused prop safe to delete. No new map layout or implementation approval is claimed. Gameplay changes require numbered feature bundles and explicit review under the repository workflow. Fresh SessionToolset.GetGameState returned Unconnected; no playtest was launched and the editor remains open.
