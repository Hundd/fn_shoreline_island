# AI Classifier wrong-route explanation — 2026-09-23

The existing wrong-route result identified the item's chosen and correct
categories but did not explain the item/category relationship. The station's
single mismatch path now adds a short reason for each authored item: an apple
is food people can eat, a puppy is an animal, and a car is a vehicle people
travel in. The result still ends with an invitation to try again.

Only localized feedback and a read-only item-to-reason helper changed. The
fixture's queues, route rules, category IDs, device references, progress
state, and Classifier Badge guard were untouched. UEFN MCP `BuildAll` returned
zero diagnostics after the edit.

AC-026 and T-023 remain open because the owner has asked to skip Play-in-
Client. In-client feedback fit, wrong-route reset/retry, and two-player
independence still need a session check.
