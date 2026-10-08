# Skills Lab replacement: Pix's Popcorn Parkour

Status: feedback and learning enrichment proposed for planning, 2026-10-08. Source owner request: “playtest of Popcorn Parkour worked well”, add hit feedback “like pop sound and glowing halo”, and enrich each step with learning content; “Ask producer first, then planner.” Numbered specs remain authoritative. This brief is a proposal, not design approval or implementation.

## Current proposal — clear hits and learn-by-doing

**Owner-reported observation:** the current Popcorn Parkour playtest worked well. The owner identifies insufficient hit response and learning content. This updates the earlier status audit's absence of a reported current playthrough; it does not establish independent exhaustive acceptance, fault coverage or child comprehension. The recommendation is focused presentation enrichment of the working game, with the mirrored route and feature 040 behavior preserved.

Player promise: **“I see that my shot worked, see what Pix did, and understand why one saved skill can make many bridges.”** For ages 8–10, teach that an instruction is one action, order matters, a named skill groups instructions, and using the same skill at a new machine repeats those actions. Jumping lets the player use and check the physical result. This is a scripted routine, not live AI learning or generalization.

### Hit response

Give each accepted teaching or PopBridge invocation shot a short, playful pop/click sound and a clearly visible glowing halo at the struck receiver. An immediate small response means **shot accepted**; a bigger existing popcorn/flourish response at actual commit means **platform created**. Never imply the platform exists or the finale succeeded before the current execution/arrival guards permit it. A short hit pulse should read distinctly from the persistent NEXT/selectable cues.

Keep full used-machine disappearance from 040. The halo is a brief cosmetic response at the last machine position, not a retained ring or target: fade it without keeping any machine component, hit surface or instructions selectable. Avoid bright full-screen flashes, occluding solid fills or effects over the next jump. Proposed perceptual targets for planning: onset within about 0.15 seconds of an accepted callback and halo lasting roughly 0.4–0.6 seconds, independent of gameplay timing. These are unverified targets, not measurements or authority to slow execution. The 250 ms teaching beats and current sequence/commit cadence stay unchanged.

Wrong-order shots retain the existing tiny puff and useful NEXT cue; use a softer “pfft”/brief dashed ripple if feasible so a registered wrong shot is acknowledged without the successful halo/sound. Too-early or wrong-position shots explain the next usable action without success feedback; blocked/stale/foreign shots must not create celebratory effects. Repeated/held input must not stack loud pops, extend effects indefinitely or award progress. Sound is supplementary: pulse shape/animation and short text must communicate the same event with audio muted, independent of color alone.

### Learning content tied to actual actions

Use one short, legible contextual sentence at a time, with action/next-target guidance taking precedence. Keep the PopBridge recipe available as a stable recap. Avoid a new panel, quiz, mandatory reading pause or paragraphs on target labels. Candidate copy and trigger intent:

| Actual stage | Candidate brief learning cue | Observable connection |
| --- | --- | --- |
| Entry / before LOAD | “A skill is a few steps you can use again. Build PopBridge!” | Three named actions visible; player can start immediately. |
| Accepted LOAD | “LOAD puts in a kernel. One instruction, one action.” | Kernel/load mechanism acts; prefix becomes 1/3. |
| Accepted HEAT | “HEAT warms the kernel. Steps work in order.” | Heat mechanism acts after loading; prefix becomes 2/3. |
| Early HEAT/POP | “A kernel needs LOAD, then HEAT, then POP. Next: LOAD.” | Adapt NEXT to actual prefix; successful work stays. Do not use this fixed NEXT string when LOAD is already complete. |
| Teaching POP committed | “Saved! PopBridge = LOAD → HEAT → POP.” | First platform appears only on commit; recipe remains available after the machine hides. |
| First actual jump/landing | “You used the popcorn you made. Shoot PopBridge to make the next one.” | Learning references the real landing, not a predicted jump or fixture success. |
| First reuse / three execution beats | “One shot runs all three saved steps.” | Existing ribbon highlights LOAD, HEAT, POP while mechanisms execute; do not ask the player to reconstruct the recipe. |
| Later reuse / fork | “Same skill, new machine. Pick either popcorn path!” | Both branches remain equally valid and repeat the same routine; branch choice does not teach a false correct/wrong distinction. |
| Miss and recovery | “Missed the jump? Your skill and bridges are safe. Try again.” | Existing safe recovery keeps learned prefix and platforms; no extra lesson penalty. |
| Final actual commit | “One skill. Many bridges! You saved three steps and reused them.” | Basket overflow and existing once-only Skills reward; Replay/Return/free jumping remain usable. |

