# Button repair — definitive saved result

- Fixed five `delivered_one?` argument sites: false query previously short-circuited first-delivery safety checks. Geometry, endpoint connector and approved route bounds unchanged.
- HOME native radius now 2m; recording still requires actual player within1m of HOME. Actionable rejection feedback added; collision and positions unchanged.
- Replaced ONLY three failed billboard actors via official catalog PlaceDevice. Scalar label editables form a runtime array. Scalar conversion alone failed; successful replacement proved actor lifecycle, not array category, was the relevant distinction.
- All three new labels cooked at correct positions/scale.4/text24/yaw+90/opaque dark background/TwoSided/borderoff (final native JSON and independent QA readback are authoritative for yaw). HOME and CANCEL readable in bugfix-readable-home.png; LOAD/TRY MY ROUTE was directly observed readable by Implementer. Working board pose retained, text12/backgroundalpha.7/TwoSided.
- At20:10:56UTC, real HOME prompt/E fired phase0, recorded POINT0(6650,-13600) and POINT1(6565.53,-13641.05), changed sign/prompt to SHOW AGAIN, and displayed walking instructions. Startup-only test positioning preceded input; no forced interaction event or recorded route teleport.
- All diagnostic position/pose fixtures removed. New startup checks reject invalid prop or label bindings; failed footprint teleport is now handled and recording rejected.
- New labels/controller saved; original three failed labels removed through editor; playable level save returned true. Final production BuildAll [] passed. Source SHA2564290341256c8fe68a7d2a465769dfaf5a6f3cbfbc6a13d755ab4cc191fad30d7.
- `python -m unittest tools.tests.test_route_geometry`:5passed. Cooked real input is the regression proof for Verse false argument failure; Python geometry tests support unchanged clearance.
- Final production StartSession Completed; validation/cook channels Completed Successfully20:14:40UTC; controls subscribed/reset reached20:14:42UTC with no diagnostic fixture logs. StopGame Completed; StopSession followed by Unconnected/Disconnected verified20:15UTC. Editor left open, no in-flight editor calls. See bugfix-final-native.json. Full walked deliveries, old-route stop, both bypasses, multiplayer, visible footprint chain and separate Project Validate remain unverified. TEST precondition code built but real TEST E not recorded. Screenshot still shows existing Performance Warning: See editor; no claim that warning was resolved.

## Historical diagnostic checkpoints
Earlier settings/conclusions/pending statements below are chronological history; definitive settings and scope above take precedence.

# Button repair checkpoint — 2026-10-03

User reproduced absent HOME interaction prompt and unreadable overlapping cards in cooked Fortnite. Current saved controller configured=true and all three savedActor button references match scene inventory. Game was Running/Connected and stopped with native StopGame=Completed for repairs. Desktop capture is available.

Native comparison: HOME enabled/Any team/Any class/prompts enabled, actor collision allowed and ButtonMesh QueryAndPhysics. SphereCollision NoCollision matches existing path_water_button; it is not evidence of an erroneous override. interactionRadius=1 corresponds to sphereRadius=100cm, so units are metres. No collision/radius speculative edits.

Confirmed display defect: labels have full-size billboard geometry at scale1 with background alpha .85; panels overlap and clip other labels. Confirmed source usability defect: HOME silently rejects players farther than100cm from centre; button itself is180cm from centre. Endpoint geometry must remain unchanged; actionable feedback will preserve the1m rule.

## Repair checkpoint

Four affected billboards saved individually. Control labels retain positions/yaw, use scale .4 and text size24 with background alpha0. Teaching board retains pose/scale, text size12/background alpha.7. Native readbacks confirmed values. Source adds event diagnostics and actionable HOME-pad/ground/zone rejection feedback without changing bounds or endpoint connector. BuildAll returned an empty diagnostic array (pass). Full PushChanges is in flight, awaiting cook; no other editor calls overlap.

Full PushChanges Completed, then fresh Play From Here StartSession Completed; runtime controls subscribed19:15:08UTC. No HOME event yet. At centre, Pix/crate rendered across player/camera; fresh spawn at (6710,-13660) within85cm pad removes occlusion. RETURN TO HUB prompt persists toward distant Academy; rejected E input was not executed. Ongoing prompt diagnosis, no button collision mutation.

## Focused usability correction / test fixture

