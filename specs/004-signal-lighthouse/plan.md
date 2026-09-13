# Signal Lighthouse Implementation Plan

## Cargo symbol completion

Use authored leaf and gear textures on the moving boat, selected with the current
cargo. PLAIN remains unmarked. Keep written labels and rule legends so recognizing
a symbol is never required to solve a queue. Generate queue labels from the same
cargo-name function as the moving label. A launched test showed the leaf Unicode
glyph as a replacement character; font glyphs are unsuitable here. Restore the
12-point cargo label after 24-point text clipped. Verify the texture materials
and cargo changes in Fortnite before claiming symbol acceptance.

- Status: Approved
- Specification: [spec.md](spec.md)

## Approach

Build a coastal lighthouse landmark, three labeled destination docks, and an owned preview station with a movable boat and cargo sign. Separate cargo classification from presentation. Use authored queues and rule choices, agent-targeted feedback, and cancellation-safe execution. Define exact queues and distractor mappings before coding; retain them in this plan.

## Authored fixtures and interactions

Cargo IDs are Leaf=0, Gear=1, Plain=2; destinations are Garden=0,
Workshop=1, Storage=2. Words remain visible alongside any decorative symbols.

| Challenge | Visible queue, front first | Player action | Correct destinations |
| --- | --- | --- | --- |
| 1: Garden supplies | Leaf, Plain | Choose Garden or Storage for each boat; Workshop gives an explanatory unavailable message | Garden, Storage |
| 2: Workshop supplies | Gear, Plain, Leaf | Choose one of three destinations for each boat | Workshop, Storage, Garden |
| 3: Harbor rule | Plain, Leaf, Gear, Leaf | Select A/B/C, then Run rule for the entire queue | Storage, Garden, Workshop, Garden |

Rule A maps Leaf to Garden, Gear to Workshop, otherwise Storage (correct).
Rule B maps Leaf to Storage, Gear to Workshop, otherwise Garden; it fails on
the first Plain boat. Rule C maps Leaf to Garden, Gear to Garden, otherwise
Storage; it passes the first two boats and fails on the third Gear boat. Every failed boat still travels
to the selected dock before the mismatch is explained. Correct manual deliveries
advance one queue position; a wrong manual choice retries the same boat. A final
rule attempt always restarts at the front; it stops at its first mismatch.

Next advances only after the current queue is solved. On challenge 3 it starts
an optional replay at challenge 1. A separate Replay control cancels execution
and restarts the current queue, resetting hints while preserving completed work
and any badge. Help first explains checking the cargo label, then provides the
current destination (manual challenges) or Rule A's full mapping (final challenge).
Completion states explicitly: a condition is a check that chooses what happens.

Use a shared per-player progress device and four owned stations. Persist current
challenge, queue position, selected rule, hint level, solved state, and completed
challenge flags in that player's round state. Reward requires all three flags;
tracker sharing must be Individual and persistence disabled. Station release
cancels animation with station and round generation tokens; interrupted boats
retry without credit. Respawn and leaving the station preserve completed work.

Tracker readback left both `resetBetweenRounds` and `reset on First Spawn` false
after configuring the latter false. Keep native reset disabled and let the
progress device's RoundBegin handler explicitly reset each player's tracker and
state. Runtime respawn and round-reset acceptance must verify this behavior.

One boat prop moves through short interpolated transforms, checking cancellation
before every movement and before granting credit. Dock marker transforms define
destinations. A cargo billboard names the current boat, a queue board shows the
whole authored queue and current position, and a rule board shows every mapping.
Controls are Claim, Garden, Workshop, Storage, Rule, Run, Help, Next, Replay, Hub.
All controls must fit within the station ownership radius. Build and test one
station before duplicating its complete, verified binding set for four players.

First harbor layout: floor centered at (-3200,1050,2325), size 2800 by 3300,
top Z=2400. A 700 by 3000 connector centered at (-1450,900,2350) joins its east
edge to the existing hub. The first solo approach exposed a gap beside the
initial 600-wide connector; the widened version covers the hub-facing edge.
Ten controls run from X=-2390 to -4010 in 180-unit
steps at Y=700, Z=2500, facing the southern approach. Station ownership is
measured within 1400 units of the hidden controller at (-3200,900,2450).
The boat starts at (-3200,1250,2460); Garden/Workshop/Storage docks sit at
X=-3900/-3200/-2500, Y=2100, Z=2460. A lighthouse tower occupies the northwest
corner. These are graybox transforms, subject to the first walking/camera test.

First routing review: moor boats 300 units in front of each dock instead of
inside the dock marker. Raise the moving cargo label to Z=2670 at home so it
clears the destination labels. Manual challenge boards omit the inactive rule
selection; only challenge 3 displays its selected A/B/C rule.

After the first harbor's three-queue solo review, duplicate its 35 station-owned
actors westward by 2800, 5600 and 8400 units. Harbor centers are X=-3200, -6000,
-8800 and -11600; the 2800-wide floors meet edge to edge along the front walking
route. Retain one progress device, one Signal tracker and the original hub
connector/route sign. Assign station IDs 0-3 and rebind every local native device
explicitly; the four hub spawners and hub destination remain shared. Audit all
23 native bindings, shared progress, full transforms and saves for each copy.

## Implementation checkpoint: 2026-09-12

Author the fixtures, personal progression, and station execution first, then
build through UEFN. Compilation alone is not placement or acceptance evidence.
The existing repair and journal graybox review is recorded in feature 003;
their remaining lifecycle, presentation, and multiplayer checks stay open.

## Delivery and verification

Implement this zone after the preceding zone's graybox and gameplay review.
Use the existing map, named routes, and one responsibility per Verse class.
Save before and after editor changes. Verify device references by readback.
Run every acceptance scenario in a launched session, including wrong inputs,
rapid presses, hints, repeat completion, departure during execution, respawn,
join-in-progress, and round restart. Recheck hub spawn and the existing garden.
Record actual multiplayer evidence separately from code inspection. Run project
validation and memory calculation; capture the visible zone and completion.