Every teaching step gains its own explanation; later jumps reinforce creation, checking the result and reuse without presenting a fresh unrelated AI fact on every landing. On reuse, the rapid three beats are demonstrative labels, not the sole place to read new prose. Hold or retain the current stage's short takeaway at a safe standing view until superseded by the next meaningful event; retry/action cues may temporarily override it. A brief recipe recap must remain readable after machines disappear. Planner resolves display placement, pacing and priority arbitration against HUD/journal messages; do not rely solely on 250 ms captions, tiny world text or speech.

### Scope, priority and evidence

Prioritize accepted-hit acknowledgement and the teach-once/first-reuse explanations together: responsive play makes the causal lesson visible. Then add later-reuse, recovery and finale reinforcement. Preserve course layout/jump gaps, mirrored entrance-to-deep flow, LOAD/HEAT/POP rules, 040 spacing/full-machine hiding/free movement after finish, checkpoint safeguards, one badge per round, Core/journal/Agent authority, solo settings, Replay and both Returns. Exclude new jumps, answer banks, timers, new badges, narrated lectures, live AI claims and other island changes. Defer voiceover and decorative effect proliferation; their cost and cognitive load exceed the current need.

Source supports reuse opportunities rather than proving assets are configured: [controller](../../Content/fn_shoreline_island_popbridge_controller.verse) already separates accepted shots, teaching animation, wrong puff, committed execution, ribbon and recovery messages; [production profile](../../Content/fn_shoreline_island_popbridge_production.verse) binds instruction/puff/flourish VFX and hides mechanisms through machine_used. [Shared target](../../Content/fn_shoreline_island_data_target.verse) exposes hit_flash/hit_sound/wrong_sound, but deactivation ends target VFX; immediate hide may truncate a new halo. Planner must inspect actual bindings/assets and cancellation behavior before choosing reuse or a separate short-lived cosmetic effect. Limit shared-adapter changes to opt-in Popcorn behavior. [039 requirements](../../specs/039-popcorn-parkour/spec.md) R02/R03/R06/R10 and [040 requirements](../../specs/040-popcorn-spacing-and-finish/spec.md) define the behavior to preserve.

### Success criteria and Planner handoff

- Given an accepted real teaching/reuse/finale shot, the player hears the brief response (when unmuted) and sees an unambiguous pulse at the correct receiver; actual outcome feedback waits for commit. Halo remains visible long enough to perceive despite machine disappearance, then clears completely.
- Given wrong-order, repeated, wrong-position or stale shots, no false success, new platform or duplicate reward appears; wrong-order feedback identifies the next instruction and retained work.
- Given muted audio, each LOAD/HEAT/POP action, saved recipe, first reuse, branch choice, safe retry and final takeaway remains readable from the actual standing view. Feedback does not obscure aiming or jump landings.
- Given first use without coaching, the player can explain that PopBridge contains LOAD/HEAT/POP and a later shot runs that same sequence elsewhere. Record explanation/confusion/enjoyment qualitatively; completion alone is not a learning pass.
- Given both branches, earned Replay, Return, finished free jumping or round reset, learning copy/effects reset or stop with the existing attempt and reward authority; no old halo, queued sound or misleading saved-skill message leaks into a fresh attempt.

Planner should create the next numbered presentation-enrichment bundle rather than overwrite approved 039/040 history; inspect supported pop audio/halo assets, current sightlines and actual target feedback lifecycle under Supervisor ownership. Live Unreal tools are unavailable in this conversation, so saved source/readbacks support drafting while exact sound/halo availability and settings must remain explicit feasibility gaps. Resolve placement, message arbitration, sound attenuation/volume, effective onset/visibility, reset/cancellation and muted readability. Effort is provisionally modest-to-moderate, dependent on whether existing assets can survive target hide with an independent cosmetic lifecycle. Present concrete preview/plan for explicit human approval before mutations. The owner requested Producer then Planner; this brief authorizes planning only. Earlier 040's no-testing instruction remains a historical delivery constraint; specify prospective focused verification clearly in the new review and do not launch QA as part of this proposal.

