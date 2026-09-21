# Promenade route audit, 2026-09-21

The promenade actor is saved in UEFN. Its spine component is centered at
world X -400, Y -7350 and spans X -750..-50, Y -18000..3300. The west
branches meet its centerline at world Y 900 (Signal), -2600 (Vault), -6400
(Debug), -10200 (Event), -14000 (Bot), and -17000 (Nursery). The east Garden
branch meets it at Y 1500.

The Loop Lagoon spur was corrected after a walking-height editor view showed
the former Y 3800 route crossing Station 0 controls. A first southward move
exposed a dock pylon in the route. The final saved spur is centered at world
Y 3290, width 450 cm, spanning X -1200..7200 and Y 3065..3515. It overlaps
the spine by 235 cm in Y. Loop's rear pylons occupy approximately
Y 2735..2965; the first station's button bounds begin at Y 3622. The new
route has 100 cm and 107 cm of separation from those bounds, respectively.
Editor views along the spur and northbound spine show the path between the
pylons and controls, with the `LOOP LAGOON` sign visible. These are editor
geometry and visual checks; player collision remains unverified.

The west room shell bounds end at approximately X -3070 (Signal), -1080
(Vault), -966 (Debug), -1000 (Event), -830 (Bot), and -1740 (Nursery).
The spine's west edge is X -750, so the shell bounding boxes do not cross
the spine. The Bot shell comes closest, with an 80 cm bounding-box gap;
its entrance opening and walking aisle need a client traversal check.

A fresh `StartSession` after the path change returned `Completed`; status
checks showed `Connected` and `Running`. `StopGame` returned `Completed`,
`StopSession` was called, and final checks showed `Disconnected` and
`Unconnected`. UEFN stayed open. This proves the updated content passed
session validation and cook, but does not prove physical traversal.

The Garden branch at world Y 1500 is 700 cm wide (Y 1150..1850). An editor
approach view found its second and third greenhouse frame pairs standing
inside that lane at Y 1300 and 1700, and a 2050 cm long decorative planter
closing the center. Both frame pairs were moved to Y 1000 and 2000; their
posts now end 60 cm outside the branch. The planter was split into two
600 cm beds spanning Y 475..1075 and 1925..2525, leaving an 850 cm central
opening. Its five leaf fins were redistributed onto those beds. The Garden
shell and identity actors were saved in UEFN. A walking-height editor view
from the branch now shows an open route to the controls; client collision
and control interaction still need testing.

A fresh `StartSession` after the Garden edit failed during source upload,
after local validation. The editor log reports `Server is in maintenance
mode` from Epic's URC source service and
`FlowStep_UploadCandidateSourceFiles(): Failed to register session
candidates`. This is an external upload failure, not evidence of a Garden
asset validation error or a completed cook. A session/game status check was
initiated afterward to determine shutdown state.

The session status MCP call timed out after 300 seconds and the local MCP
HTTP endpoint did not answer a five-second probe. The Fortnite client log
was still updating and advertised a UEFN session. The client process
(`FortniteClient-Win64-Shipping`, PID 18156) was stopped directly. A process
check then found no Fortnite client and confirmed that the UEFN editor
process (PID 24924) remained open. The MCP game-state API could not confirm
`Unconnected` after this shutdown.

The MCP endpoint later recovered and UEFN confirmed `Disconnected` /
`Unconnected`. Verse `BuildAll` returned no diagnostics after the Garden edit.
A single fresh-session retry failed before asset validation: the editor log
reports scratch-repository initialization `Login failed or not initiated`,
then `Failed to stage project for upload`. The top-level message was
`Validation failed`, but the underlying cause was Epic authentication/source
staging, not a new UEFN asset-validator finding. Final state after this
attempt remained `Disconnected` / `Unconnected`, with the editor open and
no Fortnite client process.

Walking-height editor captures were also made from the spine toward the six
west rooms. Signal, Vault, Debug, and Bot showed the teal branch leading into
the intended aisle; Event and Nursery branches were visible after moving the
editor camera inside the branch. Button rows in several west rooms sit along
one side of the branch and their bounds overlap its 700 cm visual strip.
This warrants the client clearance test in `playtest-matrix.md`; a viewport
view is not evidence that every station can be passed without collision.

User-supplied Fortnite startup lines beginning with `Custom abort handler`
and successful `LogPakFile` container mounts contain no crash or project
failure. The latest UEFN launch attempt did not create a new Fortnite client:
its editor log again reported `Login failed or not initiated` while staging
the scratch repository. A prior login attempt reported `Server is in
maintenance mode`. No Fortnite client process or new crash report was found
when these logs were inspected. UEFN reported `Disconnected` / `Unconnected`.

