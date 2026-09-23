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
- FR-008: Each first-time module restoration visibly connects the completed
  zone to Pix's central AI Core, while the journal remains the authoritative
  per-player module display and shared world effects remain cosmetic.
- FR-009: Important learning actions have short, distinguishable sounds for
  scan, correct classification, confidence increase, error detection, tool
  connection, and skill activation, in addition to module and Core completion.
  Feedback does not spam, write rewards, or leak one player's state to another.
- FR-010: The capstone eventually stages the plan's Research Station delivery
  story: identify the medical crate, navigate, use a scanner, choose the open
  route, execute a reusable delivery skill, and verify the destination before
  the one-time AI Agent Badge. Retained seed/dock/classification mechanics may
  support this, but merely renaming their props does not establish those six
  player actions.

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
For a wrong command, Pix names the attempted action and the action needed at
that step, explains that order matters, and resets only that player's attempt
without revealing the full four-command solution in the failure message.

### AC-003: Remaining zone presentation

Given a player reaches any mapped zone, when they read its start, help,
completion, replay, and journal text, then the AI concept is accurate,
age-appropriate, and contains no obsolete player-facing zone or badge name.

### AC-004: Progress and safety

Given two players use a migrated game concurrently, when either player makes a
wrong attempt, completes, or replays, then only that player's attempt and
reward state change; neither player is eliminated or blocked by a timer.
Given a Pattern Scanner player with an earned badge chooses Replay all, when
they leave and reclaim the station, then their replay resumes at its selected
challenge instead of jumping back to challenge 3; their badge stays earned
and another player's challenge stays unchanged.

### AC-005: Completed Core guidance

Given a player has all eight AI Core modules online, when they open their
personal journal, then it reports the Core as restored rather than asking
them to restore offline modules. Another player's incomplete journal remains
unchanged.

### AC-006: Discovery Trail explanation before the next note

Given a player correctly checks Pix's four-crate prediction, when they choose
the correct answer, then they first see that Pix predicted five but only four
crates are present and why the answer should be checked. They can then choose
the next Human Decision field note, retry the crate-count question, or close
the panel. The optional flow grants no badge or main-route progress.

### AC-007: Tool Lab unclaimed instructions

Given any AI Tool Lab station has no claimant, when a player reads its
introductory board before or after Verse refresh, then they see the same
numbered station instruction to choose a tool for each request. The visible
Scan Object and Announce Result controls, their existing device bindings,
and reward behavior remain intact.

### AC-008: Confidence and Error Lab entry boards

Given a Confidence Core or AI Error Lab station has no claimant, when a player
reads its board before or after Verse refresh, then the numbered station text
and claim instruction agree. Error Lab also tells players to check Pix's
result for a mistake. Puzzle controls and rewards remain unchanged.

### AC-009: Personal Agent Mode celebration effect

Given a player earns the AI Agent Badge for the first time in the round after
restoring the first seven modules, when the tracker completes, then a brief
non-looping cosmetic effect plays for that player alongside the existing
personal AI Core UI celebration. Another player's progress and reward state
remain unchanged, and replay does not duplicate the badge or finale effect.
Given that personal finale UI is visible, when the round resets, the player
respawns, or the player departs, then the old celebration closes immediately;
an expired earlier display must not remove a later celebration, and a finale
queued before a round change must not appear after the new round begins.

### AC-010: Skills and Agent station entry boards

Given an AI Skills Lab or AI Agent Mission station has no claimant, when a
player reads its entry board before or after Verse refresh, then it shows the
same station number and lesson wording. Existing claim, puzzle, and reward
bindings remain unchanged.

### AC-011: Personal module restoration cue

Given a player earns any of the first seven AI module badges for the first
time in the round, when its existing tracker completes, then a brief
non-looping cosmetic restoration cue plays at that player. A second player's
progress is unaffected, and replay does not repeat the cue or award.

### AC-012: Saved badge tracker text

Given any of the eight AI badge trackers is inspected before or after Verse
initialization, when its title and description are shown, then its saved
defaults agree with the existing Verse badge title and description. Its
Individual sharing, target, and reward bindings remain unchanged.

### AC-013: Classifier tracker target consistency

