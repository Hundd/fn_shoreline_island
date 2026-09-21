# Plan

- Status: In progress; Variable Vault graybox shell built and saved, traversal
  acceptance pending.

## Design language

Build a small coastal academy rather than eight disconnected boxes. Reuse only
minor construction details such as trim thickness and safe doorway clearance;
do not copy the Variable Vault pavilion shell. Give every game a different
silhouette, roofline, entrance composition, and landmark:

- Path Garden: greenhouse and planters.
- Loop Lagoon: dock workshop and repeating lantern rhythm.
- Signal Lighthouse: harbor control room and beacon tower form.
- Variable Vault: power lab with energy conduits.
- Debug Workshop: repair garage and diagnostic props.
- Event Factory: compact production hall with bell/chute motifs.
- Build-a-Bot: robotics hangar.
- Tidepool Nursery: glassy coastal conservatory.

The intended structural families are greenhouse frames for Garden, an open dock
shed for Loop, a tall beacon hall for Signal, the existing enclosed power-lab
pavilion for Vault, an asymmetric repair garage for Debug, a stepped production
hall for Event, a broad robotics hangar for Bot, and a low conservatory with
planter wings for Nursery.

Station decoration follows the same rule: retain every existing gameplay
device in place, but frame each game's controls with a different low-profile
primitive kit. Garden uses leaf/planter fins, Loop uses paired circular arches,
Signal uses antenna pylons, Vault uses faceted energy banks, Debug uses offset
tool racks, Event uses stepped indicator towers, Bot uses angular assembly
arms, and Nursery uses rounded coral pods. Decorations must stay behind or
beside interaction points rather than covering their faces.

## Delivery sequence

1. Audit zone bounds, routes, available Fortnite assets, and current memory
   constraints.
2. Build one reversible room shell around Variable Vault as the template. Its
   regular grid and four stations make clearance problems easy to detect.
3. Save, launch a solo session, and verify entrance, four-station access,
   controls, boards, camera, exit, and unchanged gameplay.
4. Revise the kit, then build the other seven room shells one zone at a time.
5. Add hub paths, trees, planters, lighting, and landmarks after room footprints
   are stable.
6. Run the existing zone regressions plus validation and memory gates.

## Placement policy

New environment actors use the `campus_` prefix and zone-specific Outliner
folders. Maintain broad front entrances and at least one visually obvious exit.
Do not place decoration inside control interaction radii or moving-prop paths.

## First implementation checkpoint

The initial `campus_variable_vault_shell` is centered at
`(-7600, -2700, 2400)`. It uses one actor with a rear wall, two side walls, a
high roof, and five open-front bay columns. The shell spans the existing four
Vault stations without moving them. An editor viewport inspection shows the
station line beneath the roof with an unobstructed open front. Runtime traversal
is still pending because the first Play From Here launch returned the player to
the normal hub spawn.

## Distinct graybox checkpoint

Seven additional shells are saved without moving gameplay actors:

- `campus_path_greenhouse`: compact pergola frames, ridge, and side planters.
- `campus_loop_dock_sheds`: four offset dock roofs with alternating pitch and
  round markers.
- `campus_signal_beacon_hall`: four open signal portals around a tall beacon.
- `campus_debug_repair_garage`: asymmetric split roofs and exhaust stacks.
- `campus_event_stepped_factory`: four different-height production towers,
  chimneys, and an overhead conveyor.
- `campus_bot_aframe_hangar`: paired sloped roofs, ridge spine, and open bays.
- `campus_nursery_canopy_garden`: four separate round canopies with planter
  wings.

An aerial editor inspection confirms different silhouettes. These remain
graybox structures: material identity, windows, signs, native Fortnite props,
landscaping, paths, and runtime clearance evidence are still pending.

The first full content launch after this checkpoint timed out after 300 seconds
and the Session toolset subsequently reported `Disconnected` / `Unconnected`.
No runtime result is claimed. Diagnose the launch/cook before any shell receives
acceptance credit or before further environment density is added.

## First campus connection pass

The saved `campus_main_promenade` adds a teal north-south spine with branches to
Garden, Loop, Signal, Energy, Debug, Event, Bot, and Nursery. Eleven scaled
native Fortnite `CP_Apollo_Tree_RedAlder` actors form loose east/west boundary
rhythms outside the station rows. An aerial editor inspection confirms that the
paths read continuously and the trees remain outside the room entrances.

