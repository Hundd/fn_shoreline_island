# Old primary button cleanup — offline scope

User explicitly requested “and also do clean up from the previous game (remove old unused buttons)”. This authorizes removal of unused old primary buttons. Advisory only: Planner made no live calls, approved artifact changes, source edits or deletions. Implementer owns live audit; Root preserves QA/editor serialization.

## Exact candidates and preservation

13 candidates extracted directly from approved production-scene.retire_primary, with historical saved transform/settings/component readback copied into legacy-button-cleanup-candidates.json:

|Old primary field|Native actor suffix (prefix Device_Button_V2_C_UAID_E89C2592D1B5)|
|---|---|
|claim_button|160103_1362067786|
|slot_0_button|160103_1363333788|
|slot_1_button|160103_1364496790|
|slot_2_button|160103_1365668792|
|slot_3_button|160103_1366748794|
|run_button|160103_1367938796|
|help_button|160103_1368949798|
|caller_0_button|180103_1424754163|
|caller_1_button|180103_1426644165|
|caller_2_button|180103_1427828167|
|repeat_button|180103_1429045169|
|next_button|180103_1430193171|
|remix_button|240103_1504758423|

Exact full native soft paths are authoritative in candidates.json; never select actors by loose label or bay-wide delete. production-binding-checkpoint.json retirement has all13 atZ1800, bHidden=true, bNoCollision=true, enabledAtGameStart=false, visibleDuringGame=false, componentNoCollision. These are recorded implementation evidence, not today's fresh live confirmation.

Preserve **reused Replay** suffix160103_1369950800 and **entry Return** suffix160103_1371014802, both bound to new production profile; preserve newfinishReturn and ALL other modules/bays/controls. Do not delete old boards/labels/plants/controller, protected roots, floors, progress, journal, blaster, hub or spawners under this button-only instruction. Hidden label cleanup is separate scope unless subsequently authorized.

## Workflow disposition and dependency checks

Deleting only confirmed invisible, noncolliding, disabled unused primary buttons is maintenance with no player-visible layout/mechanic change. It completes previously approved primary retirement and current explicit user cleanup request. Approved plan said retain audit bindings; removal now changes implementation metadata/reference inventory rather than the approved playable design. Record this precise disposition, preserved refs and before/after count in cleanup evidence; do not regenerate map/approval or fabricate approval. A newly discovered active dependency makes that actor non-unused and must be resolved within compatible cleanup, not silently deleted.

Before deletion, fresh native audit must confirm each exact actor still matches recorded hidden/disabled/Z1800/collision state, identity/ownership and incoming references. Inspect:

- Old primary station actor suffix160103_1359952783: current source has retired_primary early return immediately after Hide and before all setup/subscriptions. Fresh native flag must remaintrue. Its13 editable button wrappers may still savedActor-reference candidates; remove/clear only those unused references through discovered editor schemas. Retired earlyreturn prevents runtime use but does not by itself prove native validation accepts dangling references.
- New production profile exact editable Replay/course_returns/support refs and target/native direct-event bindings must exclude candidates. Verify other station/module actors and live native event channels have no incoming dependency. Prior primary direct-event bindings were empty; that historical fact does not replace fresh incoming-reference audit.
- Determine editor deletion/reference behavior via actual schema/readback: preserve a recoverable checkpoint and full candidate ref/settings inventory; detach obsolete retired-primary wrappers or allow supported automatic reference cleanup with explicit readback. Do not hand-edit WorldPartition files or set unrelated active fields to default identities. Clear-only-retired refs require validation; no source class/schema removal is needed.
- Delete serialized approved candidates incrementally, read back exact absence and unchanged Replay/Return/newcourse counts/refs. Save affected actor/level packages; Verse build if reference/schema/source handling requires it, supported project validation and cook, then resumed actual Replay/entryReturn/finishReturn QA. Those tests are already unfinished and must be completed, not reset to source-only confidence.
- If a candidate references another active lesson or validation fails, stop its deletion and report the exact dependency; preserve unchanged gameplay and continue independent safe candidates. Do not broaden deletion to shared controller or retired duplicate bays.

No new map-design approval cycle for this narrowly authorized invisible cleanup. Gameplay acceptance/shutdown requirements still apply after saved editor changes. Final report must separate13candidate maintenance from unchanged183new-course allocation, list actual deleted count and exclusions, and verify nonrunning game/editor left open.
