# 027: Prompt Workshop redesign

Status: draft for human design review. This supersedes the current feature-026 shooting interaction only after approval and implementation. No scene or Verse changes are authorized by this file.

## Goal

Let the player give Pix an instruction, see a concrete consequence, and revise one useful detail. The player learns that a prompt needs **what**, **which one**, and **where** through action rather than five successive shots. Reuse the existing Prompt Badge, journal source, Pix/core props, boards, controls, audio and reset hooks where inspection shows they are sound. The user permits removal of the existing four-station/game assets; remove only reconciled Prompt Lab actors rendered obsolete by the approved design, after a checkpoint.

## Requirements

- **FR-01 Arrival and access:** Keep the known west walking ramp, entry from the hub, and always available walking return. Give the player a 3 m clear route among four compact activity areas without jumping or rail boarding. No mandatory timer.
- **FR-02 Inspect:** At a nearby scene with a large and small blue core and labelled destinations, an Inspect control reveals the requested **large blue core** and **power reactor** in a short board/HUD cue. The scene must remain visible while choosing. Do not make success depend on hue alone.
- **FR-03 Compose:** Physical labelled choices set WHAT (blue or red core), WHICH ONE (large or small), and WHERE (reactor or scanner). A persistent board shows the assembled request and updates each choice. Send is enabled when all three slots have a value; players may replace any choice before sending.
- **FR-04 Test and revise:** Send makes Pix visibly attempt the chosen request. A wrong but complete request produces a safe, specific result and returns Pix/core home. The board identifies the mistaken slot; the player changes that slot only, retains correct slots, and resends. No DATA, badge, or stage progress is awarded for wrong submissions. Guard against double Send while Pix is acting.
- **FR-05 Success and reward:** Correct large-blue-to-reactor request shows Pix carrying/placing the core and powers the module. A reachable final Connect control awards the existing Prompt Badge once via `byte_island_game_manager`. Retain Data Energy integration deliberately: the accepted Send grants 5 DATA once per run and module completion grants 3, matching a fresh feature-026 completion total of 8. Replay may earn subsequent DATA under the established repeat policy; badge stays owned.
- **FR-06 Lifecycle:** One player's selections and feedback remain personal, while visual Pix execution is serialized. Replay cancels delayed work, returns props and board to their starting state, and retains badge/DATA. Round reset clears round DATA and transient mission state. Late join and two-player behavior must be explicitly tested; no participant receives another's choice or reward.
- **FR-07 Scene reconciliation:** Reuse the platform, west ramp, current machine, Pix, labelled props, boards, sounds, and suitable buttons. Retire the nine gun target assemblies, hit surfaces, target-only cues and current firing layout after exact actor/binding reconciliation. Preserve the shared Data Blaster for other missions; do not delete global managers, asset files, world-partition data, module, or hub links merely because Prompt Lab stops using them. Avoid concurrent active old/new controllers.
- **FR-08 Verification:** Before handoff, reconcile live bindings, transforms, collision, and exact removal list. After implementation, build Verse, validate/cook, test solo progression and wrong results, repeated replay/reset, walking return, and two-player isolation. Stop the game and leave UEFN open.

## Acceptance scenarios

1. **AC-01 (FR-01/02):** Given a fresh hub arrival, when the player walks in without jumping and uses Inspect, then the visible large/small cores and destination cues disclose WHAT, WHICH ONE, and WHERE within the same work area.
2. **AC-02 (FR-03):** Given the clue, when the player chooses BLUE, LARGE and REACTOR, then the board shows exactly those three slots and replacing one choice updates only that slot.
3. **AC-03 (FR-03/04):** Given a complete wrong request such as BLUE, SMALL, REACTOR, when Send is pressed, then Pix attempts the small core, safely reports the mismatch, restores the props, retains BLUE and REACTOR, awards nothing, and accepts LARGE plus another Send.
4. **AC-04 (FR-04/05):** Given a corrected complete request, when Send is pressed twice quickly, then one Pix delivery plays, the module powers once, the correct player gets 5 DATA once, and Connect grants 3 more DATA and the one-time badge; repeat Connect adds neither reward nor badge.
5. **AC-05 (FR-01/05):** Given success, when the player reaches Connect and returns west, then both routes are walkable without rail use, forced precision movement or a long detour; completion is communicated from the work area.
6. **AC-06 (FR-06):** Given Pix in a wrong or correct delivery, when Replay or round reset occurs, then stale callbacks cannot later move props, advance stage, or award. Replay retains earned DATA/badge and round reset clears round DATA.
7. **AC-07 (FR-06/07):** Given two players at different choice states, when either sends, replays, leaves, or joins late, then personal boards/feedback/rewards remain attributed to the right player and the shared Pix animation does not corrupt either request.
8. **AC-08 (FR-02/03/08):** Given a first-time player, when they complete the workshop, then they can explain why LARGE and REACTOR were needed; labels, controls, animation, and wrong-result feedback are readable from ordinary play positions.
9. **AC-09 (FR-07/08):** Given the replacement is saved, when the editor inventory, Verse build, validation, cook and playtest complete, then no orphaned target collision blocks interaction, no duplicate controller is active, the shared blaster works elsewhere, and game state is CanStart or Unconnected at handoff.

The proposal intentionally changes gameplay and reward timing, so feature-026 approval does not cover it. Feature-026 acceptance gaps remain historical evidence, not claims that this design already works.
