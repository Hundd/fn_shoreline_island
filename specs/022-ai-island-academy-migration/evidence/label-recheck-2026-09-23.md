# Label recheck — 2026-09-23

This read-only UEFN recheck supersedes the findings in the earlier
[label audit](label-audit-2026-09-23.md) where the text has since changed.
The [inventory](label-inventory-2026-09-23.csv) has been refreshed to match
this editor read-back. The loaded level is
`/fn_shoreline_island/fn_shoreline_island`.

## Verified updates

- Read all 552 saved Billboard texts, 329 Button settings, eight Trackers, and
  34 HUD Message devices with zero property-read failures.
- Compared the 552 Billboards with the prior read-back: 44 saved texts changed.
- The three former static route/start names now read **AI Error Lab**,
  **AI Tool Lab**, and **AI Classifier**.
- All 24 static AI Classifier dock/control destination labels now read
  **FOOD**, **ANIMAL**, or **VEHICLE**. Its four rule boards, four station
  boards, and hub route also have new AI Classifier text.
- Four AI Error Lab station boards and four AI Tool Lab station boards now use
  the new zone names.
- No unbound Billboard now contains a complete former island or zone name
  from the migration mapping.
- The 469 Verse `<localizes>:message` declarations are unchanged from the
  previous audit; the source search still finds former complete zone/badge
  names only in one internal fixture comment.

## Remaining saved-text mismatches

- Eight static Confidence Core controls still say **+1 ENERGY** or
  **-1 ENERGY**. Verse presents their action as **+10% / -10% confidence**.
- Sixteen static Fix the Prompt stage labels still say **1 WATERED**,
  **2 PLANTED**, **3 GROWN**, and **4 HARVESTED**. Verse teaches
  **Find Seed, Dig Hole, Plant Seed, Water**.
- Eight AI Error Lab static result labels still say **GARDEN** or
  **STORAGE**. Their intended new wording needs a design decision.
- `signal_2_how_to_play_sign` still says **CLAIM THE HARBOR**,
  **READ THE CARGO LABEL**, and **MATCHING DOCK**. These terms do not match
  the new AI Classifier station and item/category wording.
- 23 saved Billboard texts still contain complete former names, but all 23
  are bound to Verse devices with migrated message declarations. The
  Confidence Badge Tracker also stores an old Variable Vault description,
  and four Prompt Lab Buttons store old action verbs. Verse sets migrated
  text for these devices when it starts. The editor's saved defaults have
  not been changed.

The recheck verifies stored properties and source declarations. It does not
establish the final in-client appearance or when Verse replaces saved
defaults. At the end of the recheck, the UEFN session was disconnected and
the game state was unconnected.

## Remediation and post-change audit

- Inspected the live AI Error Lab behavior before changing its result labels:
  its Verse classification pairs use **Food** and **Vehicle**, so the eight
  saved `GARDEN` and `STORAGE` result labels now read **FOOD** and
  **VEHICLE**, respectively. This changes presentation only; device wiring,
  classification rules, and rewards were not changed.
- Updated and saved 55 Billboards: eight Confidence Core controls now read
  `+10% CONFIDENCE` or `-10% CONFIDENCE`; 16 Fix the Prompt labels now read
  `1 FIND SEED`, `2 DIG HOLE`, `3 PLANT SEED`, and `4 WATER`; the Classifier
  instruction sign now uses classifier/item/category wording; and the 22
  actual old bound Billboard defaults now agree with their Verse text.
- Updated and saved the four Prompt Lab Button defaults to `Find Seed`,
  `Dig Hole`, `Plant Seed`, and `Water`, plus the Confidence Badge Tracker
  default to `Solve all three Confidence Core challenges.`
- The initial remediation pass found and corrected 22 of the 23 old bound
  Billboard defaults. A later direct live-editor inspection found the missed
  hub title as the 23rd; see the hub-title follow-up below.
- Post-change UEFN property audit: all 552 Billboards, 329 Buttons, eight
  Trackers, and 34 HUD Message devices were read successfully. Zero specified
  stale labels or saved-text mismatches remain.
- No Verse file changed, so no Verse build was required. A fresh UEFN session
  launch was requested after the saves, but content updating exceeded the
  MCP call's five-minute timeout. The editor subsequently reported
  `Disconnected` and `Unconnected`; no game remained running. The available
  MCP toolset exposes no Project Validate command. The user had already
  reported successful project validation and memory calculation before this
  remediation.
