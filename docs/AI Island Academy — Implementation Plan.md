 # AI Island Academy — Theme Migration & Implementation Plan

## 1. Objective

Convert the existing **Byte Island Academy** Fortnite/UEFN island from a general coding-education theme into an **AI education adventure**.

The implementation should:

* Preserve as much existing Verse/device/gameplay logic as possible.
* Change the narrative, terminology, visual presentation, UI text, rewards, and educational framing.
* Keep the island non-combat.
* Keep puzzles short and understandable for approximately ages 8–10.
* Preserve safe failure:

  * no elimination;
  * no punitive timers;
  * wrong answers reset only the current attempt;
  * players can retry immediately.
* Preserve independent player progress in multiplayer.
* Preserve existing reward protections so replaying activities does not duplicate rewards.
* Avoid turning the project into a completely new island.
* Prefer **reskinning and adapting existing systems** over replacing working systems.

The end result should feel like a coherent AI adventure rather than a coding island where the word "AI" has simply been added to existing games.

---

# 2. New Island Concept

## New working title

**AI Island Academy**

Alternative title if a more narrative name is preferred:

**Pix AI Academy**

## Core story

Pix is a small AI assistant running the systems of a futuristic island research academy.

A major system glitch has damaged Pix's AI Core.

Pix can still communicate with the player, but several abilities are offline:

1. Understanding instructions
2. Recognizing patterns
3. Classifying things
4. Measuring confidence
5. Detecting mistakes
6. Using tools
7. Using reusable skills
8. Acting as an AI agent

The player explores the academy and restores these abilities one by one.

Each completed zone activates one part of Pix's AI Core.

When all required modules are restored, the player unlocks the final **AI Agent Mission**.

---

# 3. Core Progression

The island should communicate the overall progression clearly.

Use the following order:

```text
AI Academy Hub
      |
      v
1. Prompt Lab
      |
      v
2. Pattern Scanner
      |
      v
3. AI Classifier
      |
      v
4. Confidence Core
      |
      v
5. AI Error Lab
      |
      v
6. AI Tool Lab
      |
      v
7. AI Skills Lab
      |
      v
8. AI Agent Mission
```

Optional content:

```text
AI Discovery Trail
```

The optional trail must not block completion of the main island.

---

# 4. Existing Game → New Game Mapping

| Existing          | New AI Theme       | Main AI Concept                  | Logic Reuse |
| ----------------- | ------------------ | -------------------------------- | ----------- |
| Path Garden       | Prompt Lab         | Clear instructions               | Very high   |
| Garden Repair     | Fix the Prompt     | Improving instructions           | Very high   |
| Loop Lagoon       | Pattern Scanner    | Pattern recognition / prediction | High        |
| Signal Lighthouse | AI Classifier      | Classification                   | Very high   |
| Variable Vault    | Confidence Core    | Confidence / uncertainty         | High        |
| Debug Workshop    | AI Error Lab       | Checking AI mistakes             | Very high   |
| Event Factory     | AI Tool Lab        | AI tool use                      | Very high   |
| Tidepool Nursery  | AI Skills Lab      | Reusable AI skills               | Very high   |
| Build-a-Bot       | AI Agent Mission   | Agent workflow                   | High        |
| Coastal Fieldwork | AI Discovery Trail | Predictions / AI literacy        | High        |

---

# 5. Implementation Strategy

Do **not** start by modifying every system simultaneously.

Implement the migration in phases.

Each phase must leave the island playable.

Recommended order:

1. Audit existing implementation.
2. Introduce global AI terminology.
3. Update hub and progression.
4. Convert Prompt Lab.
5. Convert Pattern Scanner.
6. Convert AI Classifier.
7. Convert Confidence Core.
8. Convert AI Error Lab.
9. Convert AI Tool Lab.
10. Convert AI Skills Lab.
11. Convert AI Agent Mission.
12. Convert optional AI Discovery Trail.
13. Update rewards.
14. Add global visual feedback.
15. Perform multiplayer/progression validation.
16. Perform final content and memory/performance pass.

---

# 6. Phase 0 — Audit Existing Implementation

Before modifying gameplay, inspect the existing implementation.

## 6.1 Identify systems

Locate the implementation for:

* academy hub;
* Pix dialogue;
* player progress tracking;
* personal journal;
* badge board;
* zone recommendation logic;
* Path Garden;
* Garden Repair;
* Loop Lagoon;
* Signal Lighthouse;
* Variable Vault;
* Debug Workshop;
* Event Factory;
* Tidepool Nursery;
* Build-a-Bot;
* Coastal Fieldwork;
* end-of-island celebration;
* hint system;
* reward system;
* replay protection;
* multiplayer/player-specific state.

## 6.2 Record dependencies

For every game, identify:

```text
Entry trigger
↓
Game initialization
↓
Player input
↓
State mutation
↓
Validation
↓
Success/failure feedback
↓
Completion event
↓
Reward/progress event
```

