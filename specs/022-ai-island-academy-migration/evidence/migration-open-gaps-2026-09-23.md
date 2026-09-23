# Migration gap review — 2026-09-23

This is a source/editor inventory, not a project validation or playtest. It keeps the implementation plan's remaining scope visible while those checks are skipped at the owner's request.

| Plan requirement | Current evidence | Remaining work |
| --- | --- | --- |
| AI-themed hub, zones, journal, badges, Pix story, and labels | T-002 through T-006, the live label inventory/recheck, and saved Verse/actor evidence cover the identified presentation changes. | In-client readability and end-to-end behavior are not established. |
| Each completion visibly sends energy/data toward the central Core (section 78) | Seven first-module tracker events drive a player-local VFX; all eight drive a shared hub Core pulse. The live level contains these three VFX Creator actors, with no beam/data-path actor. | Implement a visible zone-to-Core connection without new progress state; T-020 / AC-023. The shared pulse alone is not a per-player status display. |
| Distinct short sounds for key AI actions (section 79) | The live level has exactly two Audio Players: one on seven module-restoration trackers and one on the Agent finale. | Add action-gated scan, classification, confidence, error, tool, and skill cues; T-021 / AC-024. Button-only bindings could play on invalid attempts and should not stand in for successful actions. |
| Safe retries, one-time rewards, solo and two-player independence (sections 94–95) | Source guards and per-player maps are documented under T-001–T-006. | Correct/wrong/retry/replay, badge, solo, and multiplayer behavior remain untested after recent edits. |
| Final celebration, memory, and performance (sections 95–96) | Personal finale UI and VFX/audio bindings are saved; the owner reported an earlier successful validation, memory calculation, and push. | The later actor/Verse changes are not covered by that earlier result. Re-run UEFN validation, memory calculation, and a full playthrough when verification resumes; T-007–T-013. |

The connected editor's VFX Creator property schema exposes sprite shape,
speed, spawn zone, and player/device start functions, but no destination or
beam endpoint property. Its `RemoveEffectFromPlayer` function says it moves an
effect to the device position; the schema does not establish a visible travel
animation. Do not label a static beam as module progress or assume that
function supplies the plan's zone-to-Core connection. T-020 needs a scoped
Niagara/Verse or device prototype and an in-client visibility check.

No acceptance task above is checked off by this review. The migration is not complete while the two explicit presentation gaps and runtime evidence remain open.

## Later same-day implementation update

The table above is the baseline at the time of this gap review, not the final
actor count. The journal now shows a first-award, player-local animated
module-to-Core UI data route alongside the saved Core pulse; see
`core-data-route-2026-09-23.md`. It is not a physical beam and still needs
an in-client visibility decision. Six separate action-specific Audio Players
and their 24 station references are now built, saved, and read back; see
`six-action-audio-binding-2026-09-23.md`. There are eight intended Audio
Players in total when the earlier module and finale cues are included.
T-020 and T-021 remain unchecked because the owner has deferred Play-in-Client
and project validation, and the broader end-to-end migration is not yet
verified.

## Live VFX Spawner endpoint probe

After the owner cleared the Save Content dialog, the connected editor remained
responsive and the latest recorded Verse build ended in `VerseBuild: SUCCESS`.
A temporary VFX Spawner V2 was placed solely to inspect its live property
schema. Its `LaserBeams` preset has no zone-to-Core endpoint setting. The
underlying Creative `NS_Laserbeams` Niagara system exposes color, environment,
spawn rate, and tempo controls, but no start/end location. The probe actor was
removed, and a live actor lookup returned no match for its label. No beam or
Niagara asset was saved as part of this probe.

The saved journal route remains the scoped implementation for AC-023. A
physical effect should not be added just to imply progress: it would need a
reliable completion-only trigger and visible travel toward the Core. Whether
the current route communicates that clearly still requires an in-client
decision; the owner has asked to skip that check for now.

## Capstone fidelity gap found in later source audit

The existing AI Agent Mission's three physical stages teach ordered seed
delivery, a repeated dock-light sequence, and conditional Apple/Car routing.
They cover several concepts in the plan's capstone acceptance list, but do
not implement the specific six-action Medical-crate Research Station story in
sections 57-63. A source-level human verification gate has now been added
before the Agent Badge; see `agent-mission-verification-gate-2026-09-23.md`.
The remaining crate identification, scanner information, blocked/open route
choice, and reusable delivery skill are tracked explicitly as AC-028/T-025.
Do not treat the current three-stage adaptation or the new Verify control as
proof that the full capstone story is present.

The subsequent final-stage source edit added an explicit destination scan
and Bridge/Dock choice before classification, using per-player attempt state
and the existing controls; see `agent-mission-scanner-route-2026-09-23.md`.
Medical-crate identification and a reusable delivery skill remain absent,
and the new scan/route flow is not runtime-verified.

