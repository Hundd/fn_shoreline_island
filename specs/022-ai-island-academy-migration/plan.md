# Implementation plan

## Current-system audit

| Concern | Existing owner | Dependency chain |
| --- | --- | --- |
| Prompt Badge and journal source | `byte_island_game_manager` | Data Core Rescue controller -> one-time award -> `player_states` -> tracker |
| Pattern Scanner | `fn_shoreline_island_loop_station/progress` | Claim/input -> per-player state -> station display -> tracker |
| AI Classifier | `fn_shoreline_island_signal_station/progress` | Claim/routing -> per-player state -> HUD/board -> tracker |
| Confidence Core | `fn_shoreline_island_energy_station/progress` | Claim/value buttons -> per-player state -> board -> tracker |
| Error, Tool, Skills, Agent zones | respective `*_station/progress` files | Claim/input -> per-player state -> board/HUD -> tracker |
| Hub labels | `fn_shoreline_island_hub_signs` | static billboards -> alternating display refresh |
| Journal/recommendations | `fn_shoreline_island_academy_journal` | existing managers/trackers -> player UI -> recommendation |

Existing state maps and tracker assignments already scope progress and rewards
to individual players. Presentation changes must not alter those links.

## Delivery order

1. Create and maintain this feature specification, audit, and verification
   record.
2. Convert global narrative, hub labels, journal labels, zone labels, and badge
   display text to the AI Island Academy Theme Shell.
3. Convert Prompt Lab presentation and explanation; build and playtest its
   correct, wrong, retry, reward, replay, and multiplayer paths.
4. Convert the remaining zones one at a time in route order, verifying each
   before moving on.
5. Add hub AI Core feedback and the final Agent Mission presentation only after
   the existing progress model is confirmed sufficient.
6. Perform project validation, memory calculation, solo end-to-end testing,
   and multiplayer testing; record results before marking requirements done.

## Implementation choices

- Keep names such as `byte_island_game_manager` and `energy` internally during
  migration. Their editor bindings and persistence behavior are higher risk
  than the player-facing benefit of a rename.
- Convert UI text first. World props, signs outside Verse, VFX, audio, and
  island metadata require separate UEFN inspection and are not inferred from
  source searches.
- Feature 023 supersedes the earlier four-step Prompt Lab input plan with
  Data Core Rescue. Keep `byte_island_game_manager` as the journal's one-time
  badge source while the new physical mission owns player-local attempt state.
- Fix the Prompt keeps its optional four-slot swap mechanic but now uses the
  plan's blue data-cube scanner scenario. A preparatory Find Cube slot leaves
  Pick Up Cube, Walk to Scanner, and Scan Cube as the ordered task; swapping
  the initially inverted slots 3 and 4 repairs the prompt. The saved stage
  signs, cube props, and no-extra-badge behavior remain tied to that logic.
- Pattern Scanner now starts challenge 1 with the plan's Blue/Yellow/Green
  next-color prediction. The correct Yellow answer unlocks the retained
  `Repeat [Move]` robot task; the later `[Move + Light]` and target-change
  challenges keep the existing badge route. The optional Discovery Trail
  still has its separate next-item pattern question. When Replay all wraps
  from challenge 3 to 1, store that selected stage in the existing per-player
  Pattern Scanner progress object so leave/reclaim resumes the replay without
  clearing the already-earned badge.
- Bring the optional Discovery Trail's source examples into line with plan
  sections 68-69: `1, 2, 1, 2, 1, ?` predicts `2`, and Banana has three
  classification choices (`Food`, `Animal`, `Machine`) with a Food explanation.
  Expand only the local field-note UI for the third choice, align the two
  saved signs through UEFN, and do not write badge or main-route progress
  (AC-034).
- Add a fourth, independently accessible Human Decision field-note Button
  and sign near the optional trail's existing stations. Bind them to two new
  editable fields on the same Verse controller; the Button opens the existing
  per-player Route A/Route B panel, and the sign refreshes with the other
  field-note signs. Keep the Check Pix `Next field note` link and avoid
  progress/reward writes. Place through UEFN on walkable ground without
  blocking the promenade, save the actors and controller, and read back all
  references and text (AC-035).
