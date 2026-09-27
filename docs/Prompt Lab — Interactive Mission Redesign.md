# Prompt Lab — Interactive Mission Redesign

## 1. Design Goal

Replace the current sequence-ordering minigame with a short, physical Fortnite adventure.

The player should:

* run;
* jump;
* grind;
* collect or carry objects;
* activate large physical controls;
* watch Pix react in the world;
* fix a funny but understandable mistake;
* receive immediate visual feedback.

The player should **not** spend most of the mission:

* reading text panels;
* arranging text cards;
* selecting abstract commands from menus;
* guessing an arbitrary command order.

The mission teaches one simple AI idea:

> **AI works better when you clearly describe what you want.**

The gameplay should demonstrate this through the world instead of explaining it first.

---

# 2. New Mission Name

# Prompt Lab: Data Core Rescue

Pix needs to repair one part of the AI Core.

A damaged data core has been ejected into the Prompt Lab.

Pix can retrieve it, but Pix needs the player to tell it **exactly which object to get and where to take it**.

The player physically gathers the missing information and builds a clear instruction.

---

# 3. Core Gameplay Loop

Use the following loop:

```text
See mission
    ↓
Explore environment
    ↓
Discover important information
    ↓
Choose instruction details
    ↓
SEND PROMPT
    ↓
Watch Pix execute it
    ↓
See immediate result
    ↓
Fix instruction if necessary
    ↓
Big physical success moment
```

The important difference from the original game is:

```text
OLD

Read commands
→ arrange commands
→ press Run
```

becomes:

```text
NEW

Explore
→ discover
→ physically choose
→ watch Pix act
→ react to result
```

---

# 4. Environment

Build Prompt Lab as a colorful AI training playground rather than a classroom.

Suggested layout:

```text
               [AI CORE REACTOR]
                       ▲
                       |
                 PIX DELIVERY
                       |
                 [Prompt Gate]
                       |
          ┌────────────┴────────────┐
          |                         |
   [Data Core Yard]           [Destination Area]
          |                         |
       Grind Rail               Jump / Boost
          |                         |
          └───────── PLAYER ────────┘
```

The room should have verticality.

Avoid putting every interaction on one flat floor.

Use:

* raised platforms;
* ramps;
* Grind Rails;
* bounce/boost sections;
* glowing pipes;
* moving machinery;
* rotating holograms;
* animated doors;
* large data cores;
* obvious destination icons.

The environment itself should look playable before the player reads anything.

---

# 5. Main Props

Create three large **Data Cores**.

Example:

* Blue Core
* Red Core
* Green Core

They should be visually very different.

Do not rely only on written labels.

Use:

```text
BLUE CORE
🔷 blue / electricity symbol

RED CORE
🔥 red / heat symbol

GREEN CORE
🌿 green / nature symbol
```

Each core should be large enough to immediately attract attention.

If appropriate for the project, implement them using a **Carryable Spawner** so players can pick up, carry, drop, or throw a physical object.

However, the player carrying the object should be used for exploration and secondary interactions.

Pix should remain responsible for executing the final AI instruction.

---

# 6. Pix Representation

Pix should have a visible physical presence in the room.

Preferred:

* small floating robot;
* drone;
* friendly bot;
* holographic robot.

Pix should:

* turn toward relevant objects;
* move when executing instructions;
* produce question/error VFX;
* celebrate success.

### Stable implementation option

Use:

* animated prop;
* Prop Mover;
* Cinematic Sequence;

instead of requiring complex NPC navigation.

### Advanced option

Use an NPC Spawner/custom behavior if the project already uses NPC systems reliably.

Do not make the Prompt Lab dependent on experimental NPC behavior if a simple animated robot can produce the same player experience.

---

# 7. Mission Intro — Keep It Under 10 Seconds

Player enters the Prompt Lab.

Alarm / lights activate.

A Data Core launches out of the central machine.

Three cores become visible.

Pix appears.

Pix:

> Uh-oh! My Prompt Module is broken!

Then:

> Tell me which core I need.

