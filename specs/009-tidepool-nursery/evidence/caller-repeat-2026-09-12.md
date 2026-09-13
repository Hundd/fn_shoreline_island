# Nursery caller and repeat implementation — 2026-09-12

The first Care test passed before implementing these additional challenges.
The station now supplies a one-call, three-slot Care/Move caller, or bounded
Repeat [Care, Move], depending on the selected challenge. It evaluates each
bed's transitions and renders an immutable trace with caller slot, repeat,
Care step, robot cell and individual bed states. Next and Replay reset authored
programs; completed flags and the one-per-round badge remain per player.

Added 15 actors and reflowed the control row. Total: 44 actors, 45 native station
bindings. All transforms, native overrides, geometry meshes/materials/mobility
and native references matched editor readback after save. The native placement
offsets were explicitly corrected before launch. Build All returned `[]`.
The accompanying JSON contains the audit and exact source SHA-256 revisions.

The first expanded-station launch completed and Claim worked, but Planter 1
was outside the camera view from Run. That test stopped before execution.
Moved the three planters, robot and four floor labels into a tighter row and
raised the three boards. All 11 saved transforms matched editor readback;
see `sightline-fix-2026-09-12.json`, which supersedes those transforms in the
construction audit. Fortnite was closed and the session was Disconnected.
The completed follow-up launches and current revision acceptance are recorded
in [three-challenge solo evidence](three-challenges-2026-09-12.md).
Four-station capacity, multiplayer, journal integration, lifecycle, validation,
memory and final presentation remain incomplete.
