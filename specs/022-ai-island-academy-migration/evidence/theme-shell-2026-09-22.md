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
full game flows and multiplayer behavior are not proven by this evidence.
They remain open in this feature's task list.

## User-confirmed UEFN validation (2026-09-23)

The project owner confirmed that UEFN project validation completed successfully,
memory calculation completed successfully, and the project push completed with
no errors. These are manual UEFN outcomes; the current MCP tool registry does
not expose equivalent commands. This evidence does not substitute for the
separate interactive solo or two-player progression checks.

## World-sign migration (2026-09-23)

- Live UEFN inspection found seven stale player-facing classic Billboard
  strings: four `LOOP LAGOON` station boards, a `LOOP LAGOON >` hub route,
  and two `PATH GARDEN` route/entry signs.
- Their existing `text` properties were updated and each actor was saved:
  `PATTERN SCANNER` now labels the four boards and hub route; `PROMPT LAB`
  now labels the route and entry sign. Only billboard text changed; existing
  transforms, bindings, and gameplay configuration were retained.
- A read-back across every loaded Billboard found zero remaining player-facing
  `Path Garden`, `Garden Path`, or `Loop Lagoon` strings.
- A fresh UEFN session cook completed, reached `Running`, and was stopped to
  `Disconnected` / `Unconnected`.

## Classifier, Error Lab, and Tool Lab signs (2026-09-23)

- All 24 static AI Classifier destinations now map the existing routes to
  `FOOD`, `ANIMAL`, and `VEHICLE` rather than `GARDEN`, `WORKSHOP`, and
  `STORAGE`. The four Classifier boards, four rule boards, start sign, and hub
  route now also use the AI Classifier framing.
- Four Debug Workshop boards plus its route now present `AI ERROR LAB`.
  Four Event Factory boards plus its route now present `AI TOOL LAB`.
- The live-editor read-back found zero Billboard strings containing `DEBUG
  WORKSHOP`, `EVENT FACTORY`, or `SIGNAL LIGHTHOUSE`, and zero remaining
  legacy destination labels on any `signal_*` AI Classifier sign.
- All 44 saved Billboard changes cooked in a fresh session that reached
  `Running`; the match and session were stopped to `Disconnected` /
  `Unconnected` afterward.

## Pix AI Core editor probe

## Hub-sign binding inspection

- The placed `hub_static_sign_refresh` Verse device was inspected through the
  live UEFN device toolset. All 13 of its existing billboard fields resolve
  to placed billboard subobjects: academy title, Prompt Lab sign and four
  sequence labels, return sign, hub routes, Fix the Prompt route, journal
  sign, AI Classifier route, and Confidence Core route.
- This proves the migrated Verse sign text has live device targets. It does
  not prove in-client line wrapping or player readability, which remain open.

On 2026-09-23, the bound academy-title Billboard's saved `BYTE ISLAND
ACADEMY` default was corrected to the AI Island Academy restoration goal. The
fixed Verse title now gives the seven-module Agent Mode unlock rule and sends
players to the personal journal for changing status instead of permanently
claiming all seven modules are offline. UEFN read-back and actor save
completed; Verse `BuildAll` returned zero diagnostics. In-client readability
remains open under the user's request to skip validation and playtesting.

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

## Pix spawn message follow-up — 2026-09-23

- Source review found that the Prompt Lab manager shows its introduction on
  player join and on every hub respawn. The earlier fixed `7 modules are
  offline` sentence could therefore contradict retained player progress.
- The introduction now tells players to restore seven modules to unlock Agent
  Mode, starts them at Prompt Lab, and points to their personal journal for
  current status. No progress reads or writes, device references, or rewards
  changed. Verse `BuildAll` returned zero diagnostics.
- The inventory records the current source declaration. In-client HUD timing
  and readability remain untested under the user's instruction to skip
  validation and playtesting.
- A follow-up wording pass scoped the Prompt Lab direction to new players
  (`New here?`) and made the journal the next-step guide for returning
  players. This avoids repeatedly directing progressed players to restart
  the first zone. Verse `BuildAll` again returned zero diagnostics.

## Completed-Core journal guidance — 2026-09-23

- The journal's fixed `Restore Pix's offline AI modules` line contradicted its
  own `8/8 MODULES ONLINE` state after the Agent Mission. The line now comes
  from the existing read-only, per-player `completed_modules` count:
  incomplete players see the restoration goal; 8/8 players see `All eight AI
  Core modules are ONLINE!`.
- No tracker assignment, completion state, reward guard, or device reference
  changed. Verse `BuildAll` returned zero diagnostics, and the label inventory
  records the current declarations. The 8/8 branch still needs in-client
  confirmation when playtesting is resumed.
