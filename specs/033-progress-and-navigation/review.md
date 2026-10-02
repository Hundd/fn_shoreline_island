# Draft review — 2026-10-02

Requirements are ready for product review. Implementation readiness is blocked.

| Finding | Requirements | Disposition |
|---|---|---|
| Eight unique badges already provide a stable count; two Prompt activities share one badge. | FR-001,006 | Preserve module identities and recommend Workshop. |
| Current journal supplies next destination but no persistent progress HUD or generic stage interface. | FR-002,003,008 | Reuse readers; explicitly implement presentation/stage hooks. |
| Actual entrance positions, floor clearance and walking distances are not surveyed here. | FR-004 | Blocking a_01; schematic preview is not a physical route or new room layout. |
| Per-agent pulse lifecycle, existing indicators and map visibility settings need inspection. | FR-004,010 | Blocking a_02; do not assume static map icon state is personalized. |
| Mission steps and HUD safe regions must be audited before editing. | FR-002,008 | Blocking a_03; source-level count support does not establish a generic adapter. |

Scale, accessibility and entry/exit clearance cannot be accepted from diagram
coordinates. No new walking detours, targets, weapon devices or interactions are
proposed. Learning remains in the existing games; navigation makes the next action
clear. Agent's existing seven-module gate remains; optional content stays optional.
Labels use numbers/text as well as color. All cooked readability, reset, route and
multiplayer checks remain pending. Successful generation is offline evidence only.

No human approval is recorded. An approved, resolved bundle can later hand off to
the uefn-map-implementation skill. This request creates specifications only.

## Offline evidence

- `python tools/map_workflow.py check specs/033-progress-and-navigation/map.yaml`
  passed, generating preview.html, preview.svg, implementation.yaml and manifest.
- `python tools/map_workflow.py validate specs/033-progress-and-navigation/map.yaml`
  passed. Both commands report the three intentionally open assumptions above.
- Generated HTML and implementation intent were inspected: schematic title and
  marker provenance are explicit, with no invented walk connections. The generated
  plan remains a draft with execution blockers; its reconcile instructions must
  not be used as placement commands while schematic coordinates remain.
- No gameplay acceptance tasks were checked off; no approval record was created.

Session inspection during specification authoring returned Unconnected; no playtest
was launched and no editor mutations were performed.
