# One player restores Pix

Status: proposed for planning; not design approval or implementation.
Date: 2026-10-03.
Source request: “please suggest ways to transform island to only single player mode”.

## Recommendation

Make AI Island Academy a guided solo restoration adventure: one player helps Pix regain eight abilities, sees the academy recover, and uses those abilities in the final rescue. Keep the bright, non-combat experience for ages 8–10, experimentation, brief explanations and safe retries. Preserve the existing campus and working games. Prioritize a coherent start-to-finish journey over rebuilding every lab.

Compare three approaches:

| Approach | Benefit | Tradeoff | Decision |
| --- | --- | --- | --- |
| Enforce one player and remove obsolete multiplayer prompts | Establishes a clear admission rule with relatively limited scope | Does little for navigation, motivation or the ending | Necessary foundation |
| Guided solo adventure on the existing campus | Connects current games through Pix, recommended destinations and visible restoration | Requires progress/UI integration and an end-to-end playtest | Recommended |
| Rebuild as a strictly linear story campaign | Strong control over pacing | Higher provisional effort; new gates and geometry can reduce exploration and disrupt working content | Defer |

Effort comparisons are provisional until Planner inspection.

## Evidence and uncertainty

- [Current roadmap](../../plan.md) describes eight modules, individual rewards and a seven-module Agent prerequisite, but still mentions support for four players and contains area statuses superseded by later evidence.
- [Feature 033](../../specs/033-progress-and-navigation/spec.md) already proposes a unique eight-module count, recommended destinations, consistent Prompt Workshop onboarding, local steps and an 8/8 finale. It is a draft, not verified shipped navigation. Reuse it rather than create a competing progression system.
- [Confidence solo evidence](../../specs/030-confidence-reactor-rescue/evidence/solo-acceptance-status-2026-09-30.md) records owner-confirmed completion and Replay/Return behavior; wider lifecycle coverage is incomplete. This supersedes the roadmap's older unimplemented status for that area.
- [Error Lab evidence](../../specs/031-ai-error-lab-shoot-to-fix/evidence/real-rifle-acceptance-2026-10-02.md) records actual rifle completion but unresolved Return and subsequent visual verification. [Tool Lab evidence](../../specs/032-ai-tool-lab-dock-rescue/evidence/2026-10-02-verification.md) records solo entry and unresolved real-shot verification. These are release checks, not reasons to invent replacement mechanics.
- [Rescue QA](../../specs/034-ai-agent-rescue-run/evidence/qa-report.md) reports a one-player project/session capability and final clean production build/cook, but independent final gameplay acceptance remains open. Natural traversal, controls and lifecycle still need verification. This does not independently establish every published admission path or current live settings.
- [Hangar proposal](../../specs/035-hangar-launch-code/spec.md) is an optional, unapproved activity without a ninth badge. Keep it optional if later approved.
- [Journal source](../../Content/fn_shoreline_island_academy_journal.verse) already derives personal progress and recommendations. [Tool controller](../../Content/fn_shoreline_island_event_station.verse) retains owner identity and departure cleanup. [Bot controller](../../Content/fn_shoreline_island_bot_station.verse) contains both legacy Claim interactions and the newer rescue branch; source presence alone does not establish which legacy controls are reachable in the saved map.

This assessment uses repository source and recorded observations, not firsthand playtesting. Current native admission settings, actual traversal time, remaining legacy stations and cross-session save feasibility are unknown.

## Proposed scope and priorities

### 1. Establish the solo contract

Planner should verify and specify a maximum of one active player per island instance, including party and join-in-progress behavior, then identify any required native settings changes. Do not assume a solo test proves admission enforcement. A second person must never enter the same active playthrough; platform-supported rejection or separate-session behavior must be documented and tested. Avoid inventing exact setting names before inspection.

Present the island as a single-player adventure in its description and start cues. Replace player-facing Claim, occupied, wait-for-player and numbered duplicate-station instructions where they remain reachable. Entering the main activity should show its goal; retain an intentional Start where it helps the player prepare. Keep clear Replay and Return controls.

Preserve internal player attribution, cancellation generations and departure/respawn cleanup. They remain useful for one player; removing every player map or owner guard would introduce unnecessary risk. Inventory legacy copies before proposing removal; retire only redundant reachable gameplay and preserve structures, shared devices and accepted mechanics.

### 2. Connect the existing eight modules

Use feature 033 as the navigation foundation: one clear spawn instruction, `N/8 modules restored`, one next destination, and local step feedback while playing. Prompt Workshop is the recommended first stop; clearly label the older Prompt arena as an optional alternative for the same badge until a separate retirement decision is approved.

