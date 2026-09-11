A Fortnite learning island works best when it feels like an adventure first and a classroom second. Kids remember **quests, characters, and “I figured it out” moments** — not posters that say “this is a loop.” Epic’s own Hour of Code lessons already prove this: lock-and-key doors for conditionals, treasure hunts for variables, music sequencers for loops, obstacle courses for events.

One important constraint: official Epic classroom plans are usually **ages 13+**, and published islands get an IARC rating. For children, aim for **E / E10+**: no weapons, no combat, no horror, short sessions, clear instructions. LEGO Fortnite assets help if the audience is younger.

---

## Theme options

Pick one world metaphor and stick to it. These all map cleanly onto CS ideas:

| Theme | Feel | Best for |
|---|---|---|
| **1. Byte Island Academy** (recommended) | Bright campus + adventure park | First public island, classroom + Discover |
| **2. Bug Hunter HQ** | Kids are “debug agents” | Problem-solving, persistence |
| **3. Inside the Computer** | Player shrinks into a PC | Hardware + software together |
| **4. Robot Workshop** | Build/program robots with commands | Sequencing, functions |
| **5. Logic Kingdom** | Castles, keys, magic “if” spells | Conditionals, Boolean logic |
| **6. Data Archipelago** | Each small island = one concept | Modular building, easy expansion |
| **7. LEGO Code Camp** | Soft, blocky, all-ages | Younger kids, safer rating |

**Recommended: Byte Island Academy.**  
One hub, several themed zones, a mascot, collectible “Bytes,” and a story: *the island’s computer is glitching — kids restore each system by solving CS puzzles.* It is modular, publishable in slices, and matches how Epic already teaches CS in Creative.

---

## Recommended project: **Code Quest — Byte Island**

**One-line pitch:** A colorful adventure island where kids restore a broken computer-world by completing quests about sequencing, loops, variables, conditions, events, and debugging.

**Target**
- Players: ~8–14 (design for E10+; language simple enough for 8–10)
- Session: 20–40 minutes for the hub + 1 zone; 60–90 minutes for the full tour
- Mode: co-op 1–4, or solo
- Tools: start in **Fortnite Creative devices**; add **UEFN + Verse** only where devices are not enough

**Learning goals (computational thinking, not syntax)**
1. Sequence — order of steps matters  
2. Loops — repeat instead of copy-paste  
3. Variables — things that store and change  
4. Conditionals — IF / THEN / ELSE  
5. Events — “when this happens, do that”  
6. Debugging — find what broke and fix it  
7. Decomposition — split a big problem into parts  

Later optional zones: binary, functions, algorithms, networks, “what is AI.”

---

## Island layout

```
                    [Boss Glitch Arena]
                            |
[Hub Plaza] -- bridges --> themed zones
   |  spawn, map, NPC guide "Pix"
   |  Byte Bank (score)
   |  Practice Sandbox
   |
   +-- Zone 1 Path Garden     (Sequence)
   +-- Zone 2 Loop Lagoon     (Loops)
   +-- Zone 3 Variable Vault  (Variables)
   +-- Zone 4 If-Then Fortress(Conditionals)
   +-- Zone 5 Event Factory   (Events / triggers)
   +-- Zone 6 Debug Dungeon   (Bugs)
   +-- Capstone: Build-a-Bot  (combine all)
```

**Visual language (kids read this instantly)**
- Green paths = safe / tutorial  
- Blue water + repeating fountains = loops  
- Gold chests / counters = variables  
- Red/green gates = true/false  
- Sparking broken machines = bugs  
- Billboard + NPC at every zone entrance: *goal in one sentence*

---

## Zone-by-zone design

### Hub — “Pix’s Plaza”
- Spawn, short cinematic or pop-up: *“The Core crashed. Collect 6 Circuit Badges.”*
- Map board, Byte counter, easy parkour to the first zone (warm-up, not a lesson).
- Devices: Player Spawner, HUD Message / Pop-up Dialog, Billboard, Score Manager, Teleporter.

### Zone 1 — Path Garden (Sequence)
**Idea:** A robot gardener only walks the path you “program.”  
Wrong order = flowers wilt / gate stays shut.  
**Play:** step on 4 colored pads in the correct order (Water → Plant → Wait → Harvest).  
**Show the word:** ALGORITHM = a recipe.  
**Devices:** Triggers, Sequencer, Barriers, Billboard.

### Zone 2 — Loop Lagoon (Loops)
**Idea:** A ferry or fountain that repeats. Kids set “repeat 5 times” instead of pressing 5 buttons.  
**Play:** Music Sequencer or repeating platforms; collect coins that spawn in a loop.  
**Show:** LOOP saves work. Infinite loop = funny “help I’m stuck” gag, then a stop button.  
This matches Epic’s music-loop Hour of Code lesson.

### Zone 3 — Variable Vault (Variables)
**Idea:** Treasure hunt. Coins update a score. Different coins have different values.  
**Play:** collect 10 Bytes before the timer; a shop spends Bytes.  
**Show:** a variable has a **name**, a **value**, and it **changes**.  
Epic already uses this as a treasure-hunt scoring lesson.

### Zone 4 — If-Then Fortress (Conditionals)
**Idea:** Classic lock-and-key, then a 2-path fork.  
IF you have the Blue Key THEN the bridge appears ELSE the hint NPC talks.  
**Play:** Conditional Button + key item + locked door; later AND (need two items).  
This is Epic’s official conditional lesson.

### Zone 5 — Event Factory (Events)
**Idea:** Machines wake when you touch, shoot a target (foam dart / no weapon), or stand on a plate.  
**Play:** short obstacle course: trigger → door, collision → boost, button → platform.  
**Show:** EVENT = “when X, do Y.”  
Same pattern as the official obstacle-course lesson.

