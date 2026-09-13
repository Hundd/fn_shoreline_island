# Loop Lagoon Implementation Plan

## Runtime console cleanup

Call the native creative_device Hide method on begin for the station and shared
progress device. Their editor console meshes are implementation controls and
must not compete with the labeled player buttons. Keep the editor actors and
bindings. Verify in a fresh Fortnite launch that consoles disappear while
Claim, Run and Help still work; record any billboard-loading recurrence.

- Status: In progress
- Specification: [spec.md](spec.md)

## Approach

Entrance flicker correction: the walkway top and both supporting floors are at
Z=2400 cm. Move only loop_hub_walkway upward 2 cm, preserving its rotation and
scale. Verify the transform, inspect both joins, and check traversal in a solo
session. This separates the rendered faces with a minimal transition height.

Build a compact dock zone in the existing map. Prototype one Move challenge
before adding the lantern block and final variation. Keep Path Garden working
throughout. Use labeled buttons for count selection, Run, Help, and Return.

Prefer four separate physical puzzle stations, assigned one per active player,
to make visible robot motion independent without assuming props can be shown
per player. Each station has its own robot, board, lanterns, and controls;
only its assigned player can operate it. Station ownership must be visible.
Assign a free station on entry, release on exit/disconnect, and retain completed
challenge progress for the round. Re-entry restores the player's challenge on a
free station. All four stations support every challenge.

First verify station assignment and moving-prop behavior in the editor. If this
layout is too expensive or unclear, revise the draft to use a personal UI board
before implementation proceeds. Do not use a shared animated board that can
misrepresent independent attempts.

## State and responsibilities

- Add a focused `Content/fn_shoreline_island_loop_lagoon.verse` device for
  challenge rules, station ownership, and per-player state.
- Track selected count, unlocked challenge, current challenge, hint level,
  running state, badge earned, and a run generation identifier per player.
- Keep the existing garden manager responsible for its existing puzzle.
- Execute a snapshot of the selected program; ignore input changes during Run.
- Invalidate pending animation callbacks on respawn, station release, disconnect,
  and round reset so old runs cannot advance progress or award a badge.
- Use an individual, nonpersistent Loop Badge tracker; guard awards in state.
- Target instructional and result messages at the owning player. Clear a board
  when released and restore its initial state before every execution.

Implementation APIs and device capabilities must be checked against the live
project before coding. This plan does not claim a verified API design.

Use one station device per board and one shared progression device. A Claim
button assigns an unoccupied station; moving more than 12 meters from that
station releases it. A polling check also releases inactive/disconnected owners.
Spawn events release active runs while retaining challenge completion. The
station checks a generation token before each step, using short, discrete robot
steps so cancellation cannot leave a long-running movement acting on a new owner.

## Delivery sequence

Four-station expansion (2026-09-12): use station 0 as the tested template and
duplicate its 33 local actors through the editor. Keep the progression device,
badge tracker, hub spawners, return destination, entrance, and route sign shared.
Place station copies at X offsets 2200, 4400 and 6600 cm, with unchanged Y/Z,
rotation and scale. The 2200-cm-wide dock floors meet edge-to-edge, providing
walkable access without overlapping top faces. Assign station IDs 1, 2 and 3;
verify every local binding resolves to that copy and every shared binding still
resolves to the original shared actor. Keep station 0 and its entrance intact.
Label available boards with dock numbers. Save/read back all copies and then
test station access and progress transfer solo; simultaneous isolation remains
a separate multiplayer acceptance gate.

1. Use the approved behavior and track the MVP's outstanding release checks.
2. Graybox one station; prove counts 1-5, visible stepping, safe failure, and retry.
3. Add Move/Light, the changed target, hints, progression, reward, and return.
4. Expand to four assigned stations; test each station solo and verify ownership
   and lifecycle handling. Defer simultaneous-player isolation checks until
   additional clients are available; the user currently has solo testing only.
5. Add coastal presentation and readable signs after the mechanics pass.
6. Build Verse, launch solo and multiplayer tests, validate the project, calculate
   memory, and record results before marking the feature validated.

## Playtest focus

2026-09-12 solo correction: keep lantern props visible at half scale while OFF,
restore their authored scale when ON, and show numbered OFF/ON states on the
station board. Capture the authored transforms before initial reset. Preserve
the parcel's horizontal target tile but put its center 120 cm above the robot
center, so the robot does not hide it on success. These changes address observed
hidden lanterns and parcel overlap; they require a fresh build and solo retest.

The first retest showed control billboards at Z=2580 obscuring the props and
long board text clipping. Move the six control labels from Y=3820/Z=2580 to
Y=3700/Z=2420, retaining X, rotation, and scale. This places their text below
the buttons and out of the robot sightline. Reduce the main board font from
16 to 12 and shorten its status row. Save each actor and read back transforms.

Run AC-001 through AC-012. Include rapid presses, every wrong count, repeated
completion, leaving mid-animation, respawn, disconnect, join-in-progress, and
round reset during execution. Recheck MVP spawn, garden solve/reset, badge, and
return. Record target-age observations using the roadmap's provisional measures.

Presentation pass PR-001: trial native billboard viewDistance 8 tiles on the 52 Loop station billboards (four objective boards, 24 control labels and 24 tile labels). Current readback is 10000 on the sampled objective board. Preserve transforms, text sizes, authored/runtime text and the Hub route sign. Snapshot all target values before editing, save, apply sequentially, save and audit exact readback. Solo-test distant docks from Hub, Dock 1 claim/run and near/far reappearance. Broader compact-board and landmark work remains pending.

The 8-tile trial preserves Dock 1 claim/run readability but leaves distant Dock 1 text visible from near Dock 3. Native ViewDistance and ToyOptions readback both equal 8, with widget draw distance 3996 and bNeverDistanceCull false. Trial 4 tiles next; keep only with nearby execution and distant-text evidence. Effective client culling distance has not been measured.

Retain **4 tiles** after the completed content push: the Hub view culls farther dock text while keeping the named route and nearest dock visible. Dock 1 claim, Repeat 1 execution and wrong-count feedback remain readable; Dock 2 text appears on approach. All 52 saved properties were audited. See [evidence/sign-range-2026-09-13.md](evidence/sign-range-2026-09-13.md). Repeated same-dock out/back travel, progress retention and nearby Dock 3/4 checks remain pending; T-PRESENTATION-RANGE stays open.
