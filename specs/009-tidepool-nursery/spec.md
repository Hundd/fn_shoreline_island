# Tidepool Nursery Specification

- Status: Approved for implementation; acceptance pending.
- Authorization: User requested implementation of the full island extension plan.
- Source: [Coastal Restoration Expansion](../island-extension-plan.md).
- Dependencies: working Garden rules and Loop Lagoon; no player badge gates.

## Requirements

- FR-001: Three challenges teach a named reusable action, Care. A visible
  definition editor contains four slots, each cycling Water, Plant, Wait, Harvest.
  Initial order is Water, Plant, Harvest, Wait. The valid order remains consistent
  with Path Garden: Water, Plant, Wait, Harvest.
- FR-002: Challenge one supplies the caller `Care` for one empty planter. Run
  expands the definition visibly, highlights each step, and succeeds only when
  the planter completes the four valid transitions.
- FR-003: Challenge two supplies two empty planters and three caller slots.
  Each slot selects Care or Move; all initially select Care. The successful
  caller is `Care, Move, Care`. Both planters must complete. Moving off the row
  or applying an invalid garden transition stops safely at that instruction.
- FR-004: Challenge three supplies three empty planters followed by an exit tile.
  The block is `Care, Move`; choose Repeat 1-4, initially 1. Exactly three repeats
  must finish all planters and reach the exit. A fourth Care at the exit fails
  safely. The Care definition stays editable in every challenge.
- FR-005: Run snapshots the submitted definition and caller. Each run starts
  with empty planters and the robot at the first planter. Editing is disabled
  during execution; a failed run preserves the submitted program for revision.
- FR-006: Help first explains the relevant concept, then shows a worked solution.
  Success unlocks the next challenge. Finishing all three awards one Nursery
  Badge per player per round and explains: "A function is a named group of steps."
  Replay never duplicates rewards. Hub return is always available.
- FR-007: Progress, hints, and submissions are independent for 1-4 players.
  Respawn or departure cancels the run; completed challenges and earned badge
  survive respawn within the round. A new round resets progress. Returning to
  the nursery restores the current unlocked challenge with its initial program.
- NFR-001: No combat, damage, countdown, or required second player. Essential
  instructions and state changes must remain understandable with audio muted.
- NFR-002: Record solo acceptance, multiplayer isolation, Verse build, project
  validation, and memory evidence before marking the feature Validated.

## Acceptance scenarios

- AC-001 (FR-001, FR-002): Given the initial definition, when Care runs, then
  Harvest is identified as invalid before Wait. When the last two slots are
  corrected and rerun, the planter completes and challenge two unlocks.
- AC-002 (FR-003, FR-005): Given two empty planters and a correct definition,
  when Care, Move, Care runs, then both complete. When Care, Care, Care runs,
  then the second call stops at the invalid transition and permits editing.
- AC-003 (FR-004): Given three planters and a correct definition, when the repeat
  count is 1, 2, or 4, then the goal is not awarded and the reason is visible.
  When it is 3, all planters complete and the robot reaches the exit.
- AC-004 (FR-005): Given a running program, when controls are pressed rapidly,
  then the execution snapshot remains unchanged and no second run starts.
- AC-005 (FR-006): Given any challenge, when Help is pressed twice, then a concept
  hint and worked solution appear. When the whole set is replayed successfully,
  the Nursery Badge remains exactly one and the hub return works.
- AC-006 (FR-007): Given a run in progress, when its owner respawns or leaves,
  then execution cancels without late rewards. When they return, completed work
  remains but the current program starts at its authored defaults. When the round
  restarts, all progress resets.
- AC-007 (FR-007): Given two players, then four players, when one edits, fails,
  completes, or disconnects, then the others' boards and rewards stay unchanged.
- AC-008 (NFR-001, NFR-002): Given the final revision, when played solo with audio
  muted and validated in UEFN, then all objectives remain readable and safe;
  release evidence records results, warnings, revision, and player count.

## Boundaries

No nested functions, parameters, recursion, persistent progress, random layouts,
or compulsory dependencies on earlier badges. Any journal or hub badge-board
extension requires a matching update to feature 003 before implementation.