- Align the four AI Classifier moving-item board defaults with the existing
  runtime `INCOMING ITEM QUEUE` label. The underlying cargo-routing actors and
  item IDs remain unchanged.
- On a wrong Classifier route, augment the current actual-versus-expected
  result with a short item-specific reason (Apple/Food, Puppy/Animal, or
  Car/Vehicle). Keep the safe retry and all authored queues/rules unchanged;
  this closes the plan's `what happened / why / what next` feedback gap
  without altering classification or reward state (AC-026).
- Map AI Tool Lab's existing two request controls to `Scan Object` and
  `Announce Result`. Cycle each connection among Scanner, Speaker, and the
  Light distractor; Scanner opens the existing crate/chute and reveals its
  contents on the response board, Speaker plays the existing player-local
  Audio Player and announces a result, and Light retains the existing lamp
  animation as a wrong-tool result. Keep demonstration cause/effect, the
  two-input final test, per-player state, and the one-time tracker guard.
  Reconcile saved Button/board defaults through UEFN (AC-036).
- Express Confidence Core's existing integer values as a display-layer percent
  mapping only after inspecting all relevant board strings and station flow.
- The migration plan's second Confidence challenge explicitly starts at 40%
  and aims for 100%. Keep the existing 0-10 integer range and 10%-per-button
  display mapping, but author that challenge's start/target fixture as 4/10.
  Keep the third challenge's repeated +20% clues and 60% target unchanged.
  Give target-miss feedback a mode-specific reason and next adjustment, with
  no new reward or progress state (AC-025).
- Reconcile all four AI Skills Lab stations' bound control Billboards with
  their `label_texts` Verse values. Keep the skill-definition and plan-slot
  controls distinct; the saved defaults should name both the reusable skill
  steps and the skill/Move choices without changing puzzle logic.
- Align the player-facing skill name with the implementation plan's
  `GrowPlant` example while retaining its explicitly permitted Water, Plant,
  Wait, Harvest actions. Update Verse text and saved Billboard/Button/Tracker
  defaults in all four Skills Lab stations; do not change the Care evaluator,
  device references, or rewards (AC-037).
- Align both Agent Mission completion HUD variants with the final Pix lesson
  recap in implementation-plan section 65. Change only localized messages;
  keep the completion gate, journal count, one-time badge, and existing
  celebration triggers intact (AC-038).
- Add the implementation plan's simple agent definition to the four Agent
  Mission entry boards, retaining the mission, unlock, and stage guide. Save
  and read back the four board defaults through UEFN (AC-039).
- Add the plan's optional Dolphin/Fish mistake example behind Help after
  the completed final Classifier challenge. Use a player-local question with
  Yes/No/Close and a Mammal explanation; do not alter classification routing,
  badge guards, or the required challenge sequence (AC-040).
- Make Error Lab's first two existing puzzles express the plan's scanner
  destination and Station 4 overshoot. Preserve the marker mover, single
  editable element per challenge, expected Station 3 result, hint levels,
  and reward state. Relabel each existing tile-3 endpoint sign `SCANNER`
  through UEFN without moving it (AC-041).
- Prepend the implementation plan's blue/yellow/green prediction to Pattern
  Scanner challenge 1 using its existing Count and Run controls. Correct
  Yellow unlocks the retained Repeat-Move parcel task, which still owns the
  challenge completion. Keep the three-stage progress and one-time badge
  path intact (AC-042).
- Present Pix AI Core's online-module count in the personal journal by reading
  the same per-player badge sources; it does not write, assign, reset, or
  otherwise alter those sources.
- Use that same read-only count to select the journal's guidance line: restore
  remaining modules below 8/8, and celebrate a fully restored Core at 8/8.
  Keep the journal per-player; do not add a second progress store.
- Agent Mission stations use the bound journal only as a read-only authority:
  after the existing one-time Agent Badge completion, the full-Core finale is
  shown only when that player's journal count is 8/8. Otherwise the normal
  Agent Mode completion message is shown.
