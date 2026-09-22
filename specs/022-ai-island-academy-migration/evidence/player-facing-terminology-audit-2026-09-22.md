# Player-facing terminology audit — 2026-09-22

## Scope

- Searched quoted Verse messages for the former zone and badge names from the
  migration map, plus visible terms such as vault, factory, harbor, nursery,
  and fieldwork.
- Retained internal identifiers and comments such as `garden`, `lagoon`, and
  `nursery`; they are not player-facing and preserve existing device bindings.

## Corrected visible strings

- Confidence Core ownership feedback no longer calls its station a vault.
- AI Tool Lab ownership feedback no longer calls its station a factory.
- AI Classifier Badge now describes three AI classification challenges instead
  of harbor challenges.
- AI Discovery Trail's observation prompt now names a prediction pattern.
- AI Skills Lab ownership and optional remix messages no longer call the zone a
  nursery. Planter/bed wording remains where it describes the Care-skill
  puzzle's visible props.

## Verification

- Verse `BuildAll` returned zero diagnostics.
- A fresh UEFN session reached `Running` after the changes, then `StopGame` and
  `StopSession` completed. Final session status was `Disconnected` /
  `Unconnected`.

## Remaining checks

- Inspect the changed messages in-client for visual readability.
- Exercise correct, wrong, replay, and multiplayer paths; this static audit
  does not prove runtime interaction behavior.
