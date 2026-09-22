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

## Session shutdown

- The failed validation attempt left a Fortnite playtest client active while
  UEFN MCP was unresponsive. The exact client process was stopped and a
  follow-up process check confirmed it is gone; UEFN remains open.
- A fresh read-only `GetSessionStatus` MCP probe still stalled afterward, so
  no further live editor calls were made.
