# Project Title

## Requirements

- `FR-001`: The player-facing UEFN project title MUST be **Byte Island Academy**.
- `FR-002`: The project description MUST communicate the coastal coding-puzzle adventure in brief, age-appropriate language.
- `FR-003`: Existing internal project, map, plugin, and Verse identifiers MUST remain unchanged.

## Acceptance scenarios

### Updated project metadata

Given the project descriptor is opened, when its metadata is inspected, then its title is `Byte Island Academy` and its description is `Restore Byte Island Academy! Explore a sunny coastal campus, solve bite-size coding puzzles, and help Pix bring its glitched systems back online.`

### Stable internal references

Given the title update is complete, when project bindings and plugin metadata are inspected, then the existing `fn_shoreline_island` identifiers and Verse path are unchanged.
