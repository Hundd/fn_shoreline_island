# Discovery Trail: evidence before the route decision

Status: proposed for planning; 2026-10-10, autonomous cycle8.
Source request: choose one independent product improvement after a successful build; delegated agent review, no automated gameplay tests.

## Recommendation and evidence

Make the optional Human Decision field note provide the evidence needed for its answer. The learner checks updated route information showing **A closed and B open**, then chooses B. The result explains that the choice followed this information, without claiming that merely ruling out A proves B is safe.

[Current field-observations source](../../Content/fn_shoreline_island_field_observations.verse) says: Pix suggests Route A and new information says A is temporarily closed. It then asserts in `route_b_result` that “Route B is the safe choice.” Nothing in the question establishes B's status. This is a source-level reasoning gap in an AI-literacy scenario, not an observed player failure or a claim about real route hazards.

The [022 Human Decision requirement](../../specs/022-ai-island-academy-migration/spec.md), AC-035, intends the player to use current information rather than automatically follow Pix. Explicit evidence about both options makes that intended lesson sound. It is a textual scenario; do not invent actual island route closures, navigation changes or a physical safety audit.

This is selected for learning accuracy, not as routine wording polish. Larger new lessons have no stronger current evidence, and recent055–057 interaction/content changes should not be expanded speculatively. The [057 implementation](../../specs/057-error-lab-movement-verification/evidence/implementation-summary.md) remains intact; no extra movement guards are proposed.

## Exact candidate content and scope

Preserve the two existing Route A / Route B buttons, answer indices, Again/Close and Next field note paths. Keep this optional, reward-free and independent of the main eight modules.

Planner should review these three localized strings together:

| Surface | Proposed copy |
|---|---|
| human_sign | `AI DISCOVERY TRAIL: HUMAN DECISION\nPix says Route A\nToday's signs: A CLOSED / B OPEN\nCheck new information before choosing` |
| human_decision_question | `AI DISCOVERY TRAIL: HUMAN DECISION\nPix suggests Route A. You check today's signs: Route A is closed. Route B is open.\nWhich route should you take?` |
| route_b_result | `Route B matches today's signs. You checked new information before following Pix's suggestion.\nAI can offer suggestions; people check the evidence and decide.` |

These are candidate exact strings for a bounded content review, not source edits. Shorten only if needed for existing text bounds while retaining both route-status facts and the evidence-to-choice explanation. Existing Route A retry remains valid: A is closed and the player should check the information again. Do not add a universal “safe” claim based solely on openness, change the correct choice, or introduce a third option/new confirmation stage.

Only `fn_shoreline_island_field_observations.verse` localized content should change. Preserve all callback/generation/state logic, widget geometry/style, actor references/sign locations, input handling, correct/retry classification, resets, other field notes and rewards. Do not extend055 navigation into this modal as part of the same task. No scene mutation, new assets or global text replacement.

## Planner handoff and success

Create a small numbered content spec/plan identifying current baseline strings and all references, including direct Human Decision entry and Check Pix's Next field note link. Review that both entry paths use the same question/result and that B's status is stated before choice. Record the source-only/no-geometry boundary and concrete delegated review; do not overwrite022 historical approval.

- Offline content review: the choice follows supplied current evidence; no unsupported safety conclusion; sign, question and answer agree on A closed/B open. Exact answer mapping and all other field-note text/logic unchanged.
- Native Verse build succeeds with recorded diagnostics; diff/loaded-source review confirms the bounded change. No actor edits, games, sessions, cooking, push or gameplay input.
- Owner manual remains pending: direct Human Decision and Next field note show the updated question; B gives the evidence-based explanation; A permits retry; Again/Close still work. Check actual sign/panel fit and ask what information changed the decision. A correct button click alone does not establish understanding.

Unknowns: actual text fit and child comprehension. Do not claim they are proven by similar line count or compilation. If the current UI cannot hold the facts, return a compact copy revision for review rather than changing layout.

## Alternatives considered

| Opportunity | Decision |
|---|---|
| Evidence-complete Human Decision scenario | Select: precise source premise/conclusion mismatch, core AI-literacy value, independent and very bounded. |
| New hangar or core lesson mechanics | Defer: accepted/implemented lessons already exist; first-use/runtime findings would better identify a useful replacement or extension. |
| Additional Pattern sets, modal navigation or movement guards | Defer: avoid automatic repetition of recent features without evidence of another specific need. |

050–057 manual acceptance remains open independently, not a global ban on useful work. Local Producer inspection covered057 handoff, Discovery Trail source/022 context, existing hangar status and prior briefs. Changed only this brief; no editor/source/spec/asset changes. Supervisor owns editor/shutdown and subsequent dispatch.
