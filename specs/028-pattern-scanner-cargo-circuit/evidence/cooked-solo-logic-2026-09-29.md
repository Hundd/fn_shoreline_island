# Cooked solo logic validation — 2026-09-29

A temporary Verse device used the one connected test player, waited for game start, teleported that player onto the approved dock at approximately (-450,3800,2477), and confirmed the controller's authored-bounds check accepted them. It then invoked the same controller methods used by Start and attributed target hits; the first prediction call selected a wrong answer, followed by the correct ordered indices 1, 6, 10 and 12. This tests Verse progression and timing, but does not prove physical rifle traces, button interaction or visual feedback.

The first run exposed a real bug in `loop_progress.complete`: its former `else if` badge branch executed when challenge index 0 completed, setting the badge before the other stages. After replacing that structure with explicit early returns, a fresh full cook and game produced the following `LogVerse` evidence:

- 10:05:39 UTC: phase 0, saved challenge 0.
- 10:05:43: stage 0 credit moved challenge 0 → 1; badge branch was not entered.
- 10:05:52: replacement phase 2, saved challenge 1.
- 10:05:56: stage 1 credit moved challenge 1 → 2; badge branch was not entered.
- 10:06:06: motion phase 3, saved challenge 2; player still inside course.
- 10:06:11: stage 2 credit awarded the badge at challenge 2.
- 10:06:14: finale phase 4, challenge 2, badge earned.

An extended cooked run repeated that order and at 10:10:19 recorded Replay at phase 0 with challenge 2 and badge retained. Teleporting the only participant off the course recorded phase -1 and zero participants at 10:10:20. Calling the same round reset handlers recorded challenge 0 and badge cleared. The temporary probe actor and source plus diagnostic prints were removed from the production island after these results.

Remaining acceptance: a person must fire the rifle and use controls in Fortnite to confirm hit surfaces, wrong-choice feedback, Help/Watch/Freeze, physical cargo and shutter motion, signs, muted-audio readability, journal/prerequisite, and two/four-player joins, simultaneous fire and departures. The scripted probe is evidence for controller transitions and progress invariants only.
