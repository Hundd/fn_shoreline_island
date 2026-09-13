# Tidepool Nursery Implementation Plan

- Status: In progress; first Care challenge implementation.
- Specification: [spec.md](spec.md).

Use one reusable station implementation with authored challenge data. Inspect
the final Loop Lagoon station design before choosing ownership and board APIs.
Prefer four separate owned stations with independent physical props, provided
the measured memory and layout permit it. Do not assume per-player prop visibility.

Keep progression separate from execution. Represent Care as four commands and
the caller as calls, moves, or a bounded repeat. Expand the submitted program
into a bounded execution snapshot, showing both the call and the active internal
step. Evaluate transitions rather than comparing only an answer string.

Each planter progresses Empty -> Watered -> Planted -> Ready -> Harvested.
A command outside that transition order fails at its location. Move advances one
tile. Challenge three has three planter tiles and one exit; movement beyond
the exit or Care on the exit is invalid. Reset the demonstration before each run.

Use cancellation tokens for respawn, departure, disconnect, and round restart;
validate ownership before each animated step and reward. Award a personal,
nonpersistent Nursery Badge once. Add only verified native creative_prop targets
for runtime movement. Keep label and color cues together.

Build and test challenge one before implementing the other two. Then test
every authored wrong count, hints, input spam, replay, and lifecycle cancellation.
Expand station capacity after the solo mechanics pass. Record unavailable
multiplayer tests as pending. Validate and calculate memory before release.

All actor and asset changes go through UEFN. Exact APIs and device bindings must
be inspected at implementation time. Close Fortnite after test sessions.

## First implementation slice â€” 2026-09-12

Use the existing native button, billboard, creative_prop, HUD, spawner and
teleporter APIs inspected in Loop and Bot. Keep a shared per-player progress
device, with station-local attempt definitions and immutable execution frames.
This deliberately resets submitted programs on reclaim while retaining completed
challenges. Every animated step checks owner, generation and round generation.

First fixture: four commands encoded Water=0, Plant=1, Wait=2, Harvest=3;
initial definition [0,1,3,2], correct definition [0,1,2,3]. Each successful
command changes planter state by one. Error frames retain the failing slot,
command and prior planter state. One planter, one supplied Care call, no Move.
Later caller and repeat execution will be added after this fixture passes live.
Journal integration is deferred until its matching feature 003 update is made.

First station layout: center (-3500,-17000), floor center (-3500,-17150,2325), scale (34,37,1.5), top 2400; its north edge joins Bot at Y -15300. Nine controls run east to west from (-2780,-17700,2500), spaced 180, with labels behind/below. Objective/program boards sit at (-3050,-15750,2690) and (-4050,-15750,2690); execution at (-3500,-15750,2440). The planter sits at (-3500,-16500), with a separate robot at (-3300,-16700). This is a staged first-challenge layout; live readability and all final acceptance remain pending.

The first Care execution prerequisite passed solo: initial transition failure, corrected four-step execution, both hints, Replay and Hub. Continue with caller editing and Next/unlocks, then bounded repetition. Improve the planter/board sightlines as the row expands. See evidence/first-station-2026-09-12.md.

## Caller and repeat implementation — 2026-09-12

Expand each Care call into four immutable trace steps carrying caller slot,
repeat iteration, definition slot, robot tile and all three planter states.
Move is a separate trace instruction. Evaluate transitions against each bed;
never award by comparing the submitted answer string. Challenge 2 accepts three
Care/Move slots, initially Care/Care/Care; the only completing caller is
Care/Move/Care. Challenge 3 expands Repeat 1-4 [Care, Move], with three beds and
exit tile 3. Counts 1/2 leave unfinished beds, 4 fails at Care on the exit, and
3 completes. All bounds produce explicit safe errors.

Next after success advances the current challenge and resets its authored
program. Completed challenge flags remain per player; replaying the full set
retains the one badge. Reclaim restores the selected challenge at defaults.
Add three caller controls, Repeat and Next, making fourteen controls; reflow the
row to X -2330 through -4670 at Y -17700. Ownership distance is measured from
station center (-3500,-17000), so both ends stay inside the station radius.

Three plant props sit at X -3000/-3450/-3900, Y -16700. The robot moves along
matching cells at Y -17000 and reaches exit X -4350. Labels are farther south
at Y -16900, reducing overlap with the rear boards. Each board names its bed
and state; the exit is explicitly labeled. The compact definition and caller
share the program board. Exact count, completion flags and badge count appear
on the mission board, making progress retention reviewable during lifecycle tests.

