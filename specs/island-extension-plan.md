# Byte Island: Coastal Restoration Expansion

- Date: 2026-09-12
- Status: Implementation in progress; the full island is not yet accepted.
- Baseline: [implementation status](implementation-status.md) and
  [existing roadmap](post-mvp-roadmap.md).
- Testing available: solo. Two-player and four-player acceptance stays pending.

## Experience

Give the island a clear purpose: help Pix restore a small coastal academy.
Players grow supplies, repair dock lights, route deliveries, and prepare a robot
for the final restoration mission. Every puzzle should visibly help a place or
character, with short instructions and an immediate opportunity to experiment.

Keep the existing ages 8-10 audience, non-combat play, gentle retries, and
independent progress. Routes remain open: recommendations guide players without
requiring earlier badges. Each zone contains a demonstration, an independent
challenge, and a variation that checks understanding.

## Current baseline

Path Garden has historical solo acceptance evidence. Loop Lagoon and the later
adventure zones now have four authored stations with recorded solo checks.
Living Academy includes the journal and garden repair; Tidepool Nursery and
Coastal Fieldwork have implementations and partial acceptance evidence. Exact
coverage and outstanding checks are tracked in [implementation status](implementation-status.md)
and each numbered feature's tasks and evidence. Lifecycle, multiplayer,
presentation and release gates remain incomplete. This plan does not replace
those requirements or treat partial solo evidence as full zone acceptance.

## Delivery order

| Milestone | Deliverable | Exit evidence |
| --- | --- | --- |
| A: Finish the playable core | Complete Loop Lagoon's three challenges, hints, replay, badge, reset, and readable controls. Recheck the garden and entrance. | One uninterrupted solo run through both zones; retries and reset pass; remaining multiplayer tests listed. |
| B: Give the island direction | Deliver Living Academy (003): personal progress board, recommended destination, garden repair variation, clear outbound and return routes. Add short restoration-themed objective text in that spec. | A fresh player can find a puzzle, understand its purpose, and return without developer directions. |
| C: Make the harbor work | Deliver Signal Lighthouse (004): route leaf/plain cargo, introduce gear cargo, then choose a rule for a visible queue. Boats visibly reach labeled destinations. | Correct and incorrect routes are understandable with audio muted; every queue fixture passes. |
| D: Complete the learning adventure | Deliver Variable Vault (005), Debug Workshop (006), Event Factory (007), and Build-a-Bot (008), one tested zone at a time. | Each zone's acceptance scenarios pass solo; the capstone combines earlier ideas and preserves safe retries. |
| E: Add a new mechanic | Build Tidepool Nursery (009): define a reusable action called Care, then reuse it to restore planters. | Three handcrafted challenges work with independent state, hints, replay, and visible execution. |
| F: Add exploration and replay | Add optional field observations, authored challenge routes, and restoration presentation after testing the adventure. | Optional activities never block the main route or duplicate rewards; all variants have verified solutions. |

This is an ordered backlog, not a calendar estimate. Re-estimate after each
playable milestone using observed editor, playtest, and revision effort.
Prioritize A-C for the next candidate build; avoid opening several unfinished zones.

## New puzzles beyond the existing roadmap

| Puzzle | Player action | What it teaches | Priority |
| --- | --- | --- | --- |
| Tidepool Nursery: Care | Put Water, Plant, Wait, Harvest inside one named action, then call it. | A function groups steps under a name. | First new mechanic; specified in 009. |
| Nursery row | Place Care calls across two planter beds, then use Repeat on Care and Move for three beds. | Reuse and composition with loops. | Included in 009. |
| Boardwalk detour | Program a delivery cart on a small grid with one blocked tile; change the route after a sign shows a new blockage. | Planning and adapting an algorithm. | Later; requires numbered specification and exact grids. |
| Harbor queue | Choose which crate moves first from a visible queue; predict the remaining order after a delivery. | First-in, first-out ordering. | Later; do not duplicate the lighthouse's sorting task. |
| Sensor garden | Predict whether a pump runs from two labeled conditions: soil dry and tank ready. Test all four combinations. | Combining conditions with AND. | Later; depends on lighthouse concepts. |

These later ideas are alternatives for future releases, not requirements for
the next candidate build. Select one after observing which existing puzzles
players understand and enjoy. Do not build all of them at once.

## Exploration and replay proposal

- Place three optional observation spots along existing paths: a growth sequence,
  a repeating lantern pattern, and a labeled cargo route. Each asks one prediction
  and reveals a short explanation. No scavenger hunt is required to progress.
- Offer an optional challenge route after a zone's normal challenges: changed
  target positions or supplied programs, selected from authored fixtures.
  Show fewer-command goals as optional experiments, with no timer or penalty.
- Use a personal restoration journal to explain the player's completed work.
  Shared scenery stays neutral unless its multiplayer meaning is explicitly
  designed; one player's completion must not imply another has solved a puzzle.
- Keep the academy celebration in the existing Bot capstone. A later expansion
  may add a journal page, but must not introduce a second conflicting ending.

Specify these changes in numbered feature directories before implementation.
Persistent saves, random puzzle generation, daily rewards, competitive rankings,
and a freeform code editor remain outside this plan.

## Presentation priorities

Use the hub as the orientation point. Give each completed zone one recognizable
landmark and short, clearly signed paths. Replace repeated large floating signs
with compact objective boards and labels readable from the interaction position.
Make the robot's current instruction and destination visible during execution.
Keep essential information available through text or symbols as well as color.

Check floor seams, collision, sign overlap, and camera readability on the actual
walking route before adding distant decoration. Treat the recent entrance
flicker as a regression check for every later geometry pass.

## Verification and release decisions

For each milestone: specify exact fixtures, build one challenge, play it solo,
revise confusing behavior, complete progression, and record the evidence.
Check spawn, wrong attempts, hints, replay, rewards, departure, respawn, and round
restart. Run Verse build when source changes, project validation, and memory
calculation before a release candidate is considered ready.

Solo progress may continue while extra clients are unavailable. Multiplayer
readiness still requires two-player and four-player isolation, station access,
disconnect, and join-in-progress checks. Do not count solo station checks as
multiplayer evidence. Close Fortnite after testing, as requested by the user.

Observe whether a new player can choose the next action and explain what changed
after a run. Record completion time, wrong attempts, hints, and moments needing
developer help. Treat these as observations, not evidence of learning from a
single tester. Use target-age feedback where available before expanding scope.

## Next concrete work package

Finish the remaining milestone A-C acceptance and presentation checks on the
implemented zones, retaining the full A-F scope above. Continue from current
numbered tasks and runtime evidence rather than rebuilding existing stations.
The current Loop presentation pass reduces distant station text; nearby
readability, repeated range transitions and progress retention must be verified
before its task is closed. Later-zone lifecycle, optional-activity and release
checks remain required as recorded in their feature directories.