Do not rename Verse APIs/classes/functions blindly.

First determine which names are:

* internal implementation names;
* player-visible text;
* editor/device names;
* persistent identifiers.

Internal names may remain temporarily unchanged if renaming creates unnecessary risk.

Example:

```text
Internal:
PathGardenController

Player-facing:
Prompt Lab
```

This is acceptable during the migration.

## 6.3 Create a migration checklist

For each zone track:

```text
[ ] Gameplay logic inspected
[ ] Player-facing strings identified
[ ] Props identified
[ ] HUD identified
[ ] Dialogue identified
[ ] Badge identified
[ ] Tutorial identified
[ ] Hint text identified
[ ] Completion event identified
[ ] Multiplayer behavior checked
```

---

# 7. Phase 1 — Global AI Theme

Implement the global narrative before deeply changing individual games.

## 7.1 Change island description

Suggested player-facing description:

> Restore Pix's AI Core! Explore a futuristic island academy, teach Pix how to understand instructions, recognize patterns, classify objects, use tools, detect mistakes, and complete a final AI Agent Mission.

Keep wording simple.

Avoid technical descriptions such as:

* transformer;
* embeddings;
* tokens;
* neural network weights;
* backpropagation;
* inference architecture.

These are unnecessary for the target age.

---

# 8. Pix Character Redesign

Pix should become the narrative anchor of the island.

Pix is:

* friendly;
* curious;
* helpful;
* imperfect;
* capable of making mistakes;
* improving as the player progresses.

Pix should **not** present itself as always correct.

## Initial Pix state

At the beginning:

```text
AI CORE STATUS

Instructions      OFFLINE
Patterns          OFFLINE
Classification    OFFLINE
Confidence        OFFLINE
Error Checking    OFFLINE
Tools             OFFLINE
Skills            OFFLINE
Agent Mode        LOCKED
```

## Progression

After each module:

```text
AI MODULE RESTORED

PATTERN RECOGNITION
ONLINE
```

Pix should visually become more capable as modules return.

Possible visual changes:

* additional glowing lights;
* floating holograms;
* changing face/display;
* more active particles;
* activated antennas;
* progressively brighter central AI Core.

Do not require a different character mesh for every stage if this is expensive.

Simple VFX/material/UI changes are sufficient.

---

# 9. Academy Hub Conversion

Convert the current academy hub into the **AI Academy Hub**.

## Hub centerpiece

Add a large visual representation of:

**PIX AI CORE**

Show eight modules.

Example:

```text
PIX AI CORE

[✓] Instructions
[✓] Patterns
[ ] Classification
[ ] Confidence
[ ] Error Checking
[ ] Tools
[ ] Skills
[🔒] Agent Mode
```

This display must derive from existing player progress where possible.

Do not create a second independent progression system unless necessary.

---

# 10. Navigation

Rename destinations.

```text
Path Garden
→ Prompt Lab

Loop Lagoon
→ Pattern Scanner

Signal Lighthouse
→ AI Classifier

Variable Vault
→ Confidence Core

Debug Workshop
→ AI Error Lab

Event Factory
→ AI Tool Lab

Tidepool Nursery
→ AI Skills Lab

Build-a-Bot
→ AI Agent Mission

Coastal Fieldwork
→ AI Discovery Trail
```

Update:

* signs;
* map labels;
* journal entries;
* destination hints;
* teleport labels;
* HUD messages;
* Pix dialogue.

---

# 11. Reward Migration

Recommended badge changes:

| Existing      | New                |
| ------------- | ------------------ |
| Circuit Badge | Prompt Badge       |
| Loop Badge    | Pattern Badge      |
| Signal Badge  | Classifier Badge   |
| Energy Badge  | Confidence Badge   |
| Debug Badge   | AI Detective Badge |
| Event Badge   | Tool Master Badge  |
| Nursery Badge | AI Skills Badge    |
| Bot Badge     | AI Agent Badge     |

Preserve underlying reward IDs if changing them could break persistence.

Player-facing names can change independently.

---

# 12. Game 1 — Prompt Lab

## Replaces

**Path Garden**

## Educational goal

Teach:

> AI needs clear instructions.

Avoid claiming that real AI literally executes prompts as deterministic step-by-step programs.

The simplified lesson is:

> Clearer instructions help AI understand what you want.

---

## 12.1 Environment

Convert the garden into a small AI robot training area.

Suggested props:

* robot;
* seed crate;
* planting station;
* scanner;
* holographic instruction panel.

The environment may still contain plants.

That allows existing props and animations to be reused.

---

## 12.2 Challenge 1

Player receives:

```text
MISSION

Help the robot plant a seed.

Arrange the instructions.
```

Available commands:

```text
Find Seed
Dig Hole
Plant Seed
Water
```

Correct order:

```text
Find Seed
→ Dig Hole
→ Plant Seed
→ Water
```

