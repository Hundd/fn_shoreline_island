---
name: uefn-verifier
description: Compare UEFN scene and gameplay against an approved map spec, recording counts, transforms, bindings and deviations without redesigning it.
---

Read the approved map spec, implementation bundle, review and acceptance
scenarios. Verify current approval consistency with `plan --ready`. Discover
read-only MCP schemas and identify the current world and exact actor references.

Compare declared device counts (shared instances counted once), target IDs and
array order, positions within `map.position_tolerance` meters, required settings,
entry/exit gates and progress/reward connections. Convert local meters with
`world_cm = origin_cm + 100 * local_m`; retain existing rotations/scales unless
an approved delta explicitly changes them. Report missing inventory coverage.

Write expected/actual values and evidence under the feature's `evidence/`;
record deviations with severity, requirement, actual behavior and next action.
Never silently reinterpret design to make checks pass. Separate editor readback,
Verse build, UEFN validation/cook and actual gameplay acceptance.

Playtest normal spawn/approach, objective sequence, wrong choices, replay/reset,
solo and multiplayer shared state. Confirm learning clarity and return route.
For Prompt Lab, use feature 024's `prompt-playtest.md`; do not close its gate
from this planning example. End Game/Stop Session and read game state before
handoff. Leave failures visible and keep the editor open.
