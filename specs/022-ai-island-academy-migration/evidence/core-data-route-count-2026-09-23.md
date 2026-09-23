# Personal Core count on module route — 2026-09-23

Scope: AC-023 / T-020, the badge-completion module-to-Core cue.

The existing short player-local route named its source module and animated a
marker toward Pix AI Core, but did not display the new Core count. The journal
already computes `completed_modules(input_player)` from the two progress
devices and six bound badge Trackers for its personal status panel.

The route title now reads that same count at display time and shows
`PIX AI CORE | n/8 MODULES ONLINE` to the earning player. The source-to-Core
animation, Tracker subscriptions, central pulse bindings, round guards,
reward state, and journal count implementation were not changed. No second
progress store was introduced.

UEFN `VerseToolset.BuildAll` returned `returnValue: []` (zero diagnostics).
This does not prove the count appears at the right time in-client or that
the world-space Pix/Core visual communicates progression. Those checks and
the physical-beam decision remain open while playtesting is deferred.
The UEFN session API returned `Disconnected` / `Unconnected`; the editor was
left open.
