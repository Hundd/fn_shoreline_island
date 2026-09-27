# Reusable agent prompts

Use these with the project rules; they do not confer editor authorization.

**Plan:** “Inspect the current mission and latest evidence for [request]. Use
the map-planner skill. Update the numbered feature and map.yaml using existing
patterns. Preserve working intent, label uncertain geometry and missing adapter
capabilities, and run check. Present the preview and implementation plan for
review; make no map-design mutations.”

**Review:** “Use the blockout-reviewer skill on [map.yaml] and its generated
preview. Check scale, walking, sightlines, active choices, learning objective,
entry/exit gates, device coverage and reset. Record concrete blockers and
playtests in review.md. Do not mark human approval.”

**Implement:** “Use the uefn-implementer skill for the explicitly approved
[map.yaml] revision. Check approval evidence and plan --ready, discover current
MCP schemas and inspect scene drift. Reuse existing actors/Verse, apply the
resolved delta incrementally with readback, and record deviations. Return any
missing design decision to planning.”

**Verify:** “Use the uefn-verifier skill to compare the scene with [approved
map.yaml]. Report expected/actual counts, IDs, approximate positions and
connections; validate/cook and exercise its acceptance scenarios. Record
deviations and unresolved tests without changing the design. End active games
and confirm shutdown.”