Given the AI Classifier badge Tracker has not yet been initialized by Verse,
when its saved target is inspected, then it is one completion, matching the
existing `SetTarget(1)` and one-time `SetValue(player, 1)` logic. Individual
sharing and all player progress, bindings, and reward guards remain intact.

### AC-014: Personal module restoration sound

Given a player earns one of the first seven AI module badges for the first
time in a round, when the tracker completes, then a short success sound plays
for that player alongside the cosmetic module cue. It does not auto-play,
loop, change a reward, or notify another player as if that player's module
were restored.

### AC-015: Distinct personal Core completion sound

Given a player earns the final AI Agent Badge for the first time in a round,
when its tracker completes, then a distinct brief celebration sound plays
for that player alongside the existing final visual cue. Replay does not
repeat the sound or duplicate the badge, and another player's progress is
unaffected.

### AC-016: Cosmetic hub Core pulse

Given any player earns one of the eight AI module badges for the first time
in a round, when its existing tracker completes, then Pix's hub Core plays a
brief non-looping visual pulse at the Core. The shared pulse is cosmetic and
never changes or claims another player's module status; personal status
remains in each player's journal.

### AC-017: Pix helper figure at the hub

Given a player spawns at the academy hub, when they look toward the first
route, then a small friendly Pix helper figure is recognizable near the
approach without obscuring route signs or blocking movement. It is decorative
and has no device, reward, or progress binding.

### AC-018: Pattern Scanner robot visual

Given a player approaches any of the four Pattern Scanner stages, when they
look at its moving robot, then it reads as a friendly robot rather than an
unmarked cube. The visual additions move with the existing robot prop and do
not change its collision, puzzle movement, device references, or rewards.

### AC-019: Skills and Agent robot visuals

Given a player reaches AI Skills Lab or AI Agent Mission, when they look at
any of the four station robot props in that zone, then it reads as a friendly
AI robot rather than an unmarked cube. Decorative parts remain attached to
the existing props, with no new collision or change to station logic,
device references, or reward state.

### AC-020: Error Lab classification result status

Given a player runs the classification challenge in AI Error Lab, when the
board shows expected Food/Vehicle categories and actual Apple/Car routes,
then it also shows a short running, match, or mismatch status. On a mismatch,
the player can still correct only the rule and rerun; progress and rewards
remain unchanged until the existing completion guard succeeds.

### AC-021: Pattern Scanner explanation matches its puzzle

Given a player asks for help or completes Pattern Scanner, when they read
Pix's explanation, then it describes the station's repeated Move pattern
and the player's prediction without claiming that all patterns repeat or
that the prop learned from the player's attempt. Badge ownership and replay
behavior remain unchanged.

### AC-022: Agent Mission unlock is visible before claiming

Given a player approaches an unclaimed AI Agent Mission station, when they
read its board, then it states the Research Station restoration goal and that
the first seven AI Core modules must be online before they can claim the
mission. A player with fewer modules still
receives the existing locked response; an eligible player's claim and earned
badge replay continue through the existing per-player gate.

### AC-023: Visible zone-to-Core data path

Given a player restores any AI Core module for the first time in a round,
when its existing badge completion fires, then the player can see a brief
zone-to-Core data or energy connection and the central Core responds. Another
player's journal and badge state stay unchanged. A replay does not claim or
restore the module again. The route names the completed module and reads the
earning player's current `n/8` Core count from the journal's existing badge
sources, without writing a second progress value. If the round changes, the
player respawns, or the player departs during the animation, its old route
closes; a route queued before Round Begin must not appear in the new round.

### AC-024: Distinct action feedback sounds

Given a player performs a successful scan, classification, confidence clue
change, error check, tool connection, or reusable skill activation, when the
corresponding action actually occurs, then they hear a brief concept-specific
cue without unrelated players hearing it. Repeated button presses that do
not perform the action do not create extra sounds or rewards.

### AC-025: Confidence clue target and useful retry feedback

Given a player reaches Confidence Core challenge 2, when the challenge starts,
then Pix's displayed confidence is 40% and the target is 100%. Each accepted
manual adjustment changes the displayed value by 10%, bounded by 0% and
100%. If a manual or repeated-clue run misses its target, feedback states the
actual and target values and explains which adjustment or clue count to
revise. The existing door, replay, badge, and per-player progress guards remain
unchanged.

