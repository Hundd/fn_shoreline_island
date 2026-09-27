# Initial editor build — 2026-09-24

The live UEFN MCP connection created and saved three project-owned color instances under `Content/PromptLab/`: `mi_prompt_blue`, `mi_prompt_red`, and `mi_prompt_green`. Each derives from the existing `m_academy_color` material and sets its `academy_color` vector.

In the open area south of the current greenhouse, UEFN created and saved:

- Three 450 cm spherical cores at x=9000, y=-3000/-3800/-4600, z=2750; three 550 cm navy pedestals beneath them. A separate red cone was added as the first heat silhouette cue.
- Raised target and destination scanner platforms at x=6200, y=-3000 and -5300, top z=2865; a central prompt console base at x=7600, y=-3800.
- Target and destination scanner Buttons, Blue/Red/Green selector Buttons, Power Reactor/Research Scanner/Storage Bay selector Buttons, and a Send Button. All 9 new controls have unique `prompt_lab_*` actor labels and were saved individually.

An editor viewport capture confirmed the distinct core colors, pedestals, console base, and both platform positions. `SceneTools.find_actors(name="prompt_lab_")` read back 18 named actors after the first save; the red flame actor was then added and saved. This is editor scaffold only: the new buttons have no Verse controller binding, the platforms have no traversal devices, the scanner/console boards are absent, and the existing four-command Prompt Lab is still active. Do not interpret the visual placement as gameplay acceptance.