## Medical-crate choice implementation update

The previous sentence is a historical snapshot. AC-030 now has a built Verse
choice/gate and four saved sets of visibly distinct Food, Medical, and
Mechanical crates. The Medical props retain their existing Verse bindings;
all 12 crates were saved and read back as non-colliding. See
`medical-crate-choice-2026-09-23.md`. The reusable delivery-skill interaction
and full six-action sequencing remain incomplete, and no new gameplay or
multiplayer acceptance is claimed while playtesting is skipped.

## Reusable skill source update

The final-stage Next control now offers a named DeliverPackage skill after
both item routes pass. The skill replays the existing Medical-crate delivery
fixture visibly, and Verify remains a separate badge gate; Verse built with
zero diagnostics. See `agent-mission-delivery-skill-2026-09-23.md`. The
in-client six-action flow, ordering/readability, and solo/multiplayer behavior
remain unverified, so AC-028/T-025 are not complete.

## Scanner navigation implementation update

The final-stage robot now starts at Home and requires a Move x2 plan before
the scan. Four saved SCANNER markers make the destination visible; Verse built
with zero diagnostics. See `agent-mission-scanner-navigation-2026-09-23.md`.
The plan's six actions are now represented in source/editor state, but their
in-client sequence and reset/multiplayer behavior have not been exercised.
The earlier three-stage training structure still wraps the capstone, so the
full plan narrative cannot be claimed complete from these readbacks alone.

## Dock-to-delivery source update

The prior reusable-skill note describes the gate as requiring both optional
item tests; that was the old source behavior. The capstone now offers
`DeliverPackage` immediately after Move x2, the destination scan, and the
open Dock choice. Apple/Car sorting remains optional practice and is no
longer a prerequisite to the skill or Verify. Bridge still produces a safe
retry, and only Verify calls the existing completion path. Verse built with
zero diagnostics; see `agent-mission-dock-delivery-gate-2026-09-23.md`.
In-client sequencing, readability, reset behavior, and reward persistence
remain open because playtesting was skipped.

## Scanner tool wording update

The capstone's player-facing `Launch`/`Dispatch` language has been changed to
`Scanner`/`destination marker`, matching the plan's gather-information step.
The underlying connection control and device bindings are unchanged. Four
saved Run billboards and four saved Run Button prompts were aligned to the
generic `Run agent plan` text in UEFN and read back after individual saves.
Verse built with zero diagnostics; see
`agent-mission-scanner-tool-wording-2026-09-23.md`. In-client tool clarity
and readability remain open while playtesting is skipped.

## Optional Discovery Trail example alignment

The Pattern and Classification field notes previously used shorter/different
examples than plan sections 68-69. Source and two saved signs now show
`1, 2, 1, 2, 1, ?` with `2` as the correct prediction and Banana with Food,
Animal, and Machine options. The third category is a new player-local UI
button, not a badge or required route. Verse built with zero diagnostics;
the signs were saved and read back in UEFN. See
`discovery-trail-plan-examples-2026-09-23.md`. Runtime UI layout and
two-player isolation are still unverified while playtesting is skipped.

## Fourth Discovery Trail station implementation

The plan's Human Decision note was previously reachable only through Check
Pix's `Next field note` UI. A separate Button and sign are now placed and
saved near the optional trail, with new Verse fields bound to the existing
player-local controller; the earlier link still works. Source built with
zero diagnostics, and actor text, transforms, and wrapper references were
read back. See `discovery-trail-human-station-2026-09-23.md`. In-client
visibility, walking clearance, and multiplayer independence remain open.

## Tool Lab request/tool conversion

The Tool Lab's retained Supply/Beacon-to-chute/lamp presentation did not
implement plan sections 42-45. Its three tool choices are now Scanner,
Speaker, and Light. Scan Object opens the existing crate/chute and reveals
Medical Supplies on the result board; Announce Result runs the player-local
Speaker audio and updates the result board; Light remains a safe wrong-tool
animation. The three-challenge progression and one-time Tracker guard are
unchanged. Four stations' saved labels, boards, and Button prompts were
reconciled in UEFN, then all 61 changed text properties read back with zero
mismatches. Verse built with zero diagnostics. See
`tool-lab-scanner-speaker-2026-09-23.md`. The physical clarity, sound timing,
and solo/multiplayer behavior remain unverified while playtesting is skipped.

## AI Skills Lab source comparison