The expanded-row visual check showed bed 1 outside the Run view. Revised bed X positions to -3250/-3700/-4150, Y -16300; robot starts (-3250,-16550); labels Y -16450 and Exit X -4600. Raised mission/program boards to Z2850 and execution to Z2560. These 11 transforms replace the prior row layout and require fresh visual acceptance.

2026-09-12 solo acceptance: all three core challenges passed on the expanded
station (Care wrong/correct and Next; caller Care/Care failure then Care/Move/Care;
Repeat 1/2/4 safe failure and 3 success). Badge became 1/1 only on full success,
remained 1/1 on another Run, and Hub return worked. See evidence/three-challenges-2026-09-12.md.
T-010 through T-012 are checked with evidence; remaining tasks stay open.
Feature 003 now specifies the pending Nursery tracker and eight-zone panel,
with Nursery recommended before Bot without a badge gate or change to the ending.
No journal implementation change was made in this revision.

Subsequent journal integration on 2026-09-12 appends Nursery's tracker while
preserving the five earlier references. A fresh continuous solo session passed
unearned journal, all three Nursery challenges, Hub return, exact earned 1/1,
and Close/reopen with unchanged other zone states. See
../003-living-academy/evidence/nursery-journal-2026-09-12.md.
Full-set Replay, six hints and remaining feature acceptance stay pending.

## Four-station capacity - 2026-09-12

T-030 / FR-007: after the three core challenges passed solo, expand from one
station to four. Keep shared progress and badge actors; create 42 independent
actors per additional station (37 devices and five geometry actors), for 170
Nursery actors total. Centers are X -3500, -6900, -10300 and -13700 at Y -17000.
Translate the verified first layout by -3400 X per station, retaining the floor
size and Bot join at Y -15300. IDs are 0 through 3. All 45 native references per
station must point to its local targets or the five shared hub devices; progress
must point to the existing Nursery progress device. Save and read back every
new actor, reference and full transform, including native placement rotations.

Solo acceptance before review: walk the lateral joins, claim all four, run a
copied demonstration, leave/reclaim and confirm current challenge defaults while
completed flags survive, and return to the hub. Two/four-player isolation remains
pending extra clients. Save audit and runtime evidence separately; construction
alone does not check off T-030. Existing label occlusion and route presentation
issues remain open, along with project validation and memory calculation.

Four-station construction and focused solo capacity checks passed. All 126 new
actors were saved and audited, along with 135 new native references and three
progress/ID pairs. Solo Station 4 wrong/correct Care, Next, four sequential
claims, all three lateral joins, Challenge 2 defaults with completed Challenge 1
retained across transfers, and Station 1 Hub return passed. See
evidence/four-stations-2026-09-12.md. Fortnite closed: zero clients, Disconnected.
T-030 remains pending actual multiplayer; active cancellation, later copied
challenge motion, six hints/full Replay, presentation and release gates remain.

## Control-view readability revision - 2026-09-12

NFR-001 / AC-008: the four-station test showed the mission board under the HUD
and the robot hiding planter state labels. Trial Station 1 first: lower mission
and program boards from Z2850 to Z2670, execution from Z2560 to Z2400, and bring
the four bed/exit labels forward from Y-16450 to Y-16900 at Z2420. Keep controls,
props and floors fixed. Save/read back exact transforms and inspect fresh idle,
claim and running views from controls before applying the same relative layout
to Stations 2-4. If text overlaps, revise the trial using captured evidence.
This is a presentation change; progression and fixtures remain unchanged.

The first fresh readability launch reproduced missing unchanged billboards.
After Claim only the changed mission appeared; after Run the changed execution
and planter text appeared. Repeating SetText/ShowText/UpdateDisplay with the same
text had not recovered static labels. Trial a Nursery-local display cache: keep
current text and intended visibility, and alternate an invisible trailing space
on the existing two-second refresh to force a changed replicated value. Refresh
must never restore hidden beds/exit or alter gameplay state. Verify fresh labels,
program, failed trace and current planter state; do not claim a global fix from
one zone. Inspect the revised layout once all necessary boards are visible.

Display cache revision SHA-256 085E5439067EA11D569199F3813EF0C58BF8CC89BE79AFB85BADB2586CBA869A builds cleanly. Focused Station 1 solo fresh display, complete Run view, failed trace persistence, editing, Care success, Challenge 2 defaults/two visible beds and Hub pass. This does not prove intermittent-load recovery; other zones were visible on that launch too. Side-control program/minimap clipping and plant/execution overlap remain. The seven trial transforms were copied to Stations 2-4 and all 21 readbacks matched; copied runtime views pending. See evidence/readability-2026-09-12.md. Fortnite closed with zero processes and Disconnected status.