Recommend this order: Prompt → Pattern → Classifier → Confidence → Error → Tools → Skills → Agent. Preserve exploration among the first seven and the existing seven-module finale gate. Avoid adding seven new mandatory locks. Discovery Trail and a future Hangar game are optional breaks, never hidden prerequisites.

### 3. Make the player's work visible

Propose one readable hub Core with eight labelled segments that light as corresponding unique badges are earned. After each first completion, give a short Pix reaction and a next-destination cue. The final rescue then restores the full Core and leaves a clear completion state with Replay and Explore options. World feedback must derive from authoritative badge state and reset consistently; no credit from merely entering a room.

This is new proposed presentation scope, not an existing implementation claim. Start with the Core; defer widespread environmental transformations until their value is demonstrated. Keep text/symbol cues alongside color and avoid covering answer targets with HUD messages.

### 4. Make stopping and retrying predictable

For the initial conversion, preserve current-round earned badges through local Replay, Return and respawn. Reset only the active attempt according to its specified lifecycle; a new round starts fresh. Do not imply that leaving Fortnite saves a campaign.

Consider cross-session Continue as a separate follow-up if measured full-island play is too long for a comfortable sitting. It would need an explicit persistence contract, version migration, reset semantics and testing. Do not combine that additional risk with the first solo conversion.

### 5. Finish and verify the actual solo route

Resolve the recorded real-shot, Return/Replay, readability and rescue traversal gaps before declaring the solo adventure complete. Test the clean production island from normal spawn, acquiring every prerequisite through real play. Measure time, missed directions and repeated mistakes. Ask a first-time tester to explain one lesson and the final rescue's “check the result” idea in their own words. Treat this as qualitative evidence, not invented engagement metrics.

## Preserve and exclude

Preserve eight unique badges, no duplicate replay rewards, safe retries, large readable targets, non-combat Data Blaster framing, muted-audio usability, accessible returns, the shoreline campus, existing working bindings and Pix's fallibility. The player should experience an action and consequence before receiving its explanation.

Exclude new combat, competitive timers, leaderboards, extra required badges, a new AI service, wholesale controller rewrites, automatic publication, blanket deletion of legacy assets and cross-session saving from the first conversion. Do not implement the pending Hangar proposal merely because it appears in this brief.

## Candidate acceptance scenarios for Planner

- Given supported admission paths, when a second player attempts to join an active island instance, then that instance still contains only its original player, with the actual platform behavior recorded.
- Given a fresh round, when the player spawns, then the opening cue, hub guidance and journal agree on Prompt Workshop and 0/8.
- Given a reachable activity, when the player approaches, then its purpose and next action are clear without a station-ownership negotiation or another player.
- Given a first module completion, when feedback settles, then the badge, count, proposed Core segment and next destination agree; replay or the alternative Prompt activity adds no duplicate credit.
- Given a wrong answer, then feedback explains the mismatch and allows a safe retry without losing completed modules.
- Given earned modules, when the player returns, replays or respawns, then earned progress survives within the round and stale effects cannot advance a new attempt; a new round resets all related presentation consistently.
- Given six prerequisites, then Agent remains locked; given seven, it unlocks; given successful verified rescue, then the island reaches exactly 8/8 and offers Replay/Explore.
- Given a clean cooked build, when a solo tester follows the normal route, then every required activity and return is usable, without developer teleports or seeded badges; record comprehension, traversal, timing, validation and final non-running session evidence.

## Planner handoff

Prepare a numbered solo-conversion feature and reconcile its dependencies with draft 033 and the latest 028–035 evidence. Identify the exact admission state first; document whether this is a configuration change or confirmation of an existing limit. Inventory active controllers, reachable duplicates, spawn points, badge consumers and optional activities. Resolve the world-Core feedback mechanism and measured scene delta using existing patterns/devices where possible.

Retain historical multiplayer evidence. Explicitly supersede inapplicable future multiplayer acceptance requirements only within the approved solo scope; replace them with admission and solo lifecycle coverage rather than silently checking them off. Refresh roadmap status as part of that approved work.

Open feasibility questions: Which native settings actually enforce one-player admission across available launch paths? Which legacy controls are still reachable? Is Skills fully playable solo? How long does normal eight-module completion take? Can existing Core art support eight clear states? Are the recorded Tool/Return/rescue issues still reproducible on the current revision?

Generate a concrete offline preview and implementation plan, resolve blockers, and present them for human design approval under the existing workflow before gameplay changes. This brief grants no approval.

## Brief verification

Offline inspection only; no gameplay, Verse, assets or settings changed. Source and evidence paths were checked. Process inspection on 2026-10-03 found the UEFN editor and no Fortnite client process; no playtest was started by this task.