The plan explicitly permits retaining the existing `Water, Plant, Wait,
Harvest` garden actions for the reusable AI skill. The four bound Skills Lab
stations had the three planned caller patterns and execution traces but used
the name Care rather than the plan's `GrowPlant`. That source comparison led
to AC-037/T-034: the player-facing name has now been aligned in Verse, saved
Billboards, Button prompts, and the Tracker description. See
`skills-lab-growplant-name-2026-09-23.md`. The same definition remains in the
fixture evaluator. Runtime visibility and behavior still require a human
playtest when checks resume.

## Agent definition and final recap

The Agent Mission source now presents the plan's simple agent definition on
all four unclaimed station boards. Both completion HUD variants recap all
seven lessons and the human-check reminder. Verse built with zero diagnostics,
and four saved board defaults were read back. See
`agent-mission-definition-finale-2026-09-23.md`. In-client readability and
the one-time completion/celebration path remain unverified.

## Optional Classifier mistake example

The plan's `Dolphin > FISH` mistake check is now a non-rewarding personal
question behind Help after the final Classifier badge. No required queue or
badge logic changed. Verse built with zero diagnostics after the source edit;
see `classifier-optional-dolphin-check-2026-09-23.md`. Its UI and
solo/multiplayer behavior are not runtime-verified.

## Error Lab planned examples

The first Error Lab challenge now names the scanner at tile 3, and the
second starts with Pix's Repeat-4 error so the uncorrected marker reaches
Station 4 rather than Station 3. The one-edit correction and rewards remain
unchanged. Verse built with zero diagnostics; see
`error-lab-scanner-overshoot-2026-09-23.md`. In-client overshoot clearance,
wrong/correct/retry, and two-player behavior remain unverified.

The four existing tile-3 Error Lab signs were subsequently relabeled
`SCANNER` in UEFN, saved, and read back; the marker endpoint now has a
matching static name. The in-client sightline remains unchecked.

## Pattern Scanner color prediction

The first Pattern Scanner challenge now begins with the plan's
Blue/Yellow/Green prediction before the retained Repeat-Move parcel task.
The correct Yellow answer explains the repeating pair; wrong answers retry
safely. Verse built with zero diagnostics and no actor asset changed. See
`pattern-scanner-color-prediction-2026-09-23.md`. In-client prompt clarity,
transition to robot play, replay, and multiplayer state remain unverified.

## Fix the Prompt cube order

The optional Fix the Prompt stations now use the planned blue data-cube
scanner scenario. A preparatory Find Cube step retains the four-slot swap
mechanic; swapping the initially inverted slots 3 and 4 yields Pick Up Cube,
Walk to Scanner, Scan Cube after it. All 16 saved stage signs now match that
order, and all 16 existing stage cubes use the Academy navy material. Actors
were saved and read back, the label inventory was updated, and Verse built
without diagnostics. See `fix-the-prompt-data-cube-2026-09-23.md`. In-client
stage visibility, retry, completion, and multiplayer behavior are deferred.

## Confidence Core cat-clue example

The first Confidence Core challenge now uses the planned CAT prediction at
40% and names pointed ears, whiskers, and tail as three successive +10%
clues leading to a 70%-or-higher threshold. Its existing controls, door, player state, and badge
guard remain in source, while challenge 2 retains 40%-to-100% and challenge 3
retains the +20% repeats. Verse built without diagnostics; see
`confidence-cat-clues-2026-09-23.md`. In-client readability and gameplay
acceptance remain deferred. The bound display presents CAT in text, and a
later editor pass added four non-colliding cat props behind the preview doors;
see `confidence-mystery-cat-2026-09-23.md`. Their in-client reveal remains
unverified.

## Classifier APPLE introduction

The first AI Classifier queue now contains only APPLE, matching the plan's
opening example. All three categories use the existing route animation and
correct/wrong feedback; the former Animal-only block and pre-revealed answer
were removed. Verse built without diagnostics. See
`classifier-apple-intro-2026-09-23.md`. In-client route, safe retry, and
progression remain deferred.

## Discovery Trail visual count

The optional Check Pix question no longer exposes the true crate count
before the choice. Four saved, non-colliding teal cubes now stand near its
field-note board, and the saved sign asks players to count them while Pix
predicts five. Verse built without diagnostics; see
`discovery-trail-count-crates-2026-09-23.md`. The row was subsequently moved
closer to the field-note button; an editor capture now shows all four cubes
from the approach, though two are shaded. In-client sightlines and retry
remain open.

## Delivered capstone scene follow-up

