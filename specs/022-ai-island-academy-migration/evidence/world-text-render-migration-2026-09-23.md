# Campus TextRender migration — 2026-09-23

## Scope

The earlier Billboard audit did not cover TextRender components placed on the
decorative campus-shell actors. A live viewport check exposed visible legacy
facade titles, including `PATH GARDEN`, `LOOP LAGOON`, and `VARIABLE VAULT`.

## Live UEFN update

Updated only the `text` property of 13 TextRender components, then saved their
nine owning campus actors. No transforms, meshes, materials, Verse/device
references, game logic, progress, or reward state changed.

| Former presentation | New presentation |
| --- | --- |
| Path Garden | Prompt Lab |
| Loop Lagoon | Pattern Scanner |
| Signal Lighthouse | AI Classifier |
| Variable Vault | Confidence Core |
| Debug Workshop | AI Error Lab |
| Event Factory | AI Tool Lab |
| Tidepool Nursery | AI Skills Lab |
| Build A Bot | AI Agent Mission |
| Academy Hub | AI Academy Hub |

Multi-line title components preserve their existing line-break layout using
`<br>`; this makes the new names fit without changing decorative structures.

## Verification

- UEFN read back all 13 changed component values exactly after saving.
- A stale-name scan across those components found zero former mapped-zone
  titles.
- A post-save viewport capture shows the former Variable Vault facade now
  reading **CONFIDENCE CORE**.
- A final component-level scan read all 13 TextRender components belonging to
  `campus_*` decorative actors. It found zero former mapped-zone titles.
- A broader live-editor sweep then read every TextRender component in the
  loaded level (1,290 actors; 14 TextRender components, including the Pix AI
  Core title). It found zero instances of the eight former campus names.

No Verse source changed. A fresh in-client session is still required to verify
distance readability across every facade and the existing gameplay flows.

## Session attempt

A post-save UEFN session launch was requested from `Disconnected` /
`Unconnected`. Its content-update call exceeded the MCP five-minute limit;
the editor then settled back to `Disconnected` / `Unconnected` with no game
running. This does not prove the in-client visual check. It leaves the UEFN
editor open and identifies the required human playtest rather than masking the
timeout as a successful runtime result.
