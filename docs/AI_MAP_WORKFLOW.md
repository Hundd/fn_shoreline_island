# AI map planning and blockout workflow

For a practical checklist, start with [AI map instructions](AI_MAP_INSTRUCTIONS.md).

Map creation now passes through a reviewable design bundle before Unreal changes:

```text
Prompt → map.yaml + known patterns → offline blockout → validation + human review
       → approved implementation plan → incremental Unreal MCP / UEFN → verification
```

This makes room scale, learning purpose, flow, target logic and device needs
explicit before spending time in the editor. MCP applies resolved decisions and
reads state back; it is not the default level designer. This workflow does not
rebuild existing missions or replace UEFN's authoritative build/playtest process.

## Repository inspection and implementation choice

- Native MCP is configured at `http://127.0.0.1:8000/mcp` in both
  `.cline/mcp.json` and ignored local `.codex/config.toml`. Codex's existing
  approval policies and both endpoint files are preserved. The planning tools
  need neither endpoint nor a running editor.
- The repository had Markdown feature specs 001–024, JSON actor/binding evidence,
  32 Verse files, PowerShell inventory/artwork helpers and five Cline skills.
  There was no map compiler, preview stack or machine-readable design contract.
  JSON evidence records observations; YAML is used for the new authored specs.
- Python 3.10 and PyYAML 6.0.2 are installed. The solution uses that small stack
  with standard-library tests and static HTML/SVG, not Node/React/3D dependencies.
- Live tool discovery exposed Actor/Scene/Object/Device/Verse/Session toolsets.
  AgentSkillToolset is absent in this editor; project roles therefore use the
  existing `.cline/skills/` format and explicit routing in AGENTS.md. No editor
  plugin, remote service or new MCP executor is installed.
- Existing docs, particularly `MCP Map Editing Diagnosis.md`, already favor
  configuration/readback. The new workflow makes their planning boundary concrete.
  Prompt Lab feature 024 supersedes the older feature 023 interaction model;
  both controllers remain preserved. No other mission is migrated in this task.
- No existing CLAUDE, Cursor, GitHub agent configuration or separate `.mcp`
  configuration was found. CLAUDE.md now points to the shared project rules.

## Lifecycle

**A — Understand.** Inspect the feature, controller, assets, bindings and newest
evidence. Read-only MCP discovery/inspection is allowed before design approval.
Preserve the user's learning intent and working mechanics. Separate measured
facts, conceptual grouping and unknowns.

**B — Specify.** Create/update `specs/NNN-feature/{spec,plan,tasks}.md` and
`map.yaml`. Prose defines testable intent/acceptance; YAML defines layout and
pattern configuration. Keep them synchronized. Reuse a named pattern and shared
devices/Verse first. Mark missing adapters and unmeasured geometry as assumptions.
See [the v1 contract](../design/MAP_SPEC.md).

**C — Blockout.** Generate `generated/preview.html` and `preview.svg` locally.
The numbered top-down shapes show zones, arrival, targets, inventory/weapon,
knowledge, exits, checkpoints and rewards when present. The HTML adds marker
provenance, stages and assumptions. No editor is required.

**D — Validate and review.** Run validation; inspect the preview. Check player
flow, accessible size/entry/exit, target positions, active target sets, walking
burden, interaction density, learning purpose, required devices and controller
capabilities. Save findings in `review.md`. Automated checks detect basic
inconsistencies; they do not establish collision or playability.

**E — Human approval.** Present the actual preview and generated plan, with
scope, blockers and intended scene delta. Do all review preparation before
asking. Resolve blockers and regenerate. Only after explicit human approval,
record `approval.yaml` beside map.yaml, using the current manifest digest:

```yaml
status: approved
reviewer: "Human reviewer name"
approved_at: "2026-09-27T12:00:00Z"
evidence: "Reference to the explicit approval message/review record"
review_digest: "Copy the actual generated/review-manifest.json review_digest"
```

This is an illustrative record, not approval of the shipped example. Do not
copy the placeholder values to claim approval. Agents must verify the actual
human instruction; a writable hash file cannot authenticate a person. Existing
approval remains valid only for the approved scope and revision. `plan --ready`
compares artifacts against freshly computed output and the recorded digest;
editing spec/patterns/preview/plan invalidates it. It never regenerates or edits
approval. A material design deviation returns to this stage. Small fixes clearly
unrelated to map design can bypass it with an explanation in feature evidence.

