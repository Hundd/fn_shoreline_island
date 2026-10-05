# fn_shoreline_island rules

Always-on rules for Cline in this UEFN island workspace. Detailed source:
`AGENTS.md`.

## Assets
- Treat binary `.uasset` / `.umap` as editor-owned. Edit through UEFN / Unreal
  MCP and save all affected actors. Never rename or move
  `Content/__ExternalActors__` / `Content/__ExternalObjects__`.
- Never commit `Binaries/`, `DerivedDataCache/`, `Intermediate/`, `Saved/`.

## Verse
- Four-space indent, `snake_case`, descriptive device names, one gameplay
  responsibility per file or class.
- Match the lowercase project prefix: `fn_shoreline_island_*.verse`.
- Build with **Verse > Build Verse Code** after any `.verse` change.

## Testing
- No automated test framework. For every gameplay change, launch a session and
  verify spawn, objective progression, reset, and solo play. Test multiplayer
  when devices share state.
- Run **Project > Validate Project** and resolve errors before review.

## Sessions
- Stop any active playtest (**End Game** / **Stop Session**) at the end of every
  task and verify it is no longer running. Leave the editor open unless told to
  close it.

## Spec workflow
- Use `specs/` as the source of truth. Create or update a numbered feature
  directory (`spec.md`, `plan.md`, `tasks.md`) before implementation.
- Map changes follow `docs/AI_MAP_WORKFLOW.md`: inspect → map.yaml → offline
  preview/validation → explicit human review → approved implementation plan →
  incremental MCP execution/readback → gameplay verification.
- Use the uefn-map-planning, uefn-map-implementation and uefn-gameplay-verifier
  skills for those roles. Run `python tools/map_workflow.py check <map.yaml>`;
  `plan <map.yaml> --ready` must pass before map-design mutations.
- Prefer reusable devices/Verse configuration. Record deviations; do not
  reinterpret a draft or successful MCP response as design/gameplay approval.
