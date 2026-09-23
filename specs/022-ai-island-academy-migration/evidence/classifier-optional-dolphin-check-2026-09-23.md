# Optional Classifier dolphin check — 2026-09-23

Scope: AC-040/T-037, implementation-plan section 25. The three required
Classifier queues, route fixture, and badge Tracker were not changed.

After a player completes the final Classifier challenge and earns its badge,
Help opens a non-rewarding, player-local question: Pix predicts `Dolphin >
FISH`; is that correct? `No` explains that a dolphin is a mammal and why AI
results should be checked. `Yes` gives evidence and an immediate retry. The
panel also offers Close and Try again. It is removed on replay, station
release, round reset, or departure; stale UI callbacks are rejected by a
generation token and station-owner check. The solved board now points to Help
for this optional check. No new device, reward path, or required stage exists.

The first Verse build reported a reserved-name collision for a local
`result` variable. Renaming that local resolved it; the subsequent
`VerseToolset.BuildAll` returned zero diagnostics. The label inventory was
updated for the changed solved-board message, seven new localized messages,
and shifted source line numbers. No actor asset changed in this step.

Project validation and Play-in-Client were skipped at the owner's request.
UI layout, correct/wrong/close/replay behavior, and concurrent two-player
isolation still need in-client checks before T-037 can be accepted.