A later source audit found that the Agent Mission's post-skill board refresh
hid the delivered Medical crate and restored the optional classification
parcel before Verify. The final-stage refresh now keeps the Medical crate at
its delivered pose and reveals the Animal Research Station marker while
Verify is pending, including after release and reclaim. A late Run now
directs the player to Verify without replacing that scene. Verse built with
zero diagnostics; see `agent-mission-delivery-skill-2026-09-23.md`. Actual
in-client visibility, confirmation, and multiplayer isolation remain open.
Live reads of all four saved station layouts then showed the delivered pose
was 380 cm away from that marker in Y. The source now keeps the delivered
crate in its original lane, 180 cm from the marker; Verse built cleanly.
A separate source guard now skips delayed late-join label refresh during an
active Agent Mission run, preventing that refresh from hiding the moving
Medical crate mid-skill. Verse built without diagnostics; a two-player
join-during-skill check remains deferred.

## Label inventory source refresh

The label inventory's Verse section was refreshed from current source:
547/547 localized declarations now match path, line, field, and text. Its
732 saved-actor rows were preserved, not re-read in this pass. See the Verse
declaration refresh note in `label-recheck-2026-09-23.md`; in-client labels
remain unverified.

## Pattern Scanner replay-stage persistence

Pattern Scanner now persists the selected Replay-all stage in its existing
per-player progress object, so a leave/reclaim no longer reverts to the old
post-badge challenge value in source. Verse built without diagnostics;
runtime replay and two-player checks remain open under AC-004/T-004. See
`pattern-scanner-replay-stage-2026-09-23.md`. A cross-station source audit
found the other six claimed zones already store their selected Next/Replay
stage per player; see `replay-stage-source-audit-2026-09-23.md`. That is not
in-client resume evidence.

## Personal Core count on module route

The badge-completion data route now includes the earning player's read-only
`n/8 MODULES ONLINE` count from the journal, alongside its named source
module. Verse built without diagnostics; in-client timing/readability and
world-space progression remain open under AC-023/T-020. See
`core-data-route-count-2026-09-23.md`.

## Prompt Lab wrong-step feedback

Prompt Lab now gives step-specific wrong-command feedback instead of the
entire solution, without changing attempt reset or reward writes. Verse built
without diagnostics; interactive retry and multiplayer checks remain open
under AC-002/T-003. See `prompt-lab-wrong-step-feedback-2026-09-23.md`.

## Module data-route reset cleanup

The module-to-Core UI route now rejects stale queued starts across Round
Begin, invalidates its active frame loop on close, and prunes route maps on
departure. Verse built without diagnostics; runtime checks remain open under
AC-023/T-020. See `core-data-route-reset-2026-09-23.md`.

## Agent finale UI reset cleanup

The Agent finale canvas now closes on round reset, respawn, and departure;
its eight-second expiry is generation-guarded, and an asynchronous start
rejects a stale round token. The two token sources were read back to the
same Round Settings actor. Verse built without diagnostics.
Runtime cancellation and two-player checks remain open under AC-009/T-006;
see `agent-finale-ui-cancellation-2026-09-23.md`.

## Island time-limit audit

The loaded level and project Verse contain no authored combat or Timer
device path. The Island Settings actor stores a five-minute default value,
but its `roundTimeLimit_Override` is false and the owner confirmed the Time
Limit control is unchecked. An attempted write to the legacy `timeLimit`
field reverted on save; no active deadline is inferred from it. See
`noncombat-time-limit-audit-2026-09-23.md`; the actual solo/multiplayer
no-timeout playtest remains open under AC-048/T-045.
The sole placed Round Settings actor has no time-limit override property,
last-standing override, or saved End Round binding; the same evidence file
records its readback. This strengthens the editor audit but does not replace
the deferred no-timeout playtest.

## Capstone progressive-hint follow-up

The final-stage board and initial status no longer reveal `Move x2` or Dock
before the player has navigated and scanned. Help now progresses separately
for navigation, scanner connection, and route choice, with hint level reset
between those substeps. Verse built with zero diagnostics; see
`agent-mission-scanner-navigation-2026-09-23.md`. In-client readability and
hint sequencing remain deferred.
The immediate scanner result now asks the player to choose an open route
without naming Dock; worked Help and wrong-Bridge feedback remain explicit.
Verse built again with zero diagnostics.

## Optional capstone controls after delivery

The final-stage optional Apple/Car rule and cargo controls now redirect to
Verify when a completed DeliverPackage skill is awaiting confirmation. They
no longer clear the completed skill or alter the displayed cargo at that
point; pre-skill optional practice remains unchanged. Verse built with zero
diagnostics. See `agent-mission-post-skill-controls-2026-09-23.md`; in-client
button behavior and delivered-crate visibility remain deferred.

## Agent Mission prerequisite alignment

The journal READY display and all four mission claim gates now use the same
read-only check for the seven named prerequisite modules. This prevents a
seven-module total containing Agent Mode from satisfying the unlock rule in
an inconsistent saved state. Verse built with zero diagnostics; see
`agent-mission-prerequisite-gate-2026-09-23.md`. Runtime unlock, replay, and
two-player checks remain deferred.