- The Agent Mission retains its three-stage progression and one-time reward
  path. The first two stages are Medical-crate and pattern-dock practice;
  together they cover the plan's six capstone actions within the existing
  station controls: identify Medical in the first stage, then navigate to
  the scanner, scan the destination, choose the open Dock route, run
  DeliverPackage, and Verify at Animal Research Station in the final stage.
  Apple/Car classification tests remain optional final-stage practice. The
  physical plan, repeat, tool connection,
  classification, and reward mechanisms remain in place; the full sequence
  and its solo/multiplayer behavior still require an in-client check.
- Align the four Agent Mission stations' fixed control-label defaults with
  their existing runtime Verse labels: `Change test item`, `Choose
  classification rule`, and `Change starting energy (0-6)`. This removes
  leftover cargo shorthand while retaining energy as the dock-light resource.
- Reconcile the complete four-station Agent Mission `refresh_labels` set with
  its saved UEFN Billboard defaults. The same exact labels should be visible
  before and after Verse refresh, including the agent-plan controls, Launch
  connection, help/replay, and the two-line Home/Planter markers. Preserve
  all existing actor references and station state.
- First-time Agent Mission claims are locked below seven restored modules;
  earned Agent Badge replays remain allowed. The attempted typed binding of
  a classic VFX Spawner to a Verse device remains unsupported in this UEFN
  MCP build; direct device bindings are used for cosmetic VFX instead.
- A direct device binding avoids that typed Verse field for a personal
  cosmetic finale: the existing Agent Badge tracker's `When Complete` event
  targets a VFX Creator's `SpawnAtPlayer` function. The effect is cyan,
  gameplay-only, event-started, and non-looping. Keep the tracker's one-time
  value write and all reward logic untouched. A separate shared hub Core
  pulse now covers the central cosmetic response; both effects require an
  in-client check before AC-009 or T-006 can be accepted.
- Use a separate, smaller player-local VFX Creator for the first seven AI
  module restorations. Bind each existing badge tracker's `When Complete`
  event to its `SpawnAtPlayer` function. This gives a visible completion cue
  without a shared hub state or a second progress store; leave the distinct
  Agent Mode finale effect separate. The effect and per-player instigator
  behavior still require an in-client check.
- The 8/8 branch instead shows a personal eight-second cyan UI restoration
  overlay from the existing journal device. It is spawned only from the
  existing first-time Agent Badge completion path and carries no input or
  progress-writing behavior. Track each player's overlay and a display
  generation in the journal so round reset, respawn, and departure close it;
  the eight-second expiry may close only the display it created. Preserve the
  one-time badge guard and all tracker bindings. Pass the progress device's
  round generation to the asynchronous overlay and compare it with the
  journal's round generation before adding a canvas. Both devices listen to
  the same Round Begin event, so either callback order rejects a stale award.
- The main static hub billboard gives the first-route instruction rather than
  attempting to mirror personal module completion globally: each player sees
  their actual eight-module state in the journal, preserving the existing
  independent-progress model.
- Align the bound hub journal Billboard's saved default with its current
  Verse message. The sign should name the AI Core Journal and direct players
  to its personal status display even before the Verse refresh runs.
- Reconcile all thirteen bound hub Billboard defaults against the exact
  `hub_static_sign_refresh` Verse declarations. Correct the four Prompt Lab
  step defaults and any route wording drift through UEFN, preserving the
  existing device bindings and sign-refresh behavior.
- Use a backed, static Billboard frame with a TextRender child near the Pix
  AI Core for the eight module names. The editor viewport showed this layout
  readable from the hub approach. Keep per-player ONLINE/OFFLINE states in
  the journal; the decorative sign has no reward or progress binding.
- The fixed hub title describes the restoration goal and the seven-module
  Agent Mode unlock condition without claiming that the initial offline or
  locked state still applies after a player has progressed. Pix's spawn HUD
  also states the restoration goal without a fixed offline count, since it is
  shown again on respawn. The personal journal provides each player's live
  status.
