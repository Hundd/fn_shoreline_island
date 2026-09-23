# AI Agent Mission and Discovery Trail presentation — 2026-09-22

## AI Agent Mission

- Kept the Build-a-Bot mission stages, plan execution, safe stop feedback,
  replay/reset behavior, player station ownership, and one-time AI Agent
  Badge guard unchanged.
- Reframed its three stages as combining instructions, a repeat pattern, and
  item classification to restore Pix’s Agent Mode.
- Aligned its visible item/category terms with AI Classifier: **Apple ->
  Food** and **Car -> Vehicle**. Existing identifiers and route logic remain
  unchanged.
- The one-time final Agent Mode feedback now celebrates the mission, directs
  players to their personal AI Core Journal for authoritative module status,
  and reminds players that people should check important decisions. It remains
  on the existing guarded reward path.

## AI Discovery Trail

- Kept the optional Fieldwork observation interactions and no-badge design.
- Its three existing signs, interaction prompts, and personal panels now name
  the area **AI Discovery Trail**, with concise Check Pix, Pattern, and
  Categories station labels.
- Updated the category field note and prediction to use Apple/Food and
  Car/Vehicle, matching the core classifier lesson.
- Repurposed the redundant optional growth-order note into **Check Pix**:
  players compare Pix's prediction of five data crates with the visible count
  of four. The existing personal two-choice panel, immediate retry, and
  no-badge/no-reward behavior are unchanged. Its explanation now explicitly
  says that AI can make mistakes and people use evidence for the final
  decision.
- A correct Check Pix answer now opens a second, optional personal prompt:
  Pix suggests Route A, but new information says it is closed. The player can
  select Route A or Route B; Route A explains the safe retry, while Route B
  explains that people should use new information when making decisions. This
  reuses the existing panel, generation guard, close/retry controls, and no
  reward state.

## Verification

- Verse `BuildAll` completed with zero diagnostics after the presentation
  changes.
- A fresh UEFN session cook reached `Connected` / `Running`.
- The game and session were stopped afterward; final state was `Disconnected`
  / `Unconnected`.
- Verse `BuildAll` again completed with zero diagnostics after the final-dialogue
  update. A fresh session reached `Running` and was stopped to `Disconnected`
  / `Unconnected`.

## Full-Core finale binding

- Each of the four Agent Mission stations is now bound to the saved personal
  journal device. The station reads the journal's existing `completed_modules`
  count only after the unchanged one-time Agent Badge completion.
- At 8/8 modules, the finale reports the full AI Core as restored. At any
  lower count, it reports only Agent Mode completion and directs the player to
  the journal. No tracker, reward, state map, or retry path is written by this
  check.
- A first-time claim is now blocked below seven restored modules. Players with
  an already earned Agent Badge may still claim the station for replay.
- Verse `BuildAll` returned zero diagnostics. A fresh UEFN session cooked the
  bindings, reached `Running`, and was stopped to `Disconnected` /
  `Unconnected`.
- The same guarded 8/8 branch now spawns a personal, non-interactive cyan UI
  panel for eight seconds. It reports the eight restored modules and is owned
  by the existing journal device, so it adds no device bindings or state.
  Verse `BuildAll` returned zero diagnostics and a fresh session reached
  `Running`, then `Disconnected` / `Unconnected` after teardown.
- Verse `BuildAll` returned zero diagnostics after the Discovery Trail's
  Check Pix text migration. A fresh UEFN session reached `Running` and was
  stopped to `Disconnected` / `Unconnected`.
- Verse `BuildAll` returned zero diagnostics after the human-decision branch.
  A fresh UEFN session reached `Running` and was then stopped to
  `Disconnected` / `Unconnected`.
- Verse `BuildAll` returned zero diagnostics after the AI Discovery Trail
  naming update. A fresh session reached `Running` and was stopped to
  `Disconnected` / `Unconnected`.

## Remaining checks

- Test the 8/8 and below-8 finale branches in-client, including the personal
  restoration overlay and replay.
- The optional environmental/VFX celebration remains open. A temporary silent
  Sparkles VFX Spawner was configured at the hub, but the current MCP build
  rejected its typed Verse-device reference in two safe attempts. The temporary
  actor and unused Verse field were removed; no unbound VFX remains.

- Test every agent stage’s correct path, wrong path, help, replay, and
  retained reward in-client.
- Verify the Discovery Trail stays optional and grants no progression reward.
- Exercise Check Pix's crate-count retry and Route A/Route B retry paths
  in-client, including two-player panel isolation.
- Test station ownership and reward behavior with two players.
