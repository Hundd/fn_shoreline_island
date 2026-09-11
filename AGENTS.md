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

## Spec-Driven Workflow

Use `specs/` as the source of truth for planned player-visible changes. Before implementation, create or update a numbered feature directory containing `spec.md`, `plan.md`, and `tasks.md`. Define testable requirements and Given/When/Then acceptance scenarios before editing the island. Record implementation choices in the feature plan, link tasks to requirement IDs, and check off tasks only after the corresponding UEFN validation or playtest evidence has been recorded. If editor work changes the intended behavior, update the spec in the same change.

## Commit & Pull Request Guidelines

Git history is unavailable in this checkout, so use short imperative commit subjects such as `Add sequence puzzle triggers`. Keep map, asset, and Verse changes focused. Pull requests should describe player-visible behavior, list validation and playtest steps, identify the changed map or zones, and include screenshots or a short capture for visual changes. Link the relevant issue or roadmap item when one exists.

## Configuration & Asset Safety

Do not commit local caches or generated editor directories such as `Binaries/`, `DerivedDataCache/`, `Intermediate/`, or `Saved/`. Avoid hand-editing project IDs, Verse paths, and matchmaking settings unless the change is intentional and documented.