- A human playtest is still needed to check the labels' in-client readability
  and the full correct/incorrect/retry flows, including multiplayer state.

## Confidence help-text alignment

- The saved Confidence Core controls use `+10% CONFIDENCE` and `-10%
  CONFIDENCE`; a source audit found two Verse help strings still referring to
  their legacy integer-facing `+1` / `-1` wording.
- Updated only those two localized messages to `+10%` / `-10%`. The existing
  integer state, target checks, player-specific progress, and reward guards
  were not changed.
- Verse `BuildAll` completed with zero diagnostics after the update.

## Repeated session-launch blocker

- After the clean Confidence Core build, a third fresh `StartSession` request
  again remained in UEFN `UpdatingContent` until the MCP five-minute call
  limit expired. Game state was `CanStart`, so no match had launched.
- A follow-up status poll returned `Disconnected` / `Unconnected`; no active
  playtest was left running and the editor remains open.
- This repeats the same unavailable-runtime condition recorded for the two
  preceding post-save session attempts. A human UEFN session or an editor-side
  resolution of the content-update stall is required for the outstanding
  in-client readability, solo-flow, and multiplayer verification.

## Agent Mission saved destination defaults

- A further review of the saved-label inventory found eight Agent Mission
  destination Billboards across four stations still storing `GARDEN | LEAF`
  and `STORAGE | PLAIN`. These category defaults were outside the earlier
  complete-zone-name filter. The bound Verse station already displays `Food`
  and `Vehicle` for Apple and Car.
- Changed each saved Billboard through UEFN to its exact Verse display text,
  read all eight values back, and saved all eight actors. The source, device
  bindings, route logic, and reward state were not changed. The inventory CSV
  now records the saved `Food` and `Vehicle` values.
- No Verse build was required for this saved-property change. In-client
  readability and mission-flow checks remain open under the user's request to
  skip validation and playtesting.

## Confidence Core repeated-clue wording

- Challenge 3 still exposed the old `Add 2` coding term in six Verse prompts.
  Rephrased the count, start, challenge, controls, ready, and worked-answer
  messages as repeated clue updates; each displayed update remains +20%
  confidence. No fixture, target, repeat count, player state, or reward logic
  changed. Verse `BuildAll` returned zero diagnostics.
- The four Count and four Start Button devices had blank saved interaction
  text. Set their saved text in UEFN to match the new Verse prompts, read all
  eight back, and saved all eight actors. The inventory now includes those
  saved Button rows and the revised Verse declarations.
- In-client readability and challenge flow remain untested under the user's
  instruction to skip validation and playtesting.

## Confidence Core saved value boards

- Four value boards still stored `ENERGY: 0 / TARGET: 3` even though their
  Verse unclaimed state displays `AI CONFIDENCE / Claim to begin`. Changed
  those four saved Billboard texts through UEFN, read them back, and saved
  their actors. The label inventory now records the current defaults.
- This is a presentation-only change; the separate Agent Mission energy
  resource and labels remain intact. No Verse build was needed for these four
  saved properties. In-client appearance remains untested as requested.

## Hub title follow-up

- Direct live UEFN inspection confirmed the academy title Billboard still
  stored `BYTE ISLAND ACADEMY`; this was the 23rd old bound default missed by
  the earlier inventory count. Changed its saved text to the AI Island
  Academy title and restoration goal, read it back, and saved the actor.
- The bound Verse title previously displayed `7 MODULES OFFLINE` and `AGENT
  MODE: LOCKED` permanently. It now states the seven-module unlock rule and
  directs players to their personal AI Core Journal for current status. The
  initial Pix HUD still explains the starting offline state. Verse `BuildAll`
  returned zero diagnostics. No progress source, binding, or reward changed.
- In-client readability remains open under the user's request to skip
  validation and playtesting.

## Fix the Prompt wording

- Source inspection confirmed that the optional challenge still uses four
  planting commands with Plant Seed and Water swapped in the starting plan;
  the four saved stage labels describe those same commands. The feature plan
  records this retained variation in place of the narrative plan's blue-cube
  example.
- Changed the one remaining player-facing `repair station` ownership message
  to `Fix the Prompt station`. Verse `BuildAll` returned zero diagnostics; no
  puzzle state, device binding, or badge behavior changed. The inventory
  records the updated declaration. Interactive flow remains untested as
  requested.

