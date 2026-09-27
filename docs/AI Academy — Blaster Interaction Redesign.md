# AI Academy — Blaster Interaction Redesign

## 1. New Core Gameplay Rule

Replace most precision-button interactions with a universal mechanic:

```text
SEE
↓
AIM
↓
SHOOT
↓
WORLD REACTS
↓
GET FEEDBACK
↓
LEARN
↓
NEXT TARGET
```

The player's weapon is not presented as a combat weapon.

It is the:

# AI BLASTER

or:

# DATA BLASTER

Story explanation:

> The Data Blaster sends instructions and data to Pix's AI systems.

Shooting something means:

* select it;
* send it;
* classify it;
* activate it;
* identify it;
* fix it.

This makes one interaction language work throughout the entire island.

---

# 2. Important Change From Current Design

The original island explicitly avoided weapons and elimination.

Keep the important part:

* no PvP;
* no enemy combat;
* no player elimination;
* no punishment for wrong answers.

But allow a weapon as the primary **interaction tool**.

The player is effectively shooting holograms, robots, symbols, data cores and targets rather than fighting characters.

---

# 3. Give Every Player One Permanent Blaster

Every player should receive the same weapon automatically.

Recommended characteristics:

* bright / cartoon / sci-fi appearance;
* low recoil;
* reasonably fast projectile or hitscan;
* no scope required;
* large readable crosshair;
* no explosive self-damage;
* no environmental destruction;
* infinite ammunition;
* preferably no meaningful reload interruption.

Do **not** make players search for ammunition.

Do **not** make weapon management part of the educational gameplay.

---

# 4. Weapon Selection

Preferred visual style:

### First preference

A paint / energy / cartoon-style blaster already available in the project's current Fortnite content.

### Second preference

A simple pulse/laser-style weapon with:

* good accuracy;
* little recoil;
* fast response.

Avoid:

* sniper rifles;
* shotguns;
* weapons with strong recoil;
* complicated charge mechanics;
* weapons with huge explosions.

Do not depend on the Kymera Ray Gun for a new implementation because Epic currently marks that weapon as deprecated.

---

# 5. Player Protection

The player should not have to care about health.

Recommended:

```text
Invincibility = ON
Infinite Reserve Ammo = ON
Infinite Magazine Ammo = ON
Instant Reload = ON
```

If full invincibility produces undesirable behavior, fallback:

```text
Health = high
Shield = 100%
Shield Recharge = ON
Shield Recharge Delay = very short
Shield Recharge Amount = high
```

But full invincibility is preferable.

The purpose of the weapon is interaction.

There should be no scenario where a seven-year-old fails the AI lesson because they died.

---

# 6. Remove Weapon Damage From The World

Where possible:

```text
Environment Damage = OFF
Player Damage = irrelevant / blocked
Friendly Fire = OFF
```

The blaster should activate intentional targets only.

Players should not accidentally destroy the laboratory.

---

# 7. Replace Buttons

Current:

```text
Walk to button

precisely position camera

find interaction focus

press interact
```

New:

```text
See giant target

point approximately at it

shoot

BOOM — immediate reaction
```

Regular gameplay buttons should disappear from the main minigames.

Buttons are allowed for:

* settings;
* accessibility;
* restart;
* leaving a mission;
* optional hints.

They should not be the primary puzzle interaction.

---

# 8. Target Size

Do not require accurate Fortnite shooting.

This isn't an aim trainer.

Use large targets.

Recommended apparent target size from normal engagement distance:

```text
minimum:
~1 meter

preferred:
1.5–2.5 meter visual target
```

Use normal hit detection.

Do **not** require bullseyes.

Conceptually:

```text
HIT TARGET
```

not:

```text
HIT 10-CM CENTER
```

---

# 9. Universal Active-Target Visual Language

Every currently shootable target should look obviously shootable.

Create one reusable effect:

# AI TARGET BEACON

Composition:

```text
        ▲
        │
   red/orange light
        │
      \ | /
       \|/
     [TARGET]
    (( GLOW ))
```

Use all three visual signals:

### 1. Back cone

A translucent glowing cone behind the target.

