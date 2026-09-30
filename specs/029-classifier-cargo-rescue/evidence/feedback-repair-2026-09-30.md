# Feedback and completion repair

Owner playtest: the lesson works, but hit/wrong-choice feedback is not perceptible and the ending is unclear; example/targets remain in place. This fails S-04/S-06/S-08. Detailed lifecycle/learning checks were not reported.

## Implementation

- Existing Classifier HUD now explicitly displays CORRECT! and solved count on every accepted answer, and TRY AGAIN with persistent hint on wrong category choices. Hide-before-show replaces old feedback. Existing positive audio and target effects remain.
- Target labels acknowledge CORRECT!/TRY AGAIN for one second. Runtime opt-in fields are set only by the Classifier controller; other missions retain their previous 0.4-second behavior and labels.
- After final result's 1.5 seconds, hide/park all example props and deactivate all answer assemblies. Persistent HUD and board identify LESSON COMPLETE, earned badge, and PLAY AGAIN / RETURN TO HUB. Final completion no longer waits for quiet fire when no next item exists. Existing reset/replay/departure clears the HUD and restores the lesson.
- Native HUD settings read back: Top Center, 32-point white text, 80% dark background, no intro/outro animation, no priority queue and no duplicate queue entries. Saved successfully.
- BuildAll returned no diagnostics. Full content push requested because native HUD settings also changed; cook/result and real playtest observations pending.

No geometry, seven-answer sequence, input mechanic or reward changes. Empty-space shots are not observable through the current damage-only target events; no invented miss detection is claimed. AC-10/11 in spec.md define the affected checks.

Full PushChanges returned Completed after local validation completed at 05:28:47 UTC and both platform cooks finished around 05:30:05 UTC. Readback: Connected / Running (push resumed the match automatically; an explicit StartGame was rejected because it was already running). Owner was asked to test wrong/correct messages, completion cleanup/persistent prompt, and Play Again. Those observations remain pending; build/cook is not visual acceptance.

Handoff: no new owner observations received during the verification window. StopGame returned Completed; GetGameState then returned CanStart. Editor left open. AC-10/11 and T-09 remain open for perceptual/gameplay verification. Source/native changes are saved, built and cooked. Approved map readiness still passes.

## Owner acceptance

After the updated build and request to check feedback, completion and Play Again, the owner replied: "yes. looks good now". Record this as acceptance of the repaired feedback/ending presentation and close T-09's reported defect. Together with the preceding "the game is working" report, this establishes owner acceptance of basic gameplay and the repaired presentation. It does not supply measured timings, a first-time learning explanation, or individual held-fire/muted/edge/lifecycle/persistence results; retain those checks under T-04..07.

Acceptance handoff: game was Running; StopGame returned Completed and subsequent GetGameState returned CanStart. UEFN left open.