This pass deliberately reuses one tree asset at varied scales and rotations to
limit memory growth. Per-room materials, windows, entrance signs, lighting, and
themed props remain pending.

## Ground-alignment correction

Editor bounds inspection established the shared campus surface at world
`Z = 2272`, matching the bottom of all eight room shells. The promenade and all
twelve currently placed campus trees were lowered without changing their X/Y
placement, rotation, or scale so each actor's bounds now meets that surface.

## Distinct station-identity pass

Eight saved `campus_*_station_identity` actors add 86 decorative primitives
without moving or replacing any gameplay device. The visual vocabularies are
green planter fins for Path, teal dock posts and portholes for Loop, gold mast/
orb antennas for Signal, navy crystals with gold nodes for Vault, asymmetric
sand tool racks for Debug, rising gold indicator towers for Event, teal overhead
assembly frames for Bot, and clustered green coral pods for Nursery.

An aerial editor inspection confirms that these read as different arrangements
and remain beside, behind, or above the existing button faces. Runtime control
interaction and clearance evidence remain pending.

## Grounded station dressing correction

The room-floor actors top out at world Z 2400, whereas the station-identity
actors were initially authored with component bases at Z 2272. Raise only the
eight decorative identity actors by 128 cm so their visible bases meet the
playable surface. Add narrow uprights beneath the Debug Workshop's tool beams,
preserving the intentionally asymmetric rack heights. Verify the final bounds
and component positions in the editor; runtime interaction remains pending.

Editor correction applied: all eight identity actor origins are now Z 2400,
placing the visible primitive bases on the floor. Eight narrow Debug uprights
bridge each tool beam to its two differently sized rack posts. A close editor
view shows the beam with visible posts; normal player interaction still needs
a fresh-session check.

## Vault station 3 control-row support

Side-on editor inspection of the row containing
`energy_station_3_help_button` shows a line of exposed button devices without
a visible console under them. The dark wall behind is the pavilion shell, not
a button support. Add a low, slim rail and narrow grounded stanchions behind
the existing button/label plane, leaving the devices and their bindings in
place. Verify the rail reaches the floor, does not obscure labels, and reads as
part of the Vault's navy/gold energy-lab kit.

Applied to the existing `campus_vault_station_identity` actor: a navy base and
mount rail plus five gold floor-to-rail posts support the Station 3 row. The
base starts at the playable floor (Z 2400); frontal editor inspection shows
the original button faces still exposed and the posts visibly connecting the
row to the floor. Runtime interaction remains unverified.

## Remaining Vault control rows

Apply the same navy-and-gold floor-mounted rail pattern to the other three
Energy rows (`energy_0_*`, `energy_station_2_*`, and `energy_station_4_*`). All
four rows have nine buttons at Y -2800, spaced 180 cm apart, on floors topping
at Z 2400. Use each row's measured button center to position the supports;
do not move or reconfigure gameplay devices. Check Station 4 from the front
and side after saving, then inspect all four rows for consistent grounding.

The remaining three rows are saved on `campus_vault_station_identity`, each
with a navy base and mount plus five gold posts. Actor inspection confirms
seven support components per row across all four stations. Front and side
editor captures of Station 4 show exposed button faces and visible posts down
to the floor. In-game interactions still need a fresh-session check.

## Signal Lighthouse control supports

The four Signal rows (`signal_0_*` through `signal_3_*`) each have ten exposed
buttons at Y 700, with the playable floor topping at Z 2400. Unlike the Vault's
continuous rail, group each Signal row into three separate beacon-console
pods: short navy mounts carried by round gold floor pedestals. Keep the pods
behind the button and label planes, clear of the central station screen, and
leave all devices and bindings unchanged. Inspect the row containing
`signal_3_workshop_button` from front and side after saving.

All four rows now have three floor-mounted pods, each built from a gold foot,
gold column, and navy deck. The deck widths were narrowed to 500, 500, and
650 cm after the first editor capture showed the pods touching; the final
front view shows clear gaps and exposed button faces. A side view confirms
the round feet meet the floor and the central station screen stays visible.
Runtime interaction remains pending.

## Button-device appearance pilot

The placed controls are `Device_Button_V2` actors using the default military
switch mesh. UEFN exposes a `customMesh` override on those same actors. Pilot a
Fortnite-native Switch Device mesh on one Signal button first, inspecting
orientation, prompt readability, and state feedback before changing a whole
row. Keep the device instance, label, location, and Verse binding unchanged;
if the custom mesh cannot show button state reliably, use a separate decorative
surround that leaves the original control visible rather than replacing it.