### AC-026: Classifier wrong-route explanation

Given a player sends Apple, Puppy, or Car to the wrong AI Classifier
destination, when the safe retry feedback appears, then it names the chosen
and correct categories, gives an age-appropriate reason for the correct
category, and invites another try. The existing item queues, destination
mapping, reset behavior, and one-time Classifier Badge remain unchanged.

### AC-027: Agent Mission human verification before reward

Given a player has chosen the open Dock route and run `DeliverPackage` in
the AI Agent Mission's final stage, when the delivery skill finishes, then
Pix asks the player to verify the Medical crate's Animal Research Station
destination and the existing Next control becomes a clear Verify action.
The optional Apple/Car tests are not required. The AI Agent Badge is not
awarded until that player confirms. Releasing the station, replaying,
resetting the round, or changing the route/connection cannot bypass
verification or create a duplicate reward; another player's mission state
remains independent.

### AC-028: Complete Agent Mission delivery story

Given a player has restored the seven prerequisite modules, when they play
the capstone, then they identify the Medical crate for the Animal Research
Station, navigate to the transport/scanner point, use a scanner to reveal the
blocked Bridge and open Dock routes, choose Dock, execute a reusable delivery
skill, and explicitly confirm the destination before the existing one-time
AI Agent Badge and final restoration celebration. Wrong choices allow safe
retry; replay does not duplicate rewards; another player's progress is
independent. The six actions must be observable in the running island, not
inferred solely from instructional text.

### AC-029: Capstone scanner and route decision

Given a player reaches the Agent Mission's final stage, when they connect
the Scanner to the destination marker and run the scan, then they see `Bridge:
BLOCKED` and `Dock: OPEN`. The immediate result presents those facts and
asks the player to choose an open route without naming the correct button.
Before that scan, route selection is unavailable.
Choosing Bridge after the scan gives a safe, explanatory retry; choosing Dock
allows the delivery skill and later Verify action. The retained Apple/Car
classification tests are optional practice, not a capstone prerequisite.
The Run control names the blocked Bridge choice until Dock is selected,
then identifies its Apple/Car test as optional rather than suggesting it is
the next required mission step.
Editing the connection or replaying clears the scan, route choice, and prior
test passes as appropriate; no badge is awarded by a scan or a route choice.

### AC-030: Medical crate selection and visible prop

Given a player starts the Agent Mission's delivery stage, when they cycle the
Food, Medical, and Mechanical supply choices, then the chosen crate is named
on the plan board and only Medical permits the existing Pickup/Move/Drop
sequence toward the Animal Research Station. A wrong choice explains why and
allows immediate retry without moving the prop or awarding progress. The
three choices are represented by distinct, labeled crates at the station;
the moving Medical object remains bound to
the same creative prop reference with its collision and motion safety intact.
The four stations and their saved defaults agree with the runtime text.

### AC-031: Reusable delivery skill before final verification

Given the player has scanned the destination and chosen Dock, when they press
the mission's Next control, then it
offers `Run DeliverPackage skill` rather than immediately offering Verify.
Running that skill visibly reuses the known Pickup, Repeat Move, and Drop
sequence with the Medical crate, shows each action on the execution board,
and only then enables the separate confirmation of delivery to the Animal
Research Station. The delivered Medical crate and station marker remain
visible while Verify is offered, including after a release and reclaim;
pressing Run at that point does not replace the delivered scene with optional
classification practice. If another player joins during the delivery
animation, the join refresh does not hide the moving Medical crate or reset
the owning player's action trace. A replay, round reset, or edit that invalidates the route
clears skill completion. The skill itself never awards the Agent Badge;
the existing one-time reward remains behind the final Verify action.

### AC-032: Navigate to the destination scanner

Given a player begins the Agent Mission's final stage, when they choose
`Move` and `Repeat 2` and press Run, then the robot visibly travels from its
start point to a labeled scanner/transport marker before the scanner tool
can be used. Choosing Light or the wrong repeat count gives a safe, specific
retry without moving the robot or revealing the Bridge/Dock result. A later
Run with the Scanner connected to the marker performs the scan. The four station markers and
their saved text agree with this sequence. Replay or a new round returns
the robot and per-player navigation state to the start; navigation alone
never awards progress or a badge. The initial board and status prompt ask
the player to use the visible marker without revealing the required repeat
count; first Help encourages counting, and worked Help may name `Move x2`.