On success:

```text
Great instructions!

Pix understood exactly what to do.
```

Concept message:

```text
Clear instructions help AI understand a task.
```

---

## 12.3 Failure behavior

Example wrong sequence:

```text
Water
→ Find Seed
→ Plant Seed
→ Dig Hole
```

Robot performs enough of the sequence for the player to see why the result is wrong.

Then display:

```text
That instruction didn't work.

Try changing the order.
```

Reset only the current attempt.

---

# 13. Garden Repair → Fix the Prompt

Keep this as an optional or follow-up challenge within Prompt Lab.

## Scenario

Goal:

```text
Bring the blue data cube to the scanner.
```

Incorrect instructions:

```text
Pick Up Cube
Scan Cube
Walk to Scanner
```

Player must swap:

```text
Scan Cube
```

and:

```text
Walk to Scanner
```

Correct:

```text
Pick Up Cube
→ Walk to Scanner
→ Scan Cube
```

Success message:

```text
Prompt improved!

Small changes can make instructions much clearer.
```

No additional badge is required.

---

# 14. Prompt Lab Acceptance Criteria

* Existing sequence validation still works.
* Wrong order safely resets the attempt.
* Player can immediately retry.
* Pix explains why ordering matters.
* Existing badge/reward protection still works.
* Multiplayer players do not overwrite each other's sequence state.
* Garden Repair remains optional.
* No player-facing references to "Path Garden" remain.

---

# 15. Game 2 — Pattern Scanner

## Replaces

**Loop Lagoon**

## Educational goal

Introduce:

* patterns;
* repetition;
* prediction.

Explain:

> AI often learns patterns from examples.

Do not tell players that all AI works only by simple repeating sequences.

---

# 16. Pattern Scanner — Challenge 1

Show:

```text
🔵 🟡 🔵 🟡 🔵 ?
```

Choices:

```text
🔵
🟡
🟢
```

Correct:

```text
🟡
```

Pix:

```text
You found the pattern!

The colors repeat:
Blue, Yellow, Blue, Yellow...
```

---

# 17. Pattern Scanner — Challenge 2

Use the existing robot movement/repetition mechanic.

Example physical sequence:

```text
Move
Light
Move
Light
Move
Light
```

Player chooses:

```text
Repeat [Move + Light] ___ times
```

Correct:

```text
3
```

Robot physically executes the sequence.

---

# 18. Pattern Scanner — Challenge 3

Modify the target.

Example:

Robot needs to reach tile 4.

Player adjusts repeat count.

Preserve the original repeat-count mechanic.

Pix explains:

```text
The pattern stayed the same.

Only the number of repeats changed.
```

---

# 19. Pattern Scanner Acceptance Criteria

* Pattern UI clearly shows the repeated structure.
* Robot visibly performs each repeated action.
* Existing repeat-count logic is reused.
* Hint system still works.
* Player can request an explanation.
* Completion awards Pattern Badge once.
* Replaying does not duplicate rewards.

---

# 20. Game 3 — AI Classifier

## Replaces

**Signal Lighthouse**

This should be one of the most visibly AI-themed areas.

## Educational goal

Teach:

> Classification means placing things into categories.

---

# 21. Classifier Environment

Convert cargo routing into an AI sorting facility.

Suggested layout:

```text
Incoming Item
       ↓
   AI Scanner
       ↓
Classification
   /    |    \
Food Animal Vehicle
```

Existing routing paths can remain.

Change visual theme and labels.

---

# 22. Classifier Challenge 1

Incoming object:

```text
🍎 APPLE
```

Destinations:

```text
FOOD
ANIMAL
VEHICLE
```

Correct:

```text
FOOD
```

---

# 23. Classifier Challenge 2

Examples:

```text
🐶 → ANIMAL
🚗 → VEHICLE
🥕 → FOOD
```

Player routes each object.

Reuse existing Leaf/Gear/Plain routing logic internally if convenient.

Only the visible representation must change.

---

# 24. Classifier Challenge 3

Present several items.

Player chooses the complete classification rule.

Example:

```text
Food      → Storage Lab
Animal    → Biology Lab
Vehicle   → Transport Lab
```

Pix:

```text
You created a classification rule!

AI can use learned categories to sort new things.
```

---

# 25. Optional AI Mistake

After the basic lesson, show:

```text
AI prediction:

Dolphin → FISH
```

Ask:

```text
Is this classification correct?
```

Answer:

```text
No
```

Correct classification:

```text
MAMMAL
```

Explain:

```text
AI can make mistakes.

Checking the result is important.
```

Keep this optional if it creates scope problems.

---

# 26. AI Classifier Acceptance Criteria

* Existing routing system continues to work.
* Three visible categories exist.
* Players can observe items moving to destinations.
* Wrong classification safely resets/retries.
* Final challenge evaluates a complete rule.
* Classification explanation appears at completion.
* Badge is awarded once.

---