Suggested:

```text
color:
red/orange

movement:
slow pulse

opacity:
medium
```

The cone should be visible even when the player is not looking directly at the target.

### 2. Target ring

Animated circular ring around the target.

```text
○
◎
◉
```

Pulse slowly.

### 3. Floating particles

Small particles travel toward the target.

This visually communicates:

> SHOOT THIS.

---

# 10. Implementing The Beacon

For an exact cone shape, use a simple emissive cone/beam mesh behind the target.

Add VFX Creator particles around it for:

* pulses;
* sparks;
* floating data;
* activation.

Do not try to make the whole target unreadably bright.

The target itself still needs to be recognizable.

---

# 11. Beacon States

Standardize four states.

## INACTIVE

```text
No cone
No ring
Very low glow
```

Cannot progress mission.

---

## ACTIVE

```text
Red/orange cone
Pulsing ring
Particles
```

Player should shoot it.

---

## HIT

For ~0.3–0.5 sec:

```text
bright flash
+
particle burst
+
hit sound
```

---

## COMPLETE

```text
green/cyan burst
target powers down
data flies toward Pix
```

This must be consistent throughout the island.

Children quickly learn:

> Red glow = shoot it.

---

# 12. Hit Feedback

Every successful shot needs feedback within approximately one frame / immediately perceptible time.

Use several channels simultaneously.

Example:

```text
SHOT
 ↓
TARGET FLASH
 ↓
PING!
 ↓
+ DATA
 ↓
particles fly away
 ↓
Pix reacts
```

A hit should never feel like:

```text
shoot

...

did anything happen?
```

---

# 13. Bonus Feedback

Every meaningful hit can create a small reward.

Examples:

```text
+1 DATA
```

```text
CLUE FOUND!
```

```text
GOOD DETAIL!
```

```text
PATTERN FOUND!
```

```text
CORRECT CATEGORY!
```

```text
ERROR FIXED!
```

```text
TOOL CONNECTED!
```

Avoid presenting everything as generic:

```text
+10 POINTS
```

The reward should reinforce what the player learned.

---

# 14. Data Orb Effect

Create a reusable reward effect.

When player hits a correct target:

```text
TARGET
  ↓
burst
  ↓
3–8 glowing Data Orbs appear
  ↓
orbs fly toward player/Pix/AI Core
  ↓
HUD meter increases
```

Example HUD:

```text
AI DATA

■■■■□□

4 / 6
```

This gives every correct answer a collectible feeling even though the reward is automatic.

---

# 15. Wrong Target Feedback

Wrong answers should still be entertaining.

Player shoots wrong target:

```text
BOINK
```

Target:

* shakes;
* turns grey briefly;
* emits funny sparks;
* shows red X.

Pix:

> Not quite!

or:

> Check the clue!

No health loss.

No points lost.

No restart.

The correct target can pulse slightly stronger after repeated mistakes.

---

# 16. AI Knowledge Intro System

Every minigame now starts with:

# AI KNOWLEDGE

Keep this extremely short.

Target:

```text
5–10 seconds
```

Structure:

```text
ONE AI IDEA

ONE SIMPLE EXAMPLE

PLAY IT
```

Never start with several paragraphs.

---

# 17. Intro Presentation

Player enters mission.

Doors close/open dramatically.

Weapon temporarily lowered if necessary.

Large hologram appears:

```text
AI KNOWLEDGE

Good prompts include useful details.

"Find a battery"

is less clear than

"Find the LARGE BLUE battery."
```

Pix says one sentence.

Then:

```text
READY?

TEST IT!
```

Targets illuminate.

Player immediately starts shooting.

---

# 18. Critical Educational Rule

The minigame following the explanation must test **exactly the concept just introduced**.

Bad design:

```text
Lesson:
AI needs clear prompts.

Gameplay:
shoot five random red targets.
```

There is no connection.

Good design:

```text
Lesson:
Specific details make prompts clearer.

Gameplay:
Three batteries appear.

Player must shoot:
LARGE BLUE BATTERY.
```

The physical action represents the AI concept.

---

# 19. Prompt Lab — Complete Redesign

