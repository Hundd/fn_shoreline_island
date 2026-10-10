# Repository Guidelines

## Rule Source of Truth

Repository rules are authored in `.rulesync/rules/` and this `AGENTS.md` is generated from them by [rulesync](https://github.com/dyoshikawa/rulesync). Edit `.rulesync/rules/guidelines.md` (or add new `.rulesync/rules/*.md` files), then run `rulesync generate` to refresh `AGENTS.md`. Do not edit `AGENTS.md` directly; edits there are overwritten on the next generate.

## Project Structure & Module Organization

This repository is a UEFN island project. `fn_shoreline_island.uefnproject` is the main project descriptor, and `fn_shoreline_island.uplugin` defines the content/Verse plugin. The playable level is `Content/fn_shoreline_island.umap`; supporting assets, including `GameFeatureData.uasset`, live under `Content/`. UEFN manages World Partition data in `Content/__ExternalActors__/` and `Content/__ExternalObjects__/`; do not rename or move those files manually. `Resources/Icon128.png` is project artwork, while `plan.md` records the island concept and build roadmap.

## Build, Test, and Development Commands

UEFN provides the authoritative build workflow; this project has no package-manager or standalone CLI build.

- Open `fn_shoreline_island.uefnproject` in UEFN to edit the island.
- Choose **Verse > Build Verse Code** after adding or changing `.verse` files.
- Click **Launch Session** to cook current content and run an interactive Fortnite playtest.
- Use **Project > Validate Project** before submitting changes or publishing.

Open `fn_shoreline_island.code-workspace` when editing Verse in VS Code. Generated digest folders referenced there are read-only dependencies.

## Coding Style & Naming Conventions

Treat binary `.uasset` and `.umap` files as editor-owned. Make asset changes through UEFN and save all affected actors. For Verse, use four-space indentation, `snake_case` identifiers, descriptive device names, and one gameplay responsibility per file or class. Match the existing lowercase project prefix, for example `fn_shoreline_island_score_manager.verse`. Keep player-facing text brief and age-appropriate, following `plan.md`.

## Testing Guidelines

There is no automated test framework or coverage threshold. For every gameplay change, launch a session and verify spawn flow, objective progression, reset behavior, and solo play. Test multiplayer behavior when devices share state. Run project validation and resolve errors before requesting review; note any warnings intentionally left in place.

## Playtest Session Shutdown

At the end of every task, stop any active UEFN/Fortnite playtest game before sending the final response. Use UEFN's **End Game** or **Stop Session** control, or equivalent approved automation, and verify that the game state is no longer running. Leave the UEFN editor open unless the user explicitly asks to close it. If the playtest cannot be stopped, report that clearly instead of claiming the task is complete.

## Spec-Driven Workflow

Use `specs/` as the source of truth for planned player-visible changes. Before implementation, create or update a numbered feature directory containing `spec.md`, `plan.md`, and `tasks.md`. Define testable requirements and Given/When/Then acceptance scenarios before editing the island. Record implementation choices in the feature plan, link tasks to requirement IDs, and check off tasks only after the corresponding UEFN validation or playtest evidence has been recorded. If editor work changes the intended behavior, update the spec in the same change.

## Map Planning Before MCP

Follow [docs/AI_MAP_WORKFLOW.md](docs/AI_MAP_WORKFLOW.md) for requests to build a room, create a mission, add a challenge, change a map, or redesign Prompt Lab:

1. Inspect the current mission, source, assets and evidence before designing.
2. Create/update `specs/NNN-feature/map.yaml` using `design/patterns/`; reuse a pattern before adding one. Keep its intent consistent with `spec.md`.
3. Run `python tools/map_workflow.py check <map.yaml>` to validate and generate the offline preview and implementation plan. Resolve errors and review scale, walking, learning purpose, interaction density, entry/exit gates and unsupported assumptions.
4. Present the concrete preview and plan for explicit human approval before map-design mutations. Record the actual approval in `approval.yaml` with the current `generated/review-manifest.json` digest. Never approve on the user's behalf. Existing authorization applies only to its approved scope/revision; material design changes require renewed review.
5. Run `python tools/map_workflow.py plan <map.yaml> --ready`. Do not execute a draft, stale approval, or plan with unresolved blockers. Read-only MCP inspection is allowed during planning. Small code fixes that clearly do not affect layout, mission behavior or map design may bypass the design gate; record why.
6. Prefer existing Verse classes, creative devices, `@editable` values, arrays/maps/structs and known prefabs over mission-specific new code. Pattern parameters document intent; do not pretend a hardcoded controller supports arbitrary configuration.
7. Use MCP to implement resolved placements, configurations, bindings and approved assets incrementally. Discover live schemas, checkpoint, serialize calls, read back counts/transforms/properties after meaningful groups, then save. MCP must not invent missing scale, mechanics, flow or target logic.
8. Keep spec and implementation synchronized, record expected/actual deviations, and return blocked design decisions to planning. Successful MCP calls do not prove gameplay quality. Optimize for playability and clarity and verify in a cooked game before accepting gameplay tasks.

Project-local roles use the existing skill mechanism. All agents should read the relevant file directly if their client does not auto-discover `.agents/skills/`:

- Producer: `.agents/skills/uefn-producer/SKILL.md` (product direction and feature briefs upstream of planning; resolve the flagship model from `producer_model` in `.agents/workflow-models.yaml`, with explicit Codex model override and `fork_turns: "none"`)
- Planner & Reviewer: `.agents/skills/uefn-map-planning/SKILL.md` (pattern-backed map spec, blockout review, and the human-approval gate)
- Implementer: `.agents/skills/uefn-map-implementation/SKILL.md` (dispatch on a cost-controlled worker; resolve the model per host from `worker_model` in `.agents/workflow-models.yaml` — Codex CLI `gpt-6.1-sol` with `fork_turns: "none"`, Claude Code frontmatter `model:`, Cline inherits parent; no inherited frontier model or silent model fallback)
- QA / Gameplay Verifier: `.agents/skills/uefn-gameplay-verifier/SKILL.md` (same host-resolved cost-controlled worker rule as Implementer; no inherited frontier model or silent model fallback)
- Supervisor: `.agents/skills/uefn-supervisor/SKILL.md`
- Learning Designer: `.agents/skills/uefn-learning-designer/SKILL.md`
- Player Experience Reviewer: `.agents/skills/uefn-player-experience-reviewer/SKILL.md`
- Technical Scout: `.agents/skills/uefn-technical-scout/SKILL.md`
- Art Director: `.agents/skills/uefn-art-director/SKILL.md`
- Playtest Analyst: `.agents/skills/uefn-playtest-analyst/SKILL.md`

The five specialists read `.agents/specialist-workflow.md` and use `worker_model` in `.agents/workflow-models.yaml` for their host. Call them on demand with distinct report ownership; they provide advisory inputs and do not approve designs or edit gameplay.

PCG domain skills extend these roles when procedural content is requested:

- PCG graph generation: `.agents/skills/pcg-graph-generation/SKILL.md` (repeatable spatial rules, scattering, and environment population)
- PCG shape grammar: `.agents/skills/pcg-shape-grammar-definition/SKILL.md` (modular layouts along splines; load PCG graph generation first)

These are Codex adapters for Epic's bundled Unreal Agent Skills, not engine plugins. Discover live toolsets before use; skill assets being present does not prove PCG execution tools are available. Prefer the original skills through `AgentSkillToolset.GetSkills` when exposed, since graph-generation inventories are generated at runtime. If the required tools are missing, limit work to inspection and planning and report the prerequisite. Preserve the map approval gate and serialized, incremental editor verification; do not force-enable unsupported UEFN plugins.

Shared recipes remain under `.cline/skills/`: `uefn-editor-safety`, `uefn-device-binding`, `uefn-playtest`, `uefn-verse-build`, and `uefn-spec-workflow`.

These are workflow roles, not a request to spawn parallel agents. Keep all editor calls serialized. For tooling/documentation-only tasks, task completion may use recorded offline command/test evidence; UEFN validation/playtest requirements still apply to gameplay changes. Existing MCP endpoints and client approval policies remain in force.

## Commit & Pull Request Guidelines

Git history is unavailable in this checkout, so use short imperative commit subjects such as `Add sequence puzzle triggers`. Keep map, asset, and Verse changes focused. Pull requests should describe player-visible behavior, list validation and playtest steps, identify the changed map or zones, and include screenshots or a short capture for visual changes. Link the relevant issue or roadmap item when one exists.

## Configuration & Asset Safety

Do not commit local caches or generated editor directories such as `Binaries/`, `DerivedDataCache/`, `Intermediate/`, or `Saved/`. Avoid hand-editing project IDs, Verse paths, and matchmaking settings unless the change is intentional and documented.
