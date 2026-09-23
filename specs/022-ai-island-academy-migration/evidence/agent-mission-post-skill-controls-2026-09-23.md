# Agent Mission controls while Verify is pending — 2026-09-23

Source audit found that the optional Apple/Car rule control used `changed`,
which clears `delivery_skill_complete`. A player pressing it after a valid
DeliverPackage execution but before Verify would lose the pending delivery
and have to run the required skill again. The optional cargo control did not
clear the flag, but could change the program-board item while the Medical
crate remained delivered.

The final-stage edit handler now intercepts only those two optional controls
when the delivery skill is complete and the attempt is not yet solved. It
shows the existing Verify prompt and leaves the delivered crate, selected
route, skill flag, and reward state unchanged. Both controls retain their
previous optional-practice behavior before the skill. Route-changing edits
and Replay still invalidate the skill as specified by AC-033.

UEFN Verse `BuildAll` returned `returnValue: []` (zero diagnostics). No actor
or saved default text changed. This is source/build evidence, not an
in-client check; wrong/retry, post-skill button behavior, visual continuity,
and multiplayer remain deferred at the owner's request.