Pilot result: `CP_Device_Switch_02_Off` is visibly distinct, but its material
does not expose the `Emissive` vector parameter required by the Button device
for state color. The attempted `buttonReadyEmissiveColor` edit was rejected by
the editor property setter. The pilot mesh override was disabled and saved;
do not spread this unverified mesh to other buttons. Next prototype a
non-interactive, room-specific housing around the original button, then
validate clearance and interaction in a live session.

## Vault promenade entrance correction

The promenade's Energy branch reaches the Vault at the east end, but the
original east wall was continuous across that approach. Split that wall into
two 950 cm runs with an 1100 cm center opening at Y -2700. Add a high lintel
and a gold `VARIABLE VAULT` text component facing the promenade, while keeping
all station actors and controls at their original coordinates. An editor view
from the branch now shows the four-station aisle through the doorway and the
room name above it. Save the Vault shell and check collision, camera clearance,
and the text component in a fresh session before counting the entrance as
accepted.

## Fresh-session result, 2026-09-21

`StartSession` exceeded the MCP 300-second call limit. A subsequent state check
reported `UpdatingContent` / `CanStart`, then `Disconnected` / `Unconnected`.
The editor log says server cooking finished and it was waiting on client
platforms; later the server shut down because no game clients were connected.
This provides no traversal or gameplay acceptance evidence. Diagnose the client
launch or content cook path before marking AC-001 through AC-005 complete.

## Signal nameplate pilot

The path-facing east portal now carries a gold `SIGNAL LIGHTHOUSE` label on a
2100 cm wide nameplate. A frontal editor capture shows the label grounded in
the portal beam while the central aisle and beacon remain visible. The label
and plate are saved on `campus_signal_beacon_hall`; confirm rendering after cook
and player clearance in a session.

## Branch-facing entrance pass

Editor approach views exposed two more blocked branches. `bot_east_end_buttress`
closed the Bot hangar at the promenade, so it is now split around a 1300 cm
opening with a lintel and a `BUILD A BOT` nameplate. `garden_planter_west`
crossed the Path Garden approach; it is now two side planters with an 1100 cm
center gap and a named greenhouse arch. The original station actors remain in
place.

All eight game rooms now have saved names visible from their approach:
Vault's wall opening, Signal's beacon portal, Debug's low floor-mounted garage
gantry, Event's two-line tower plaque, Bot's hangar lintel, Nursery's rounded
pod-supported sign beside the path, Garden's arch, and Loop's round dock sign.
The Loop sign was moved outside the walking strip and ahead of its lantern
posts so the name is unobstructed. Editor captures confirmed each newly added
name from its branch. These are editor-only observations; verify every label,
clearance, and doorway after a successful cook and play session.

## Connected-session checkpoint

A stale Fortnite client was closed and a fresh `StartSession` completed in 97
seconds. The session connected and the match reached `Running`; Verse built
without diagnostics. Client image/input was unavailable, so no walking or
control interaction is credited. The client log has physics-component errors
for several BuildingProp actors. Details and shutdown state are recorded in
`evidence/session-2026-09-21.md`.

## Coastal material pass

Create one small UEFN material with a parameterized base color and matte
roughness, then make muted color instances for the eight rooms. Apply colors to
selected architectural pieces, especially rooflines, entry frames, and name
plaques, while keeping the floors and original gameplay devices unchanged.
Pilot one plaque first, inspect it in the editor, then extend the palette only
if the material saves and renders correctly. Use material and shape together
for room identity; color is not the sole navigation cue.

## Native prop pilot

Use a small set of Fortnite-authored coastal props for the promenade's empty
gaps. Pilot the Apollo Coastal Boardwalk Bench beside, rather than on, the
spine and inspect its ground contact and size before repeating it. Put any
planters and lamps beyond the branch clearance bands so their silhouettes
help wayfinding without hiding room names. Reuse the same props at low density
to limit memory growth.

## Promenade clearance correction

The first coastal bench pilot revealed that the north-south spine centered on
X -1200 runs through the Vault's east wall and skirts other room ends. Move the
spine center to X -400 while keeping its width, height, and north-south extent.
Extend the six west-facing room branches by 800 cm at the east end so they still
meet the spine. Garden and Loop branches already cross the revised spine.
Shift the five east boundary trees east by 1600 cm to leave a clear view and
walking lane. Reconnect the first bench deck on the spine's east side and keep
its bench base at playable floor height. Inspect the junctions and entrance
lines in the editor; traversal acceptance still needs a client playtest.