## Pattern Scanner repeated-step presentation

- Kept the existing robot movement, Move + Light, and moved-target stages.
  The first-stage prompt now asks players to predict the needed Move count;
  its board visibly writes `Repeat [Move]`, and the lantern selection writes
  `[Move + Light]`. The Run prompt now says `Run the pattern`.
- Verse `BuildAll` returned zero diagnostics. Four Run Buttons with blank
  saved interaction text were aligned to the new prompt in UEFN, read back,
  and saved. The inventory records the saved Button and source text.
- The optional Discovery Trail retains the separate next-item prediction.
  In-client board readability and the three challenge flows remain untested
  under the user's instruction to skip validation and playtesting.

## Agent Mission fixed control defaults

- Live UEFN inspection found four copies each of `TEST CARGO`, `CARGO RULE`,
  and `ENERGY` on Agent Mission control Billboards. The Verse label refresh
  already writes `Change test item`, `Choose classification rule`, and
  `Change starting energy (0-6)` respectively. The last term remains the
  dock-light resource, not the separate Confidence Core lesson.
- Updated all twelve saved defaults to those exact runtime labels, read back
  every text property, and saved every actor. The label inventory records the
  new defaults. No Verse source, control binding, gameplay state, or reward
  logic changed; no build was required for this editor-only change.
- In-client readability is still untested at the user's request.

## AI Classifier incoming-item board defaults

- All four AI Classifier moving-item Billboards still stored `CARGO QUEUE`,
  while `release()` already displays `INCOMING ITEM QUEUE` from Verse. Live
  UEFN inspection confirmed the four saved values before editing.
- Changed each saved text to `INCOMING ITEM QUEUE`, read back all four, and
  saved the affected actors. The inventory now matches their runtime default.
  No source, routing logic, item ID, device reference, or reward state changed.
  No Verse build was required for this editor-only correction.
- In-client readability and queue behavior remain untested at the user's
  request.

## Hub journal sign default

- The bound hub journal Billboard still stored `MY RESTORATION JOURNAL`, while
  Verse writes `MY AI CORE JOURNAL` with a reminder that module status is
  personal. Updated the saved default to the exact three-line Verse text,
  read it back in UEFN, and saved the actor.
- The inventory now matches the saved sign. No Verse source, journal state,
  device reference, or reward changed; no build was needed. In-client
  readability remains untested at the user's request.

## Bound hub sign reconciliation

- Compared all thirteen `hub_static_sign_refresh` Billboard defaults in the
  inventory with the exact current Verse declarations, then inspected the
  seven mismatches live in UEFN. The four Prompt Lab step signs still stored
  `WATER`, `PLANT`, `WAIT`, and `HARVEST` rather than `FIND SEED`, `DIG HOLE`,
  `PLANT SEED`, and `WATER`. Two route signs held older instruction wording,
  and the AI Classifier route said `by category` instead of `into categories`.
- The Fix the Prompt route's live saved text had already moved beyond its
  stale inventory row but still differed from Verse. All seven were set to
  the exact bound Verse text, read back, and saved in UEFN. The corrected
  inventory now records their live values. A separate live read of the other
  six bound hub defaults confirmed those already match Verse, completing a
  thirteen-of-thirteen saved-default comparison.
- This supersedes earlier broad claims that all seven stale hub defaults had
  been corrected. No sign-refresh logic, device reference, player state, or
  reward changed. No Verse build was required for these editor-only edits;
  in-client sign readability remains open at the user's request.

## Agent Mission bound-label reconciliation

- Inspected all eighty `refresh_labels` Billboards across the four Agent
  Mission stations against their exact current Verse text. Fifty-two saved
  defaults still used shorthand such as `COMMAND 1`, `LAUNCH LINK`, `RUN /
  LAUNCH`, `HUB`, or single-line Home/Planter markers. Twenty-eight already
  matched.
- Updated all fifty-two mismatched defaults in UEFN, read back each changed
  text, and saved each actor. A subsequent live comparison of all eighty
  returned zero mismatches. The label inventory now records the saved values.
- No Verse source, binding, gameplay state, or reward changed. No build was
  required for these editor-only edits; in-client layout and readability
  remain untested under the user's instruction to skip playtesting.

## AI Skills Lab bound-label reconciliation

