# Completion popup copy refinement

Owner requested completion and hub-return popup on the last pop039_ring_7. The approved nonmaterial copy lineage is completion-popup-copy-refinement.json; ready digest e8a90c247a73f3aabcd695863bb9199700073294edd096779dd8ef17533fe5e1. Implementer reran plan --ready successfully before edits.

Generated production source from learning-content.yaml with tools/build_popbridge_production.py. Exactly two final_done string literals changed; see completion-popup-source-delta.json and completion-popup-source-diff.patch. No generator logic, controller, device, sound, geometry, reward, Return, or journal-mask changes.

Exact popup (126 characters including newlines, within native150):

```
Mission complete! You saved three steps and reused them.
PopBridge = LOAD > HEAT > POP.
You can return to the hub. Use Return.
```

Existing successful target7 commit invokes committed_lesson -> advance_lesson -> owner feedback.Show with persistent duration0; final_board uses the same card. Existing journal masking and release/Replay cleanup remain. An accepted but not committed hit does not announce completion. This is source evidence, not gameplay acceptance.

Native BuildAll returned diagnostics[] (completion-popup-compile.json). SaveAll returned true, map dirty=false, game=Unconnected, session=Disconnected (completion-popup-save/map-dirty/final-game/final-session.json). Editor released to Supervisor with no calls in flight and left open.

No tests, Project Validate, cook, session launch, audition, or gameplay were performed, per owner instruction. A09 completion popup/Return/journal/rejected callbacks remains manual and unchecked.