HOME/native interaction radius increased from1m to2m with native readback and actor save. The original1m interaction sphere and1m HOME pad have centres1.803m apart: horizontal overlap only0.197m before vertical offsets. The recording gate/connector remain1m. No button collision or actor placement changed.

Fresh native Play From Here sometimes leaves actual player at hub despite Completed; delayed diagnostics confirm hub XY(-995.8,1803.3), not assumed HOME. Supervisor authorized temporary test-only player positioning after startup to reach (6570,-13650),94.34cm from HOME. Fixture changes neither button events nor progression, and will be removed before finalbuild/cook. BuildAll zero diagnostics. StopSession followed by Unconnected/Disconnected verified before test launch. Launch pending serialized.

## Root cause reproduced and corrected

At actual player(6569.9945,-13649.9888,2391.15),94.34cmHOME, cooked UI displayed SHOW A ROUTE and real E fired HOME phase0. Original code rejected its safe connector. All five geometry call sites passed `delivered_one?` as a logic argument; false querying fails before geometry executes. Changed only those arguments to the raw logic value `delivered_one`; intentional conditional queries retained. BuildAll clean, Verse-only push Completed. Real E then recorded POINT0(6650,-13600) and POINT1(6570,-13650), displayed Walk to LOAD, and changed prompt to SHOW AGAIN at19:30:39UTC. Screenshot bugfix-home-recording.png records real input result, using temporary startup positioning only.

One momentary W key did not produce a retained50cm walking sample through the available UI API; full walked delivery/bypasses are not claimed. Pad-facing views revealed control labels pointed away from their interaction side; control-label yaw corrected -90→90, with positions unchanged. Three actors saved; full content update pending. No collision change or forced events.

Control-label alpha0 proved unsuitable in cooked view (no readable text), so an intermediate experiment used translucent alpha.35 at scale.4 rather than transparent. Label yaw90 was an unproven orientation hypothesis; actual readability still awaiting final cooked LOAD-side capture. Temporary fixture moved only test positioning to LOAD(7960,-13660); build clean, fullcook pending. No manual full-game acceptance claimed.

### Definitive binding diagnosis and current saved settings (19:54 UTC)
Same cooked match: scalar teaching_board pose was correct (6800,-12900,2594), footprint[0] was IsValid with correct pose (6650,-13600,2250), but all three billboard array references returned identity/default pose. Native savedActor references and an explicit array assignment did not fix runtime resolution. Alpha/yaw experiments above were unsuccessful hypotheses, not proven fixes.

Three existing labels now use scalar editable references home_label/load_label/cancel_label, assembled into control_labels at runtime. BuildAll returned no diagnostics; new scalar wrappers were bound to the original three actors and controller saved. First fresh launch rejected retained old labels[0..2] serialized fields; runtime array renamed control_labels to avoid the old field name. Next fresh launch currently pending.

Definitive saved label settings: scale 0.4, text size 24, original yaw -90, opaque dark background alpha 1, Two Sided, border off; positions unchanged. Teaching board: text size 12, background alpha .7, Two Sided, original pose/scale. Readable cooked proof remains pending; superseded alpha .35/yaw90 settings are history only. The 128 footprint references remain intact, with runtime validity measured.

### 20:06 UTC: revised diagnosis and replacement checkpoint
Scalar conversion did NOT restore runtime label poses; direct load_label and runtime control_labels both returned identity in the next cook. Array-specific serialization cause is disproved. Lights array resolved both actual expected transforms; unchanged. Existing failed labels and working board compared same class, enabled Always, editor-only false, spatial loading false, NetLoadOnClient true and NoCollision false.

BuildAll after validation-modal recovery independently returned [] at20:01UTC. Earlier blocked BuildAll timed out after300s, not counted as success. The failed-launch 'Unable to Play / Validation failed / OK' modal was read and acknowledged under Supervisor authorization; subsequent queued launch completed. Temporary diagnosis still active.

Replaced three labels using official DeviceToolset.PlaceDevice catalog PID_Device_Billboard (old actors retained pending cooked proof). New actor suffixes1809328293/1809742294/1810246295, UAID_E89C2592D1B5BB0703. Same approved label positions and definitive settings above; new scalar refs bound and all new actors/controller saved. Fresh launch now pending, after verified Unconnected/Disconnected shutdown.