- In the optional Discovery Trail, show the correct four-crate answer and its
  AI-mistake explanation before offering the Human Decision field note. Reuse
  the existing per-player panel and generation guard; add no progress write or
  reward. Keep retry and close available on the answer page.
- Name Pattern Scanner and AI Agent Mission explicitly in their remaining
  generic `robot station` claim guidance. This is HUD wording only; retain the
  same station ownership, claim gates, and device bindings.
- Reconcile the four Pattern Scanner introductory board defaults to each
  station's `available_text` Verse value so the saved level and runtime display
  agree before a claim. Preserve the boards' existing bindings and placement.
- Reconcile the four AI Classifier introductory boards to their numbered
  `available_text` Verse values. A direct live read showed the Fix the Prompt
  boards already match Verse despite stale inventory rows, so correct that
  inventory only and do not rewrite those actors.
- Give the four AI Tool Lab introductory boards and their `available_text`
  source one numbered instruction: choose a tool for each request. This keeps
  the existing helpful entry cue while making saved and runtime text identical.
  Do not alter Supply/Beacon input IDs, actions, device links, or rewards.
- Number the four saved Confidence Core introductions to match their current
  `available_text` without changing Verse. For AI Error Lab, keep the helpful
  `Check Pix's result` cue but qualify it as a mistake check; use the same
  numbered three-line text in Verse and all four saved boards. Preserve the
  existing claim flow and gameplay bindings in both zones.
- Number the four saved AI Skills Lab and four AI Agent Mission entry boards
  to match their existing `available_text` messages exactly. Change only
  Billboard text; preserve all station bindings, puzzle logic, and rewards.
- Reconcile the eight existing badge Trackers' saved `trackerTitle` and
  `descriptionText` fields with the Verse `badge_title` and
  `badge_description` declarations. Do not touch `sharing`, `targetValue`,
  persistence, or event bindings.
- Separately correct the AI Classifier tracker's pre-existing saved target
  from 10 to 1. Verse already sets a target of 1 before player assignment and
  writes value 1 on first badge completion; the saved target should agree
  before initialization. Do not modify individual sharing, completion
  bindings, per-player values, or the one-time reward guard.
- An initial audio audit found no previously placed Audio/Speaker actor,
  identifiable project audio clip, or Verse audio-player reference. Prefer a
  short Creative-owned cue over adding a silent device; treat further audio
  variety and final timbre/volume as a later in-client polish pass.
- A Creative-owned `SkilledInteract_Success_Cue` is available in the editor
  and reports a 1.2-second duration. Use one Audio Player for the first seven
  badge tracker `When Complete` events, set it to event-only playback heard by
  the instigating player at their location, and keep it hidden in game. Use a
  distinct final Agent Mode sound; verify actual volume, timbre, and
  multiplayer scope in-client before acceptance.
- The Audio Player's built-in Creative radio `Stinger_Accent_01_Cue` reports
  a 3.06-second duration and offers a distinct final sound without importing
  an asset. Use a separate event-only, instigator-only Audio Player bound to
  the existing Agent Badge tracker's one-time `When Complete` event; preserve
  the final VFX and reward path. Audition and multiplayer-scope verification
  remain required before accepting it.
- Add a separate burst-only VFX Creator centered on the existing Pix AI Core
  actor and bind all eight one-time badge tracker completions to its
  `StartEffectAtDevice` function. This is an ambient shared pulse only: it
  neither changes the static legend nor writes progress, and each player's
  true module state remains in the journal. It is a partial visual step toward
  the plan's zone-to-Core energy path, not a persistent per-player hub status.
- Add a small static Pix helper figure near the hub spawn approach using
  existing academy materials and simple primitive components. The existing
  station robot props are plain teal cubes, so they are not a useful visual
  model on their own. Keep the new figure non-colliding and entirely
  decorative, with no Verse/device reference or personal state. Give the
  figure a compact `PIX` name label so its identity is clear at the hub. Inspect
  editor placement from the spawn path; in-client scale and navigation still
  need a later playtest.