## Learning Goal

Teach:

> Useful details make instructions clearer.

Knowledge intro:

```text
AI KNOWLEDGE

A prompt tells AI what you want.

Useful details help AI choose correctly.
```

Example:

```text
GET A CORE
```

versus:

```text
GET THE LARGE BLUE CORE
```

Then start immediately.

---

# 20. Prompt Lab Round 1 — Specific Target

Three giant floating Data Cores appear.

```text
RED CORE

BLUE CORE

GREEN CORE
```

They should:

* float;
* rotate;
* have animated faces/icons;
* move gently up/down.

Mission:

```text
PIX NEEDS:

THE BLUE CORE
```

Blue Core receives:

**No explicit highlight yet.**

The player needs to interpret the prompt.

All three have shootable hitboxes.

Player shoots Blue.

### Correct

```text
BLUE CORE
   ↓
FLASH
   ↓
DATA ORBS
   ↓
PIX
```

HUD:

```text
GOOD DETAIL!

"BLUE" helped you choose.
```

---

# 21. Prompt Lab Round 2 — Ambiguity

Spawn:

```text
SMALL BLUE CORE

LARGE BLUE CORE

RED CORE
```

Display:

```text
PROMPT:

GET THE BLUE CORE
```

Both blue cores get subtle:

```text
?
```

Pix:

> I see TWO blue cores!

The player cannot yet solve it.

A new target appears:

```text
LARGE
```

with the glowing target beacon.

Player shoots:

```text
LARGE
```

The prompt visually changes:

```text
GET THE

LARGE

BLUE CORE
```

Then both blue cores become shootable.

Player shoots Large Blue Core.

Success:

```text
CLEAR PROMPT!
```

Data Orbs fly into Pix.

---

# 22. Prompt Lab Round 3 — Add Destination

Knowledge reinforcement:

> A useful prompt can also say where the result should go.

Spawn destination targets around the lab:

```text
⚡ REACTOR

🔬 SCANNER

📦 STORAGE
```

Prompt:

```text
TAKE THE LARGE BLUE CORE
TO THE REACTOR
```

Now make it dynamic.

Large Blue Core moves slowly on a Target Track / moving platform.

Player must:

### Shot 1

Shoot:

```text
LARGE BLUE CORE
```

Core locks.

VFX:

```text
TARGET ACQUIRED
```

### Shot 2

Shoot:

```text
REACTOR
```

Energy beam forms:

```text
BLUE CORE
──────────>
REACTOR
```

Pix executes delivery.

---

# 23. Prompt Lab Finale

Do not simply display:

```text
Mission Complete
```

Make the room respond.

Correct final shot:

```text
Blue Core launches
        ↓
flies toward reactor
        ↓
reactor spins
        ↓
lights turn on sequentially
        ↓
energy runs through cables
        ↓
Prompt Module opens
```

Big message:

```text
PROMPT MODULE

ONLINE
```

Player receives a burst of Data Orbs.

Then activate an exit rail/launcher.

Let them physically ride back toward the hub.

---

# 24. Pattern Scanner

## AI Knowledge

```text
AI KNOWLEDGE

AI can find patterns in examples.

Patterns can help predict what comes next.
```

Example:

```text
🔵 🟡 🔵 🟡 🔵 ?

Answer:

🟡
```

---

# 25. Pattern Scanner Gameplay

Instead of buttons:

Targets physically appear.

Example:

```text
🔵    🟡    🟢
```

Mission display:

```text
🔵 🟡 🔵 🟡 🔵 ?
```

Shoot:

```text
🟡
```

Correct target explodes into Data Orbs.

---

# 26. Dynamic Pattern Round

Use moving target tracks.

Targets:

```text
Triangle

Circle

Star
```

move sideways.

Pattern:

```text
▲ ● ▲ ● ▲ ?
```

Player must shoot:

```text
●
```

The point is observation, not precision.

Target movement therefore should be:

```text
Slow / Medium
```

not Fast.

---

# 27. AI Classifier

## AI Knowledge

```text
AI KNOWLEDGE

Classification means putting things into categories.
```

Example:

