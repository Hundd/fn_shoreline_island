# Repository Guidelines

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

Project-local roles use the existing skill mechanism. All agents should read the relevant file directly if their client does not auto-discover `.cline/skills/`:

- Producer: `.agents/skills/uefn-producer/SKILL.md` (product direction and feature briefs upstream of planning)
- Planner: `.cline/skills/map-planner/SKILL.md`
- Reviewer: `.cline/skills/blockout-reviewer/SKILL.md`
- Implementer: `.agents/skills/uefn-map-implementation/SKILL.md` (dispatch with `model: "gpt-6-sol"` and `fork_turns: "none"`; no inherited frontier model or silent model fallback); execution checks: `.cline/skills/uefn-implementer/SKILL.md`
- QA / Gameplay Verifier: `.agents/skills/uefn-gameplay-verifier/SKILL.md` (dispatch with `model: "gpt-6-sol"` and `fork_turns: "none"`; no inherited frontier model or silent model fallback)
- Verifier checks: `.cline/skills/uefn-verifier/SKILL.md`

These are workflow roles, not a request to spawn parallel agents. Keep all editor calls serialized. For tooling/documentation-only tasks, task completion may use recorded offline command/test evidence; UEFN validation/playtest requirements still apply to gameplay changes. Existing MCP endpoints and client approval policies remain in force.

## Commit & Pull Request Guidelines

Git history is unavailable in this checkout, so use short imperative commit subjects such as `Add sequence puzzle triggers`. Keep map, asset, and Verse changes focused. Pull requests should describe player-visible behavior, list validation and playtest steps, identify the changed map or zones, and include screenshots or a short capture for visual changes. Link the relevant issue or roadmap item when one exists.

## Configuration & Asset Safety

Do not commit local caches or generated editor directories such as `Binaries/`, `DerivedDataCache/`, `Intermediate/`, or `Saved/`. Avoid hand-editing project IDs, Verse paths, and matchmaking settings unless the change is intentional and documented.