- Give the four existing Pattern Scanner runtime robot props small eyes, a
  mouth, and a lit antenna using attached primitive components and existing
  academy materials. Keep every added component non-colliding and attached
  to its original moving prop. Do not replace or relink the robot actors;
  their Verse movement and reward path remain unchanged. Check editor views
  for visual placement, leaving actual animated movement to a later playtest.
- Extend that same attached, non-colliding face-and-antenna language to the
  four AI Skills Lab and four AI Agent Mission robot props. Reuse their
  existing teal cube bodies and academy navy/gold materials; leave the
  original actors, transforms, station bindings, and reward logic intact.
  Compare an editor view in each zone before repeating the placement.
- AI Error Lab's classification `cargo_result_text` already accepts a
  `status` parameter but omits it from the visible board. Display that
  parameter as a fourth, short line. Feed it compact running/match/mismatch
  phrases instead of the longer instruction/HUD feedback so the board keeps
  the expected and actual categories legible. Leave choice evaluation,
  retry, and the one-time AI Detective Badge guard untouched.
- Adjust only Pattern Scanner's generic hint and first-time completion HUD:
  refer to this particular repeated Move plan, then connect the player's
  prediction to the broader idea that AI can use patterns in examples.
  Avoid the blanket claim that every pattern repeats or any suggestion that
  the in-world prop trained itself during play. Keep the three-stage puzzle,
  badge tracker, and replay guard unchanged.
- Put the existing Agent Mode prerequisite on each unclaimed AI Agent
  Mission board: the first seven modules must be online before Claim.
  Keep this a shared rule, not a shared per-player status. Update the single
  Verse `available_text` template and all four saved Billboard defaults
  through UEFN; preserve their device references and the actual seven-module
  claim guard. Keep the Research Station restoration goal and the three stage
  names visible on the board; use separate short lines for the goal and gate.
- Reuse the existing Next control as a deliberate Verify action after
  `DeliverPackage`, before `complete_stage`. Ask whether the Medical crate
  reached Animal Research Station; retain the tracker, generation guard,
  replay, and reset paths. Restore the Next prompt whenever the route or
  connection is edited or the station is released. The earlier implementation
  verified both Apple/Car routes; those tests are now optional practice and
  cannot substitute for the delivery check (AC-027).
- Within the existing final-stage controls, present the former
  Launch-to-Dispatch connection as Scanner-to-destination-marker, then run
  an explicit destination scan. The scan reveals Bridge blocked and Dock open;
  repurpose the starting-energy control only in this stage as the Bridge/Dock
  selector. A blocked route stops safely, while Dock enables delivery skill
  execution; retained item tests remain optional. Make the Run control
  describe the blocked route until Dock is selected, then label item tests
  optional. Store scan/route state per player with the
  current stage attempt, reset it on replay/round and connection edits, and
  keep the four stations' shared progress/device references unchanged
  (AC-029). This is a path toward the full capstone, not its completion.
- The existing first-stage moving `seed` actor is a sand sphere
  in each of four stations. Keep its Verse reference and movement path but
  make it a small, clearly labeled Medical crate through UEFN. Place small
  static Food and Mechanical alternatives beside each Medical crate, with
  distinct colors and readable labels; make the crates non-colliding and outside
  the robot's movement path. Reuse the
  connection control only in stage 1 as a Food/Medical/Mechanical selector;
  require Medical before running Pickup/Repeat Move/Drop, and explain wrong
  choices safely. Present cell 3 as the Animal Research Station, update the
  four saved station labels/defaults to match, and leave the later Scanner
  connection role unchanged (AC-030). This is the crate-identification part
  of the six-action capstone, not the complete delivery skill.
- After the final stage's scanner and Dock choice,
  reuse the existing Next Button as `Run DeliverPackage skill` before Verify.
  Encapsulate a fixed, valid Pickup / Repeat Move three times / Drop trace
  from the same fixture used in the instruction stage; animate the same bound
  Medical crate and robot while showing each action. Store only a per-player
  `delivery_skill_complete` attempt flag. Reset it on replay/round and edits
  that invalidate the route, then expose the existing Verify gate. Do not
  award the badge from the skill. This implements the plan's permitted
  reuse-existing-skill fallback without new device references (AC-031).