## Current checkpoint and finish-first handoff — 2026-10-08

We left off polishing **Pix's Popcorn Parkour**, after replacing the old primary Skills Lab. The latest saved change is feature 040, not the older October 5 roadmap summary. There is no evidence that a new game is needed before finishing acceptance of the existing island.

| Scope | Implemented / observed | Still unfinished |
| --- | --- | --- |
| Popcorn 039 | Permanent shooting-and-jumping game, both branches, safe recovery and module-7 integration. Earlier independent QA physically completed left → earned Replay → right → owned finish Return with Core staying 1/8. Later October 5 work mirrored 188 course actors, changed facing/direction and added a balloon-hide fix; compile and runtime fixture result 0 are recorded. | Earlier branch/Return QA predates the mirrored layout and later visibility changes. Interactive shoot/jump/branch/finish and separate Project Validate for the mirrored revision remain recorded as pending. See [039 tasks](../../specs/039-popcorn-parkour/tasks.md), [earned-cycle QA](../../specs/039-popcorn-parkour/evidence/legacy-button-cleanup-qa.md). |
| Latest Popcorn 040 | Outer teaching machines moved 40 cm outward each: centers 1.6 m apart, with 20 cm gaps. Successful machines fully hide; completed players can jump/drop without checkpoint teleport. Verse compiled, transforms read back, actors saved. Eight logic devices were organized and hidden in the editor only. | Runtime machine disappearance, wrong-shot visibility, Replay restoration and free jumping remain unverified. The owner explicitly approved **no tests, validation, cook or gameplay session** for this delivery; do not start these automatically on this status request. See [040 implementation](../../specs/040-popcorn-spacing-and-finish/evidence/implementation.md), [approval](../../specs/040-popcorn-spacing-and-finish/approval.yaml), [editor organization](../../specs/040-popcorn-spacing-and-finish/evidence/editor-logic-cleanup.md). |
| Shared journey 033/037 | Personal HUD/journal, numbered 1–8/HUB markers, eight Core panels, solo caps and consistent optional Prompt copy saved. Independent fresh spawn, map readability and real desktop journal open/close pass. | Normal eight-module journey, earned Core/light transitions, full reset/respawn, Agent unlock at seven and finale at eight, compact/controller layout and actual second-account admission are incomplete. Description metadata write was rejected/unsupported and remains a delivery item. [033 QA](../../specs/033-progress-and-navigation/evidence/qa-report.md), [037 tasks](../../specs/037-single-player-academy/tasks.md). |
| Agent Rescue 034 | Scene/controller saved, production fixtures removed, final build/validation/cook recorded. Controlled fixture evidence demonstrates medical delivery and physical verification. | Final clean-source natural walking, seven normally earned prerequisites, final lab-label view, physical Replay/Return and cancellation are unverified. Earlier E/prompt anomaly is unresolved evidence, not a proven device defect. [034 QA](../../specs/034-ai-agent-rescue-run/evidence/qa-report.md). |
| Hangar 036 | Teach Pix a Route implemented; buttons/labels repaired. Agent implementation closed at owner's “Finish task, I'll verify manually.” | Owner manual routes, old-route closure failure, both bypasses, unsafe route/retry/cancellation/isolation and separate Project Validate remain handed off, not passed. [Manual handoff](../../specs/036-teach-pix-a-route/evidence/manual-verification-handoff.md). |

### Recommended order