HUD objective:

```text
HELP PIX FIND THE RIGHT DATA CORE
```

Show a hologram of the required target:

```text
TARGET

🔷 BLUE CORE
```

Do not explain what a prompt is yet.

Let the player start playing.

---

# 8. Stage 1 — Find the Target

## Goal

Player must discover which core Pix needs.

Make this a traversal activity instead of a menu.

The target clue appears on an elevated scanner platform.

To reach it, the player:

1. runs toward the platform;
2. hits a speed boost;
3. jumps onto a Grind Rail;
4. grinds across part of the room;
5. lands at the scanner.

Scanner reveals:

```text
TARGET IDENTIFIED

🔷 BLUE DATA CORE
```

A beam briefly highlights the three Data Cores in the distance.

Pix:

> Got it! BLUE.

---

# 9. Why This Stage Exists

This replaces something like:

```text
Select:
BLUE
RED
GREEN
```

with a physical Fortnite activity.

The educational concept remains simple:

```text
"core"
```

is vague.

```text
"blue core"
```

is more specific.

But the player discovers this through gameplay rather than reading a lesson.

---

# 10. Stage 2 — Tell Pix Which Core

Player returns toward the central Prompt Console.

Do not use a conventional text menu.

Build three large physical selectors around the console:

```text
[ 🔷 BLUE ]

[ 🔥 RED ]

[ 🌿 GREEN ]
```

These can be:

* holographic pads;
* giant buttons;
* floor zones;
* interactive props.

Player activates:

```text
🔷 BLUE
```

The central hologram updates:

```text
YOUR PROMPT

GET
🔷 BLUE CORE
```

Each selected component should physically fly into the holographic prompt.

Example:

```text
BLUE
   \
    → [GET] [BLUE CORE]
```

Use particles, sound and animation.

Building the prompt should feel like powering a machine.

---

# 11. Stage 3 — Where Should It Go?

Now Pix asks:

> Where should I bring it?

There are three visually distinct locations in the room:

```text
⚡ POWER REACTOR

🔬 RESEARCH SCANNER

📦 STORAGE BAY
```

The correct destination is:

```text
⚡ POWER REACTOR
```

But the answer should not simply appear in the HUD.

The player has to find the destination clue.

---

# 12. Destination Challenge

Put the clue on another section of the room.

Possible traversal:

```text
Prompt Console
      ↓
Moving platform
      ↓
Jump pad
      ↓
Upper walkway
      ↓
Destination Scanner
```

At the scanner:

```text
CORE NEEDED AT:

⚡ POWER REACTOR
```

Activate a large animated energy beam pointing toward the reactor for 1–2 seconds.

The player now knows the destination.

---

# 13. Select Destination

Return or take a shortcut back to the Prompt Console.

The player activates:

```text
⚡ POWER REACTOR
```

Prompt hologram becomes:

```text
GET

🔷 BLUE CORE

AND TAKE IT TO

⚡ POWER REACTOR
```

Then reveal a large button:

# SEND TO PIX

The button should feel important.

Do not use a small standard interact button if possible.

Use:

* giant physical button;
* lever;
* holographic hand scanner;
* energy switch.

---

# 14. First AI Execution

Player activates:

```text
SEND TO PIX
```

Lock prompt controls temporarily.

Lights dim slightly.

Prompt travels toward Pix as a visible energy/data effect.

Example:

```text
[PLAYER PROMPT]
       ↓
  DATA STREAM
       ↓
     [PIX]
```

Pix:

> Prompt received!

Pix goes to:

```text
BLUE CORE
```

Pix then carries/pushes/transports it toward:

```text
POWER REACTOR
```

The player should be free to follow Pix.

Do **not** lock the player into a long cinematic.

The execution should happen in the playable world.

---

# 15. Make Execution Fun to Watch

Pix's execution should create physical spectacle.

Example sequence:

1. Pix activates.
2. Lab lights turn on sequentially.
3. A door opens.
4. Conveyor begins moving.
5. Pix grabs/activates the Blue Core.
6. Energy travels through pipes.
7. Core moves through the room.
8. Reactor accepts it.
9. Huge energy pulse activates.