```text
🍎 → FOOD

🐶 → ANIMAL

🚗 → VEHICLE
```

Immediately start conveyor.

---

# 28. AI Classifier Gameplay

Objects move down conveyor.

Large category targets exist above gates:

```text
FOOD

ANIMAL

VEHICLE
```

Object:

```text
🍌 BANANA
```

Player shoots:

```text
FOOD
```

Gate opens.

Banana slides into correct container.

Correct:

```text
CATEGORY FOUND!
```

* Data Orbs.

---

# 29. Make Classification Faster

Later round:

Objects arrive one after another.

No timer failure.

Example:

```text
DOG
CAR
APPLE
HELICOPTER
CARROT
CAT
```

Player shoots categories.

Successful shots produce:

```text
combo sound
```

and increasingly energetic VFX.

Optional:

```text
x2
x3
x4
```

for consecutive correct answers.

No punishment when combo resets.

---

# 30. Confidence Core

## AI Knowledge

```text
AI KNOWLEDGE

AI is not always equally sure about an answer.

More useful evidence can increase confidence.
```

---

# 31. Confidence Gameplay

Center:

```text
PIX CONFIDENCE

30%
```

Several floating clue targets appear.

Example object:

```text
CAT?
```

Targets:

```text
WHISKERS

WHEELS

POINTED EARS

TAIL
```

Player shoots useful evidence:

```text
WHISKERS

POINTED EARS

TAIL
```

Each correct clue:

```text
30%
 ↓
50%
 ↓
70%
 ↓
90%
```

Confidence meter should physically fill around Pix.

Wrong clue:

```text
WHEELS
```

funny buzz.

No penalty.

---

# 32. AI Error Lab

## AI Knowledge

```text
AI KNOWLEDGE

AI can make mistakes.

Important answers should be checked.
```

Immediately show an incorrect AI result.

---

# 33. Error Lab Gameplay

Example:

```text
PIX:

🐬 DOLPHIN
CATEGORY: FISH
```

Three targetable parts:

```text
DOLPHIN

FISH

PICTURE
```

Question:

```text
SHOOT THE MISTAKE
```

Player shoots:

```text
FISH
```

Target cracks / glitches.

New targets:

```text
MAMMAL

BIRD

VEHICLE
```

Shoot:

```text
MAMMAL
```

AI result repairs itself.

```text
ERROR FIXED!
```

---

# 34. AI Tool Lab

## AI Knowledge

```text
AI KNOWLEDGE

Some AI systems can use tools.

Different jobs need different tools.
```

Example:

```text
Need to SEE?

Use CAMERA.

Need to SCAN?

Use SCANNER.
```

---

# 35. Tool Lab Gameplay

Mission:

```text
WHAT IS INSIDE THE BOX?
```

Three large floating targets:

```text
📷 CAMERA

📡 SCANNER

🔊 SPEAKER
```

Player shoots:

```text
SCANNER
```

Scanner physically powers up.

Laser scans mystery crate.

Crate becomes transparent/open.

Reward:

```text
RIGHT TOOL!
```

---

# 36. Dynamic Tool Round

Later:

three stations activate around player.

```text
Mystery crate
Broken antenna
Announcement terminal
```

Tool targets move / rotate overhead.

Player moves around the room and shoots correct tool-target combinations.

This becomes much more physical than selecting tool names from a UI.

---

# 37. AI Skills Lab

## AI Knowledge

```text
AI KNOWLEDGE

A skill groups useful actions together.

Then it can be reused.
```

---

# 38. Skills Gameplay

Instead of building functions using buttons, create physical action targets.

For example:

```text
SCAN

PICK UP

DELIVER
```

Player shoots each glowing target.

Each hit loads the action into the Skill Core.

Visual:

```text
SKILL: DELIVERY

[SCAN]
   ↓
[PICK UP]
   ↓
[DELIVER]
```

When complete:

```text
SKILL READY!
```

Then several package targets appear.

Player shoots a package.

Pix automatically executes the entire skill.

This physically demonstrates why reusable skills are useful.

---

# 39. AI Agent Mission

This should combine everything.

## Knowledge Intro

