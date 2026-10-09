# Campus asset validation repair

## Scope and authorization
Owner requested "fix it please" after the disallowed-reference diagnosis. This is a compatibility repair of existing passive scenery in approved features 045–047. No mission behavior, layout or art intent change is authorized by this repair. Original owner preference defers gameplay walkthrough to the owner.

## Requirements
- R1: Remove the diagnosed illegal references from the 1,732 affected campus actors through supported native Creative equivalents or explicitly reviewed project-owned/basic geometry alternatives.
- R2: Preserve visual footprint, top heights, collision behavior, labels/roles and any bindings. Preserve exact transforms for exact-mesh counterparts; record pivot/scale compensation for different representations. Record measured equivalence and Supervisor-approved passive visual compromises before rollout. A materially different replacement returns to concrete design review.
- R3: Save affected editor assets and run authoritative UEFN validation/cook. Record actual results and remaining failures.
- R4: Leave editor open and verify no playtest game remains running.

## Acceptance scenarios
- Given the diagnosed campus actors, when validation/cook runs after repair, then the diagnosed disallowed references are absent from validation errors.
- Given a replaced actor, when its before/after receipt is compared, then transform, role, visual mesh and intended collision remain equivalent.
- Given the completed validation attempt, when task ends, then game state is not running.

