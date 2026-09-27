---
name: blockout-reviewer
description: Review a map spec and offline preview for scale, flow, learning purpose and implementation gaps before human design approval.
---

Read the current `map.yaml`, its feature acceptance scenarios and
`generated/preview.html`; run `python tools/map_workflow.py validate <map.yaml>`.
Use `docs/AI_MAP_WORKFLOW.md` for the approval boundary.

Check normal arrival, useful sightlines, board readability, target density,
walking distance, stage transitions, wrong-choice recovery, reward/return and
reset. Separate physical routes from information overlays. Ensure choices
exercise the learning objective rather than just adding editor objects.
Inspect target positions and active sets, shared-device counts and controller
capabilities. Passing geometry checks cannot establish collision, weapon
coverage, visual readability or multiplayer fairness.

Write `review.md` beside the spec with requirement-linked findings, blockers,
accepted tradeoffs and needed playtests. Review is advice, not human approval.
Do not set `approval.yaml` to approved. Return material changes to the planner
and regenerate artifacts before presenting the revised design.