## Coastal pass implementation, 2026-09-21

`M_CampusMatte` and ten muted material instances are saved under
`Content/Campus/Materials`. Each room now uses its own roof, entrance, or
nameplate accents; the Signal plaque was inspected from its approach before
the palette was applied to the other rooms. The main promenade spine is now
centered at world X -400, with all six west branches extended to meet it.
The five east boundary trees are at world X 2600. Four cream rest decks join
the spine's east edge at world Y -3900, -7900, -11900, and -15900, each with
an Apollo Coastal Boardwalk Bench grounded at Z 2400. The promenade, trees,
and benches were saved in UEFN. The room-end wall clearance improves in the
editor, but route collision and bench access still need a client playtest.

Fresh-session validation found the boardwalk bench mesh is disallowed for
this island. Remove all four `campus_promenade_bench_*` actors in UEFN, then
build simple backed benches from the existing approved primitive kit on the
four rest decks. Validate before adding another Fortnite prop. The editor
MCP became unresponsive after the validation failure, so this correction is
pending a live editor connection.

The editor connection recovered. All four rejected actors were deleted, and
each rest deck now has a six-part backed bench assembled on the promenade
actor from approved cube components. A second-nook editor capture shows the
seat and backrest grounded on the deck. Fresh `StartSession` then completed
UEFN local validation and reached `Connected` / `Running`. Client traversal,
memory, and interactive puzzle checks remain open.

## Loop Lagoon approach correction

A walking-height audit showed the promenade's north end and Loop spur running
through Loop Station 0 controls. The Station 0 button bounds include world
X -528..428 and Y 3622..3878. The first revision moved the spur south to
Y 3000, but an editor approach view then exposed a dock pylon in its center.
The Loop shed's four rear pylons sit at world Y 2850 with a 115 cm half-width;
the southernmost button bounds begin at Y 3622. Route the Loop spur midway
between them: center world Y 3290, width 450 cm, so its edges are Y 3065 and
3515. This leaves 100 cm to the pylon bounds and 107 cm to button bounds.
Retain the spur's full east-west reach. Shorten the main spine to end at
world Y 3300 while keeping its south end at Y -18000; it then overlaps the
spur by 235 cm and ends 322 cm before the button row. Inspect the first dock
and all four station approaches in the editor before considering the route
safe.

## Path Garden frame clearance

The Garden branch is 700 cm wide at world Y 1500, spanning Y 1150..1850.
The second and third greenhouse frame pairs stand at world Y 1300 and 1700
and block this lane. Move their two posts and overhead beam to world Y 1000
and 2000, respectively, preserving the two outer frames at Y 900 and 2100.
Each 180 cm post then ends 60 cm outside the walking strip. Do not move any
puzzle stations or control devices. Inspect the branch and greenhouse from
walking height after saving; player collision still needs a client test.

The entrance view also exposed the identity actor's continuous `planter_spine`
at world X 1500 across Y 475..2525. Split it into south and north beds at
Y 475..1075 and 1925..2525, leaving an 850 cm center opening around the
700 cm branch. Reposition its five leaf fins onto the two beds without
changing their height or the gameplay controls beyond them. The planter
opening and frame opening must align at Y 1500.

## Signal and Vault branch clearance correction

Editor chest-height collision traces found the Signal Station 0 claim button
within the south side of the existing 700 cm branch at Y 900. Move only the
visual path component to Y 1175 and reduce its width to 400 cm (Y 975..1375).
The original claim button ends at Y 828, leaving 147 cm between its bounds
and the new south path edge. The narrower path also avoids a Station 0
device collision detected at Y 900 farther inside the room. Editor lines
through both new edges and the center were clear before the edit.

The Vault branch has a separate south-side collision at Y -2750. Move only
that path component from Y -2600 to Y -2475 and reduce its width to 450 cm
(Y -2700..-2250). Editor traces were clear on both new edges, and the east
wall doorway was clear at these Y coordinates. Retain branch length and floor
height, preserve all station actors, and verify path junctions and entrances
with editor traces after saving. Runtime capsule clearance remains pending.

## Signal button crest pilot

