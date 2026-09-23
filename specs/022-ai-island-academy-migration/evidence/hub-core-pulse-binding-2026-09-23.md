# Pix AI Core completion pulse — 2026-09-23

## Saved editor setup

- The live `pix_ai_core_centerpiece` transform is X=800, Y=1000, Z=2900.
  Placed and saved `pix_ai_core_module_pulse_vfx` at that same transform.
  Its actor asset is
  `/fn_shoreline_island/__ExternalActors__/fn_shoreline_island/9/DV/C2R7G7YTHSJA3709J68PHY`.
- The VFX Creator is gameplay-only, event-started, cyan, burst mode with 30
  generated sprites, a 1.25-second non-looping cycle, a 0.6 spherical spawn
  zone, and no player attachment. A separate post-save read confirmed those
  properties.
- Bound all eight existing first-time badge Trackers' `When Complete`
  events to its `StartEffectAtDevice` function and saved each tracker plus
  the VFX Creator. A separate live read returned exactly eight incoming
  bindings, including the final Agent Badge tracker.
- Epic's [VFX Creator documentation](https://dev.epicgames.com/documentation/fortnite/using-vfx-creator-devices-in-fortnite-creative)
  describes `Loop: Never` as a one-shot and `Start Effect at Device` as an
  event-triggered function. The shared pulse is decorative; it does not
  display a module count, modify the static legend, or write personal badge
  or journal state. No Verse source changed or needed rebuilding.

## Open runtime check and scope

Validation and playtesting remain skipped at the owner's request. The Core
pulse has not been cooked or seen in-client. Confirm visibility from the hub,
one pulse per first award, replay behavior, and simultaneous two-player
completions. A player-local badge effect and personal journal still carry
the individual state; the shared hub pulse must not be interpreted as a
personal completion indicator. The implementation does not yet create a
visible beam from each zone to the hub Core.