```text
AI KNOWLEDGE

An AI agent can:

understand a goal,
choose actions,
use tools,
and complete a task.
```

Then:

# AGENT TEST START

---

# 40. Agent Mission Example

Goal:

```text
DELIVER THE MEDICAL CORE
TO THE RESEARCH LAB.
```

### Stage 1 — Classification

Three crates appear.

Shoot:

```text
MEDICAL
```

---

### Stage 2 — Tool

Route hidden.

Shoot:

```text
SCANNER
```

---

### Stage 3 — Decision

Scanner reveals:

```text
BRIDGE ❌

TUNNEL ✓
```

Shoot:

```text
TUNNEL
```

---

### Stage 4 — Skill

Shoot:

```text
DELIVERY SKILL
```

---

### Stage 5

Pix performs whole sequence.

Huge final AI Core activation.

---

# 41. Universal Mission Start Template

Every minigame follows exactly this rhythm:

```text
ENTER ROOM
      ↓
2-sec spectacle
      ↓
AI KNOWLEDGE
      ↓
simple example
      ↓
"LET'S TEST IT!"
      ↓
weapon ready
      ↓
targets illuminate
      ↓
PLAY
```

Knowledge section should generally last:

```text
5–10 seconds
```

unless the player chooses to stay longer.

---

# 42. Avoid Forced Reading

Support the lesson with:

* Pix voice/dialogue;
* icons;
* animations;
* examples;
* short text.

Example:

Instead of:

```text
A classification model assigns observations to predefined categorical labels...
```

show:

```text
🍎
 ↓
FOOD
```

and say:

> AI can sort things into categories.

Then shoot.

---

# 43. Universal Bonus System

Add a simple:

# DATA ENERGY

Every correct interaction gives Data Energy.

Example:

```text
+1 DATA
```

or particularly good sequences:

```text
PERFECT!

+3 DATA
```

Data Energy feeds the AI Core.

This gives a shared meta-reward across all minigames.

---

# 44. Combo System

Optional but recommended.

Correct consecutive hits:

```text
1 hit
GOOD!

2 hits
NICE!

3 hits
DATA COMBO x3!

4 hits
AWESOME!
```

Do not punish misses.

A miss simply ends the combo.

This creates arcade energy without adding failure anxiety.

---

# 45. Moving Targets

Use moving targets selectively.

Recommended progression:

```text
Tutorial:
stationary

Round 1:
slow movement

Round 2:
multiple targets

Final:
slow/medium moving targets
```

Never make the educational answer hard to select because the target is moving too quickly.

The challenge should be:

> Do I understand the AI idea?

not:

> Am I good at Fortnite aim?

---

# 46. Target Dummy Configuration

Where practical, implement shootable answer targets using Target Dummy devices / shooting-range target devices.

Use:

```text
On Hit
```

rather than:

```text
On Bullseye
```

for normal educational interactions.

Bullseyes may be optional bonus interactions.

For example:

```text
Normal hit:
correct answer

Bullseye:
extra Data Orb
```

Never require bullseye to progress.

---

# 47. Moving Targets

Use Target Dummy Track for targets that need to:

* slide sideways;
* enter/leave a conveyor;
* move between stations;
* create arcade-style interaction.

Start around:

```text
Slow
```

and test with young players before increasing speed.

---

# 48. Verse Interaction Architecture

Create a shared gameplay abstraction instead of writing unique hit behavior everywhere.

Conceptually:

```text
AIInteractableTarget
```

properties:

```text
TargetId
MissionId
IsCorrect
IsActive
RewardValue
TargetType
```

events:

```text
Activated
Hit
CorrectHit
WrongHit
Completed
```

Then every mission can reuse the same feedback pipeline.

---

# 49. Shared Correct-Hit Pipeline

```text
Weapon hits target
       ↓
Validate target active
       ↓
Validate mission state
       ↓
Play Hit VFX
       ↓
Play sound
       ↓
Disable target if required
       ↓
Award Data
       ↓
Update mission
       ↓
Activate next target(s)
```

---

# 50. Shared Wrong-Hit Pipeline

