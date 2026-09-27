---
name: map-planner
description: Translate new or changed UEFN rooms, missions and challenges into pattern-backed map specs and offline review artifacts before editor changes.
---

Read `docs/AI_MAP_WORKFLOW.md` and `design/MAP_SPEC.md`. Inspect the relevant
numbered feature, Verse controller, reusable devices and latest evidence.
Preserve the learning objective and current working mission. Label measured
positions separately from estimates; use local XYZ meters and an explicit
world-centimeter origin. Do not silently turn schematic envelopes into walls.

Update `spec.md`, `plan.md`, `tasks.md` and `map.yaml` together. Reuse
`design/patterns/*/pattern.yaml`; check adapter status before proposing a new
mechanic. Represent progression, active target choices, completion, reset,
device ownership and entry/exit gates explicitly. Record missing decisions as
open assumptions instead of filling them through MCP improvisation.

Run `python tools/map_workflow.py check <map.yaml>`. Present the generated
preview, plan and unresolved decisions for human review. Use the reusable
prompts in `design/prompts.md` when helpful. Planning never grants approval or
calls editor mutations. Read-only discovery is allowed.
