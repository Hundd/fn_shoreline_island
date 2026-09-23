# Personal Agent Mode completion sound — 2026-09-23

- The existing Agent Badge tracker completes only on the guarded first badge
  award and already triggers a distinct player-local finale VFX. No reward or
  progress source was changed for this audio addition.
- UEFN's built-in Creative radio
  `/Game/Sounds/Creative/Gadgets/Radio/Stingers/Stinger_Accent_01_Cue`
  reports a 3.060333-second duration. Placed and saved a separate Audio Player
  named `pix_agent_core_restored_audio`, using that cue at volume 0.8,
  `Gameplay Only`, hidden in game, `Instigator Only`, at the
  `Instigating Player`, with all auto-play phases and looping off.
- Actor asset: `/fn_shoreline_island/__ExternalActors__/fn_shoreline_island/0/AS/10TEMU73B29SRLOVCVT2OG`.
  Bound `fn_shoreline_bot_1_badge_tracker: When Complete` to its `Play`
  function, then saved both actors. A separate live read confirmed the
  setting values and exactly that one incoming binding. The seven earlier
  module Trackers remain bound to their separate shorter Audio Player.
- No Verse source changed, so no Verse build was needed. The owner's request
  to skip validation and playtesting means the cue has not been cooked or
  auditioned in-client. Before accepting AC-015, confirm its sound quality,
  one-time first award, replay suppression, and two-player audibility without
  a duplicate badge. Epic's [Audio Player documentation](https://dev.epicgames.com/documentation/fortnite/using-audio-player-devices-in-fortnite-creative)
  describes the instigator-only and event-triggered options used here.
