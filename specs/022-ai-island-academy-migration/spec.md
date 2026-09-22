# AI Island Academy migration

## Purpose

Migrate Byte Island Academy into **AI Island Academy**, a safe, non-combat
adventure in which players help Pix restore eight AI Core modules. Preserve the
working Verse/device mechanics, per-player state, retry behavior, and reward
guards unless a change is explicitly required by the migration plan.

## Requirements

- FR-001: Player-facing island, hub, journal, destination, HUD, dialogue, and
  badge terminology use the AI Island Academy narrative.
- FR-002: The required route is Prompt Lab, Pattern Scanner, AI Classifier,
  Confidence Core, AI Error Lab, AI Tool Lab, AI Skills Lab, then AI Agent
  Mission. AI Discovery Trail remains optional.
- FR-003: Pix's damaged AI Core is the narrative anchor, with eight named
  modules and Agent Mode initially locked.
- FR-004: Each migrated zone keeps its original short gameplay mechanic while
  explaining its mapped, age-appropriate AI concept.
- FR-005: Wrong answers reset only the active attempt and allow immediate
  retry; no combat, eliminations, punitive timers, or mandatory timers are
  introduced.
- FR-006: Existing player-specific progress and one-time reward protections
  remain intact in solo and multiplayer play.
- FR-007: Internal Verse identifiers and persistent reward/device bindings are
  retained where a presentation-layer rename is sufficient.

## Zone mapping

| Existing system | Player-facing AI zone | Concept |
| --- | --- | --- |
| Path Garden + Garden Repair | Prompt Lab + Fix the Prompt | Clear instructions |
| Loop Lagoon | Pattern Scanner | Patterns and prediction |
| Signal Lighthouse | AI Classifier | Classification |
| Variable Vault | Confidence Core | Confidence and uncertainty |
| Debug Workshop | AI Error Lab | Checking mistakes |
| Event Factory | AI Tool Lab | Tool use |
| Tidepool Nursery | AI Skills Lab | Reusable skills |
| Build-a-Bot | AI Agent Mission | Agent workflow |
| Coastal Fieldwork | AI Discovery Trail | Optional AI literacy |

## Acceptance scenarios

### AC-001: Theme shell

Given a player starts at the hub, when they read the hub and journal, then
they see AI Island Academy, Pix's AI Core story, the eight module names, and
AI-themed zone/badge names without changing current progress ownership.

### AC-002: Prompt Lab

Given a player enters the former Path Garden, when they complete or fail its
ordered sequence, then it is presented as Prompt Lab instructions, retains the
existing safe retry, and awards Prompt Badge no more than once per player.

### AC-003: Remaining zone presentation

Given a player reaches any mapped zone, when they read its start, help,
completion, replay, and journal text, then the AI concept is accurate,
age-appropriate, and contains no obsolete player-facing zone or badge name.

### AC-004: Progress and safety

Given two players use a migrated game concurrently, when either player makes a
wrong attempt, completes, or replays, then only that player's attempt and
reward state change; neither player is eliminated or blocked by a timer.

## Out of scope for this feature slice

- Replacing functional Verse classes, devices, or persistent reward IDs merely
  to match the new names.
- Treating optional AI Discovery Trail content as a main-route prerequisite.
- Claims that AI is always correct, understands like a human, or learns from
  every player interaction.