- Compared the fifty-six bound `label_texts` Billboards across four Skills Lab
  stations with current Verse. Twenty-eight saved defaults differed: sixteen
  Care-step signs said `Change Care step` rather than `Edit Care skill step`,
  and twelve plan-slot signs omitted the `Care / Move` choices.
- Set those twenty-eight saved defaults to the exact Verse labels in UEFN,
  read back each changed actor, and saved it. A complete live read of all
  fifty-six against the updated inventory returned zero mismatches.
- No Care definition, plan state, device binding, or reward changed. No Verse
  build was needed for this editor-only correction. In-client text fit and
  interaction paths remain untested at the user's request.

## AI Tool Lab saved-label follow-up

- Read all sixty Tool Lab control and status Billboards across the four
  stations directly from the live UEFN level. Every saved label matches the
  current Supply/Beacon naming and status text recorded in the inventory;
  there were zero mismatches. Also read the four introductory boards and the
  separate route sign: all five match the inventory's AI Tool Lab wording.
  Thus all sixty-five Tool Lab Billboards in the inventory were read live.
- A fresh inventory search found no old zone-name label in saved actor text.
  The remaining `garden`/`storage`-style matches are internal Verse variable
  names inside interpolated source strings, not player-visible labels.
- This was a read-only follow-up. Project validation and playtesting remain
  skipped at the owner's request; no runtime behavior is claimed here.

## Pattern Scanner station guidance follow-up

- A direct source and inventory comparison found that four Pattern Scanner
  introductory boards still saved `Robot station available` even though
  `available_text` writes `PATTERN SCANNER | Station 1` through `Station 4`.
  Confirmed all four old values in live UEFN, set each to its exact Verse
  available text, read back all four after saving, and updated the inventory.
- Changed two remaining generic claim HUD strings to name Pattern Scanner and
  AI Agent Mission respectively. These are wording-only changes; station
  ownership, gate checks, actor references, and reward paths are untouched.
  UEFN Verse `BuildAll` returned zero diagnostics.
- In-client text fit and the station claim paths remain untested because the
  owner asked to skip validation and playtesting.

## Introductory board comparison

- Compared the current `available_text` declarations with the saved board
  inventory, then read the affected actors in live UEFN. All four Fix the
  Prompt boards already saved the exact numbered Verse text; their inventory
  rows were stale and have been corrected without changing those actors.
- All four AI Classifier boards actually saved `AI CLASSIFIER | Scanner n` and
  `Press CLAIM to begin.` while Verse writes `AI CLASSIFIER | Station n` and
  `Press CLAIM to sort incoming items.` Updated the four actors to exact
  numbered Verse text, saved them individually, and confirmed a separate
  post-save readback of all four matches. The inventory now reflects them.
- The initial read also found descriptive saved introductions in Confidence
  Core, AI Error Lab, and AI Tool Lab that differ from their shorter numbered
  runtime `available_text`. These are still coherent AI-themed descriptions;
  they were not changed in this increment and should be assessed for text fit
  and consistency before any rewrite.
- No Verse source, device reference, puzzle state, or reward changed. No Verse
  build was needed for these editor-only changes. Project validation and
  client playtesting remain skipped at the owner's request.

## AI Tool Lab introductory board reconciliation

- Changed `available_text` to `AI TOOL LAB | Station n`, `Choose a tool for each
  request.`, and `Press CLAIM to begin.` This keeps the useful entry instruction
  while matching the Supply/Beacon request lesson.
- Confirmed the four older saved defaults in live UEFN, updated and saved the
  four introductory Billboards, and independently read back all four after
  saving. Every numbered board matches the revised Verse message. The label
  inventory records both the new saved text and source declaration.
- UEFN Verse `BuildAll` returned zero diagnostics. No input ID, action mapping,
  device reference, reward, or player state changed. In-client readability and
  request flow remain untested because validation/playtesting were skipped.

## Confidence Core and AI Error Lab entry boards

- Live UEFN reads confirmed four Confidence Core boards saved an unnumbered
  title. Added `Station 1` through `Station 4` to match the existing Verse
  `available_text` exactly; no Confidence Core source or puzzle value changed.
- The four Error Lab boards saved `Check Pix's result` while runtime Verse
  used a shorter mistake-check instruction. Chose one age-appropriate message:
  `AI ERROR LAB | Station n`, `Check Pix's result for a mistake.`, and
  `Press CLAIM to begin.` Updated the Verse declaration and all four saved
  boards. This preserves the task → AI answer → expected-result puzzle.
