# Fortnite campus building assets — Producer brief

Status: Proposed for planning; no map changes or design approval.
Date: 2026-10-08
Source request: Owner reports that floors and buildings use primitive assets with single-color paint and asks for impressive Fortnite building blocks to improve the player experience.

## Player opportunity and evidence

Recommend a cohesive Fortnite modular architecture pass: make the Academy feel like a place players want to explore, while keeping its learning actions easy to read. Architecture should communicate a welcoming shoreline campus with distinct labs, rather than relying on painted blocks to carry the whole setting.

The visual complaint is **owner feedback**, not a new firsthand inspection. The hypothesis is that recognizable architecture, material texture, depth and a few memorable landmarks will improve interest and orientation. Enjoyment and wayfinding improvement need player evidence; asset count alone is not success.

- [Roadmap](../../plan.md): preserve AI Island Academy, Pix, bright non-combat play for ages 8–10, short visual lessons, immediate retries and one-time current-round badges. Its Oct 5 checkpoint is older than feature 044.
- [Migration plan](../../specs/022-ai-island-academy-migration/plan.md): existing presentation deliberately reused primitive components and Academy materials. This supports an art-pass opportunity, but does not establish every current building's mesh or appearance.
- [Remaining-area review](../remaining-area-review-2026-09-29.md): scenery includes gameplay evidence such as robot paths, expected-result markers, planter states and delivery destinations. Inspect ownership before replacing or removing it; shared supports can span zones.
- [PopBridge production source](../../Content/fn_shoreline_island_popbridge_production.verse) and [039 collision assessment](../../specs/039-popcorn-parkour/evidence/r04-production-collision-assessment.md): course geometry, landing footprints and shot/landing relationships are gameplay contracts. The [harness placement review](../../specs/039-popcorn-parkour/evidence/harness-placement-review.md) records a real solid canopy cube obstructing candidate geometry. Attractive replacement meshes can introduce collision regressions.
- [039 final startability retest](../../specs/039-popcorn-parkour/evidence/startability-final-retest-2026-10-05.md): readable LOAD/ramp feedback and unchanged Core state are affected-case cooked evidence. Preserve these cues; this does not establish whole-island or child enjoyment acceptance.
- [044 implementation](../../specs/044-hub-pix-mission-travel/evidence/implementation.md), [tasks](../../specs/044-hub-pix-mission-travel/tasks.md) and [travel source](../../Content/fn_shoreline_island_pix_travel.verse): Pix and eight entrance destinations are implemented/saved; Agent independence supersedes the earlier seven-badge prerequisite. Owner runtime/project acceptance and latest input fixes remain pending. Preserve the actual current guide, arrival anchors, UI and mission lifecycle rather than reverting to an old roadmap state.

## Recommended direction and priority

Choose one compatible Fortnite building family as the campus foundation: modular floors, walls, openings, roofs, columns, stairs and edge trims. Prefer a clean, playful research-campus character that fits the shoreline. Use warm textured paving and restrained structural materials, with Academy teal/navy/gold accents and a small distinctive accent at each lab. This is an art direction, not a verified catalog selection; Planner must compare available kits in the installed editor.

Start with **hub, its immediate promenade and one representative lab exterior/entrance** as a reviewable pilot. These establish first impression, repeated navigation and the reusable material/architecture language. Select the lab after confirming low gameplay coupling and representative asset needs. Subsequent planned batches can carry the approved visual language across the remaining primary buildings and connecting floors. The eventual target is campus consistency, not one polished corner surrounded by untouched blocks.

Build richness through proportions, layered edges, visible structure, openings, material variation and a few intentional props. Give Pix/Core a clear landmark frame and each lab an entrance silhouette plus its existing numbered name. Keep signs, targets and state changes visually stronger than decoration; do not make every surface glow. Props should support the lab's idea without suggesting extra interactions.

Priority is high for presentation because it affects arrival and every lesson visit. Pilot effort is provisionally moderate; full-campus effort and memory cost remain unknown until asset inspection. Pending travel/input acceptance stays visible as a separate delivery dependency.

Deferred alternatives: adding textures only would leave primitive silhouettes; mixing unrelated prefabs would weaken campus identity and increase collision/reconciliation work; a whole-island prefab replacement would risk working missions; custom imported architecture is unnecessary unless available Fortnite kits demonstrably fail the intended look. Cosmetic primitives may remain where they clearly explain an abstract AI action or support verified gameplay.

## Scope, preservation and dependencies

Scope covers visible architectural shells, decorative structural detail, connected walking-floor presentation and sparse environmental dressing. Include consistent doorway/path framing and readable numbered entrances. Preserve terrain and shoreline identity.

Preserve mission footprints, stable walkable height/clearance, parkour gaps and decks, shot lanes, target visibility, original entry/Return/replay controls, Pix approach/re-arm region, all eight travel landing zones and controller ownership/bindings. Preserve mission order as guidance, current Agent independence, solo settings, eight badge identities, safe retries and once-per-round rewards. No new puzzles, weapons, rewards, building/destruction mechanics, NPC systems, imported art pipeline or publishing work is proposed.

Planner should classify each primitive as architecture, functional collision, feedback/teaching art or shared support before selecting its treatment. Reuse dependable gameplay surfaces or prove equivalent replacements; do not simply cover them with a second colliding floor. Prefer known Fortnite assets and existing devices/source. Exact asset paths, dimensions, collision, destructibility, memory, lighting and runtime feasibility are planning responsibilities.

## Observable success and candidate acceptance

- Given a first hub arrival, when the player looks toward Pix/Core and the promenade, then a cohesive textured campus with structural depth is visible, and Pix, status display and route entrances remain recognizable. Record matched before/after player-height views and owner visual acceptance.
- Given the pilot lab approach, when a player follows its number/name, then its doorway and intended route are clear without mistaking decorative props for controls. Observe a first-use player rather than asserting clarity from a top-down render.
- Given normal walking or confirmed Pix travel, when the player reaches a changed area, then no snagging, falling, blocked arrival, involuntary mission start or obstructed Return occurs.
- Given a changed lab, when the player starts, makes a wrong action, retries, completes, replays and returns, then existing instructions, state feedback, earned badge and reward protection behave as before.
- Given Popcorn Parkour near later art batches, when either branch and recovery are played, then landing footprints, gaps, shot paths, teaching captions and safe recovery remain valid.
- Given the reviewed final asset set, when project validation, cooking and memory calculation run under the owner's authorized testing workflow, then results and accepted warnings are recorded; decorative polish does not substitute for gameplay evidence.

## Planner unknowns and handoff

Confirm current eye-level appearance and asset inventory, available compatible Fortnite kits, shared building/floor ownership, pilot lab choice, replacement/retention map and exact material/lighting treatment. Measure effective geometry, collision and every arrival/interaction sightline. Establish platform-appropriate memory/render cost against an actual baseline, not an invented budget. Account for feature 044's pending owner checks and existing manual-testing constraints; do not assume an automatic session/push is authorized.

When planning is requested, convert this brief into a numbered specification and pattern-backed map/review bundle, including selected asset references, before/after visual targets, measured scene delta and staged rollout. Follow [the map workflow](../AI_MAP_WORKFLOW.md): concrete preview and human approval before architectural map mutations. This brief is upstream advice only. No editor calls, map/source changes or new playtest were performed for this assessment.
