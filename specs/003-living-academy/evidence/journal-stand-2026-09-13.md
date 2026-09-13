# Hub journal stand — 2026-09-13

Requirements: FR-002, NFR-002, Hub journal stand acceptance.
Task: T-JOURNAL-STAND. One local Fortnite player.
Session: `beae4c18fbbc4a99af1852cd8c29cd57`.
Map: `Content/fn_shoreline_island.umap`, Academy Hub.

## Saved revision

Three new editor-owned FortStaticMeshActors form a base, stem and shelf under
the existing journal button. All use `/Engine/BasicShapes/Cube.Cube` and the
existing academy teal material. No Verse source, gameplay device, binding,
button transform or sign transform changed. The journal radius remains 0.5.

Actor references, material and post-test bounds are recorded in
[placement readback](journal-stand-2026-09-13.json). Each actor was saved through
Unreal MCP. The final base spans Z 2400–2416, stem 2416–2472, shelf 2472–2480.
The base footprint is X -350 to -250, Y 950 to 1050. The existing Garden walkway
starts at Y 1350, leaving 300 cm between the stand and walkway edges.

The first live trial had a visible gap under the button. Raising the stem and
shelf corrected this; the final live view shows the button meeting its shelf.
StartSession and the subsequent full PushChanges both returned Completed;
GetGameState confirmed Running. Final acceptance below is after that push.

## Results

| Scenario | Expected | Actual | Result |
| --- | --- | --- | --- |
| Visual attachment | Button appears supported by stand | Raised shelf meets button; base rests on floor | Pass |
| Spawn approach | Walk to journal and open from floor without jumping | Walked from post-update spawn, acquired prompt, E opened Overview | Pass |
| Close and walking access | Close restores movement; stand can be walked around | Closed panel, walked sideways around stand and onto Garden path | Pass |
| Garden route | New geometry leaves existing path clear | Walked along marked path to Garden controls without jumping | Pass |
| Hub destination | Normal Garden return remains usable and arrival clear | Used RETURN TO ACADEMY HUB; arrived on existing Hub destination | Pass |
| Return approach | Journal accessible from floor after Hub return | Walked toward stand, acquired prompt, opened Overview and closed it | Pass |
| Neutral scenery | Stand does not represent shared progress | Stand has no gameplay bindings; Overview stays eight Ready rows with Garden recommended | Pass |

The existing Garden control pedestals require walking around them. In particular,
aiming at the return button from behind its cube did not expose the prompt;
walking around and aiming at the exposed side did. The successful return is
recorded below. This was navigation to a control, not puzzle completion.

## Captures

- [Initial rejected shelf gap](captures/journal-stand-spawn-002.png)
- [Corrected stand at walking distance](captures/journal-stand-approach-002.png)
- [Floor-level prompt](captures/journal-stand-target-002.png)
- [Explicit journal opening](captures/journal-stand-open-002.png)
- [Walking clear onto Garden path](captures/journal-stand-walkway-002.png)
- [Reached Garden controls](captures/journal-stand-garden-002.png)
- [Garden return prompt](captures/journal-stand-return-final-002.png)
- [Clear Hub arrival](captures/journal-stand-hub-002.png)
- [Journal prompt after return](captures/journal-stand-hub-prompt-002.png)
- [Overview after return](captures/journal-stand-hub-open-002.png)
- [Close after return](captures/journal-stand-hub-close-002.png)

## Limitations and shutdown

This is focused solo geometry acceptance. It does not complete the broader
landmark/compact-sign presentation pass, all floor-seam regression coverage,
multiplayer acceptance, full project validation or memory calculation. The
transient in-client memory meter during update is not a completed memory
calculation. No new Verse build was needed for this geometry-only change.
No claim of zero validation warnings is made.

Fortnite was closed after testing; process count zero and MCP Disconnected were
verified. Keep the final stand; full island work remains active.