FR-011 requires a visual cue attached to the buttons themselves. The tested
native mesh override cannot preserve the required state material, so pilot a
small gold beacon cone above and behind one original Signal button. Use
`signal_0_claim_button` as the representative control, retaining its mesh,
settings, and bindings. Its editor bounds are X -2518..-2262, Y 572..828,
Z 2372..2628. Place the crest on the existing Signal identity actor above
that bounds box, with enough gap to keep the prompt and state face visible.
Inspect from the player approach before repeating the treatment. The cone is
cosmetic; client interaction and state feedback must be checked before
crediting AC-009.

Pilot applied on the Signal station-identity actor: a gold 70 cm cone centered
above `signal_0_claim_button` at world (-2390, 770, 2705) is connected by a
slim gold stem to the existing console deck. A player-height editor capture
shows the original Claim device face and label visible below the crest. The
actor was saved and a fresh session reached `Connected` / `Running`; runtime
prompt, state feedback, and interaction have not been observed. Keep this as
one pilot until those behaviors are verified.

## Vault interior light pilot

The spine-facing editor view of Variable Vault shows the first control row
against a very dark north wall beneath the high roof. Pilot one warm ceiling
fixture at the first bay, clear of the player camera and existing devices.
Attach a slim gold pendant to the Vault shell roof and a compact cream shade,
then add a point light near the shade if UEFN supports that component. Compare
the same walking-height view before and after; only extend the lighting rhythm
if the fixture stays visually grounded to the roof and the project cooks.
This lighting pass must not replace control-state indicators or hide boards.

Applied: four identical roof-mounted Vault fixtures now sit above the four
station bays at world X -3200, -6200, -9200, and -12200, centered on Y -2700.
Each has a slim gold pendant joined to the roof, a 230 cm cream shade, and a
warm point light below it with a 2200 cm attenuation radius and no dynamic
shadow casting. An upward walking-height editor view showed adjacent shades
and their pendants touching the roof. The single-fixture pilot and the final
four-fixture pass each saved and cooked in a fresh session that reached
`Connected` / `Running`; both sessions were stopped and verified
`Disconnected` / `Unconnected`. The editor approach image did not establish
that the far wall became brighter, and in-client light appearance, board
readability, camera clearance, and memory cost remain unverified.

## Event Factory branch-facing nameplate

An editor view from the spine along the Event branch shows the tall east
production tower but not its existing `EVENT FACTORY` nameplate: that plaque
faces east from the tower's far south edge at world Y -11350. Keep the existing
plaque and add a second navy sign on the tower's north face, where the branch
passes at Y -10200. Center the new plaque on the tower at approximately
(-3200, -10894, 3100), face the text toward the branch (+Y), and keep its
bounds outside the 700 cm path (Y -10550..-9850). Inspect from the spine and
near the entrance, then save and cook. The label supplements the tower shape
so the room is identifiable without relying on color.

Applied: a second navy `EVENT FACTORY` plaque with gold text is saved on the
north face of the east production tower, centered at world (-3200, -10894,
3100). Its 20 cm thickness overlaps the tower face slightly, and its closest
edge remains about 330 cm south of the 700 cm branch. A normal-pitch editor
view from X -1000 on the branch shows the name at walking height; the original
east-facing plaque remains in place. A fresh session cooked the new components
and reached `Connected` / `Running`, then was stopped and verified
`Disconnected` / `Unconnected`. In-client text legibility and route clearance
still need direct playtesting.

## Debug Workshop entrance sign height

A normal-pitch editor view from the Debug branch showed the garage portal but
not its nameplate; a 25-degree upward view showed `DEBUG WORKSHOP` mounted
above the two entrance posts. Lower only the existing plaque and text from
world Z 3400 to Z 2950. The plaque is 220 cm tall, so its bottom remains at
Z 2840, providing 440 cm of clearance above the playable floor at Z 2400.
Its ends still overlap the 900 cm high entrance posts. Keep the entrance
posts, room shell, and gameplay actors in place. Recheck a level camera view
from the spine and a chest-height collision line before saving and cooking.

Applied: the existing Debug plaque and text now center on world Z 2950.
A normal-pitch editor view from the branch shows `DEBUG WORKSHOP` above the
open aisle, and a Z 2700 line from the spine through the portal was clear.
The garage actor was saved and cooked in a fresh connected session. Player
camera clearance and text legibility still require a client check.

## Build-a-Bot entrance lintel height

