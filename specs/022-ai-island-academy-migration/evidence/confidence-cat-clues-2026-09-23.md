# Confidence Core cat clues — source/build evidence

Requirement: AC-044 / T-041. This is source/build evidence, not runtime
acceptance.

- Confidence Core challenge 1 now starts at internal value 4 (40%) and requires
  at least 7 (70%). The same 0–10 internal scale, +10%/-10% controls, preview door,
  per-player state, and one-time badge guard remain in place. A newly created
  player state starts at 4; replay/next still use the challenge fixture.
- The challenge-1 display names Pix's CAT prediction. The intro and worked
  hint name pointed ears, whiskers, and tail; accepted positive updates to
  50%, 60%, and 70% put those clues on the station board respectively.
  Wrong values retain the existing revision-and-retry path.
- Challenge 2 still starts at 4 and targets 10; challenge 3 still starts at
  0, increments by 2 per repeat, and targets 6. No saved actor was edited.
- `VerseToolset.BuildAll` returned zero diagnostics.

A later source correction made the first goal a true threshold: 70% or higher
opens the door, while challenge 2 and 3 still require their exact values. The
first attempted build for that correction reported a Verse failure-context
error; initializing the `logic` flag to `false` and setting it inside `if`
resolved it. The subsequent `BuildAll` returned zero diagnostics. At that
source-build point, CAT was presented only on the bound confidence Billboard;
the later physical-prop pass is documented below.

Live scene inspection initially found four preview doors centered at
X = -3300, -6100, -8900, and -11700, each at Y = -1450, but no separate cat.
A later asset thumbnail and live station-1 viewport check identified a
recognizable stone cat statue that could be staged behind those doors. Four
saved, Verse-bound props now fill that visual gap; see
`confidence-mystery-cat-2026-09-23.md`. Their actual in-client reveal remains
unverified.

Project validation, memory calculation, and Play-in-Client remain deferred
at the owner's request. Challenge-1 clue readability, wrong-value retry,
replay, door motion, badge, and multiplayer independence still need a human
playtest before T-041 can be checked off.