# 27. Game 4 — Confidence Core

## Replaces

**Variable Vault**

## Educational goal

Teach:

> AI answers can have different levels of confidence.

Also reinforce:

> High confidence does not automatically mean an answer is correct.

Do not present confidence as an exact description of how every real-world model behaves.

---

# 28. Confidence Core UI

Replace:

```text
Energy = 0
```

with:

```text
AI CONFIDENCE

0%
```

Internally, existing integer values may remain.

Example mapping:

```text
0 → 0%
1 → 20%
2 → 40%
3 → 60%
4 → 80%
5 → 100%
```

If changing internal logic would create unnecessary work, perform conversion only in the display layer.

---

# 29. Confidence Challenge 1

Pix sees an obscured object.

Display:

```text
Pix thinks:

CAT

Confidence: 40%
```

Player reveals clues.

Example:

```text
Pointed ears
Whiskers
Tail
```

Each useful clue increases confidence.

Goal:

```text
Confidence ≥ required threshold
```

---

# 30. Confidence Challenge 2

Start at:

```text
40%
```

Player must reach:

```text
100%
```

Reuse existing increment controls.

---

# 31. Confidence Challenge 3

Reuse repeated `Add 2` gameplay.

Present it as repeated information updates.

Example:

```text
New clue found.
Confidence +20%
```

The actual value system may remain identical internally.

---

# 32. Confidence Core Completion Message

```text
AI can be uncertain.

More useful information can sometimes help an AI make a better prediction.

Important answers should still be checked.
```

---

# 33. Confidence Core Acceptance Criteria

* Existing variable/value system remains stable.
* Visible display uses confidence terminology.
* Values update immediately.
* Invalid values do not punish the player.
* Player can revise their answer.
* Confidence Badge is awarded once.
* Multiplayer confidence values are player-specific.

---

# 34. Game 5 — AI Error Lab

## Replaces

**Debug Workshop**

## Educational goal

Teach:

> AI can make mistakes.

and:

> Check the answer, find the problem, correct it, and try again.

---

# 35. Error Lab Structure

Every challenge uses:

```text
TASK
↓
AI ANSWER
↓
EXPECTED / VERIFIED RESULT
↓
FIND THE MISTAKE
↓
CORRECT
↓
RUN AGAIN
```

This maps directly onto existing debugging gameplay.

---

# 36. Challenge 1

Task:

```text
Move the robot to the scanner.
```

AI plan contains one incorrect Move command.

Player identifies the wrong instruction.

Fix it.

Run again.

---

# 37. Challenge 2

AI selects the wrong repeat count.

Display:

```text
Expected:
Robot reaches Station 3

AI Result:
Robot reaches Station 4
```

Player adjusts repeat count.

---

# 38. Challenge 3

Use classification.

Example:

```text
Expected:
Food → Storage

AI Rule:
Food → Workshop
```

Player finds and repairs the reversed rule.

---

# 39. Terminology

Prefer:

```text
AI mistake
```

over repeatedly using:

```text
hallucination
```

For ages 8–10, "AI mistake" is clearer.

Optional educational note:

```text
Sometimes AI produces an answer that sounds right but is wrong.
```

---

# 40. Error Lab Acceptance Criteria

* Every puzzle has exactly one intended mistake.
* Expected result is visible.
* Actual AI result is visible.
* Player can edit one faulty element.
* Player can rerun after editing.
* Two levels of hints remain available if currently supported.
* Completion awards AI Detective Badge once.

---

# 41. Game 6 — AI Tool Lab

## Replaces

**Event Factory**

## Educational goal

Teach:

> AI can use tools to help complete tasks.

Introduce a simplified agent/tool concept.

---

# 42. Tool Mapping

Convert existing event-response relationships.

Example old conceptual mapping:

```text
Bell → Open Chute
Lever → Light Lamp
```

New mapping:

```text
Scan Request → Scanner
Photo Request → Camera
Announcement → Speaker
```

---

# 43. Tool Lab Challenge 1

Request:

```text
Find out what is inside the mystery crate.
```

Available tools:

```text
Scanner
Speaker
Light
```

Correct:

```text
Scanner
```

After connection:

```text
TEST TOOL
```

Scanner runs.

Crate contents appear.

---

# 44. Tool Lab Challenge 2

Show a demonstration.

A tool executes.

Ask:

```text
Which request caused this tool to run?
```

Use the existing cause/effect identification mechanic.

---

# 45. Tool Lab Challenge 3

Two requests:

```text
Scan Object
Announce Result
```

Two tools:

```text
Scanner
Speaker
```

Player connects:

```text
Scan Object → Scanner

Announce Result → Speaker
```

Testing must demonstrate that each request activates only its intended tool.

---

# 46. Tool Lab Explanation

Pix:

```text
I don't have to do everything by myself.

AI systems can use tools to get information or perform actions.
```

---

# 47. Tool Lab Acceptance Criteria

