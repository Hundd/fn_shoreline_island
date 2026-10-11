# Editor repair result

2026-10-10, /root/implementer, Codex CLI gpt-6.1-sol. Exclusive serialized editor access.

## Findings and repair

Pix had NoCollision on all six main visible mesh components: pix_body, pix_head, pix_arm_left, pix_arm_right, pix_leg_left, pix_leg_right. Set only their bodyInstance collision profile to BlockAll, enabled QueryAndPhysics, WorldStatic, no custom response overrides. All six read back correctly after exact actor save and disk reload; mesh, local location/rotation/scale and bUseDefaultCollision values match baseline. Decorative components are unchanged. No actor was added, removed, moved or replaced.

Menu investigation: native log records the exact travel instance as a stale class at09:33:25 and a Failed to load Verse class warning at11:14:26. Live current controller was configured=true with all eight destinations enabled and correct Talk wrapper. Current class path already resolved before repair, so historic warning is a credible defect candidate, not proof of the sole remaining cause. Built Verse cleanly, saved exact controller package, verified clean, reloaded that external actor package through native reload_asset, reacquired class and all editables; all are identical and native class resolves. Rebuilt after reload with no diagnostics. No fresh pix_travel load warning appeared. This refresh avoids a whole-level reload/discard risk and preserves unrelated dirty work. Actual menu recovery is reserved for owner manual testing and is not claimed proven.

No Verse source changed: before/after SHA256 8D602DC9B4BD3BCD274FD8DEABB8032EF5F5C2AB618BB636CBA7F88E98E8E32F. No speculative radius/height/arming/focus change. Current approved Pix and Talk poses, 125cm approach/200cm rearm, menu/destinations/reward semantics preserved.

## Non-game evidence

final-readback.json contains full six-component before/persisted state, all controller editables before/after, exact Talk/eight arrival savedActor references and native overlap/traces. Physics overlap with WorldStatic at body bounds returns the original Pix GUID AA59DB43-4A7F-36CC-FAA3-8BA1AF682AF7 after reload. A front visibility trace returns27.560794830322266cm both before and after because existing Talk interaction geometry can intercept it; this trace is inconclusive for body collision and is not presented as pawn acceptance.

Scene save_actor returned normal null, exact package is_dirty=false, reload_asset returned original actor identity. Pix saved binary SHA256 A184A79633440AC4143EBC2320238FE80A1596760ED4F6C0F4ECA3E04FB7ECFD; travel controller SHA256 503A89521918C7B9F25B77BA2AD81F6180CBE7E2F9C97E1C292ABE0D0F443A99. Both final packages remain clean. BuildAll twice returned empty diagnostics. No dedicated project-validation command is exposed in discovered native toolsets; Project Validate Project was not run. No session/game/cook/push or runtime QA was performed per explicit user instruction.

## Owner manual checks

Fresh normal hub spawn: approach Pix from outside200cm; invitation opens within125cm. Try Talk. Choose/confirm a mission; verify arrival/progress. Decline, walk away beyond200cm and return. Check front/side blocking and walk around Pix. Check reset and solo/shared behavior. If menu remains absent, capture current Verse runtime/error logs and the player's actual proximity/owner/UI state before changing guards.

Final GetGameState=Unconnected. UEFN remains open; no call in flight at handoff.
