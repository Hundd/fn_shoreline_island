# AI Tool Lab and AI Skills Lab presentation — 2026-09-22

## AI Tool Lab

- Kept the Event Factory’s event links, test sequence, retries, per-player
  station ownership, and one-time Tool Master Badge guard unchanged.
- Reframed player-facing instructions as choosing a tool action for a Bell or
  Lever input, then trying that input.
- The boards now distinguish the recent input, chosen tool action, goal, and
  safe retry feedback. They use the concrete actions **Open chute** and
  **Light lamp** without making claims beyond the lesson: some AI systems can
  choose tools to help complete tasks.
- Its first challenge now explicitly introduces a tool as an action an AI can
  use. Safe wrong-answer feedback also names the input and its expected
  action (Bell -> Open chute; Lever -> Light lamp), so it explains why the
  retry is needed rather than only reporting a mismatch.

## AI Skills Lab

- Kept the Nursery’s challenge state, plan execution, replay/reset behavior,
  station ownership, and one-time AI Skills Badge guard unchanged.
- Reframed the first challenge as defining a named **Care** skill with four
  steps, then reframed later challenges as reusing it across planters.
- Updated controls, boards, execution feedback, help, and completion text so
  players see a skill as a named reusable group of steps.

## Verification

- Verse `BuildAll` completed with zero diagnostics after the presentation
  changes.
- A fresh UEFN session cook reached `Connected` / `Running`.
- The game and session were stopped afterward; final state was `Disconnected`
  / `Unconnected`.
- Verse `BuildAll` also returned zero diagnostics after the Tool Lab feedback
  clarification. A fresh session reached `Running` and was stopped to
  `Disconnected` / `Unconnected`.

## Remaining checks

- Test each challenge’s correct path, wrong path, help, replay, and retained
  reward in-client.
- Test station ownership and reward behavior with two players.

## Tool request framing — 2026-09-23

- Reframed the two retained input IDs as **Supply request** and **Beacon
  request**. Their existing actions remain **Open chute** and **Light lamp**,
  matching the physical parcel and lamp props. The source now uses those
  requests in instructions, boards, hints, results, and Button prompts.
- Updated 16 static control signs, four `SHOW INPUT` signs, four recent-input
  board defaults, and 16 saved Button interaction texts across the four Tool
  Lab stations in UEFN. Every changed property was read back and
  its actor saved; the label inventory records the new values. Device
  references, input IDs, connection checks, player state, and badge guard were
  unchanged.
- Verse `BuildAll` returned zero diagnostics. In-client sign readability and
  challenge-flow checks remain open under the user's request to skip
  validation and playtesting.

## Skills Lab plan wording — 2026-09-23

- Eight player-facing error, answer, and optional remix messages now say
  **plan slot** or **skill plan** instead of exposing the internal `caller`
  term. Their underlying Care definition, caller array, repeat logic, and
  badge state were not changed. Verse `BuildAll` returned zero diagnostics.
- Updated the four saved Run signs and twelve saved plan-slot signs through
  UEFN, read back each text, and saved all sixteen actors. The inventory now
  reflects those saved values and the revised Verse declarations.
- The AI Skills Lab interaction and readability paths remain untested under
  the user's request to skip validation and playtesting.

## Tool Lab fixed-demo copy — 2026-09-23

- The fixed-demonstration message now asks players to identify the request
  behind its fixed tool choices. This replaces the leftover event/connection
  wording without changing the demonstration or its wiring.
- Verse `BuildAll` returned zero diagnostics. The source declaration and label
  inventory agree; in-client checks remain skipped at the user's request.