The Bot branch's normal-pitch editor view shows its A-frame and open east
end but not the `BUILD A BOT` label mounted just below the entrance lintel.
Lower the existing lintel and its text together by 400 cm. The lintel center
becomes world Z 3050, with its bottom at Z 2950, preserving 550 cm above
the playable floor. It still joins the two 1600 cm tall east buttresses at
their inner edges. Keep the 1300 cm doorway, A-frame, and gameplay devices
unchanged. Recheck the normal-pitch approach and a chest-height line through
the opening before saving and cooking.

The 400 cm lintel-height pilot did not bring the Bot label into a normal-pitch
editor view, so both components were restored to their original transforms.
Instead, retain the tall entrance and add a separate navy-and-cyan robotics
wayfinding sign just north of the branch near world (-2200, -13150). Mount an
800 cm wide plaque on two slim floor posts, with its bottom above normal head
height and all bounds north of the branch's Y -13650 edge. Face the text east
toward the spine. Inspect from the spine before saving; this sign must not
constrain the doorway or cover the original overhead `BUILD A BOT` nameplate.

Applied: the Bot side sign centers on world (-2200, -13150, 2950) with a navy
800 cm plaque, cyan text, and two cyan posts reaching the room floor. Its
nearest edge is 100 cm north of the visual branch, and the original raised
lintel/nameplate are unchanged. A normal-pitch editor view from the spine
shows the room name beside the path. The hangar actor was saved and cooked in
the same fresh session as the Debug correction; the session reached
`Connected` / `Running`, then was stopped and verified `Disconnected` /
`Unconnected`. Client collision and text readability are still pending.

## Variable Vault walking-height sign

The original Vault name is centered at world (-1080, -2700, 3650) over the
east doorway, outside a normal-pitch view from the spine. Keep that overhead
identity and add a low navy-and-gold power-lab sign north of the shifted
branch, centered near world (-2000, -1700, 3000). Use two grounded posts and
a two-line nameplate so the long room name fits without reducing it to tiny
text. The board's south edge must remain north of the path's Y -2250 edge;
keep the doorway and original gameplay actors clear. Inspect from the spine
and save/cook before crediting navigation readability.

The freestanding position was occluded by the east doorway wall in a level
camera view. Revise the sign to a compact two-line plaque on the near, north
doorway wall: center world (-1100, -1925, 2700), width 450 cm along Y, with
its southern edge at Y -2150. This wall face is beside the path's north edge
at Y -2250, leaving 100 cm of lateral separation. Remove the unused floor
posts after confirming the wall-mounted version is visible from the spine.

Applied: the compact navy/gold plaque is embedded in the cream doorway wall
at eye height. A normal-pitch editor view from the spine shows both words
fully on the plaque. The unused post components were removed. The original
overhead `VARIABLE VAULT` name remains in place; in-client legibility and
wall-side clearance are pending.

The wall-mounted Vault plaque and its original overhead sign were saved and
included in a fresh session that reached `Connected` / `Running`. The session
was then stopped and verified `Disconnected` / `Unconnected`.

## Tidepool Nursery entrance alignment

The saved Nursery pod sign is centered at world Y -18200, while its branch
is centered at Y -17000. Shift the two existing entrance pods, nameplate,
and text north together by 1200 cm. The pods will center at Y -17650 and
-16350, leaving 220 cm between their 80 cm bounds and the 700 cm path edges
at Y -17350 and -16650. Lower only the plaque and text from world Z 3350
to Z 3000, keeping the plaque supported between the 900 cm pods and leaving
475 cm from the floor to its bottom. Inspect from the spine at normal pitch,
check the path center at chest height, then save and cook. Other canopy and
station components stay where they are.

Applied: the pod sign assembly now straddles the Nursery branch. A normal-
pitch editor view from the spine shows `TIDEPOOL NURSERY` above the open path;
three chest-height lines at the path center and 250 cm to either side were
clear from X -400 to X -3000. The actor was saved and cooked in the same fresh
session as the Vault sign. These editor observations do not establish player
capsule clearance or in-client readability.

## Path Garden arch readability

The Path Garden nameplate sits at world Z 3700 on 1200 cm arch posts and
falls above a normal-pitch view from the spine. Shorten only the two arch
posts to 450 cm while keeping their feet at Z 2400, and lower the existing
nameplate and text to world Z 2950. The plaque bottom will touch the post
tops at Z 2850, leaving 450 cm of clearance above the 700 cm branch.
Preserve the 1300 cm opening, all greenhouse frames, planters, and stations.
Inspect from the spine and trace the opening at chest height before saving
and cooking.