**F — Implement through MCP.** Run the readiness command, inspect current editor
state, discover schemas and checkpoint. Generated `implementation.yaml` contains
intent operations and verification expectations. Resolve exact existing actors,
complete transforms, native properties, assets and bindings before calling tools.
Reuse first; do not duplicate actors from an inventory list. Execute one logical
group at a time, read back state, save and record deviations. The tools do not
translate an unapproved prompt directly into MCP requests.

**G — Verify.** Compare counts, target IDs/order, positions within declared
tolerance, settings and required connections. Record expected versus actual and
deviations. Build changed Verse; validate/cook through supported UEFN controls;
playtest spawn, sequence, reset, solo and shared multiplayer state. Verify learning
clarity and return access. Never equate successful tool execution with gameplay
acceptance. Stop active games and confirm final state; leave the editor open.

## Commands

Run from the repository root. Python 3.10+ is required. If needed, install
`python -m pip install -r tools/requirements-map.txt`; an optional isolated
environment can use `python -m venv .venv-map` and its Python executable. This
workspace's normal `python` already has PyYAML; package access is not required.

```powershell
python tools/map_workflow.py validate
python tools/map_workflow.py preview
python tools/map_workflow.py plan
python tools/map_workflow.py check
python -m unittest discover -s tools/tests -v
```

All commands default to feature 025's Prompt Lab example; pass a spec path for
another feature. `validate` is read-only. `preview`, `plan` and `check` validate
then write the complete deterministic review bundle beside the spec, preventing
mixed preview/plan revisions. Existing approval records are never overwritten.
Open the HTML directly in a browser, or use the SVG in a review. Exit code 1
indicates invalid input/readiness failure; usage errors exit 2. Draft generation
can exit 0 with explicit review warnings/blockers — it does not authorize edits.

```powershell
python tools/map_workflow.py check specs/025-map-planning-workflow/map.yaml
python tools/map_workflow.py plan specs/025-map-planning-workflow/map.yaml --ready
```

The second command deliberately fails for the example: no human approval exists
and migration assumptions remain open. An alternate approval path can be passed
with `--approval`. No command starts Unreal, builds Verse, calls MCP or approves
itself. There is no automatic MCP runtime enforcement: agent instructions plus
the readiness check form the v1 boundary. Clients with direct tool access must
honor it; MCP client approval policies remain an additional existing control.

## Reuse and extending patterns

See [the ten-pattern library](../design/patterns/README.md). Prefer existing
creative devices, Verse classes, editable references, arrays/maps/structs and
known prefabs. Do not introduce one-off Verse to fit a prompt when parameters
would suffice. A pattern contract is not proof of a configurable runtime adapter.

Add a pattern only for a demonstrated gap. Create its compact pattern.yaml,
define required/optional parameter types, device classes, geometry, interaction,
completion, reset and debug checks. Start at `contract_only` until a reusable
implementation is actually verified. Add focused validator/preview tests when
extending the format. Keep source, patterns and specs synchronized and review
changed behavior before editor rollout. Do not duplicate the entire mission
controller just to change data; propose a scoped editable stage configuration
adapter with lifecycle tests when that becomes necessary.

## Debugging poor MCP results

Trace the defect to its layer: wrong intent belongs in the feature/map spec;
awkward scale or walking belongs in blockout review; unsupported behavior belongs
in the adapter contract; wrong actor/property/binding belongs in the implementation
delta; collision, hit attribution and enjoyment require runtime evidence.

Preserve failing call results, current actor identities, expected/actual transforms,
approval digest and stage. Discover property schemas before writing. Use full
transforms: feature 024 observed omitted fields resetting location/scale. Do not
retry ambiguous mutations. Correct the responsible layer, regenerate the bundle
when design changes and get approval for that changed design. A successful retry
does not close the gameplay acceptance gate.

## First migration and limits

[Prompt Lab migration notes](../specs/025-map-planning-workflow/migration.md)
describe its existing state, pattern mapping, open gaps and potential future
work. The [preview](../specs/025-map-planning-workflow/generated/preview.html) is
an unapproved review artifact. No map, device, material, Verse, project ID or
matchmaking setting changes are part of this migration.

Version 1 is deliberately a linear, top-down planning tool. It does not import
binary assets, reconcile scene deltas automatically, verify native settings,
render height/collision/rail splines or implement every pattern. The formal map
schema is Python validation code rather than a JSON Schema IDE integration.
Detailed actor export/verification and reusable stage configuration are future
extensions, not hidden functionality.
