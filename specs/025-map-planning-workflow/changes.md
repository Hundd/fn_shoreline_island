# Change inventory

The new default is prompt → YAML specification → offline preview/validation → human review → approved intent plan → incremental MCP execution and verification. No existing mission was rebuilt. MCP connections, Content assets and Verse files are unchanged.

## Created files

- `.gitattributes`
- `.cline/skills/blockout-reviewer/SKILL.md`
- `.cline/skills/map-planner/SKILL.md`
- `.cline/skills/uefn-implementer/SKILL.md`
- `.cline/skills/uefn-verifier/SKILL.md`
- `CLAUDE.md`
- `README.md`
- `design/MAP_SPEC.md`
- `design/patterns/README.md`
- `design/patterns/checkpoint/pattern.yaml`
- `design/patterns/classification-arena/pattern.yaml`
- `design/patterns/corridor/pattern.yaml`
- `design/patterns/knowledge-room/pattern.yaml`
- `design/patterns/portal/pattern.yaml`
- `design/patterns/reward-room/pattern.yaml`
- `design/patterns/shooting-gallery/pattern.yaml`
- `design/patterns/spawn-room/pattern.yaml`
- `design/patterns/target-sequence/pattern.yaml`
- `design/patterns/wave-arena/pattern.yaml`
- `design/prompts.md`
- `docs/AI_MAP_INSTRUCTIONS.md`
- `docs/AI_MAP_WORKFLOW.md`
- `specs/025-map-planning-workflow/changes.md`
- `specs/025-map-planning-workflow/evidence/editor-transforms.json`
- `specs/025-map-planning-workflow/evidence/validation-2026-09-27.md`
- `specs/025-map-planning-workflow/generated/implementation.yaml`
- `specs/025-map-planning-workflow/generated/preview.html`
- `specs/025-map-planning-workflow/generated/preview.svg`
- `specs/025-map-planning-workflow/generated/review-manifest.json`
- `specs/025-map-planning-workflow/map.yaml`
- `specs/025-map-planning-workflow/migration.md`
- `specs/025-map-planning-workflow/plan.md`
- `specs/025-map-planning-workflow/review.md`
- `specs/025-map-planning-workflow/spec.md`
- `specs/025-map-planning-workflow/tasks.md`
- `tools/map_schema.py`
- `tools/map_workflow.py`
- `tools/requirements-map.txt`
- `tools/tests/test_map_workflow.py`

## Modified files

- `.cline/rules/uefn-island.md`
- `.cline/skills/uefn-editor-safety/SKILL.md`
- `.cline/skills/uefn-spec-workflow/SKILL.md`
- `.gitignore`
- `AGENTS.md`
- `specs/README.md`

## Commands and roles

Use `python tools/map_workflow.py validate|preview|plan|check [map.yaml]` (choose one command). `plan --ready` is the read-only approval/blocker gate. Tests: `python -m unittest discover -s tools/tests -v`.

Four new local roles: map-planner, blockout-reviewer, uefn-implementer and uefn-verifier. Existing spec-workflow and editor-safety skills now route through the design gate. AGENTS.md routes all clients to the same role instructions without installing duplicate skills.

The Prompt Lab example preserves nine targets and success sequence [0,3,5,5,6]. See map.yaml, generated/preview.html, generated/preview.svg, generated/implementation.yaml, migration.md and review.md. Its five open assumptions intentionally block execution.

## Limitations

Readiness is an agent workflow boundary, not server-side MCP enforcement. Plans are intent artifacts, not automatic API calls. Native settings, complete actor inventories, collision/height/rail geometry, arbitrary stage adapters and gameplay quality still need discovery and verification. Three patterns are design contracts without verified runtime adapters. No browser was connected for visual QA. Existing feature 024 multiplayer and return-ride gates remain open.

## Recommended next three improvements

1. Add a read-only scene exporter/verifier that maps stable IDs to actor references, full transforms, counts and editable bindings and produces a spec-versus-scene deviation report.
2. After an approved design and dedicated lifecycle tests, extract a small editable stage configuration adapter from Prompt Lab while retaining hit attribution, cancellation, shared state and badge guards.
3. Extend preview review with active-stage filtering and surveyed ramp/rail/motion overlays; first complete visual review and Prompt Lab return-route/cooperative acceptance.