### Zone 6 — Debug Dungeon (Debugging)
**Idea:** Three “broken” rooms. Kids compare expected vs actual behavior.  
Examples:  
- sequence pads in the wrong order  
- loop that never stops  
- score that does not go up (Score Manager not wired)  
**Play:** flip switches / rewire visible “cables” (just devices you enable/disable) until the machine works.  
**Show:** a bug is a mismatch, not “you’re bad at this.”

### Capstone — Build-a-Bot
Kids pick 3 cards (Sequence + Loop + Condition) and run a small bot through a maze.  
Reward: Core restored, badge wall, optional photo spot.

---

## How learning should work in-game

Use **guided play**, not lectures:

1. **See it** — NPC does a tiny demo (2–5 seconds).  
2. **Do it** — player solves one easy puzzle.  
3. **Name it** — one billboard with the real CS word.  
4. **Twist it** — slightly harder version.  
5. **Stamp it** — Circuit Badge + 1 sentence recap.

Rules that keep it kid-friendly:
- Fail soft. Never punish with death; reset the puzzle.
- Hints after 30–45 seconds of no progress.
- Text under ~80 characters on billboards (limit is 150, but kids skim).
- Voice-optional. Everything readable.
- No random combat. If you want energy, use races, collectathons, and co-op roles.

---

## Concrete build plan

### Phase 0 — Decisions (1 day)
Lock these before you graybox:
- Age band (8–10 vs 11–14 changes art, text, and rating)
- Creative 1.0 only vs UEFN
- Solo story vs 2–4 co-op
- Language (English only, or Ukrainian + English)
- Publish to Discover or private classroom code only

### Phase 1 — Paper design (2–3 days)
Deliverables:
- 1-page pitch
- Zone list with one learning goal each
- Player journey (spawn → badge 1 → … → ending)
- Device list per zone
- Word list for kids (algorithm, loop, variable, if/then, event, bug)

### Phase 2 — Graybox hub + Zone 1 (3–5 days)
Flat Grid Island or a small custom terrain.  
Prove the loop: spawn, quest text, 1 puzzle, score +1, teleporter home.  
Playtest with one child or a non-dev friend. If they don’t know what to do in 10 seconds, the signage is wrong.

### Phase 3 — Zones 2–4 (1–2 weeks)
Reuse the same puzzle template: intro NPC → puzzle → badge.  
Keep art simple: color-code zones, reuse galleries.

### Phase 4 — Zones 5–6 + capstone (1 week)
Add difficulty ramps and a celebration ending.

### Phase 5 — Polish and publish (3–5 days)
- Tutorial that cannot be skipped accidentally  
- Accessibility: big fonts, color + icons (not color-only)  
- Remove weapons, fall damage, storm  
- IARC questionnaire aimed at **Everyone / E10+**  
- Thumbnail: bright character + “LEARN TO CODE” is weaker than a kid-facing title like **Byte Island**  
- Description: 3 bullets of what you *do*, then what you *learn*

### Phase 6 — Classroom pack (optional)
A 1-page teacher sheet per zone: goal, 10-minute run, 3 discussion questions. Epic already publishes this format for Creative lessons.

---

## Technical stack (keep it simple first)

**Build v1 with devices only**
- Billboard, Pop-up Dialog, NPC / Character devices  
- Button, Conditional Button, Triggers, Volume  
- Sequencer, Music Sequencer  
- Score Manager, Tracker, Objective  
- Item Spawner, Lock, Barrier, Teleporter  
- Cinematic Sequence if you want a 10-second intro  

**Add Verse later only for**
- a real “code editor” minigame (forward / turn / repeat)  
- saving progress across visits  
- smarter hints  
- a visual block-code wall that actually drives a robot  

Do not start in Verse. A finished 3-zone device island beats an unfinished custom language.

---

## 8-week schedule if this is a real project

| Week | Output |
|---|---|
| 1 | Theme lock, map sketch, hub graybox |
| 2 | Zone 1 playable + first playtest |
| 3 | Zones 2–3 |
| 4 | Zone 4 + art pass on hub |
| 5 | Zones 5–6 |
| 6 | Capstone + audio + signs |
| 7 | Playtests with kids, fix confusion |
| 8 | Rating, publish, teacher notes |

Minimum viable island after week 2: Hub + Path Garden. That already teaches sequencing and proves the format.

---

## Naming and identity

Working title: **Code Quest: Byte Island**  
Guide NPC: **Pix** (small robot with a cracked screen)  
Currency: **Bytes**  
Fail state joke: **Glitch** (a silly purple cube that shrugs)  
Win: restore the **Core Crystal**

Avoid names that sound like homework: “CS Module 1,” “Informatics Park.”

---

## What I would actually ship first

If you want one concrete plan to execute:

1. Theme: **Byte Island Academy**  
2. Scope v1: Hub + 3 zones (Sequence, Loops, Conditionals)  
3. Tools: Creative devices, no Verse  
4. Rating target: E10+  
5. Loop: collect 3 badges → short ending → “more zones coming”  
6. Then expand with Variables, Events, Debug, Capstone  

That is a complete, publishable island, not an endless syllabus.

---

If you want, next I can turn this into a **zone-by-zone build checklist** (exact devices, channels, and sign text) or a **one-page design doc** you can drop into UEFN/Creative. Useful to know:

- age range (e.g. 8–10 or 11–14)  
- Creative only or UEFN  
- classroom private island vs public Discover map  
- English only or also Ukrainian