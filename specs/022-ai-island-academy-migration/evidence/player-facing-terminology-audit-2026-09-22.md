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

- Pattern Scanner's safe wrong-count feedback now explains both the outcome
  and reason: the robot stopped short or long because each repeat moves one
  tile. Its existing immediate retry, count, progress, and badge behavior are
  untouched. Verse `BuildAll` returned zero diagnostics; a fresh UEFN session
  reached `Running` and was stopped to `Disconnected` / `Unconnected`.

- Journal source audit confirms the stable tracker order remains `Signal,
  Energy, Debug, Event, Bot, Nursery`: AI Skills reads tracker 5, Agent Mode
  reads tracker 4, and Agent readiness requires the first seven restored
  modules. No journal method writes a tracker, player state, or reward.
- A narrow Verse-string audit finds no stale claim that eight modules are
  offline. The hub and initial Pix HUD now consistently present **seven
  modules offline** with **Agent Mode locked**.

- Confidence Core's remaining player-facing `energy` language was converted
  to percentage confidence: its repeat, boundary, ready, help, board, and
  retry messages now use 0%–100% values. The underlying `energy` variable,
  fixture values, player map, and device bindings remain unchanged. Verse
  `BuildAll` returned zero diagnostics; a fresh UEFN session reached
  `Running` and was stopped to `Disconnected` / `Unconnected`.

- Verse `BuildAll` returned zero diagnostics.
- A fresh UEFN session reached `Running` after the changes, then `StopGame` and
  `StopSession` completed. Final session status was `Disconnected` /
  `Unconnected`.

## Remaining checks

- Inspect the changed messages in-client for visual readability.
- Exercise correct, wrong, replay, and multiplayer paths; this static audit
  does not prove runtime interaction behavior.
