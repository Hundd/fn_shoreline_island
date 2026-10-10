# Classifier unresponsive-target investigation — 2026-10-10

Owner reports automatic start and no effect from shooting targets.

- Automatic entry activation is existing approved S-05 / AC-01 behavior. Source `monitor_player` calls `begin_solo` for the in-bay player. No start-flow change made.
- Live game initially reported Running.
- Editor log at 09:33:25 UTC warns that the placed `fn_shoreline_island_signal_station_0` is an instance of a stale class that no longer exists, and requires redefinition/map reload. Similar warnings exist for other controllers; this is not proven Classifier-only.
- GetDeviceProperties on `signal_station_0` fails with "no resolved Script subobject". The same read fails for `classifier_target_food`.
- All three `classifier_hit_*` native triggers read triggeredByDamage=true, bReceiveDamageWhenInvisible=true, triggeredByPlayer=false, enabled On Game Start=false, transmit Every X Triggers=1. Disabled-at-start relies on the controller's activation; these settings alone do not prove runtime hit delivery.
- Stopped game; confirmed CanStart. BuildAll returned an empty diagnostic array. Controller remained unresolved afterward.
- Current level was `/fn_shoreline_island/fn_shoreline_island`; its asset reported not dirty. Stopped session and called supported load_level on that path. Controller still unresolved afterward. No binary, editable, source, layout, or gameplay changes made.
- Final GetGameState=Unconnected. UEFN remains open.

Status: unresolved editor/device-loading fault found; missed-shot root cause and repair are NOT verified. Next prerequisite is a full UEFN project reopen/restart followed by controller/target binding readback and a fresh cooked test of AC-02/03/10. Do not replace/rebind devices speculatively or claim build success proves gameplay.

## Owner-requested recheck

Fresh reads now resolve `signal_station_0` successfully: configured=true and three targets in FOOD/FURNITURE/VEHICLE order. All three target scripts resolve with IDs 0/1/2 and mission_id=29. BuildAll again returns no diagnostics; controller readback still succeeds afterward. The prior unresolved-script symptom has cleared. Log history still contains the earlier stale-class warnings and an 11:14:26 UTC failed-class-load warning; these historical entries are not proof of current failure. No gameplay/source edits made. Session is Unconnected; no live shooting test was performed, so hit feedback/progression remain unverified.
