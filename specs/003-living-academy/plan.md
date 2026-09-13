# Living Academy Implementation Plan

- Status: Approved
- Specification: [spec.md](spec.md)

## Approach

Use a focused hub device for an agent-targeted badge panel and destination recommendations. Read authoritative zone progress through editable device references. Implement garden repair in its own device with a four-slot selection/swap interface and visible stage props; isolate physical execution using owned stations as established by feature 002.

## Delivery and verification

Repair fixtures (FR-003/FR-004): each player starts with command IDs
`[0,1,3,2]` (Water, Plant, Harvest, Wait). Selecting two different slots swaps
their contents; selecting the same slot cancels selection. Run snapshots the
program and executes one command per second, displaying each accepted step.
The expected command at step `i` is `i`; stop at the first mismatch and explain
what that stage needs. Initial fixture stops at step 3. Swapping slots 3/4
produces the only success `[0,1,2,3]`. A swap of slots 1/2 stops at step 1.
Help first explains waiting before harvest; the next request gives the exact
slot swap. Replay restores the faulty fixture without awarding any badge.

Use four owned repair stations, each with Claim, four slot buttons, Run, Help,
Replay, and Hub controls; a board shows the program and current result. Four
stage props reveal Watered, Planted, Grown, Harvested in order and are reset
before a run. Keep a shared per-player repair state so edits/completion survive
station changes and respawn. Cancel suspended runs on release, respawn, replay,
departure, and round reset using generation checks. Ignore edits while running.
Never call Garden badge award functions from the optional repair activity.

First-station layout review: widen the entrance connector to Y -600..1200
and the station floor to Y -600..2200 so the approach has a broad landing.
Use a short completion summary on the five-line board; retain the full learning
explanation in the personal HUD message. Apply complete transforms (location,
rotation, scale) after native property edits and verify every saved sign position.

Four-station placement: retain Station 1 at X 4000 and place stations 2-4 at
X 6200, 8400, and 10600. Their 2200-wide floors meet edge to edge, sharing the
walking approach along Y -600..700. Duplicate only the 30 station-owned actors;
retain one shared repair-progress device and the existing hub destinations.
Assign unique IDs 0-3 and explicitly audit all 21 native references per station,
the shared progress reference, full transforms, and saved actor counts.

First increment: implement a personal restoration journal opened by a hub button.
Read Garden and Loop completion directly from their authoritative player maps,
without creating or awarding progress when the board is opened. Future zones
provide their personal badge trackers in Signal, Energy, Debug, Event, Bot order;
an absent tracker means that zone is not yet available. The final implementation
originally required five references; the Nursery extension below requires six. Signal is bound as the first tracker. Earned later
badges show their actual count out of one, so the journal exposes retained
progress after replay as well as completion. Reading the panel never assigns,
resets, or increments a tracker. Recommendations skip unimplemented destinations
and never gate routes. Display a new Verse UI canvas for the requesting player,
with a dark background, complete badge text, and an explicit Close button.
Opening again replaces only that player's panel. The initial HUD prototype
truncated the message in a solo test and is superseded by this panel.
Place and bind a dedicated button before claiming runtime acceptance.
Do not mark FR-001 complete until all eight final zone states are integrated.

Nursery extension (2026-09-12): add its shared progress badge tracker as a sixth
later-zone reference, preserving the existing five reference indices. Display
and recommend Nursery before Bot while retaining the Bot ending and unrestricted
zone access. Read only the requesting player's tracker value. Adjust panel
height and Close placement if the eighth row needs space. Save/read back the
new binding, build Verse, and test unearned/earned/replay states and panel fit
before checking off the integration task. The six-reference implementation now
builds cleanly and matches saved readback. The eighth zone shares the existing
Nursery/Bot row, preserving the panel height. Fresh solo display and Close/reopen
pass. The same player's three-challenge Nursery completion, Hub return, exact
Earned (1/1), unchanged seven unearned zones, Garden-first recommendation, and
earned Close/reopen also pass; see evidence/nursery-journal-2026-09-12.md.
Full-set Replay and later recommendation branches remain pending.

