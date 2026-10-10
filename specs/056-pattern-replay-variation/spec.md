# 056 — Authored Pattern Scanner replay variation

Scope: one alternate three-puzzle set after explicit completed Replay; no scene delta. Original accepted feature028 remains the first-run contract. Input: docs/producer/pattern-scanner-replay-variation.md and docs/specialists/pattern-replay/learning-designer.md (read 2026-10-09).

## Requirements

- R1 Preserve all six original saved editable arrays exactly (evidence/live-baseline.json), original [1,0,2] answer order, targets A circle/0, B triangle/1, C square/2 and first run.
- R2 Only the existing valid active player's Replay at phase3 toggles original/alternate. Each completed Replay alternates. Wrong shots, hint timers, phase transitions and incomplete Replay never toggle.
- R3 Selected set survives same-owner exit/re-entry, respawn and Return; a fresh attempt starts puzzle1 of that set. New round, matching-owner disconnect and replacement-player ownership start original. Solo ownership is retained between visits, not a per-player history: previous owner's alternate is discarded when another player takes over. Disconnect clears a matching retained owner even when active_player is already empty.
- R4 One selected puzzle record supplies correctness, question, first hint, escalated answer/group, solved strip and journal. Idle/welcome uses selected set's first question. No original example accompanies an active alternate puzzle.
- R5 Preserve the original progress guards, one badge per round, held-fire lock, generation cancellation, 0.4s wrong throttle, 3s hint, 1s success, 0.5s quiet unlock, navigation source/module1/1 and all buttons, target transforms/bindings, travel and other missions. No new actors, geometry, editable replacement or global framework.

## Exact alternate content

| Stage | Question strip | First hint | Group | Second-mistake answer | Solved strip | ID |
|---|---|---|---|---|---|---|
| 1 | B▲  C■  B▲  C■  B▲  ? | Triangle, square. The pair repeats. | B▲ C■ | After triangle comes square. Shoot C ■. | B▲ C■ / B▲ C■ / B▲ C■ | 2 |
| 2 | B▲  C■  ?  C■  B▲  C■ | Each pair starts with triangle. | B▲ C■ | The gap starts a pair. Shoot B ▲. | B▲ C■ / B▲ C■ / B▲ C■ | 1 |
| 3 | B▲  C■  A●  B▲  C■  ? | Triangle, square, circle. Three repeat. | B▲ C■ A● | Finish the group with circle. Shoot A ●. | B▲ C■ A● / B▲ C■ A● | 0 |

Existing SHOOT THE MISSING SYMBOL wrapper and REPEATING GROUP: [{group}] escalation remain. Specialist finite-rule audit found unique C/B/A solutions within intended periods1–3; this is a near-transfer opportunity, not proven learning effectiveness.

## Acceptance scenarios (manual runtime checks pending)

- A1 Given fresh owner/new round, when entering, then original saved three questions and answers remain B/A/C; no badge duplication (R1,R5).
- A2 Given original completion, when valid Replay is pressed, then alternate three questions score C/B/A, all board/HUD/journal hints agree, solved strips match; completing and Replay restores original (R2,R4).
- A3 Given alternate stage2, when wrong A/C is shot, then phase/set remain, first mistake gives pair-start hint, second names B; current hint clears after3s only if still same generation/phase (R2,R4,R5).
- A4 Given alternate unfinished/complete visit, when same player exits, respawns or Returns then re-enters without a replacement owner, then selected alternate restarts stage1; no unfinished Replay becomes available (R2,R3).
- A5 Given retained alternate owner, when owner disconnects while active or inactive, a replacement player enters, or new round begins, then owner selection resets original and no stale reference remains (R3).
- A6 Given delayed hint/success task, when reset/replay/new owner occurs, then old generation cannot update board, target state, phase or selection. Held fire and badge guards remain (R5).
- A7 Given alternate idle/welcome or journal view, when it renders, then question comes from selected set; unknown/invalid puzzle lookup fails closed using existing guards, not mismatched original fallback (R4).

User explicitly delegates autonomous agent review and says no game testing; runtime scenarios remain for manual owner checks. No session, cook, push or game is authorized.
