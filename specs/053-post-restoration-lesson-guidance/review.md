# Planner source review

2026-10-09. Recommend the exact two-line branch reorder for delegated Producer review.

Source establishes the issue: completed_modules>=8 currently wins before fresh valid activity, so existing reports cannot reach navigation_step after full restoration. Moving done below existing activity is sufficient; no report producer, lifecycle or geometry change is needed. This is a source finding, not a cooked reproduction.

The active completion handoff remains first and its4s window unchanged. At exact handoff expiry activity may resume; report age exactly0.75s is stale. A nonnegative out-of-range module index fails the existing array lookup and falls through to done at8/8. Cleared/default reports likewise fall through. Before8, moving the always-false done branch past activity leaves action selection unchanged. Count and reward authority are unaffected.

Preserve existing pulse suppression even where an invalid positive module index would suppress the recommendation pulse; correcting that separate behavior is outside scope. Preserve module availability semantics, future/negative-age handling and token guard as written. No new requirements are silently added under the word valid.

No new visual design or geometry revision exists; small source-only presentation exception is recorded in plan.md. No map regeneration, readiness digest or fabricated human approval. Current user delegated review and reserved gameplay testing for owner manual evidence; Producer review precedes implementation.

Risk/limit: prioritizing existing reports can reveal their current instruction until normal clear/expiry; no new persistence is introduced. Native compile verifies syntax/types, not actual8/8 UI readability, lifecycle integration or travel/panel overlap. AC05 remains pending. This does not accept feature044 or prior050–052 gameplay.

Planner changed only this new planning directory. No source/binary edits and no live editor calls; no calls in flight at handoff.
