# Confidence Core: Reactor Rescue — revision 1

Replace the old Confidence Core stations with one continuous, cooperative reactor rescue. Escort the same core through a test rig, shoot machinery with the existing Data Blaster, discover that a confident prediction can be wrong, cool the core, and verify it before release. Target duration: 3–5 minutes on a first run, without a failure timer or combat enemies.

## Scope and decisions for review

The request names energy_0_floor through energy_4_floor. Live inspection instead found energy_0_floor and energy_station_2/3/4_floor: four actors, with the last at zero X scale. This proposal uses the existing Confidence Core footprint X=-13000..-1800, Y=-4100..-600, top Z=2400 cm. It divides it into five gameplay beats, not five invented floor actors. See plan.md for the overlapping support floor and 48 cm seam repair. No expansion into neighboring missions is proposed. The user explicitly confirmed: “Use the existing Confidence Core footprint and Pulse Rifle.” This resolves the equipment/site interpretation; it does not constitute approval of this concrete design.

Old Confidence Core station assets and the obstructing vault shell may be retired after reference reconciliation. Preserve shared progress, tracker identity, journal/finale, global equipment, hub destinations and neighboring missions. One team run replaces four independently owned stations. The current island and Verse remain unchanged during planning.

## Requirements

| ID | Testable requirement |
|---|---|
| FR-01 | Provide one continuous route with five beats: Briefing, Surface Scan, Independent Check, Cooling Bay, Release. The same recognizable core moves between them. Maintain a 3 m clear walking aisle, no mandatory jumps, and accessible return at every beat. |
| FR-02 | Reuse the existing rare Pulse Rifle, ammunition policy and respawn grant. Only enrolled players' weapon hits on active targets advance the mission. Wrong, inactive, spectator and repeated hits cannot skip stages. |
| FR-03 | Teach useful evidence versus irrelevant appearance, independent evidence versus a copied report, and confidence versus correctness. A contradictory internal-temperature result must overturn the initial SAFE prediction. The final release requires fresh tests after cooling. |
| FR-04 | Shooting visibly operates a scanner arm, core carriage, routing shutter, moving coolant control, cooling lift and release shutter. Each accepted action gives an immediate cue, with a visible result within 4 seconds except walking-paced core transport. |
| FR-05 | Use at least 75% eligible Fortnite props among visible non-device prop instances, excluding retained support floors. Use one industrial palette, restrained cyan/amber cues, warm lamps, readable local labels, and decorated edges. No floating wall of quiz boards. |
| FR-06 | A solo player can complete every action. One to four enrolled players share a run; late arrivals spectate until replay. Leavers/respawns lose membership; cancel when empty. Shared progress cannot award nonparticipants or duplicate badges. |
| FR-07 | Offer Pause Motion, Help and Repeat Result at each action bay. No speed-based learning penalty, lethal machinery, flashing strobe, color-only choice or required moving-platform riding. |
| FR-08 | Replay resets stage, targets, motion, readings and memberships, retaining earned badges for the round. Round reset clears progress via the existing manager. Generation cancellation prevents stale movement and rewards. |
| FR-09 | Retire old energy station subscriptions before enabling the replacement, preserve global dependencies and repair the local floor seam. Reconcile actual actor identities; never bulk-delete by label or overlapping bounds. |
| FR-10 | Build Verse, validate, cook and record solo plus two/four-player acceptance, screenshots and shutdown before declaring implementation complete. Offline review is design evidence only. |

## Acceptance scenarios

- AC-01 (FR-01,02): Given normal hub arrival or respawn, when entering the briefing, then exactly the existing blaster is available and a clear route leads through every beat without a fall, step trap or forced backtrack.
- AC-02 (FR-02,03): Given the question “Does this core need cooling?”, when shooting Paint Color or Fancy Casing, then explain why appearance does not measure temperature and keep the core in place. Surface Scan sweeps the scanner and reveals “Outside cool; inside not checked.”
- AC-03 (FR-03,04): Given Pix's authored “SAFE — 90% confidence” prediction and the outside reading, when choosing Copy Report or Count Likes, then neither adds independent evidence. Shooting Inside Probe lowers the probe and shows “INSIDE HOT — cooling needed.” The prediction changes to “SAFE? Doubtful — conflicting evidence.”
- AC-04 (FR-02,03): Given the hot inside result, when shooting SEND, then the shutter stays closed and the player can retry. HOLD routes the same core into the cooling bay. High confidence is explicitly explained as a prediction, not proof.
- AC-05 (FR-04,07): Given HOLD accepted, when shooting the slowly moving Coolant Valve, then the lift lowers, the fan turns and the core cools. Pause Motion freezes the matching visual/hit surface at its current pose with unchanged correctness; a solo player can finish while paused.
- AC-06 (FR-03,04): Given cooling has finished, when shooting RETEST, then two fresh named readings appear, outside cool and inside cool; neither old readings nor animation alone enables release. At Release, CHECKED RELEASE succeeds and SKIP CHECKS does not.
- AC-07 (FR-02,06): Given two/four enrolled players plus a late spectator, when simultaneous/held/spectator shots arrive during a transition, then exactly one action commits, no next stage auto-completes, and only continuous participants receive progress.
- AC-08 (FR-06,08): Given an active scan, transfer, cooling or reward, when all players leave, respawn, replay or a round resets, then old callbacks cannot move props or award. Replay restores home poses and full lesson order without duplicate badges.
- AC-09 (FR-01,05,07,09): Given a cooked scene, when walking the complete route and viewing from each firing spot, then labels remain readable, target sightlines and 3 m aisle are clear, native-prop proportion meets FR-05, floor seam is safe, and neighboring modules still work.
- AC-10 (FR-09,10): Given the replacement is wired, when building, validating, cooking and finishing playtests, then record actual outcomes and remaining warnings, preserve journal/finale completion, stop the game and verify non-running state while leaving UEFN open.

The 90% figure is an authored example, not a measured or calibrated model probability. More clues do not mechanically add confidence. A useful contradiction can lower confidence. This fictional reactor is an AI-literacy demonstration, not real reactor training.