Inspection of the restarted editor log clarifies the authentication chain:
at 09:44:09 UTC, `LogVkScratchRepository` reported `User is logged in,
performing Lore login`; at 09:44:10 it reported `Lore login failed` and
`Server is in maintenance mode`. The 09:45:47 `Login failed or not initiated`
scratch-repository message is downstream of that Lore failure. Epic account
sign-in had succeeded; the evidence does not call for signing out or changing
project assets. The upload could not stage the project, so this attempt did
not validate or cook the latest Garden changes. The restarted UEFN editor
remained open, no Fortnite client process was present, and UEFN MCP returned
`Disconnected` / `Unconnected` after the failed launch.

A later fresh session succeeded: project upload completed, the server log
reported content activation on all platforms, and UEFN reported `Connected` /
`Running`. The game and session were then stopped and verified `Unconnected` /
`Disconnected`. This cooks the Garden revision but still does not demonstrate
walking clearance or puzzle interaction.

An editor collision-line audit at chest height (Z 2500) found no line hit on
the six west branch centerlines from the spine X -400 to X -2700. A Loop line
at Y 3290 from X -800 to X 7000 was also clear. The Garden line at Y 1500
from X 0 to X 2400 was clear; a longer line hits an object at X 3000, beyond
the audited entrance segment. Lines 150 cm north of each west branch center
were clear over X -400..-2700. Lines 150 cm south were clear for Debug, Event,
Bot, and Nursery; Signal first hit at X -2335 and Vault at X -2180. A bounds
query at the Signal hit identified `signal_0_claim_button` (Y 572..828)
overlapping the southern edge of its Y 550..1250 branch. The Vault hit falls
within the Vault shell and station-dressing actors; the exact component has
not been identified. These are single line tests in the editor, not a player
capsule sweep or an in-game traversal. Keep both southern-edge incursions on
the playtest checklist; the clear center/north lines should not be read as
proof that the full 700 cm visual strip is collision-free.

The Signal and Vault visual branch components were then repositioned and
narrowed without moving gameplay actors. Signal now centers on Y 1175 and
spans Y 975..1375 at 400 cm width; Vault centers on Y -2475 and spans
Y -2700..-2250 at 450 cm width. Both retain their original length and floor
height and remain joined to the spine. After saving the promenade actor,
chest-height editor traces from X -400 to X -3500 were clear along the center
and both edges of each revised branch. A fresh `StartSession` returned
`Completed`; session/game state reached `Connected` / `Running`. `StopGame`
completed, `StopSession` returned, and final state was `Disconnected` /
`Unconnected`. This establishes save and cook for the branch revision, but
normal player traversal and controls remain untested in the client.

The remaining west branches were checked farther into the first station area.
At Z 2500, lines from the spine X -400 to X -5000 on the center of Debug,
Event, Bot, and Nursery hit their first station controls near X -3107 or
X -3407, as expected from the station layout. Parallel lines 150, 250,
350, and 550 cm north of each center were clear across that span. The Nursery
line 450 cm north hit near X -3210; the other three rooms were clear at that
offset. The existing 700 cm branches have clear lines on both sides of the
first controls, so they were left in place rather than narrowed to an
unusually thin strip. These line tests cannot establish a capsule-sized
walking route, and the four stations still need the client test.

The Path Garden entrance now has a compact two-line sign on the west face of
its south arch post, centered at world (540, 850, 2700). Its north edge is
100 cm south of the Garden branch. Both words were visible in a normal-pitch
editor view from the spine. Three chest-height lines through the entrance at
Y 1150, 1500, and 1850 were clear from X -400 to 1600. The tall arch remains.

The Loop Lagoon roundel was reduced to a 250 cm radius and moved to world
(1220, 3925, 2900), with its post at (1350, 3925). Its south edge is 160 cm
north of the spur and the post stays 222 cm west of Station 1 Claim bounds.
Both words were visible from the junction in a normal-pitch editor view.
Chest-height center and edge lines along the spur were clear. Both sign
actors were saved. A fresh session then activated content on all platforms
at 11:44 UTC and MCP returned `Connected` / `Running`. The preceding two
session attempts had stalled waiting for a game client; closing the stale
Fortnite client allowed the fresh attempt to connect. `StopGame` and
`StopSession` were called afterward, and MCP verified `Disconnected` /
`Unconnected`. Player traversal and control use are still untested.

A full-length chest-height promenade trace from Y -17900 to 3200 at Z 2650
was clear on the center X -400 and west interior X -700. The east interior
X -100 first hit near Y -57. Short traces across the hub junction were clear
at X -300, -250, -200, -175, and -150, but hit at X -125. A bounds query
identifies the existing `byte_island_game_manager` device at world X about
-127..127, Y -58..59, Z 2500..2658. The spine spans X -750..-50, so the
device clips its eastmost strip around the hub. The open editor line corridor
is at least X -700..-150, but that is not a capsule sweep. Walk this hub
junction at normal speed in the client and record whether the device creates
camera contact or an unexpected turn; do not move the gameplay device under
feature 011 without a separate migration and regression test.