Use Prop Movers/Cinematic sequences where appropriate.

The entire sequence should take approximately several seconds, not a long cutscene.

---

# 16. Success Moment

When the Blue Core enters the Power Reactor:

```text
BOOM / POWER PULSE
```

Not a damaging explosion.

Use:

* strong VFX;
* light pulse;
* particle burst;
* machinery activating;
* satisfying audio;
* Pix celebration animation.

HUD:

```text
PROMPT SUCCESS!
```

Then:

```text
PIX PROMPT MODULE

ONLINE
```

The corresponding AI Core module lights up.

---

# 17. Teach After the Player Succeeds

Only now explain the idea.

Pix:

> Nice! You told me WHAT to get and WHERE to take it.

Then display:

```text
A CLEAR PROMPT TELLS AI
WHAT YOU WANT.
```

Do not pause gameplay for a long explanation.

---

# 18. Challenge 2 — The Vague Prompt

The first challenge teaches the basic mechanic.

The second challenge demonstrates why detail matters.

This should be short.

A new situation appears.

Three objects:

```text
🔷 Small Blue Core

🔷 Large Blue Core

🔴 Red Core
```

Mission target:

```text
LARGE BLUE CORE
```

Initial prompt automatically contains:

```text
GET THE BLUE CORE
```

Pix looks at both blue cores.

Question marks appear.

Pix:

> Umm... which blue core?

This is important.

Pix should **not randomly choose the wrong object** just to manufacture a failure.

The problem must be understandable.

There are genuinely two valid interpretations.

---

# 19. Player Adds Missing Detail

Two large modifiers appear:

```text
SMALL

LARGE
```

Player jumps onto / activates:

```text
LARGE
```

Prompt physically upgrades:

```text
GET THE

LARGE

BLUE CORE
```

Pix:

> Much clearer!

Player presses:

```text
SEND
```

Pix selects the correct core.

---

# 20. What Challenge 2 Teaches

Without giving a lecture:

```text
GET THE BLUE CORE
```

can be unclear.

But:

```text
GET THE LARGE BLUE CORE
```

is clearer.

Completion message:

```text
MORE USEFUL DETAILS
CAN MAKE A PROMPT CLEARER.
```

---

# 21. Challenge 3 — Prompt Rescue

The final challenge should feel like a mini-adventure rather than another quiz.

## Scenario

A lab door is closing because the AI Core is losing power.

Pix needs one final Energy Cell.

Player has to quickly explore the environment.

Do not use a punitive timer.

The environment may look urgent, but players can take as long as necessary.

---

# 22. Prompt Rescue Layout

Player must discover three pieces of information:

```text
WHAT?

🔋 ENERGY CELL


WHICH ONE?

🟢 GREEN


WHERE?

🚪 DOOR GENERATOR
```

Place these pieces in three different physical locations.

Example:

```text
GREEN
→ obtained by riding a Grind Rail

ENERGY CELL
→ revealed by activating a scanner

DOOR GENERATOR
→ revealed after carrying a Data Cube into a socket
```

The player is moving through the environment rather than filling out a form.

---

# 23. Data Cube Interaction

Introduce one physical Carryable object.

Player picks up a Data Cube.

They must carry it through a short traversal section.

Possible route:

```text
Pick up cube
↓
walk across moving platform
↓
jump down
↓
throw / place cube into scanner receiver
```

When inserted:

```text
DESTINATION FOUND

🚪 DOOR GENERATOR
```

This creates a tactile Fortnite interaction unrelated to clicking UI.

---

# 24. Build Final Prompt

The player returns to the central console.

Previously discovered information is available as large holographic components.

Player activates:

```text
🟢 GREEN

🔋 ENERGY CELL

🚪 DOOR GENERATOR
```

Prompt:

```text
BRING THE

🟢 GREEN ENERGY CELL

TO THE

🚪 DOOR GENERATOR
```

