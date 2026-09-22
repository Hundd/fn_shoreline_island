# Byte Island Academy

Byte Island Academy is a bright, non-combat UEFN learning adventure for ages
8-10. Players help Pix restore a glitched coastal academy by exploring themed
rooms and solving short, visual coding puzzles. The island supports solo play
and is designed for up to four players with independent progress.

Players learn by predicting, trying, seeing the outcome, fixing mistakes, and
receiving a brief plain-English explanation. There are no weapons,
elimination, timers, or punitive failure states. Wrong answers safely reset
only the current attempt, and replaying a game does not duplicate rewards.

## Player-facing description

> Restore Byte Island Academy! Explore a sunny coastal campus, solve bite-size
> coding puzzles, and help Pix bring its glitched systems back online.

The Academy hub contains a personal journal and badge board, recommends an
unfinished destination, and connects each zone through labeled paths and
landmarks. Each completed zone awards one personal badge for that round.

The island is still in development. Most core puzzles have solo implementation
evidence, while full multiplayer, final validation, and memory-release checks
remain open.

## Minigames

| Minigame | Main idea | Player activity | Reward |
| --- | --- | --- | --- |
| Path Garden | Algorithms / ordered steps | Perform `Water -> Plant -> Wait -> Harvest` in the correct order. | Circuit Badge |
| Garden Repair | Fixing sequence order | Swap two incorrect program steps and run the repaired garden program. | No extra badge |
| Loop Lagoon | Loops / repetition | Choose how many times a robot repeats Move, then repeat Move + Light for dock lanterns. | Loop Badge |
| Signal Lighthouse | Conditions | Route cargo boats based on Leaf, Gear, or Plain symbols and select the correct routing rule. | Signal Badge |
| Variable Vault | Variables | Change an `energy` value with controls or repeated Add 2 actions to power doors. | Energy Badge |
| Debug Workshop | Debugging | Compare expected and actual results, identify one faulty instruction, edit it, and rerun. | Debug Badge |
| Event Factory | Events and responses | Connect inputs such as Bell and Lever to outcomes such as opening a chute or lighting a lamp. | Event Badge |
| Tidepool Nursery | Functions | Define a reusable `Care` action--Water, Plant, Wait, Harvest--then call and repeat it across planter beds. | Nursery Badge |
| Build-a-Bot | Coding capstone | Combine sequences, loops, variables, conditions, and events to complete a restoration delivery mission. | Bot Badge |
| Coastal Fieldwork | Optional exploration | Make predictions at three educational observation spots and complete an optional Nursery remix. | No extra badge |

## Path Garden

The introductory game teaches that an algorithm is an ordered set of steps.
Players restore a plant by choosing Water, Plant, Wait, and Harvest in order. A
wrong step safely resets their attempt; completion explains the concept and
gives the Circuit Badge.

Garden Repair is an optional variation. The supplied program has `Harvest`
before `Wait`, and the player swaps the two slots to repair it.

## Loop Lagoon

A dock robot introduces loops as repeating steps.

- Challenge 1: Repeat Move exactly three times to reach a parcel.
- Challenge 2: Repeat the supplied Move + Light block three times to light all
  dock lanterns.
- Challenge 3: Adapt the repeat count to reach a new target at tile four.

The robot visibly executes each step. Players can ask for a concept hint, then
a worked answer.

## Signal Lighthouse

Players learn conditions through cargo routing.

- Leaf cargo goes to the Garden.
- Plain cargo goes to Storage.
- Gear cargo goes to the Workshop.

Early challenges ask the player to choose the proper destination for individual
boats. The final challenge shows a queue and asks them to choose the complete
routing rule. The lesson is that a condition is a check that chooses what
happens.

## Variable Vault

Players learn that a variable stores a value that can change.

- Start energy at 0 and adjust it to 3 to open a door.
- Start at 2 and reach 5.
- Repeat Add 2 to progress from 0 to 6.

Every adjustment visibly updates the energy display. Incorrect values leave the
door closed and invite the player to revise rather than punishing them.

## Debug Workshop

Each puzzle shows a target result, the actual result, and a supplied program
containing exactly one mistake.

Players repair an incorrect Move instruction, a wrong repeat count, and a
reversed cargo-routing rule. The game teaches debugging as finding and fixing
mistakes. Players can rerun after every edit and request two levels of help.

## Event Factory

Players learn that an event starts a response.

- Connect Bell to Open Chute, then ring the Bell to release a parcel.
- Watch a demonstration and identify whether Bell or Lever caused the response.
- Connect Bell to the chute and Lever to a lamp, then test that each trigger
  activates only its intended response.

## Tidepool Nursery

This game introduces functions using a named reusable action: `Care`.

The player builds Care from four editable steps: Water, Plant, Wait, Harvest.
They then run Care for one planter, use `Care, Move, Care` for two planters,
and repeat `Care, Move` three times to restore three planters and reach an
exit. It teaches that a function is a named group of steps.

## Build-a-Bot

The capstone combines the previous concepts in a guided academy-restoration
mission.

- Deliver a seed using ordered steps and a repeat count.
- Light a dock using energy changes plus repeated Move/Light instructions.
- Route parcels by combining an event-triggered launch with cargo conditions;
  both Leaf and Plain cargo must succeed.

Completing all three stages awards the Bot Badge and triggers the Academy's
single restoration celebration.

## Coastal Fieldwork

This optional, non-blocking exploration layer has no new badge rewards.

- Predict the next Garden step after Water, Plant, Wait.
- Predict the next lantern in a repeating `1, 2, 1, 2` pattern.
- Predict the destination for a Leaf crate using visible route rules.

It also adds an optional Tidepool Nursery remix that challenges players to
solve two beds efficiently using the Care function.
