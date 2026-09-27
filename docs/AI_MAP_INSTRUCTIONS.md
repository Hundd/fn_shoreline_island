# Instructions for AI-assisted map changes

Use these steps for a new room, mission, challenge, or layout change. Read
[AGENTS.md](../AGENTS.md) first. The full rationale and lifecycle are in
[AI_MAP_WORKFLOW.md](AI_MAP_WORKFLOW.md).

## 1. Inspect the existing mission

Read the relevant feature under `specs/`, its current Verse controller, reusable
devices, actor/binding evidence and latest playtest results. Preserve working
behavior. Use read-only MCP inspection when needed; do not begin map mutations
from the natural-language request.

## 2. Prepare the design

Create or update a numbered feature directory containing `spec.md`, `plan.md`,
`tasks.md` and `map.yaml`. Define testable requirements and Given/When/Then
acceptance scenarios. Use the [Map Planner skill](../.cline/skills/map-planner/SKILL.md),
[map contract](../design/MAP_SPEC.md) and [pattern library](../design/patterns/README.md).

Specify zone dimensions, player flow, targets, devices, stages, completion and
reset behavior. Distinguish measured positions from estimates. Prefer existing
Verse classes and editable configuration; record missing decisions or unsupported
adapter behavior as open assumptions.

## 3. Generate and review the blockout

Run commands from the repository root using Python 3.10+ with PyYAML. If PyYAML
is missing, install it with `python -m pip install -r tools/requirements-map.txt`.

```powershell
# Default example: current Prompt Lab, without changing Unreal.
python tools/map_workflow.py check

# For your feature, replace the path with its actual map.yaml.
python tools/map_workflow.py check specs/025-map-planning-workflow/map.yaml
```

Open `generated/preview.html` beside the map spec. Review it together with
`generated/implementation.yaml`. Use the
[Blockout Reviewer skill](../.cline/skills/blockout-reviewer/SKILL.md) to assess
scale, unnecessary walking, target density, accessibility, entry/exit gates,
learning purpose and reusable-system gaps. Record findings in `review.md`.
Fix validation errors and resolve execution blockers, then regenerate.

The individual commands are `validate`, `preview` and `plan`. `validate` is
read-only; `preview`, `plan` and `check` generate the complete review bundle.
Passing a draft check is not approval to edit the island.

## 4. Obtain explicit human approval

Present the concrete preview, implementation plan and intended scene changes.
After an explicit approval message, record `approval.yaml` beside the map spec
with `status`, `reviewer`, quoted `approved_at`, `evidence` and the current
`review_digest` from `generated/review-manifest.json`. Follow the example in
[the workflow guide](AI_MAP_WORKFLOW.md#lifecycle); never fabricate approval.

Before any map-design mutation, run:

```powershell
python tools/map_workflow.py plan specs/025-map-planning-workflow/map.yaml --ready
```

Use your actual feature path. The shipped Prompt Lab example intentionally fails
this command because it is unapproved and has unresolved assumptions. Changed
design artifacts invalidate prior approval; regenerate and review the new scope.
Small fixes clearly unrelated to map design may use the documented exception in
AGENTS.md, with the reason recorded in feature evidence.

## 5. Implement the approved plan

Use the [UEFN Implementer skill](../.cline/skills/uefn-implementer/SKILL.md).
Discover live MCP schemas, reconcile existing actors and bindings, and save a
recovery checkpoint. Apply only the resolved, approved changes, one logical group
at a time. Serialize editor calls, verify complete transforms and properties,
and save affected assets. MCP must not invent missing layout or gameplay logic.

Stop on ambiguous failures or missing design decisions. Record deviations and
return material design changes to planning. Keep the map spec synchronized.

## 6. Verify and hand off

Use the [UEFN Verifier skill](../.cline/skills/uefn-verifier/SKILL.md). Compare
counts, IDs, positions, required settings and connections with the approved spec.
Build changed Verse, run UEFN validation/cooking and playtest spawn, progression,
wrong choices, replay/reset, solo and shared multiplayer behavior. Check learning
clarity and return access; successful MCP execution alone is not acceptance.

Record expected/actual results and unresolved failures in feature evidence. Stop
any active game and verify its state before the final response; leave UEFN open.
Commit source, specs and review artifacts together, excluding editor caches and
local MCP configuration.

For an example, see the [Prompt Lab migration notes](../specs/025-map-planning-workflow/migration.md),
[map spec](../specs/025-map-planning-workflow/map.yaml) and
[preview](../specs/025-map-planning-workflow/generated/preview.html).
