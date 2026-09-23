# Theme Shell evidence — 2026-09-22

## Changed presentation

- `fn_shoreline_island.uefnproject` now advertises **AI Island Academy** and
  the Pix AI Core description.
- Verse hub signs, the personal journal, prompt controls, Prompt Badge, and
  Garden Repair now use the Prompt Lab / Fix the Prompt story.
- Existing tracker titles now display Prompt, Pattern, Classifier, Confidence,
  AI Detective, Tool Master, AI Skills, and AI Agent badges.
- Zone start and completion UI now uses Pattern Scanner, AI Classifier,
  Confidence Core, AI Error Lab, AI Tool Lab, AI Skills Lab, and AI Agent
  Mission terminology. Confidence Core displays its unchanged 0–10 internal
  clue score as 0–100% confidence in its player-facing board.

## Pix AI Core status presentation

- The hub title identifies Pix AI Core’s eight modules and directs players to
  their personal journal.
- The journal derives its state from the existing per-player badge sources:
  restored modules display `ONLINE`, unfinished modules display `OFFLINE`,
  and Agent Mode displays `LOCKED`, `READY`, or `ONLINE` according to that
  same progress.

## Safety audit

No `player_states`, progress maps, tracker assignments, reward booleans,
device fields, or completion functions were renamed or structurally changed.
The Prompt Lab still uses the same four-input sequence and immediate reset;
only its visible command names now map its existing order to Find Seed, Dig
Hole, Plant Seed, Water.

## Verification

- Verse `BuildAll` completed with zero diagnostics after the text migration.
- Two fresh UEFN session uploads completed; the game reached `Running` after
  the final Verse changes as well.
- The match was stopped (`Completed`) and the session was torn down. A final
  status read returned `Disconnected` / `Unconnected`.

## Latest verification

- The main hub billboard now gives a concise player journey: `AI ISLAND
  ACADEMY`, `PIX AI CORE: 7 MODULES OFFLINE`, `AGENT MODE: LOCKED`, `START:
  PROMPT LAB`, and the personal-journal prompt. This matches the core story:
  seven abilities are restored before the final Agent Mode mission. Verse
  `BuildAll` returned zero diagnostics; a fresh session reached `Running` and
  was stopped to `Disconnected` / `Unconnected`.
- The first Prompt Lab HUD message establishes the same full story before its
  existing objective: `My AI Core glitched—7 modules are offline and Agent
  Mode is locked. Start with Instructions...`. It changes only localized
  presentation text. Verse `BuildAll` returned zero diagnostics; a fresh
  session reached `Running` and was stopped to `Disconnected` /
  `Unconnected`.
- A fresh UEFN session cook reached `Connected` / `Running` after the personal
  Core-state presentation change, then the game and session were stopped and
  verified `Disconnected` / `Unconnected`.
- Journal completion rows now present an explicit, short learning summary for
  each restored module. Verse `BuildAll` returned zero diagnostics and a fresh
  UEFN session again reached `Connected` / `Running`; it was then stopped and
  verified `Disconnected` / `Unconnected`.
- The journal now also shows a personal `PIX AI CORE: n/8 MODULES ONLINE`
  indicator. Its value is read from the existing eight per-player completion
  sources and does not write progress or rewards. Verse `BuildAll` returned
  zero diagnostics; a fresh UEFN session reached `Running` and was stopped and
  verified `Disconnected` / `Unconnected`.
- The Tool Lab journal summary now uses the plan's explicit explanation that
  AI systems can use tools to get information or perform actions. Verse
  `BuildAll` returned zero diagnostics; a fresh UEFN session reached `Running`
  and was stopped to `Disconnected` / `Unconnected`.
- The journal status and learning-summary rows now name all eight mapped zones:
  Prompt Lab, Pattern Scanner, AI Classifier, Confidence Core, AI Error Lab,
  AI Tool Lab, AI Skills Lab, and AI Agent Mission. Verse `BuildAll` returned
  zero diagnostics; a fresh UEFN session reached `Running` and was stopped to
  `Disconnected` / `Unconnected`. In-client line wrapping remains unverified.

## Still required

World-only signs, Props/VFX/audio, in-client readability, input interaction,
full game flows, multiplayer behavior, project validation, and memory are not
proven by this evidence. They remain open in this feature's task list.

## Pix AI Core editor probe

## Hub-sign binding inspection

- The placed `hub_static_sign_refresh` Verse device was inspected through the
  live UEFN device toolset. All 13 of its existing billboard fields resolve
  to placed billboard subobjects: academy title, Prompt Lab sign and four
  sequence labels, return sign, hub routes, Fix the Prompt route, journal
  sign, AI Classifier route, and Confidence Core route.
- This proves the migrated Verse sign text has live device targets. It does
  not prove in-client line wrapping or player readability, which remain open.

The live-editor inspection located the hub foundation (X -1700..2800, Y
0..3000, Z 2250..2400) and its existing static-sign Verse device. A temporary
Billboard device was placed at the clear east hub edge, saved, and labelled
`pix_ai_core_status`. The current UEFN MCP `SetDeviceProperty` call rejects a
newly placed classic Billboard as a `billboard_device` reference, even after
saving it. The actor was immediately removed and the temporary Verse field was
reverted, so no unbound/default-text artifact remains. The Pix AI Core world
centerpiece requires binding through UEFN's native Details picker (or an MCP
build that supports this reference type); the personal AI Core Journal already
shows the corresponding eight per-player module statuses.