Large:

# SEND TO PIX

---

# 25. Final Execution

Pix executes the prompt.

Sequence:

```text
Pix starts
↓
locates Green Energy Cell
↓
moves toward it
↓
retrieves it
↓
moves through lab
↓
inserts it into Door Generator
↓
generator activates
↓
giant lab door opens
```

Opening the giant door is the mission reward.

Behind the door is:

```text
PROMPT MODULE
```

The player enters.

Module connects to Pix's AI Core.

---

# 26. Optional Fortnite-Style Finale

After the door opens, give the player a short fun traversal back to the exit.

Example:

```text
AI Core powers Grind Rail
↓
new Grind Rail activates
↓
player jumps on
↓
rides through activated laboratory
↓
lands near Academy Hub
```

This makes completion itself enjoyable.

The exit should not simply be:

```text
Press button
→ teleport to hub
```

---

# 27. Recommended Devices / Systems

## Carryable Spawner

Use for:

* Data Cubes;
* Energy Cells;
* physical information objects.

Recommended configuration:

```text
Character Damage: 0
Environment Damage: 0
Explosion Damage: 0
```

The object is a puzzle prop, not a weapon.

---

## Grind Rail

Use for:

* reaching clue locations;
* shortcuts;
* finale traversal.

Do not require difficult precision grinding.

The target audience is 7–10.

The rail should make movement easier and more exciting rather than become a skill gate.

---

## Movement Modulator

Use as:

* boost pad;
* jump/launch moment;
* shortcut.

Again:

```text
FUN TRAVERSAL
```

not:

```text
DIFFICULT PARKOUR
```

---

## Prop Mover

Use for:

* Pix movement if Pix is prop-based;
* moving platforms;
* lab machinery;
* data cores;
* opening mechanical systems.

---

## VFX Creator

Use for:

* prompt data flying into Pix;
* scanner beams;
* question marks / confusion;
* module restoration;
* reactor activation.

---

## Cinematic Sequence

Use only for short environmental moments:

* machine booting;
* giant door opening;
* AI Core activating.

Avoid taking control away from the player for extended sequences.

---

# 28. Interaction Rule

For this age group, use this ratio as a design target:

```text
70% DOING

20% WATCHING SOMETHING COOL HAPPEN

10% READING
```

Not:

```text
60% READING
30% BUTTON SELECTION
10% WORLD INTERACTION
```

---

# 29. Text Rule

Most instructions should contain no more than one short sentence at a time.

Bad:

```text
Pix requires additional information in order to determine
which object should be transported to the appropriate destination.
```

Good:

```text
Which core should Pix get?
```

Better when the world communicates the same thing:

```text
PIX:

🔷 ?   🔷 ?
```

---

# 30. Icon-First Design

Every prompt component should have:

```text
ICON
+
COLOR / SHAPE
+
SHORT LABEL
```

Example:

```text
⚡
POWER REACTOR
```

Do not rely exclusively on color because players may have difficulty distinguishing colors.

Use both shape/icon and color.

---

# 31. Wrong Answer Design

Wrong choices should produce funny physical consequences but remain logical.

Example:

Player builds:

```text
RED CORE
→ POWER REACTOR
```

but target was Blue Core.

Pix executes exactly what the player asked.

The Power Reactor scans it.

```text
BEEP BEEP

WRONG CORE
```

Reactor rejects the Red Core.

A harmless spring/ejection effect sends it back.

Pix:

> That's the RED core. Let's change the prompt!

Prompt Console highlights only:

```text
RED
```

Player replaces it with:

```text
BLUE
```

Do not reset the entire puzzle.

---

# 32. Better Error Philosophy

Use:

```text
ACTION
↓
VISIBLE CONSEQUENCE
↓
UNDERSTANDABLE PROBLEM
↓
CHANGE ONE THING
↓
TRY AGAIN
```

Never:

```text
ACTION
↓
"WRONG"
↓
EVERYTHING RESET
```

---

# 33. Reward

Replace the old reward presentation with:

