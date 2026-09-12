# Byte Island: Post-MVP Roadmap

- Status: Implementation authorized; in progress
- Date: 2026-09-11
- Baseline: user reports the first MVP complete; repository evidence records a working solo loop.

## Direction

Turn the sequence demonstration into a small adventure where players predict,
try, observe, and improve a solution. Keep ages 8-10, short English instructions,
non-combat play, solo completion, and independent progress for up to four players.
Pix explains a concept after the player experiences it. Hints are available on
request; later puzzles should not reveal the answer in their default objective.

## Recommended release order

| Release | Player experience | Why this comes next | Scope |
| --- | --- | --- | --- |
| 1.1: Loop Lagoon | Program a dock robot with repeat counts across three short challenges. | Adds prediction and visible execution while building on ordered steps. | Next build; draft feature 002. |
| 1.2: A living academy | Read a personal badge board, choose the next destination, and solve a new Path Garden variation. | Makes the zones feel connected and gives the first puzzle replay value. | Separate feature spec required. |
| 1.3: Signal Lighthouse | Route supply boats by checking their cargo symbols. | Introduces if/else through a concrete coastal task. | One zone, three challenges. |
| 1.4: Variable Vault | Set and change an energy value to power a door. | Introduces stored values after players understand repetition and decisions. | One zone, three challenges. |
| 1.5: Debug Workshop | Predict a broken robot's behavior, find one faulty instruction, and fix it. | Revisits learned concepts through diagnosis. | Three handcrafted broken programs. |
| 1.6: Event Factory and Build-a-Bot | Connect event responses, then combine prior concepts in a delivery mission. | Provides a capstone once the individual mechanics are proven. | Specify and build factory and capstone separately. |

Do not build all zones together. Complete a graybox, playtest, and revise each
zone before expanding. Release 1.1 should target roughly 8-12 minutes including
the existing introduction; this is a design target to measure, not a prediction.

## Puzzle ideas

### Loop Lagoon: repetition

1. **Dock delivery:** a robot starts at tile 0 and a parcel waits at tile 3.
   Choose how many times to repeat Move, then press Run. Watch each step.
2. **Lantern walk:** repeat the block Move, Light to light three dock lanterns.
   The player chooses the repeat count; the two commands are supplied.
3. **New destination:** the parcel is now at tile 4. Adapt the repeat count
   without a suggested answer. This tests transfer rather than recall.

Use a safe preview board. A wrong count stops the robot, shows where it ended,
and invites an edit. A later expansion can introduce Repeat Until; fixed counts
are enough for the first release.

### Path Garden: understanding order

Add an optional repair challenge: a supplied garden program tries to Harvest
before Wait. The player swaps the misplaced commands, then runs the program.
Use the existing Water, Plant, Wait, Harvest rules consistently. Show what each
step does so the problem can be reasoned through without memorizing a sign.

### Signal Lighthouse: decisions

Start with "If the crate has a leaf, send it to the garden. Otherwise, send it
to storage." Players select the destination before a boat moves. Add a second
symbol in challenge two; challenge three asks players to select a rule that
correctly routes a short, visible queue. Symbols and labels accompany color.

### Variable Vault: changing values

An energy display starts at 0. Players use +1 and -1 to reach 3, then Start.
Next, start at 2 and reach 5; finally choose how many times to repeat Add 2 to
reach 6 from 0. The display names the stored value "energy" and updates after
every action. Wrong attempts keep the door closed without removing rewards.

### Debug Workshop: finding a mistake

Show expected and actual destinations side by side. First repair one incorrect
move, then a repeat count, then a reversed routing rule. Keep each puzzle to
one deliberate fault and let players rerun the program after every edit.

### Event Factory and Build-a-Bot

Factory puzzles connect "When the bell rings" to "Open the parcel chute" and
distinguish which event caused a response. The capstone uses a small set of
predefined command choices to deliver a seed, light a dock, and route a parcel.
Avoid a freeform coding editor until these constrained puzzles prove enjoyable.

## Improvements across the game

- **Visible consequences:** show steps executing on a puzzle board or robot,
  with a text description of the result. Avoid making HUD text the only reward.
- **Gentle help:** provide an always-visible Help action with a concept hint,
  then a worked example if asked again. No time penalty or badge reduction.
- **Clear progress:** show personal zone badges and a suggested destination at
  the hub. A player may revisit solved zones; replays never duplicate badges.
- **Replay variety:** introduce a few authored, tested variations before random
  generation. An optional challenge can ask for fewer commands without a timer.
- **Shared exploration:** let friends discuss solutions while keeping their
  attempts independent. Mandatory simultaneous switches would break solo play.
- **Coastal identity:** connect the garden, docks, lighthouse, and workshop with
  landmarks and short paths. Polish the tested route before decorating unused land.
- **Localization later:** keep instructional strings ready for translation;
  specify Ukrainian localization separately after the English wording settles.

The user authorized implementation of this roadmap. Features 002-008 now hold
the numbered specifications; implementation and verification proceed zone by
zone. Persistence, competitive leaderboards, daily rewards,
and procedural puzzles remain outside the next release.

## Build and playtest gates

Testing availability: the user confirmed solo testing only for now. Continue
implementation and solo verification zone by zone; defer the two-player and
four-player checks until separate Fortnite clients are available. Multiplayer
checks remain required before claiming multiplayer readiness. Standalone project
validation and memory calculation remain release gates. Do not mark historical
tasks complete without evidence.

For each new zone, first prove one challenge with placeholder art, then the
full progression, then presentation. Verify multiplayer isolation when additional
clients become available. Record
solo and multiplayer spawn, progression, retries, replay rewards, respawn,
join-in-progress, and round reset. Run project validation and memory calculation.

Observe 3-5 target-age playtesters where practical. Record time to first action,
wrong attempts, hint requests, completion time, and whether the player can
explain the concept in their own words. Initial design targets: at least 4 of 5
testers finish the next zone without developer intervention and at least 3 of 5
explain a loop as repetition. With fewer testers, report individual observations
instead of claiming the targets passed. Revise confusing puzzles before adding
the following zone.