* Existing input/output linking mechanic works.
* Wrong tool does not permanently break the challenge.
* Player can reconnect tools.
* Each input activates only its assigned output.
* Testing is visually obvious.
* Tool Master Badge is awarded once.

---

# 48. Game 7 — AI Skills Lab

## Replaces

**Tidepool Nursery**

## Educational goal

Teach:

> A useful set of actions can be grouped into a reusable skill.

Keep the existing function idea but frame it as an AI skill.

---

# 49. Define a Skill

Player builds:

```text
SKILL: GrowPlant
```

Steps:

```text
Scan Soil
Plant Seed
Add Water
Check Plant
```

If retaining original garden interactions is easier:

```text
Water
Plant
Wait
Harvest
```

is also acceptable.

The important theme change is:

```text
Function → AI Skill
```

in the player-facing presentation.

---

# 50. Skills Challenge 1

Build:

```text
GrowPlant
```

Run it once.

Show each internal action being performed.

---

# 51. Skills Challenge 2

Player executes:

```text
GrowPlant
Move
GrowPlant
```

The robot handles two stations.

---

# 52. Skills Challenge 3

Player creates:

```text
Repeat:
    GrowPlant
    Move

3 times
```

This reinforces combinations of:

* skills;
* movement;
* repetition.

---

# 53. Skills Lab Explanation

Pix:

```text
We grouped several actions into one reusable skill.

Now I can use that skill whenever I need it.
```

---

# 54. Skills Lab Acceptance Criteria

* Existing function-building system is reused.
* Skill contains multiple visible actions.
* Skill can be executed once.
* Skill can be executed multiple times.
* Skill can be combined with movement.
* Existing repeat functionality still works.
* AI Skills Badge is awarded once.

---

# 55. Game 8 — AI Agent Mission

## Replaces

**Build-a-Bot**

This becomes the main capstone.

The visual presentation should clearly communicate:

> Everything the player restored is now working together.

---

# 56. Definition Used for the Island

Use a simple explanation:

```text
An AI agent can receive a goal, make choices, use tools, and take actions to complete a task.
```

Do not overcomplicate the definition.

---

# 57. Mission Story

Pix receives:

```text
FINAL MISSION

Emergency supplies are needed at the Research Station.

Help Pix deliver the correct crate.
```

The mission should combine previously learned concepts.

---

# 58. Agent Mission — Stage 1

## Understand the instruction

Player receives:

```text
Deliver the medical crate to the Animal Research Station.
```

Available crates:

```text
Food
Medical
Mechanical
```

Player/Pix identifies:

```text
Medical
```

This recalls classification.

---

# 59. Agent Mission — Stage 2

## Navigate

Robot must move to the scanner or transport platform.

Player chooses:

```text
Move
Repeat
```

Reuse existing sequence/repetition systems.

---

# 60. Agent Mission — Stage 3

## Gather information

Pix needs to identify the destination.

Request:

```text
Check the destination marker.
```

Correct tool:

```text
Scanner
```

Tool runs.

---

# 61. Agent Mission — Stage 4

## Make a decision

Scanner finds:

```text
Bridge Route: BLOCKED

Dock Route: OPEN
```

Player chooses:

```text
Dock Route
```

This uses condition logic.

---

# 62. Agent Mission — Stage 5

## Execute reusable skill

Example:

```text
DeliverPackage
```

Skill performs:

```text
Approach Station
Open Cargo Door
Unload Package
Confirm Delivery
```

If implementing a new skill creates scope issues, reuse an existing skill/function interaction instead.

---

# 63. Agent Mission — Stage 6

## Verify

Before completion ask:

```text
Is this the correct station?

Animal Research Station
```

Player verifies.

Correct:

```text
CONFIRM DELIVERY
```

---

# 64. Final Celebration

On success:

```text
PIX AI CORE

Instructions       ONLINE
Patterns           ONLINE
Classification     ONLINE
Confidence         ONLINE
Error Checking     ONLINE
Tools              ONLINE
Skills             ONLINE

AGENT MODE          ONLINE
```

Trigger the existing academy restoration celebration.

Do not create duplicate celebration triggers.

---

# 65. Final Pix Dialogue

Suggested:

```text
We did it!

You taught me how to follow instructions,
spot patterns,
classify things,
check uncertainty,
fix mistakes,
use tools,
and combine skills.

My AI Core is fully restored!

But remember:
AI can help with a task,
and humans should still check important decisions.
```

---

# 66. Agent Mission Acceptance Criteria

* Mission is gated behind required module completion if that is already how the capstone works.
* Existing completion state is respected.
* Mission combines at least four previously introduced mechanics.
* Classification is used.
* Repetition or ordered actions are used.
* A tool is used.
* A condition/decision is used.
* Completion grants AI Agent Badge exactly once.
* Academy restoration celebration triggers exactly once per intended progression model.
* Replay remains possible without duplicate rewards.