```text
Weapon hits target
       ↓
Validate target active
       ↓
Wrong answer
       ↓
funny VFX
       ↓
short sound
       ↓
Pix hint
       ↓
keep puzzle active
```

Never rebuild the entire mission.

---

# 51. Highlight Manager

Create one reusable system:

```text
ActivateTarget(Target)
```

should:

```text
Enable hit detection
Enable red cone
Enable target ring
Enable particle effect
Start pulse
```

And:

```text
DeactivateTarget(Target)
```

should disable all those systems.

This avoids manually coordinating five different devices for every target.

---

# 52. Never Highlight Wrong Things

If the challenge is to choose between several answers, all possible answers can have a **neutral selectable indicator**, but do not highlight the correct answer in red.

Use:

```text
BLUE/CYAN ring
= selectable
```

versus:

```text
RED/ORANGE cone
= next required interaction / objective
```

For example:

Mission says:

```text
SHOOT THE ANIMAL
```

Dog, Car and Apple can all have neutral rings.

Do not put the objective cone exclusively behind Dog or the game gives away the answer.

---

# 53. Two Highlight Types

## OBJECTIVE BEACON

Means:

> Go here / interact with this system.

Use strong red/orange cone.

---

## ANSWER TARGET

Means:

> This is one of your choices.

Use:

* outline/ring;
* subtle particles;
* no giant directional cone.

This distinction is important.

---

# 54. Accessibility

Targets should be identifiable through:

```text
color
+
shape
+
icon
+
label
```

Never use only:

```text
red / green
```

Example:

```text
🔵
BLUE CORE
◇
```

versus:

```text
🔴
RED CORE
○
```

---

# 55. Multiplayer

Every player gets a Data Blaster.

Do not let players shoot each other meaningfully.

Prefer:

```text
Player damage disabled
```

or invincible players.

For cooperative missions:

```text
Player A hits target

→ shared world reacts

→ mission progresses
```

But badge and persistent progress should still respect the island's existing progression model.

---

# 56. Recommended Development Order

Do not rebuild every game at once.

Start with the weapon interaction framework.

### Phase A — Global Systems

Implement:

```text
[ ] Data Blaster
[ ] automatic weapon grant
[ ] infinite ammo
[ ] invincibility
[ ] target base
[ ] target hit event
[ ] correct-hit VFX
[ ] wrong-hit VFX
[ ] Data Orb reward
[ ] selectable target effect
[ ] objective beacon
[ ] shared sound effects
```

---

# 57. Phase B — Prompt Lab

Replace existing button interactions entirely.

Implement:

```text
[ ] AI Knowledge intro
[ ] Blue/Red/Green target round
[ ] vague-prompt round
[ ] LARGE modifier shot
[ ] target core shot
[ ] destination shot
[ ] moving final target
[ ] reactor sequence
[ ] Prompt Module activation
```

Do not continue to another minigame until this interaction feels fun.

---

# 58. Phase C — Validate

Test Prompt Lab specifically for:

```text
Can player instantly understand what can be shot?

Can player hit targets without precision aiming?

Do hits feel satisfying?

Can a wrong shot be recovered from instantly?

Is the lesson obvious?

Does the gameplay actually demonstrate the lesson?

Does it feel fun even if the player ignores the educational explanation?
```

That last question is important.

The game should first be enjoyable.

The learning should be embedded in that gameplay.

---

# 59. Phase D — Convert Other Minigames

Once Prompt Lab works well, apply the same architecture to:

```text
Pattern Scanner
AI Classifier
Confidence Core
AI Error Lab
AI Tool Lab
AI Skills Lab
AI Agent Mission
```

Do not invent a completely different control scheme for each room.

The player should already understand:

> If it looks targetable, I shoot it.

---

# 60. New Overall Design Philosophy

The previous prototype was:

```text
THINK
↓
CLICK
↓
CHECK
```

The new island should be:

```text
LEARN SOMETHING
↓
MOVE
↓
SEE SOMETHING
↓
AIM
↓
SHOOT
↓
BIG REACTION
↓
UNDERSTAND WHY
↓
GET REWARD
```

That is a much better foundation for the 7–10 age group and for a Fortnite experience.