The lowered arch name touched the top edge of the normal-pitch editor view,
so the two posts, plaque, and text were restored to their original heights.
Use a small two-line navy/sage plaque on the west face of the south entrance
planter instead. Center it near world (690, 675, 2700); that planter spans
Y 400..950, so the sign remains 200 cm south of the branch's Y 1150 edge.
Keep the tall arch as the greenhouse silhouette and retain the existing
in-room Path Garden board. Inspect the side plaque from the spine before
saving and cooking.

The planter-face pilot was hidden behind the original arch post. The compact
plaque and text were moved to that post's west face at world (540, 850, 2700),
with a 400 cm width and its north edge at Y 1050, 100 cm short of the
branch's south edge. A normal-pitch editor view from the spine shows both
words clearly beside the opening. The tall overhead greenhouse sign and
the original planter positions remain unchanged.

## Loop Lagoon roundel relocation

The existing round `LOOP LAGOON` sign centers at world (-1000, 5400), north
and west of the route from the promenade's Loop junction. Move its post,
roundel, and text together to world (1450, 4200), in the gap between the
first and second shed roofs. The post's 100 cm radius will stay at least
585 cm north of the spur's Y 3515 edge and 122 cm west of the Station 1
Claim button bounds beginning at X 1672. Keep the sign facing west so it
addresses players turning east. Inspect the line of sight from the spine,
trace the spur at chest height, then save and cook if neither the sign nor
post interferes with the controls.

The first candidate roundel was too large and a dock post occluded its text.
The final sign uses the same existing components at a smaller scale: post
center world (1350, 3925), roundel center (1220, 3925, 2900), radius 250 cm,
with 75 cm text facing west. The roundel stands 160 cm north of the visual
spur's edge; the post is 222 cm west of Station 1 Claim's button bounds.
A normal-pitch editor view from the junction shows both words without the
dock post covering them. The first two sheds and all controls remain in
place; player capsule clearance still needs a client run.

## South promenade hub guide

A walking-height view north from the southern promenade at Y -16000 shows a
clear route, but the distant Academy hub is not labeled there. Add one compact
grounded `ACADEMY HUB` guide sign on the east grass at world X 500, Y -15500,
facing south toward players returning from Nursery and Bot. Keep its west edge
roughly 290 cm east of the promenade's east edge X -50, and ground its post
on the grass surface at Z 2272. The sign is a route cue, not an interaction
device. Use the
existing primitive material palette; avoid a large structure that competes
with the room entrances. Inspect at normal pitch from the south, trace the
promenade at chest height, save, cook, and verify player readability later.

Applied: `campus_south_hub_guide` has a cream post from Z 2272 to 2640,
a navy plaque centered at (500, -15500, 2730), a slim gold cap, and centered
white `ACADEMY HUB` text facing south. The plaque spans X 250..750; the full
actor bounds begin at X 240, leaving 290 cm to the path edge. Its first post
height covered part of `HUB`; shortening the post below the plaque made both
words readable in the normal-pitch editor view from (-400, -16800, 2650).
Chest-height traces along the path center, east edge, and 150 cm east of that
edge were clear. The actor was saved and a fresh session activated content
on all platforms at 11:57 UTC, reached Connected / Running, and was stopped
and verified Disconnected / Unconnected. Player readability remains open.

## Hub promenade edge review

A full-length editor line audit found the existing `byte_island_game_manager`
device touches only the eastmost part of the teal spine near Y 0. Its bounds
begin at X -127, while the spine spans X -750..-50. Chest-height lines at
X -700 and -400 were clear along the spine; a local hub scan was clear through
X -150 and first hit at X -125. The open lane is still broad, but this is not
a capsule or camera clearance result.

The spine is one 700 cm wide component. Four east-side rest decks meet its
X -50 edge exactly, so narrowing or moving the entire spine would create
gaps at those decks. Splitting the spine solely for this edge contact would
introduce a visible width step near the hub and change three branch joins.
Keep the current continuous wide path until a player walk shows an actual
problem. Inspect the hub turn into Garden and Signal in the client before
editing any geometry or gameplay device. A normal-pitch editor view looking
south from world (-400, 700, 2650) shows the console standing beside the
teal route, with the center lane visually clear.