# PROMPT CORE

or:

# PROMPT BADGE

Completion sequence:

```text
MODULE RESTORED

PROMPTING
ONLINE
```

Pix gains a visible upgrade.

Example:

* new holographic ring;
* glowing antenna;
* floating prompt icon;
* brighter eyes.

This gives children a reason to want to restore the next module.

---

# 34. Mission Duration

Target approximately:

```text
Stage 1:
1–2 minutes

Stage 2:
1 minute

Stage 3:
2–3 minutes

Total:
roughly 4–6 minutes
```

Do not artificially extend it.

The mission should end while the interaction is still enjoyable.

---

# 35. Difficulty

The challenge comes from:

* exploration;
* observation;
* choosing relevant information.

Not from:

* reading ability;
* complicated logic;
* precise parkour;
* memorizing sequences.

A seven-year-old should be capable of understanding the basic objective from the environment.

A ten-year-old should still enjoy the movement and spectacle.

---

# 36. Multiplayer

For up to four players, allow players to explore simultaneously.

Possible natural cooperation:

```text
Player A → finds object clue

Player B → finds destination clue

Player C → brings Data Cube

Player D → activates Prompt Console
```

Do not require explicit assigned roles.

Any player should be able to do any interaction.

Important discoveries can update the team's active Prompt Lab mission while personal badge/progression rewards remain handled according to the island's existing progression architecture.

---

# 37. Implementation Priority

## P0 — Core Gameplay

Implement first:

```text
[ ] Redesigned Prompt Lab environment
[ ] Three Data Cores
[ ] Prompt Console
[ ] Object selection
[ ] Destination selection
[ ] SEND interaction
[ ] Pix execution
[ ] Success/failure response
[ ] Prompt Module reward
```

---

## P1 — Fortnite Feel

Then add:

```text
[ ] Grind Rail traversal
[ ] Movement boost
[ ] Carryable Data Cube
[ ] Moving platform
[ ] Reactor animation
[ ] VFX
[ ] Audio
```

---

## P2 — Polish

Finally:

```text
[ ] Pix character animation
[ ] Prompt pieces flying into hologram
[ ] Funny incorrect-result animations
[ ] Activated exit Grind Rail
[ ] Environmental animations
[ ] Additional Pix reactions
```

---

# 38. Minimum Viable Redesign

If scope needs to remain small, implement only one complete scenario:

```text
TARGET:
Blue Energy Core

DESTINATION:
Power Reactor
```

Player:

```text
rides Grind Rail
→ scans target
→ selects BLUE CORE
→ discovers POWER REACTOR
→ selects destination
→ presses SEND
→ follows Pix
→ watches reactor activate
```

Even this single scenario will feel substantially more like a Fortnite mission than the current sequence puzzle.

Do **not** reintroduce text ordering simply because it is easier to implement.

---

# 39. Acceptance Criteria

Prompt Lab is ready when:

```text
[ ] Player performs meaningful movement within first 15 seconds
[ ] Player uses at least two distinctly Fortnite-style physical interactions
[ ] Main puzzle can be understood without reading a paragraph
[ ] Prompt consists of visible meaningful details rather than code-like steps
[ ] Player discovers information through the environment
[ ] Pix visibly executes the player's instruction
[ ] Correct instruction produces a large world reaction
[ ] Incorrect instruction produces an understandable physical consequence
[ ] Wrong answer does not reset the entire mission
[ ] Player can immediately fix one detail and retry
[ ] There is no combat requirement
[ ] There is no punitive timer
[ ] Traversal does not require advanced Fortnite movement skill
[ ] Prompt Module is visibly restored
[ ] Mission works solo
[ ] Multiplayer state is validated
[ ] Replay does not duplicate rewards
```

---

# 40. Intended Feeling

The player should leave Prompt Lab remembering:

> "I rode around a crazy AI laboratory, found the right information, told Pix what to do, and then the robot actually did it."

They should **not** remember:

> "I put four words in the right order."

That should be the design standard for the other AI Academy minigames as well.