Implement this zone after the preceding zone's graybox and gameplay review.
Use the existing map, named routes, and one responsibility per Verse class.
Save before and after editor changes. Verify device references by readback.
Run every acceptance scenario in a launched session, including wrong inputs,
rapid presses, hints, repeat completion, departure during execution, respawn,
join-in-progress, and round restart. Recheck hub spawn and the existing garden.
Record actual multiplayer evidence separately from code inspection. Run project
validation and memory calculation; capture the visible zone and completion.

2026-09-13 visibility investigation (FR-002, NFR-002): repeated fresh launches
omit static hub instructions until gameplay restarts. The journal sign is
non-spatially loaded, has nonempty text, maximum view distance and no hide-event
binding. Trial only its enabled phase from Always to Gameplay Only, leaving
nearby signs as controls. Save/read back and inspect a fresh launch. Keep this
change only if runtime evidence supports it; otherwise restore Always before
trying a different remedy. Gameplay must show the journal cue without a restart.

Trial result: journal and unchanged controls were visible in both fresh launches,
including after restoring Always. No phase-only fix is supported; original phase
restored and saved. See [comparison evidence](evidence/sign-visibility-2026-09-13.md).
The intermittent issue remains open; compare first launch after a rebuild and
the exact camera/sign faces before selecting a wider remedy.

2026-09-13 next trial: add a dedicated hub_signs Verse device with 13 explicit
references to existing static hub/Garden billboards. Preserve their authored
wording as localizable messages. Reapply text, ShowText and UpdateDisplay every
three seconds, alternating a trailing space as in the visible observation signs.
Keep dynamic station boards under their existing controllers. Save and audit all
13 references, build Verse, then inspect the first launched game and respawn.
Treat this as a candidate remedy until those captures support acceptance.

The controller is placed, saved and all 13 bindings match readback. First game
after BuildAll, walking and respawn retained the hub/Garden instructions, and
Loop/Lighthouse route views passed. Keep the refresh based on this focused
[solo evidence](evidence/hub-refresh-2026-09-13.md). Exact appearance latency,
remaining route fronts and repeated fresh launches still need acceptance.

Journal approach follow-up: the Bot-to-journal playtest required several camera
adjustments at the edge-facing journal button. Native readback shows interactionRadius
0. Trial 0.5 using the native device setting, which permits looking within the
specified radius instead of directly at the button. Preserve its transform,
binding and explicit interaction behavior. Save and read back, then test spawn
approach, shared Hub return approach, Close and walking past without interaction.
Keep only if the prompt becomes easier to acquire without intercepting another
control. This native-property change does not require a Verse source change.

Keep radius 0.5: saved native readback and the focused spawn/Hub-return approaches
pass. Explicit opening, Close, walking past, Garden Wait targeting and normal
Garden return also pass. See [journal approach evidence](evidence/journal-approach-2026-09-13.md).
Full island presentation and release acceptance remain pending.

Hub journal stand: use the existing cube mesh and academy teal material for a low base, narrow stem and shelf beneath the existing control. Keep the button, sign and gameplay bindings in place. Save each new editor-owned actor, inspect bounds and playtest walking access, explicit open/Close and the adjacent Garden route. No shared completion state is represented.

The first live stand trial left a visible gap below the native button. Raise the stem top from 2440 to 2472 and shelf top from 2448 to 2480; retain the base at floor level. Push the saved geometry and recheck visual contact before accepting it.

Keep the final stand with shelf top Z 2480. The updated solo session passed floor-level opening from spawn and Hub return, Close, walking around the stand, and the adjacent Garden route. Placement readback and captures are in [stand evidence](evidence/journal-stand-2026-09-13.md). Broader presentation and release checks remain pending.
