# Skills Lab replacement: Pix's Popcorn Parkour

Status: proposed for planning, 2026-10-04. Recommendation only; no gameplay edits or design approval.

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