### AC-033: Dock-to-delivery capstone gate

Given a player has reached the scanner and seen its Bridge/Dock result,
when they choose the open Dock route, then the mission immediately offers
`Run DeliverPackage skill` without requiring Apple/Car sorting tests.
Choosing the blocked Bridge route does not offer the skill and explains the
retry. The retained Apple/Car controls may be used as optional practice but
their pass flags do not gate delivery or the badge. After the skill, Verify
confirms the Medical crate's Animal Research Station destination; only that
Verify action may award the existing one-time badge. Replaying or changing
the route clears the skill and final confirmation state. If the player touches
an optional Apple/Car rule or cargo control after the skill but before Verify,
the delivered Medical crate stays pending and Pix redirects them to Verify.

### AC-034: Discovery Trail plan examples

Given a player visits the optional AI Discovery Trail, when they open the
Pattern field note, then they see `1, 2, 1, 2, 1, ?`, can choose `1` or `2`,
and only `2` receives the correct prediction explanation. When they open the
Classification field note, then Banana can be sorted into `Food`, `Animal`,
or `Machine`; only `Food` is correct and its explanation names why Banana
belongs there. The saved signs match the questions. These answers affect
only the player's open field note, not the main route, badges, or another
player's panel.

### AC-035: Independent Human Decision field station

Given a player walks the optional AI Discovery Trail, when they reach its
fourth Human Decision sign and Button, then they can open the Route A/Route B
question directly without first answering Check Pix. Route A is described as
closed and gives a safe retry; Route B explains why new information overrides
Pix's suggestion. The existing Check Pix `Next field note` link still works.
The fourth entry is bound to the same player-local panel controller and never
writes badge or main-route progress. Its sign and Button saved defaults agree
with the Verse prompt, and the actors do not obstruct the walking path.

### AC-036: Tool Lab scanner, speaker, and distractor

Given a player enters AI Tool Lab, when they choose a tool for `Scan Object`,
then Scanner opens the mystery crate and the result board names its contents;
Speaker or Light gives a safe wrong-tool result and allows reconnection. In
the demonstration challenge the player identifies which request caused the
shown tool to run. In the final challenge, `Scan Object` must activate only
Scanner and `Announce Result` must activate only Speaker; Light remains a
selectable but incorrect alternative. The response board distinguishes
scanner, speaker, and light actions, and saved Button/board defaults agree
with the runtime prompts. Only the existing three-challenge completion may
award Tool Master Badge, once per player.

### AC-037: GrowPlant skill name

Given a player reaches AI Skills Lab, when they read the saved controls or
run any of its three challenges, then the reusable skill is named GrowPlant
throughout the controls, plan, execution trace, help, and badge description.
Its retained Water, Plant, Wait, Harvest actions, single-use, two-bed, and
three-repeat puzzles behave exactly as before. The same player-specific
progress, device bindings, retry flow, and one-time badge remain intact.

### AC-038: Pix's final lesson recap

Given a player earns the AI Agent Badge, when Pix announces Agent Mode or
the fully restored Core, then the dialogue recalls instructions, patterns,
classification, uncertainty, mistake checking, tool use, and reusable skills,
and reminds the player to check important decisions. The existing completion
gate, per-player journal, and one-time celebration/reward triggers remain
unchanged.

### AC-039: AI agent explanation at mission entry

Given a player approaches an unclaimed AI Agent Mission station, when they
read its entry board, then it explains in simple words that an AI agent can
receive a goal, make choices, use tools, and take actions to finish a task.
The board still identifies the Research Station mission, seven-module unlock,
and three stages; all four saved defaults agree with runtime text.

### AC-040: Optional classifier mistake check

Given a player has finished all three AI Classifier challenges, when they
press Help on the completed final challenge, then an optional personal
question asks whether Pix's `Dolphin > Fish` prediction is correct. Choosing
No explains that a dolphin is a mammal and why AI results need checking;
choosing Yes gives a safe retry. Closing or replaying leaves the regular
Classifier controls usable. This note grants no extra badge and cannot
change another player's progress or UI.