- All eight changed actors were saved individually and passed a separate
  post-save text readback against their numbered target. The inventory records
  their live saved text. Verse `BuildAll` returned zero diagnostics. In-client
  text fit and interaction flow remain untested under the owner's instruction
  to skip validation and playtesting.

## Skills Lab and Agent Mission entry boards

- Compared both zones' `available_text(station_id + 1)` declarations against
  the eight saved `mission_board` defaults. A live UEFN read confirmed all
  eight still omitted the station number before Verse refresh.
- Set and individually saved AI Skills Lab stations 1-4 and AI Agent Mission
  stations 1-4 to their exact existing Verse entry text. A separate post-save
  live read confirmed the numbered text on every actor; the inventory now
  records those values. No Verse source, device references, state, or reward
  logic changed, so no Verse build was needed.
- This is an editor-state readback, not an in-client readability or gameplay
  check. Project validation and playtesting remain skipped at the owner's
  request.

## Badge tracker saved text

- Read all eight live badge Trackers. Their saved `trackerTitle` fields were
  blank; seven `descriptionText` fields were blank. The Confidence Core
  description was already correct. All eight use `Individual` sharing.
- Set each saved title and description to its existing Verse `badge_title`
  and `badge_description`, saved all eight actors, and separately read back
  every value. The inventory now includes all sixteen saved text fields.
- Left sharing, completion bindings, reward state, and saved target values
  unchanged during this text pass. A separate follow-up below addresses the
  Classifier target discrepancy.
- No Verse source changed, so no Verse build was needed. Project validation
  and in-client behavior remain skipped at the owner's request.

## AI Classifier saved target follow-up

- The live `signal_badge_tracker` saved `targetValue` was 10, while
  `fn_shoreline_island_signal_progress.OnBegin` already calls `SetTarget(1)`
  before player assignment and its guarded first-time award writes value 1.
  Set only the saved `targetValue` to 1 through UEFN and saved that actor.
- A separate post-save read returned target 1, `Individual` sharing,
  `Complete Tracker` at target, and the same AI badge title/description.
  The Classifier `When Complete` -> player-local restoration VFX binding also
  remains present. Verse, player values, reward guards, and other tracker
  settings were not changed.
- The target consistency is editor-proven, not in-client-proven. Verify the
  one-time badge and effect after the owner resumes playtesting.

## HUD, Teleporter, and island-settings label sweep

- Enumerated the currently loaded UEFN level by actor class: 1,296 actors,
  including 553 Billboards, 329 Buttons, 34 HUD Message devices, eight
  Trackers, one Teleporter, and one Island Settings actor. This complements
  the separate Billboard/Button/Tracker and TextRender audits; it does not
  replace their individual text readbacks.
- Read the saved `message` and `showOnRoundStart` properties on all 34 HUD
  Message devices. All 34 messages are empty and all 34 round-start flags
  are false. Their player-facing feedback is supplied by Verse at runtime,
  so no stale saved HUD message was found or edited.
- The sole Teleporter is `hub_destination`. Its live property schema has no
  player-facing title or prompt field to reconcile. The Island Settings
  actor has empty `gameNameData`, `gameDescriptionData`, and custom
  victory/defeat/tie text fields. The project descriptor separately saves
  `AI Island Academy` and the Pix AI Core description.
- This was a read-only editor-state audit. No actor changed, no Verse build
  was needed, and in-client presentation remains unverified under the
  owner's request to skip validation/playtesting.

## Verse declaration inventory refresh

- Later Verse changes made the source portion of the CSV stale: it contained
  522 declarations, while current `Content/*.verse` files contain 547. Of the
  old rows, 291 had outdated text or line locations, and 25 current
  declarations were absent.
- `refresh-verse-inventory.ps1` regenerated only the Verse rows from the
  current UTF-8 source files. The 732 existing saved-actor rows were preserved
  as recorded; their properties were **not** re-read from UEFN in this pass.
- A separate read-only comparison found 547 of 547 Verse rows match current
  source path, line, field, and declaration text. Running the refresh again
  produced the same file hash. The inventory now contains 1,279 rows total.
- This is source-inventory maintenance, not a fresh saved-actor audit or
  in-client label check. The earlier UEFN readback remains the actor evidence.
