# Prompt Lab wrong-step feedback — 2026-09-23

Scope: AC-002 / T-003, the four-command Prompt Lab sequence.

The previous wrong-input HUD said only that an instruction did not work and
printed the complete Find Seed → Dig Hole → Plant Seed → Water solution.
The plan calls for a visible outcome and explanation while preserving a safe
retry. Source inspection confirmed that the existing per-player `next_step`
is the expected command and that a mismatch resets only that player's attempt.

The failure HUD now names the attempted command, the command needed at that
step, and why sequence order matters. It tells the player to start again with
Find Seed but no longer lists all four commands. The same mismatch branch
still resets `next_step` to zero; the successful sequence, tracker write,
one-time badge guard, and device references were not changed.

UEFN `VerseToolset.BuildAll` returned `returnValue: []` (zero diagnostics).
In-client wrong-first, wrong-later, immediate retry, replay, and two-player
independence checks remain deferred at the owner's request.
The UEFN session API returned `Disconnected` / `Unconnected`; the editor
remained open and no playtest was started.
