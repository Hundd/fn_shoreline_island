---
name: uefn-verse-build
description: Build, push, and validate Verse code in UEFN. Use after editing .verse files or when a change must be compiled and pushed to the running editor.
---

# UEFN Verse Build & Push

- The authoritative build is UEFN's: choose **Verse > Build Verse Code** after
  adding or changing `.verse` files. `BuildAll` / a clean build should report no
  diagnostics.
- The playable map is `/fn_shoreline_island/fn_shoreline_island`.
- Follow the project prefix and naming: lowercase `fn_shoreline_island_*.verse`,
  four-space indent, `snake_case`, descriptive device names, one gameplay
  responsibility per file or class.
- After a source change, build then push before testing. Actor-property-only
  changes may not require a Verse build.
- Run **Project > Validate Project** before submitting or publishing; resolve
  errors and note warnings left intentionally.
- Keep player-facing text brief and age-appropriate per `plan.md`.