- Keep the Medical crate at its delivered cell-3 pose and show the Animal
  Research Station marker after the skill, including when the owner reclaims
  the station. Hide the optional Apple/Car parcel while Verify is pending.
  Treat Run as a reminder to Verify after delivery so a late optional test
  cannot reset the delivered visual without resetting skill state (AC-031).
- Place the delivered crate in its original lane, 100 cm to the positive-Y
  side of the robot at cell 3. The four saved station layouts share this
  alignment; the prior 300 cm offset placed it about 380 cm from the
  Research Station marker and weakened the final visual check (AC-031).
- Defer the station's two-second late-join label refresh while a run is active.
  Every run path refreshes its own board after completion, so a joining player
  must not cause `show_stage_props` to hide the Medical crate mid-skill
  (AC-031; no ownership or reward-state change).
- Keep the retained Apple/Car sorting controls as optional classification
  practice in the final stage. Gate `DeliverPackage` on scanner reached,
  destination scanned, and Dock selected—not on the two test-pass flags.
  Bridge remains a safe retry, and only Verify may award the badge. Update
  player-facing prompts and clear skill completion on route-invalidating
  edits or replay. While the completed skill is awaiting Verify, optional
  rule/cargo controls should only remind the player to Verify; they must not
  invalidate the delivered crate or skill flag (AC-033).
- In the final stage, start the robot at its saved Home transform instead of
  teleporting it to the scanner-side position. Reuse the first command slot
  and Repeat controls for a `Move`/`Light` choice and a 1-4 repeat count;
  require Move x2 before Scan. Animate two 500 cm movements to the existing
  parcel-side robot position, guarded by the same per-run token. Store
  `scanner_reached`, `scanner_command`, and `scanner_repeats` per player;
  reset them on replay/round, but keep position after a Scanner connection
  edit. Place four small, labeled, non-colliding scanner markers beside that
  final position through UEFN. Do not change the existing robot/parcel or
  device references, and do not award a badge for navigation (AC-032).
- Keep the final-stage navigation puzzle discoverable: the entry board and
  first status prompt should point to the scanner marker without stating
  the two-Move answer. First Help asks players to count the distance; worked
  Help and safe wrong-attempt feedback may explicitly say `Move x2` (AC-032).
  The scanner result should present Bridge blocked and Dock open as new
  information, then ask for an open route; only worked Help or a wrong
  Bridge attempt should name Dock as the required choice (AC-029).
- Keep the two retained pre-final physical puzzles as training checkpoints,
  but label them plainly as Medical and pattern practice. The final-stage
  mission board must introduce the emergency-supplies story and the Animal
  Research Station rather than describing only scan/sort. Update all four
  saved mission-board defaults through UEFN to match the Verse availability
  text, without changing their bindings (AC-028).
- The current player-local restoration burst and shared hub Core pulse are
  only endpoints. Add a brief visible data/energy connection from the zone
  toward the Core for all eight first-time module awards without treating a
  shared world effect as personal progress. Keep the existing Tracker events
  as the only trigger and the journal as the only per-player status view.
  A static beam that appears before completion would misstate progress.
- The first connection implementation uses the journal's existing eight
  Tracker references. Each `CompleteEvent` shows only its earning player a
  brief animated, named module-to-Core data route; the already bound shared
  Core VFX pulses from that same first-award event. Show that player's current
  `n/8 MODULES ONLINE` on the route using the journal's read-only badge count,
  so each restoration visibly advances Pix's Core without a second state
  store. This is a UI data path,
  not a physical world beam. Keep the acceptance check open until it is seen
  in-client and judged clear enough to convey travel toward the Core. Capture
  the journal round generation when a badge completes and reject a queued
  route if Round Begin has since occurred. Close and invalidate the active
  route on spawn, departure, and round reset so a sleeping animation cannot
  revive old-round feedback.
