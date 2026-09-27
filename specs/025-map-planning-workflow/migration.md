# Prompt Lab: existing mission represented as a draft

This example documents the current Data Blaster mission from feature 024. It
does not redesign feature 023's retired button/scanner workflow or rebuild the
island. No approval.yaml has been issued; generated artifacts remain Draft.

## Current behavior and evidence

Source: `Content/fn_shoreline_island_prompt_blaster.verse`, shared data_target,
data_blaster, data_energy and byte_island_game_manager. On entry, the controller
enrolls participants and presents a seven-second Knowledge card. Successful hits
are BLUE (0), LARGE detail (3), LARGE BLUE (5), moving LARGE BLUE (5 again),
REACTOR (6). Wrong choices retry without loss. The existing finale moves Pix's
delivery, powers the reactor/module, awards Prompt Badge and enables the return
rail. The latest bounded solo evidence observed 8 DATA; rewards also include
the existing finale path, not just five target hits.

The nine-element target array is ordered BLUE, RED, GREEN, LARGE modifier,
SMALL BLUE, LARGE BLUE, REACTOR, SCANNER, STORAGE. Its indices are behaviorally
significant. `fn_shoreline_island_data_target` preserves actual shooting-agent
attribution and handles active/hit/complete feedback. The blaster manager handles
loadout/respawn. Data Energy and the progress manager remain shared systems.
The older prompt_lab_controller stays present with `use_blaster_mode` handoff;
do not re-enable retired primary buttons when adopting this spec.

Reset is cooperative: replay resets the room and cancels stale movement/finale;
last participant departure resets the room; earned badge/DATA survive replay;
round reset follows the shared managers. Existing optional practice and hub
journal stay outside this example's scope.

Sources include feature 024's `plan.md`, `prompt-playtest.md`,
`evidence/handoff-binding-readback-2026-09-27.json`,
`evidence/prompt-entry-ramps-2026-09-27.md` and
`evidence/return-boarding-comparison-2026-09-27.md`. The latter records current
five-hit/finale solo success and still-unproven rail boarding/hub arrival; older
Epic logout reports are historical, not the latest acceptance summary.

Read-only native MCP on 2026-09-27 measured all nine hit surfaces, board, module,
return rail actor and entry zone; raw results are in
`evidence/editor-transforms.json`. Platform bounds are sourced from feature 024:
x6000–12600, y-8500–-2300, floor top z2410cm. The YAML origin is its minimum
XY corner at floor height; local platform size is 66×62m. Target marker positions
are measured; zone partitions, route lines and the inventory cue are schematic.
This snapshot does not establish current native editable bindings or runtime
collision. The rail actor transform is not its full spline or endpoint.

## Pattern mapping

| Existing component | Pattern | Migration interpretation |
|---|---|---|
| Hub approach and existing entry volume | corridor | Arrival envelope, not new spawn pads or a closed room |
| Board and timed HUD card | knowledge_room | Overlay inside the target arena, no forced walk to the board |
| Nine targets and five successful hits | target_sequence | Existing fixed controller sequence, not generated Verse |
| Badge, module spectacle, replay, return rail | reward_room | Reuse current finale and badge guard; transport remains a test gap |

Other patterns are contracts for future designs, not additions to Prompt Lab.
There is no checkpoint in the current mission; the renderer supports checkpoint
markers but this example does not invent one.

## Gaps and future approved work

- Reconcile the full actor/device inventory, exact shared bindings and all
  VFX/audio/moving props against the current scene. The example counts selected
  gameplay anchors; it is not a complete prefab export.
- Survey the west/north ramps, motion envelopes, rail spline and arrival point.
  Prove return boarding and hub arrival in a cooked game. Review accessibility,
  sightlines and dense choices with the normal hub approach.
- Keep the current five-hit controller unchanged for this migration. A future
  generalization could extract an editable stage definition (active IDs,
  success ID, feedback/reward and transition) while retaining cancellation,
  multiplayer attribution and one-time badge ownership. That requires a separate
  approved change and lifecycle tests; array indices must not silently change.
- Add adapters for classification, waves and checkpoints only when a mission
  actually needs them. Do not label contracts as working implementations.

For a future approved implementation, first resolve open assumptions and a
concrete scene delta. If the intent remains documentation-only, inspection can
confirm zero changes are needed. If approval selects fixes (for example return
boarding), record those exact layout/behavior changes in the feature and regenerate
the preview/plan. The current plan's reconcile operations authorize no creation,
deletion, movement or new Verse on their own. Preserve feature 024's outstanding
multiplayer/readability/enjoyment acceptance until real evidence closes it.
