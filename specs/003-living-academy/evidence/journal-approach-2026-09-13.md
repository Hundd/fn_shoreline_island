# Journal approach acceptance — 2026-09-13

Requirements: FR-001, FR-002, NFR-002; task T-JOURNAL-APPROACH.
Player count: one local Fortnite client. Session: `99315ebc14314fa5abd35cf2cd7eb3ec`.
Map: `Content/fn_shoreline_island.umap`, Academy Hub journal button.

## Revision and saved change

The existing native journal button's `interactionRadius` changed from `0` to
`0.5` through Unreal MCP. The native schema describes looking within the radius
instead of directly at the button; it does not specify units. The actor was
saved before and after the change. Post-test native readback confirms radius
`0.5`, `interactTime: 0`, and `visibleDuringGame: true`.

Actor:
`/fn_shoreline_island/fn_shoreline_island.fn_shoreline_island:PersistentLevel.Device_Button_V2_C_UAID_E89C2592D1B5EE0003_1841782935`.

The button remains at (-300, 1000, 2500), yaw -90, scale 1. Its journal binding
and the sign placement are unchanged. No Verse source changed in this test.
Journal source SHA256:
`645DA93E6DFEFE3785EC5378A744E95F7B9E389806CD86B49C3CB93D6DEEF5F6`.
StartSession completed and the game entered Running.

## Focused solo results

| Scenario | Expected | Observed | Result |
| --- | --- | --- | --- |
| Approach from fresh Hub spawn | Prompt without precise button-face aiming | Prompt and white outline appear with the view aimed above/beside the thin button | Pass |
| Explicit opening | Approaching alone leaves journal closed; E opens it | E opens Overview, all eight badges Ready, Garden recommended | Pass |
| Close and walk past | Panel closes, movement works, no automatic reopening | Close removes canvas; player walks past and onward to Garden with no journal canvas | Pass |
| Nearby Garden controls | Journal does not intercept Garden interaction targets | Wait shows its own E WAIT prompt; Garden return shows RETURN TO ACADEMY HUB and teleports the player normally | Pass |
| Shared Hub return approach | Prompt near the button without aiming precisely at its edge | After Garden return and walking toward journal, camera adjustment shows prompt while the button remains to the right of screen center | Pass |
| Explicit reopen after return | E opens the same fresh state; Close removes it | Overview again shows all eight Ready and Garden recommended; Close removes the panel | Pass |

No Garden puzzle interaction was submitted; Wait was targeted only. The normal
Garden return button was used. No badge was earned in this session.

## Captures

- [Spawn-route prompt beside button](captures/journal-radius-near-002.png)
- [First explicit open](captures/journal-radius-open-002.png)
- [Walking past with journal closed](captures/journal-radius-walkpast-002.png)
- [Garden Wait prompt](captures/journal-radius-wait-002.png)
- [Garden return prompt](captures/journal-radius-return-button-002.png)
- [Normal shared Hub return](captures/journal-radius-hub-002.png)
- [Return-route prompt beside thin edge](captures/journal-radius-return-near-002.png)
- [Explicit open after return](captures/journal-radius-return-open-002.png)
- [Close after return](captures/journal-radius-return-close-002.png)

## Scope and shutdown

Keep the 0.5 setting based on these focused acceptance results. This is not full
project validation, multiplayer acceptance, an exhaustive test of every viewing
angle, or completion of the island's presentation work. No new compile was
needed because this was a native device property change. Full validation and
memory checks remain pending; no zero-warning claim is made.

Fortnite was closed after testing. Process count was verified as zero and MCP
reported `Disconnected`.
