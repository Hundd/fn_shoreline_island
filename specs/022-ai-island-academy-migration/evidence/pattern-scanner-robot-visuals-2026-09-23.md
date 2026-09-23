# Pattern Scanner robot visuals — editor evidence (2026-09-23)

- The four existing `loop_0` through `loop_3_robot_runtime` actors remain the moving puzzle props. No actor was replaced, relocated, or relinked, and no Verse or reward source changed.
- Through UEFN, each prop gained five attached primitive components: two navy eyes, a navy mouth, a navy antenna stem, and a gold antenna tip. The existing teal cube remains the body. All four actors were saved separately.
- Editor views from the front of stages 0 and 1 show the robot face and antenna clearly on the original tile. Live readback found all five new components on each of the four actors. All twenty components returned one academy material and `NoCollision`; each robot retained yaw 0 and scale `(0.7, 0.7, 1)`.
- Saved actor assets: `Content/__ExternalActors__/fn_shoreline_island/1/H6/C8TULFHC99MYSN6SR64DY6.uasset`, `Content/__ExternalActors__/fn_shoreline_island/4/UZ/UKQOWRMNUOKU7QI6BAJ2W9.uasset`, `Content/__ExternalActors__/fn_shoreline_island/A/1Y/3SWAVOO2V9TRG9SI8XDPVZ.uasset`, and `Content/__ExternalActors__/fn_shoreline_island/1/00/DNRMPIRN9AWO94NVS78IWR.uasset`.
- Per the owner's request, project validation and playtesting were skipped. The editor observations do not establish how the new components look while the robot moves in-game or whether any visual occlusion appears from the player camera.
