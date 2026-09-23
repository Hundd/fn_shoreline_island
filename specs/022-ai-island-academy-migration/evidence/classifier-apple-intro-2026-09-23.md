# Classifier APPLE introduction — source/build evidence

Requirement: AC-045 / T-042. This records implementation, not runtime
acceptance.

- Challenge 1's authored queue and queue display now contain APPLE only.
  Its three existing destination controls remain Food, Animal, and Vehicle.
  The special first-challenge Animal block was removed, so every choice
  now follows the same animated route and existing correct/wrong check.
- The first rule board now gives a neutral category prompt instead of the
  answer. Its saved Billboard default already used the same text; no actor
  was edited. The obsolete `workshop_later_text` declaration was removed,
  and the affected source-declaration rows in the label inventory updated.
- Challenge 2/3 queues and the complete-rule evaluator were not changed.
  The same per-player cursor, replay, and one-time badge guards remain.
- `VerseToolset.BuildAll` returned zero diagnostics.

Project validation, memory calculation, and Play-in-Client remain deferred
at the owner's request. The Food/Animal/Vehicle route animations, wrong
choice retry, progression to challenge 2, and multiplayer state still need
human playtesting before T-042 can be checked off.
