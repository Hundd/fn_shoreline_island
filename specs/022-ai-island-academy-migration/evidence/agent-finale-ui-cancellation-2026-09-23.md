# Agent finale UI cancellation — 2026-09-23

Scope: AC-009 / T-006, the personal eight-second Pix AI Core restoration UI.

Source inspection found that `show_core_restored` added a canvas and removed
it only after `Sleep(8.0)`. The journal's spawn, player-departure, and round
cleanup closed the journal panel and data-route UI but not this finale canvas.
An old-round celebration could therefore remain visible after a reset.

The journal now stores the active finale canvas per player. Its cleanup closes
that canvas on spawn, departure, and round begin. A per-player generation
prevents an earlier eight-second sleep from closing a newer celebration. The
existing first-time Agent Badge guard, tracker value write, and device
bindings were not changed.

A follow-up source audit found an asynchronous start race: round cleanup
could occur after the badge award but before the spawned overlay starts. The
station now passes its progress round generation to `show_core_restored`,
which rejects a stale token before adding UI. The journal and Agent progress
devices each increment their generation from the same live Round Settings
actor's Round Begin event. UEFN readback resolved both editable wrappers to
`Device_RoundSettings_V2_C_UAID_E89C2592D1B5C80003_1839433039`; therefore
the comparison is based on the same round event, not an assumed binding.

UEFN `VerseToolset.BuildAll` returned `returnValue: []` (zero diagnostics).
The follow-up build after the round-token guard also returned `[]`.
The session API returned `Disconnected` / `Unconnected`; no playtest was
started. In-client round-reset, respawn, departure, replay, and two-player
independence checks remain deferred at the owner's request. UEFN was left open.
