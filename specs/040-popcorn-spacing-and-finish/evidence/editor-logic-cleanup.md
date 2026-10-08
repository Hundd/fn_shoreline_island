# Editor logic cleanup — 2026-10-05

User authorization: after recommending an Outliner folder with editor-hidden logic devices, the owner replied, "yes do the change".

Scope: the eight existing `pop039_target_0` through `pop039_target_7` Verse devices. Assign them to `Popcorn Parkour/Logic/Targets` and toggle their editor-only visibility off. Preserve actor identities, transforms, meshes, Verse source, references, gameplay visibility and runtime settings.

This is editor organization only, with no player-visible map design or gameplay change. The offline map approval and cooked gameplay testing gates do not apply. No assets are replaced and no actors are marked editor-only. Folder assignments are saved; the Outliner eye toggle is transient and may need reapplying after reopening the editor.

Acceptance: all eight original devices appear in the named folder; editor hidden readback is true for each; full transforms match the checkpoint; actors save successfully; no playtest game remains running.

Verification: all eight actors saved without MCP errors, all eight original paths read back in the new folder, all eight editor-hidden states are true, and all eight full transforms match their checkpoint. Final game state: `Unconnected`. Readback: [editor-logic-cleanup.json](editor-logic-cleanup.json). UEFN remains open.