- Add short action-specific sounds only at the actual successful scan,
  classification, confidence clue update, error check, tool connection, and
  skill activation events. Reuse a small cue palette and player-local playback
  where the editor supports an instigator; do not bind sounds directly to
  buttons when an unclaimed/invalid press would play them. The existing
  one-time module and final Core sounds remain separate.
- The first Classifier audio prototype confirmed the Verse success branch,
  but `SetDeviceProperty` rejected a classic Audio Player actor as a Verse
  field. A later probe found the correct wrapper's `savedActor` property and
  read back four Classifier station references to a dedicated, player-local
  Audio Player. The editor's Save Content dialog delayed the final build;
  after the owner saved changes, the editor log showed build success and all
  five actors were explicitly saved and read back. A separate Confidence Core
  cue now fires only on accepted +10% and applied repeated +20% clue updates;
  its four station references and Audio Player were also saved and read back.
  Binding the existing feedback HUD `ShowEvent` remains unsuitable because
  that HUD also displays invalid and wrong-answer messages.
- The same Verse-wrapper assignment was then applied to Pattern Scanner's
  first actual robot scan tile, AI Error Lab's detected mismatch, AI Tool
  Lab's accepted connection edit, and AI Skills Lab's first executable Care
  step per invocation. Six different short Creative cues now use six separate
  instigator-only Audio Players. All 24 station references and six player-local
  configurations were read back; in-client timbre, timing, and isolation still
  need a playtest before AC-024 can be accepted.
- Adapt the optional Fix the Prompt station to the implementation plan's blue
  data-cube scenario. Keep the existing four-command swap mechanic by making
  Find Cube a preparatory step before Pick Up Cube, Walk to Scanner, Scan Cube.
  Preserve the initial 3/4 inversion, progress structure, stage-prop bindings,
  and no-extra-badge rule. The stage props are already cube meshes; set their
  existing material override to the Academy navy and update their four saved
  labels per station and the Verse teaching text;
  runtime readability and retry behavior remain for the deferred playtest.
  Keep Help progressive: first prompt the player to reason about what must
  happen before a scan, then explicitly identify the swapped Walk/Scan slots.
- Align Confidence Core challenge 1 with the plan's obscured-cat example.
  Keep the existing 0–10 internal value scale and +10%/-10% controls, but
  start at 4, require at least 7, and present the three successive clue names on
  accepted positive updates. Preserve challenge 2's 4-to-10 fixture and
  challenge 3's repeat fixture, per-player state, door, and badge guard.
  This is a source/UI change; saved entry-board defaults remain appropriate.
  For the physical mystery-object cue, use the existing compact-able
  `SM_ClayTile_CatStatue_A` asset at each Confidence Core preview door. Add
  one Verse-bound, non-colliding cat prop per station, hide it when unclaimed
  or outside challenge 1, and reveal it only as the challenge-1 door opens.
  Keep the original preview-door binding and reward path untouched.
- Give Discovery Trail's Check Pix note physical evidence: four small,
  non-colliding data cubes on the clear foundation left of its sign, using
  the existing cube mesh and Academy material. Remove the true count from
  the pre-choice sign/question; Pix's prediction of five remains visible.
  Keep the correct/wrong explanation and optional, non-rewarding UI logic.
- Make AI Classifier's first queue a single APPLE to match the plan's
  introduction. Remove the challenge-1 exception that blocks the Animal
  category so all three visible destinations use the existing correct/wrong
  routing and explanation path. Keep the later queues and rule evaluator,
  the boat/dock references, and the one-time badge unchanged. Use a neutral
  first-stage rule board instead of exposing the answer before selection.
- Audit the loaded level's device classes and project Verse for combat and
  timed-end logic. The saved Island Settings retain a five-minute default
  value, but `roundTimeLimit_Override` is false and the owner confirmed the
  Time Limit control is unchecked. Keep it unchecked; enabling it selects
  five minutes. Do not mutate the legacy `timeLimit` field. Leave the
  in-client no-timeout check open while playtesting is deferred (AC-048).
