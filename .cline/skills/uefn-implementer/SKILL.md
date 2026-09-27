---
name: uefn-implementer
description: Implement an explicitly approved map-spec bundle incrementally through Unreal MCP using existing Verse and devices.
---

Follow `AGENTS.md`, `docs/AI_MAP_WORKFLOW.md`, uefn-editor-safety and the existing
uefn-device-binding skill. Read the feature plan and actual human approval
evidence, not just an `Approved` label. Run
`python tools/map_workflow.py plan <map.yaml> --ready`; stop design mutations
on errors, stale approval or unresolved assumptions. Existing explicit approval
does not need to be requested again while scope and artifacts are unchanged.

Discover current tool schemas and inspect the actual world. Resolve source
references to exact actor identities, materials, transforms and editable fields;
compare with intended state. The plan is an intent artifact, not callable MCP
arguments. Prepare/review a concrete delta when it exposes missing decisions.

Prefer existing controllers, `@editable` values and ordered arrays. Preserve
Prompt Lab target indices and shared badge/Data Energy ownership. Never claim
arbitrary sequences are supported by the hardcoded controller. Save a recovery
checkpoint. Apply one logical group at a time with serialized calls and full
transform readback, retaining rotation/scale. Save affected editor assets.

Stop on ambiguous results; don't retry a mutation blindly. Record deviations
and evidence. If blocked design decisions change behavior or layout, update
the spec/preview/plan and return the revised bundle for human review. Compile
changed Verse, validate/cook and hand off to verification. Stop active playtest
games before the final response and leave the editor open.
