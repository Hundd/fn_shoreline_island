# Variable Vault focused solo matrix — 2026-09-12

One player; fresh Launch Session, round `e48bf07fe64142f6857f8a0164aa598`.
First station only. Source SHA256 values match [implementation evidence](implementation-2026-09-12.md), verified again after this run. Uses the saved rotation and layout corrections linked there. No source or editor edits during this test.

| Expected | Actual evidence | Result |
| --- | --- | --- |
| Revised boards readable without covering each other | [Next viewpoint](vault-next-aim-001.png): objective, energy and door status readable | PASS for corrected overlap |
| Subtract at 0 remains 0 | [Boundary](vault-lower-boundary-002.png): boundary message, energy 0, health 100 | PASS |
| Subtract updates energy immediately | Added to 4, then [subtracted to 3](vault-subtract-to-three-002.png) | PASS |
| Challenge two starts at 2, target 5 | [Fixture](vault-ch2-ready-002.png) | PASS |
| Next refuses an unsolved puzzle | [Guard](vault-next-guard-002.png) | PASS |
| Challenge two completes at 5 | Three +1 inputs, then Start: [door open](vault-ch2-complete-009.png) | PASS |
| Fresh attempt restores challenge two | [Replay](vault-ch2-replay-reset-002.png): energy 2, target 5, closed door; [recompletion](vault-ch2-recompleted-007.png) at 5 | PASS, AC-002 at first station |
| Counts other than 3 fail safely | Count [1 ends at 2](vault-repeat-one-009.png), [2 at 4](vault-repeat-two-011.png), [4 at 8](vault-repeat-four-015.png), [5 at 10](vault-repeat-five-017.png); all closed with retry message, health 100 | PASS |
| Passing through 6 does not complete a longer run | [Step 3 of 4](vault-repeat-four-008.png): energy 6, door CLOSED; final value 8 fails | PASS |
| Count 3 shows changes and opens the door | [0](vault-repeat-three-002.png), [2](vault-repeat-three-003.png), [4](vault-repeat-three-005.png), [6 and opening](vault-repeat-three-008.png), then [OPEN and badge recap](vault-repeat-three-019.png) | PASS, AC-003 at first station |
| Two-level hints | [Concept](vault-hint-concept-002.png), then [worked example](vault-hint-worked-002.png) explaining 0, 2, 4, 6 | PASS for challenge three |
| Replay resets challenge three | [Reset](vault-final-replay-reset-002.png): energy 0, repeat 1, target 6, CLOSED | PASS for fixture reset |
| Return reaches hub safely | [Hub](vault-return-hub-007.png), health 100 | PASS |

The successful third puzzle displayed “Energy Badge earned!” and the specified variable recap. Exact numeric badge retention after Replay is **not yet verified**: the native HUD showed the earlier Loop tracker and Energy is not yet bound in the journal. Do not infer AC-004 from the recap alone.

Presentation remains graybox. The main objective is partly covered by the minimap from Start and lies outside the view from some other controls; all three boards are readable from Next/Replay. Neighboring Signal boards add visual clutter. This focused spawn does not verify walking from the hub or muted-audio entry acceptance.

Pending: all remaining manual wrong-value cases and upper boundary, manual-challenge hint coverage, exact badge retention/repeated award, remaining three stations and journal integration, ownership transfer and lifecycle, multiplayer, full presentation, project validation and memory. Tasks covering these wider requirements remain open.

Fortnite closed after the test. Verified process count 0 and UEFN session `Disconnected`. No project validation or memory result is claimed.
