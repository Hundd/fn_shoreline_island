# Player-local module-to-Core data route — 2026-09-23

The academy journal already owns references to the Prompt Lab and Pattern
Scanner progress devices and six later badge Trackers. Its Verse source now
subscribes to the eight `tracker_device.CompleteEvent` signals, retaining the
module index and the event's earning agent. On completion it shows that
player a non-interactive, short cyan/white on-screen route labeled with the
source module and `PIX AI CORE`; the data marker advances in five 0.22-second
steps, then the route clears. A new completion supersedes an older route for
the same player. Round reset, spawn, and departure remove any active route.

The existing first-award Tracker bindings still pulse the central Core and
emit the earlier local reward effect. This change does not assign badges,
alter tracker targets, change journal state, or start an effect on a button
press. The route is a player-local UI depiction of data travelling from a
named zone to the Core, not a physical world-space beam.

The first MCP `BuildAll` call exceeded its five-minute response limit, but
the live editor log at 2026-09-23 10:42:02 UTC records `VerseBuild: SUCCESS --
Build complete`, preceded by a successful incremental compile and script
link. No build diagnostics were reported in that log segment. Project
validation and in-client playtesting were skipped at the owner's request.
Before accepting AC-023, inspect the route in-client for each of eight
first-time badges, check readability alongside the final Core celebration,
verify replay suppression and two-player isolation, and decide whether the
on-screen connection is sufficient or a physical beam is also required.

## Live binding readback after Save Content

The connected editor's `academy_journal` Verse device was read again after
the owner saved content. Its `garden` and `lagoon` fields point to the placed
Prompt Lab and Pattern Scanner progress devices; each progress device's
`badge_tracker` wrapper resolves to a saved Tracker actor. The journal's
`later_badge_trackers` array contains six non-null wrappers in the documented
order: Classifier (`signal_badge_tracker`), Confidence
(`energy_0_badge_tracker`), Error (`debug_station_1_badge_tracker`), Tool
(`event_station_1_badge_tracker`), Agent (`fn_shoreline_bot_1_badge_tracker`),
and Skills (an actor labeled `Tracker` under the Skills progress device).
Each wrapper's `savedActor` resolves to a Tracker actor. The generic Skills
actor label is editor-only; its owning Verse field is the Skills badge.
This is editor binding evidence, not evidence that the route appears or
completes correctly in a running session.

The Core pulse VFX Creator's live binding list was also re-read. It has
exactly eight incoming `When Complete -> StartEffectAtDevice` bindings, and
their source actor paths match those eight resolved badge Trackers one for
one. Thus the saved UI route and shared Core response use the same intended
completion sources; runtime visibility and multiplayer behavior remain open.