1. **Close the latest Popcorn revision first, when the owner resumes testing.** Verify normal arrival at the mirrored starter, LOAD → HEAT → POP, wrong-order safe retry, successful full-machine hiding, both five-jump branches, post-finish free movement, earned Replay restoration and both entry/finish Return. Keep the lesson visible: several instructions become one reusable PopBridge skill. The immediate risk is presentation/recovery regression from recent edits, not lack of content. Respect 040's explicit testing omission until testing is requested again.
2. **Finish the normal Academy journey and Agent finale.** Earn seven modules through ordinary play, confirm HUD/journal/Core agreement and seven-module unlock, then walk the clean Rescue chain through medical delivery/physical check to 8/8. Resolve the Replay/Return observation if it reproduces; check final lab-label framing and a fresh-round reset. This has the greatest release reach and closes the main story.
3. **Complete bounded residual checks in existing activities.** Confidence 030 is implemented and owner-playtested (the roadmap's “unapproved/unimplemented” line is stale). Error 031 has actual correction/badge evidence and later original Return success; Tools 032's former missed-shot/movement failures were later repaired and real Scanner/Speaker/Light completion with HUD 1/8 recorded under 033. Focus on remaining wrong/held-fire/reentry/reset/consumer/readability cases rather than repeating historical fixes. Prompt Workshop 027 reconciliation/readability and retired-bay 038 remaining Returns/restart/regression checks also stay open. [030 acceptance](../../specs/030-confidence-reactor-rescue/evidence/solo-acceptance-status-2026-09-30.md), [031 acceptance](../../specs/031-ai-error-lab-shoot-to-fix/evidence/real-rifle-acceptance-2026-10-02.md), [later Tool/Error evidence](../../specs/033-progress-and-navigation/evidence/supervisor.md), [027 tasks](../../specs/027-prompt-workshop-redesign/tasks.md), [038 tasks](../../specs/038-retired-control-presentation/tasks.md).
4. **Finish optional owner verification and release gates.** Complete 036's existing manual handoff, optional Discovery Trail and optional Prompt-role clarity; record first-use learning/enjoyment observations, solo admission checks with a second account when available, final project validation and memory calculation after asset changes, and a supported island description. Scope multiplayer requirements against current solo 037 rather than resurrecting historical cooperative tasks. [Roadmap delivery gates](../../plan.md), [022 tasks](../../specs/022-ai-island-academy-migration/tasks.md).

### Scope, preservation and Planner decisions

Affected areas are Skills/module 7, the hub/Core/journal and the eight-module route, Rescue, and optional hangar. Preserve the current shooting/jumping game, once-per-round badges, safe retries, solo caps, useful Replay/Return and optional content. No extra module, blanket button replacement or island redesign is recommended. Pattern 028 and Classifier 029 are owner-closed; their unperformed detailed checks are optional follow-ups, not reopened implementation goals ([028 tasks](../../specs/028-pattern-scanner-cargo-circuit/tasks.md), [029 tasks](../../specs/029-classifier-cargo-rescue/tasks.md)). Hangar Launch Code 035 is an unapproved historical alternative; 036 implements the selected route demonstration. The GrowPlant/Bloom Crew recommendation in the older cleanup brief is superseded by the owner's Popcorn direction.

Planner should reconcile stale headings/roadmap wording and map each remaining acceptance case to the current numbered revision before workers execute it. Specifically, plan.md still describes 030 as unapproved/unimplemented despite owner-playtested implementation, and 040 spec.md still says awaiting review despite recorded approval and implementation. This audit flags those inconsistencies without altering the source files. Feasibility and repair scope remain provisional until current editor inspection. Material layout or behavior changes need a fresh concrete review; this status brief grants none. Do not check off historical broad task rows solely because their replacement controller exists.

Observable completion: the current saved revision demonstrates the intended actions and consequences; normal play can restore all eight unique modules once; Replay and Return preserve earned state; a new round clears it; no stale action awards progress; muted presentation remains understandable; owner first-use observations explain the reused-skill lesson and record confusion/enjoyment. Fault/threshold coverage (every-gap crouch, failed teleport, departure/removal/round cancellation), Agent/journal isolation and human learning evidence remain explicit gaps in 039.

Unknowns: no fresh editor inventory or playtest was performed in this audit; whether the owner manually verified 036 or played 040 after delivery is unrecorded. Supervisor owns current editor/session health. Historical latest 040 cleanup records Unconnected; this is not a fresh live-state claim.

## Historical initial proposal — 2026-10-04

Owner direction: the old Skills Lab has too many buttons and is not fun. The owner rejected Bloom Crew and specifically requested **“something funny with gun and jumps.”** This supersedes the gardening proposal.

## Recommended game

**Shoot popcorn machines. Make ridiculous giant popcorn. Jump across the popcorn you created.**

Pix has accidentally turned the lab into a popcorn factory. Their first attempt produces one tiny kernel: “That bridge is a bit small.” The player teaches Pix a reusable **PopBridge** skill. Then every skill shot makes an enormous popcorn stepping stone, with a silly pop, wobble and shower of harmless confetti. Build your own short jumping route to Pix's snack basket.

The gun changes the traversable world; jumping lets you use that change and reach the next machine. The central toy is shooting something into existence, landing on it and seeing what you can create next. No answer-category banks or console editor.

### Concrete loop

1. **Teach it once.** From a broad starter ledge, fire at three large physical machine mechanisms: load a kernel, heat it, release the pop. Each shot visibly performs that action and records its icon in a PopBridge ribbon. Short machine-state cues explain the order. An early release gives a tiny silly puff and keeps the successful prefix; retry immediately. The finished routine creates the first giant popcorn platform. Jump onto it.
2. **Fire the saved skill.** The next machine has one large PopBridge receiver. Shoot it once: Pix executes the same saved Load → Heat → Pop routine, highlighting each ribbon icon while the mechanisms move. Another huge kernel appears and settles as a solid landing platform. Jump across. You never reconstruct the three instructions on later machines.
3. **Choose your jumping route.** From successive broad popcorn landings, shoot reachable machines to create the next foothold. Two short valid branches offer player choice and different comic payoffs: a giant popcorn moustache beside Pix or an overflowing snack bucket. Both branches use the same skill. No hidden preferred route, compulsory midair precision shot or timed disappearing platforms. Landings hold still after their brief visual wobble.
4. **Big finish.** Reach the final ledge, fire PopBridge at the oversized final machine and watch the basket comically overflow. Earn the existing Skills Badge once. Pix: “One skill. Lots of popcorn!” A brief ribbon recap keeps the actual three-step routine visible.

Missing a jump returns you quickly to the last completed landing; built platforms remain. No damage, elimination, lost rewards or countdown. Replay can try the other branch. First-run target: approximately 2–3 minutes, unmeasured. Keep gun fire, jump and movement as the main inputs, with obvious Return/Replay.

## Learning and scope

For ages 8–10, teach **a named skill is several instructions packaged for reuse**. A shot chooses where Pix applies PopBridge; the saved instructions still execute every time. This is scripted skill execution, not live AI training. The machine needs a kernel: firing at an exhausted/completed machine gives a harmless response, showing the skill has a context.

Replace only primary Skills gameplay. Preserve module 7, badge/Core/HUD integration, Agent prerequisites, solo settings, safe ammunition/loadout, cancellation and round reset. Duplicate bays stay retired. Three milestones can map to teach, first reuse and final course completion; exact mapping belongs to planning.

## Alternatives

- **Bubble Bridge Blaster:** shoot saved InflateBridge into bubble machines, then jump their solid bubble platforms. Same learning loop; simpler visual fallback if giant popcorn assets are impractical.
- **Pix's Stunt School:** teach a robot Shoot–Jump–Land, then call that trick repeatedly while racing alongside. Strong physical comedy, but faithful robot jumping/playback is a larger unverified dependency.

## Evidence and feasibility

[Current Skills source](../../Content/fn_shoreline_island_nursery_station.verse) supports the owner's complexity complaint with 15 controls; [038](../../specs/038-retired-control-presentation/spec.md) explicitly preserves that primary game. [Nursery fixtures](../../Content/fn_shoreline_island_nursery_fixtures.verse) offer ordered execution concepts; [damage targets](../../Content/fn_shoreline_island_data_target.verse) preserve the firing agent. Neither implements PopBridge or parkour. [Roadmap](../../plan.md) confirms forgiving solo Academy direction. No firsthand playtest is claimed.

Planner must verify space, jump distances, collision/landing stability, shot sightlines, popcorn assets/effects, checkpoint recovery and a reusable sequence adapter. If the primary bay cannot fit a short forgiving course, return the location decision before expanding scope.

Success: first-time children discover shoot/create/jump without coaching, enjoy the comic reactions, reuse the saved routine without re-entering its steps, explain the skill lesson, and recover from missed shots/jumps immediately. Verify both branches, muted audio, real gun hits, controller jumping, actual final arrival, single reward and replay/reset behavior in a cooked game. Enjoyment and feasibility remain hypotheses until tested.