---

# 67. Optional Area — AI Discovery Trail

## Replaces

**Coastal Fieldwork**

Keep this optional.

Do not gate main progression on these activities.

---

# 68. Discovery Station 1 — Pattern Prediction

Display:

```text
1, 2, 1, 2, 1, ?
```

Correct:

```text
2
```

Message:

```text
Patterns can help predict what may come next.
```

---

# 69. Discovery Station 2 — Classification

Display:

```text
🍌 Banana
```

Options:

```text
Food
Animal
Machine
```

Correct:

```text
Food
```

---

# 70. Discovery Station 3 — Check the AI

Scene contains:

```text
4 crates
```

Pix says:

```text
I think there are 5 crates.
```

Ask:

```text
Is Pix correct?
```

Correct:

```text
No
```

Explain:

```text
AI can make mistakes.

Check important answers.
```

---

# 71. Discovery Station 4 — Human Decision

AI suggests:

```text
Take Route A.
```

Player receives new information:

```text
Route A is temporarily closed.
```

Player chooses:

```text
Route B
```

Lesson:

```text
AI can provide useful suggestions.

People still need to use information and make decisions.
```

---

# 72. Discovery Trail Rewards

Do not create an additional badge unless explicitly desired.

Optional rewards can be:

* particles;
* short animation;
* journal entry;
* collectible;
* XP if appropriate and permitted by project requirements.

Do not interfere with primary badge progression.

---

# 73. Journal Conversion

Update the personal journal.

Suggested structure:

```text
PIX AI JOURNAL

AI Core
7 / 8 Modules Restored

Prompt Lab
✓ Clear Instructions

Pattern Scanner
✓ Patterns

AI Classifier
✓ Classification

Confidence Core
✓ Confidence

AI Error Lab
✓ Checking Mistakes

AI Tool Lab
✓ Tools

AI Skills Lab
✓ Skills

AI Agent Mission
LOCKED
```

After unlocking:

```text
AI Agent Mission
READY
```

---

# 74. Learning Summaries

Each completed zone should add one short summary.

## Prompt Lab

```text
Clear instructions help AI understand what you want.
```

## Pattern Scanner

```text
AI can use patterns in examples to help make predictions.
```

## AI Classifier

```text
Classification means sorting things into categories.
```

## Confidence Core

```text
AI can be more or less confident about an answer.
```

## AI Error Lab

```text
AI can make mistakes, so important answers should be checked.
```

## AI Tool Lab

```text
AI systems can use tools to get information or perform actions.
```

## AI Skills Lab

```text
A reusable skill combines several actions into one useful ability.
```

## AI Agent Mission

```text
AI agents can combine instructions, decisions, tools, and actions to complete a goal.
```

---

# 75. Hint System

Keep two hint levels wherever the current implementation supports them.

## Hint level 1

Should encourage reasoning.

Example:

```text
Think about what the robot must do before it can scan the cube.
```

## Hint level 2

May be more explicit.

Example:

```text
The robot needs to walk to the scanner before using Scan.
```

Avoid immediately giving the full answer in Hint 1.

---

# 76. Global UI Language

Keep language short.

Prefer:

```text
AI Answer
Try Again
Check Result
Use Tool
Run Skill
AI Confidence
Find the Mistake
Prediction
Category
Instruction
Pattern
```

Avoid:

```text
Execute inference
Invoke language model
Context-window optimization
Probabilistic model output
Autonomous orchestration
```

---

# 77. Visual Direction

The AI theme should remain compatible with the bright coastal setting.

Do **not** automatically convert the academy into a dark cyberpunk environment.

Recommended visual language:

* bright white technology;
* blue/cyan holograms;
* colorful data cubes;
* clean research stations;
* friendly robots;
* scanners;
* holographic arrows;
* floating symbols;
* animated light paths;
* transparent displays;
* glowing AI Core.

Existing nature/coastal elements can remain.

The contrast between:

```text
Nature + Friendly Technology
```

can become part of the island's identity.

---

# 78. AI Core Visual Feedback

Every completed module should send visible energy/data toward the central AI Core.

Possible implementation:

```text
Zone Completion
↓
Play zone success VFX
↓
Activate energy beam
↓
Update hub module
↓
Update journal
↓
Play Pix response
```

This creates a clear connection between each game and the main story.

---

# 79. Audio Direction

Reuse existing audio where suitable.

Add distinctive sounds for:

* AI scan;
* correct classification;
* confidence increase;
* error detected;
* tool connected;
* skill activated;
* AI module restored;
* AI Core completion.

Avoid excessive notification sounds.

Each important action should have a recognizable but short response.

---

# 80. Player Feedback Rules

Every interaction should answer three questions:

```text
1. What did I do?
2. What happened?
3. Why?
```

Example:

```text
PLAYER:
Animal → Vehicle

RESULT:
Wrong route

EXPLANATION:
A dog belongs in the Animal category.

NEXT:
Try again.
```

