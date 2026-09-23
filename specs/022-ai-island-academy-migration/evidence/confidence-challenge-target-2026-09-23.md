# Confidence Core challenge 2 target — 2026-09-23

The implementation plan's challenge 2 calls for a 40% starting confidence
and a 100% goal. The current source previously authored integer values 2
and 5; the visible display maps each integer unit to 10%, so players saw
20% to 50%. The fixture now authors 4 and 10 for challenge 2. Its existing
manual controls still change one integer unit per accepted press, so each
press remains a displayed 10% adjustment within the existing 0-10 bounds.
Challenge 3's repeated +20% clues and 60% goal were not changed.

The shared target-miss message was split by mode. Both versions state the
actual and target percentages; manual feedback explains 10% adjustments,
while repeated-clue feedback explains 20% additions and asks the player to
change the repeat count. The module-completion text now repeats the planned
lesson that important answers still need checking. No tracker, door, replay,
player-state, or reward code was changed.

UEFN MCP `VerseToolset.BuildAll` returned zero diagnostics after these edits.
Under the owner's instruction to skip verification, the 40%-to-100% run,
wrong-answer retry, door motion, reward-once behavior, and multiplayer
independence have not been exercised in Play-in-Client. AC-025 and T-022
remain open until that runtime evidence is available.
