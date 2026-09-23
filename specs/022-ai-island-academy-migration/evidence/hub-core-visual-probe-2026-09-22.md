# Pix AI Core centerpiece probe — 2026-09-22

## Created presentation assets

- Added the saved hub actor `pix_ai_core_centerpiece` at X=800, Y=1000,
  Z=2900 (500 units above the verified hub ground).
- Its decorative composition is a hovering `pix_core_orb`, a small
  `pix_core_plinth`, and one `pix_core_cyan_light`.
- Added and saved `/fn_shoreline_island/Academy/Core/m_pix_ai_core`, a simple
  unlit cyan emissive material. It has no samplers and is assigned only to the
  core orb. The orb has no generated overlap events and casts no dynamic
  shadow.

## Validation finding

- An annotated editor viewport capture from X=800, Y=-200, Z=2700 identified
  `pix_ai_core_centerpiece` in the hub view, at the intended X=800, Y=1000,
  Z=2900 placement. This verifies editor visibility and placement, but not
  in-client readability.

- A fresh UEFN session upload correctly stopped before launch with
  `Validation failed`; no playtest was started.
- The authoritative UEFN log identified one Core-specific error: the point
  light overrides `bAffectTranslucentLighting` to `False`, which the
  `ValkyrieValidator_Properties` disallows. The required correction is to
  reset that property to its default `True`.
- After MCP reconnection, a read-back confirmed the reset completed:
  `bAffectTranslucentLighting` is now the required default `True`. The actor
  was saved.
- A fresh UEFN session upload then completed, reached `Connected` / `Running`,
  and was stopped cleanly to `Disconnected` / `Unconnected`.
- Client logs were not exposed by this session, so the centerpiece’s in-client
  readability and placement still require a visual playtest.

## In-world title — 2026-09-23

- Added the saved `pix_core_title_text` TextRender component to the existing
  decorative core actor. It reads `PIX<br>AI CORE`, is cyan, and faces the hub
  approach above the orb.
- A live viewport capture confirms the title is visible with the core from the
  player-spawn approach. Component read-back confirms its text, placement,
  rotation, size, and color.
- The title deliberately does not claim a shared module count. The journal
  remains the per-player authority for module status, so this visual addition
  does not affect player progress, rewards, or multiplayer state.

## Static module legend probe — 2026-09-23

- Two temporary TextRender components listed the eight module names beside
  the core. Editor viewport captures showed that the words crossed pillars
  and busy scenery and were not reliably readable from the hub approach.
- Both temporary components were removed and the Core actor saved. That
  unbacked layout was not retained; the personal journal continued to carry
  the authoritative eight-name status display.

## Backed Core module legend — 2026-09-23

- Added the separate saved actor `pix_ai_core_module_legend` at X=-300,
  Y=1850, Z=2700, facing the hub spawners. Its classic Billboard frame has
  a TextRender component carrying the eight static module names and a
  `Personal status: Journal` instruction. The device's own text is blank, so
  it cannot duplicate the component text when its display initializes.
- Editor viewport captures from the central hub approach showed the backed
  text legible beside the Pix Core, with the main promenade left clear. The
  actor, TextRender content, border setting, and placement were read back
  after the actor was saved. The label inventory records the new visible text.
- This is decorative only: no Verse binding, per-player progress, reward,
  device reference, or shared status indicator was added. In-client
  readability, collision clearance, and cook remain untested under the
  user's request to skip validation and playtesting.

## Session shutdown

- The failed validation attempt left a Fortnite playtest client active while
  UEFN MCP was unresponsive. The exact client process was stopped and a
  follow-up process check confirmed it is gone; UEFN remains open.
- A fresh read-only `GetSessionStatus` MCP probe still stalled afterward, so
  no further live editor calls were made.