Do not simply display:

```text
Incorrect
```

without useful feedback.

---

# 81. Failure Design

Preserve the existing safe-learning philosophy.

Never:

* eliminate player for a wrong answer;
* permanently lock a challenge;
* remove rewards because of mistakes;
* require restarting the whole zone;
* use long cooldowns after mistakes.

Instead:

```text
Attempt
↓
Visible outcome
↓
Short explanation
↓
Reset current puzzle
↓
Retry
```

---

# 82. Multiplayer Requirements

The existing design supports multiple players with independent progress.

During the migration, explicitly test all converted games with multiple players.

For every game verify:

```text
Player A state != Player B state
```

where appropriate.

Examples:

* Player A selecting a classification must not change Player B's answer.
* Player A's confidence value must not overwrite Player B's.
* Player A completing a game must not incorrectly award Player B.
* Shared world VFX must not incorrectly mark personal progression as completed.
* Replay reward protection must remain player-specific.

---

# 83. Shared vs Personal State

Use this model:

## Personal

* answers;
* active puzzle;
* hints;
* current sequence;
* confidence value;
* completion status;
* badge ownership;
* journal progress.

## Shared where appropriate

* decorative environment;
* ambient VFX;
* academy-wide cosmetic celebration;
* NPC idle behavior.

If a shared environmental animation depends on a personal completion event, ensure it cannot corrupt player progress.

---

# 84. Migration Safety Rules for Implementation Agent

The implementation agent must follow these rules.

## Rule 1

Do not rewrite working gameplay logic purely to obtain cleaner naming.

## Rule 2

Prefer changing presentation before changing implementation.

Example:

```text
Internal variable:
Energy

Player display:
AI Confidence
```

is acceptable initially.

## Rule 3

Do not create parallel progress systems if existing progression can be reused.

## Rule 4

Do not duplicate reward logic.

## Rule 5

Do not remove safe retry behavior.

## Rule 6

Do not make optional content mandatory.

## Rule 7

Do not add combat.

## Rule 8

Do not introduce timers unless they are purely cosmetic.

## Rule 9

Do not expose unnecessary advanced AI terminology.

## Rule 10

Keep every migration step independently testable.

---

# 85. Recommended Implementation Order Per Zone

Use the following workflow for each game.

## Step A — Rename presentation

Update:

* zone sign;
* HUD title;
* journal name;
* dialogue;
* completion text.

## Step B — Replace visual assets

Update:

* relevant props;
* symbols;
* displays;
* VFX.

Do not touch gameplay logic yet.

## Step C — Map old mechanic to AI concept

Document:

```text
Old input → New meaning
Old state → New meaning
Old success → New success
```

## Step D — Update player-facing values

Example:

```text
energy 3
→
confidence 60%
```

## Step E — Update explanation text

Explain the AI concept.

## Step F — Verify gameplay

Test:

```text
start
correct attempt
wrong attempt
retry
hint
completion
replay
```

## Step G — Verify multiplayer

Test at least two concurrent players.

## Step H — Mark zone migrated

Only then proceed to the next zone.

---

# 86. Suggested Implementation Milestones

## Milestone 1 — Theme Shell

Complete:

* AI Island Academy naming;
* new player description;
* Pix AI Core story;
* hub labels;
* destination labels;
* badge names;
* journal labels.

Gameplay may still internally use old mechanics.

### Done when

The island can be played from beginning to end and all major player-facing references use the new AI theme.

---

# 87. Milestone 2 — Core AI Games

Complete:

* Prompt Lab;
* Pattern Scanner;
* AI Classifier;
* Confidence Core.

### Done when

Players can understand the progression:

```text
instructions
→ patterns
→ classification
→ confidence
```

---

# 88. Milestone 3 — Applied AI Games

Complete:

* AI Error Lab;
* AI Tool Lab;
* AI Skills Lab.

### Done when

Players understand:

```text
AI can make mistakes
AI can use tools
AI can reuse skills
```

---

# 89. Milestone 4 — Agent Capstone

Complete:

* AI Agent Mission;
* AI Core completion;
* final celebration.

### Done when

The final mission visibly combines mechanics from earlier zones.

---

# 90. Milestone 5 — Optional Content

Complete:

* AI Discovery Trail;
* additional explanations;
* optional AI mistake examples.

---

# 91. Milestone 6 — Polish

Complete:

* VFX;
* audio;
* signage;
* navigation;
* dialogue timing;
* journal;
* badge presentation;
* hints;
* tutorial clarity.

---

# 92. Testing Matrix

For every mandatory game test:

| Test                    | Expected                   |
| ----------------------- | -------------------------- |
| Enter zone              | Game initializes correctly |
| Correct answer          | Success feedback           |
| Wrong answer            | Safe retry                 |
| Multiple wrong attempts | No broken state            |
| Hint 1                  | General guidance           |
| Hint 2                  | More direct guidance       |
| Complete                | Progress saved             |
| Reward                  | Awarded once               |
| Replay                  | No duplicate reward        |
| Leave mid-game          | No corrupted state         |
| Re-enter                | Valid state restored/reset |
| Player A + B            | Independent progress       |
| Player A completes      | Player B unaffected        |

---

# 93. AI Content Accuracy Rules

The game should teach simplified AI concepts without making obviously false claims.

## Safe simplifications

Good:

```text
AI can recognize patterns.
```

Good:

```text
AI can classify things into categories.
```

Good:

```text
AI can make mistakes.
```

Good:

```text
Some AI systems can use tools.
```

Good:

```text
Clear instructions can help AI produce more useful results.
```

Avoid absolute claims:

```text
AI understands exactly like a human.
```

Avoid:

```text
AI always learns while you talk to it.
```

Avoid:

```text
AI confidence proves the answer is correct.
```

Avoid:

```text
AI knows everything.
```

---

# 94. Definition of Done — Individual Zone

A converted zone is complete only when all apply:

```text
[ ] New AI-themed name
[ ] New narrative
[ ] New UI terminology
[ ] Appropriate visual theme
[ ] Original core mechanic preserved or intentionally adapted
[ ] AI concept clearly explained
[ ] Correct attempt tested
[ ] Incorrect attempt tested
[ ] Retry tested
[ ] Hint behavior tested
[ ] Completion tested
[ ] Badge tested
[ ] Replay tested
[ ] Multiplayer tested
[ ] No obsolete player-facing terminology remains
```

---

# 95. Definition of Done — Entire Island

The AI theme migration is complete when:

```text
[ ] Island introduction explains Pix's damaged AI Core
[ ] Hub shows AI module progression
[ ] Prompt Lab works
[ ] Pattern Scanner works
[ ] AI Classifier works
[ ] Confidence Core works
[ ] AI Error Lab works
[ ] AI Tool Lab works
[ ] AI Skills Lab works
[ ] AI Agent Mission works
[ ] AI Discovery Trail works or is intentionally deferred
[ ] Journal uses AI terminology
[ ] Badges use AI terminology
[ ] Pix dialogue uses new story
[ ] Zone signage uses new names
[ ] AI Core reacts to completion
[ ] Final celebration works
[ ] Rewards cannot be duplicated
[ ] Wrong answers remain non-punitive
[ ] Solo play works
[ ] Multiplayer progress is independent
[ ] No combat has been introduced
[ ] No mandatory timer has been introduced
[ ] Memory/performance validation passes
[ ] Full end-to-end playthrough passes
```

---

# 96. Implementation Priority

If development time is limited, implement in this order:

### P0 — Required

1. Prompt Lab
2. AI Classifier
3. AI Error Lab
4. AI Tool Lab
5. AI Agent Mission
6. Hub AI Core
7. Journal/reward renaming

These changes create the strongest AI identity.

### P1 — Important

8. Pattern Scanner
9. Confidence Core
10. AI Skills Lab
11. AI Core VFX
12. Improved dialogue

### P2 — Polish

13. AI Discovery Trail
14. Optional AI mistake examples
15. Additional animations
16. Additional environmental storytelling

---

# 97. Agent Execution Rule

The implementation agent should work in small verified increments.

Use:

```text
Inspect
↓
Modify one system
↓
Build / compile
↓
Test
↓
Fix regressions
↓
Proceed
```

Do **not**:

```text
Modify all zones
↓
Attempt to compile
↓
Debug dozens of unrelated regressions
```

After each game migration, the project should remain playable.

---

# 98. Recommended First Implementation Task

Start with **Prompt Lab** because it requires minimal gameplay changes and establishes the new design language.

Implementation sequence:

```text
1. Locate Path Garden implementation.
2. Identify all player-visible Path Garden strings.
3. Rename visible zone to Prompt Lab.
4. Keep underlying sequence system.
5. Replace commands with AI instruction commands.
6. Update Pix dialogue.
7. Update success/failure text.
8. Rename visible badge to Prompt Badge.
9. Update journal.
10. Test correct sequence.
11. Test incorrect sequence.
12. Test retry.
13. Test reward.
14. Test replay.
15. Test with two players.
16. Commit/mark Prompt Lab migration complete.
```

Then use exactly the same process for:

```text
Pattern Scanner
AI Classifier
Confidence Core
AI Error Lab
AI Tool Lab
AI Skills Lab
AI Agent Mission
```

---

# 99. Final Desired Player Experience

By the end of the island, a player should be able to explain the following in simple words:

```text
AI works better with clear instructions.

AI can recognize patterns.

AI can classify things.

AI isn't always certain.

AI can make mistakes.

AI can use tools.

AI can reuse useful skills.

AI agents can combine these abilities to complete a goal.

People should still check important AI answers and make important decisions.
```

That is the educational arc the implementation should optimize for.