### AC-041: Error Lab scanner and overshoot examples

Given a player starts AI Error Lab challenge 1, when they read Pix's plan,
then the task is to reach the scanner at tile 3 and one wrong Move command
prevents it. The existing tile-3 sign visibly marks that scanner. Given they
start challenge 2, Pix's saved plan uses Repeat 4,
so running the uncorrected plan visibly reaches Station 4 instead of the
expected Station 3. Editing the single faulty command or repeat count and
rerunning still solves the respective puzzle; hints, safe retry, and the
one-time AI Detective Badge are preserved.

### AC-042: Pattern Scanner color prediction

Given a player claims Pattern Scanner challenge 1, when they see the example
`Blue, Yellow, Blue, Yellow, Blue, ?`, then the existing Count control cycles
Blue, Yellow, and Green predictions and Run checks the selected color. A
wrong prediction explains the repeating pair and allows immediate retry;
Yellow explains the pattern and unlocks the existing Repeat-Move parcel task.
That task still completes challenge 1, while challenges 2–3, per-player
progress, and the one-time Pattern Badge remain unchanged. Reclaiming or
replaying challenge 1 shows the color question again.

### AC-043: Fix the Prompt data-cube order

Given a player claims an optional Fix the Prompt station, when they read the
starting program, then it asks Pix to find a blue data cube, pick it up, scan
it, and only then walk to the scanner. Swapping slots 3 and 4 produces Find
Cube, Pick Up Cube, Walk to Scanner, Scan Cube. Running the wrong order stops
with a clear retry; running the corrected order shows four steps and the
planned prompt-improved message. The existing per-player state, four slot
controls, stage-prop bindings, and no-extra-badge behavior remain unchanged.
All four stations' saved stage labels agree with the program.

### AC-044: Confidence Core cat clues

Given a player claims Confidence Core challenge 1 for the first time or
replays it, when they read the display, then Pix predicts CAT at 40%
confidence and the goal is at least 70%. Each accepted +10% update through 70%
reveals one useful clue in order: pointed ears, whiskers, tail. A wrong
confidence value below the threshold allows revision without punishment.
Challenge 2 still starts
at 40% and targets 100%; challenge 3 still uses repeated +20% updates. The
same per-player progression, controls, door, and one-time badge remain intact.

### AC-045: Classifier apple introduction

Given a player starts AI Classifier challenge 1, when they read the incoming
queue, then it contains APPLE only and offers Food, Animal, and Vehicle as
visible choices. Food routes APPLE correctly and completes that challenge;
Animal or Vehicle runs the existing wrong-route explanation and safe retry.
Challenges 2 and 3 keep their existing queues and complete-rule evaluation,
and the one-time Classifier Badge and per-player state remain unchanged.

### AC-046: Confidence Core mystery cat visual

Given a player claims Confidence Core challenge 1, when they inspect the
preview door, then a recognizable non-colliding cat object waits behind it
and becomes visible when the confidence threshold opens the door. The cat is
hidden for unclaimed stations and challenges 2–3, so it does not misrepresent
their tasks. All four stations use the same visual treatment; door motion,
device references, per-player progression, and badge logic remain intact.

### AC-047: Discovery Trail count the evidence

Given a player reaches the optional Check Pix field note, when they inspect
the station, then exactly four visible data crates are grouped near the sign.
Pix predicts five, but neither the sign nor the question reveals the true
count before the player chooses Yes or No. No gives the existing evidence
explanation; Yes safely invites a retry. The four crates are decorative and
non-colliding, and this activity remains optional with no badge or main-route
progression write.

### AC-048: No mandatory island timer or combat end condition

Given a player starts the academy alone or with a partner, when they explore
and retry lessons at their own pace, then the round does not end because a
time limit expires or an elimination target is reached. The saved Island
Settings specify no round time limit, and the level contains no combat or
Timer device that imposes a lesson deadline. Existing safe retries and
reward guards remain unchanged.

## Out of scope for this feature slice

- Replacing functional Verse classes, devices, or persistent reward IDs merely
  to match the new names.
- Treating optional AI Discovery Trail content as a main-route prerequisite.
- Claims that AI is always correct, understands like a human, or learns from
  every player interaction.
