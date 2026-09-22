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

## Remaining checks

- Test each challenge’s correct path, wrong path, help, replay, and retained
  reward in-client.
- Test station ownership and reward behavior with two players.
