# Reported hidden content: read-only diagnosis

2026-10-10. User reports only Confidence/Classifier/Pattern WAITING messages and hidden second virtual section. No corrective mutation yet; Supervisor requested clarification to distinguish TV content, lower TV row, rear-face content, and retained boards behind the assembly.

Native current actor readback for academy_label_1..8: exactly TITLE newline WAITING, textSize16, displayModeTwoSided. Original checkpoint contains the same two-line content. No additional description/third line is present in original or current actor text. Confidence primary widget drawSize300x125, pivot0.5,0.5, relativeLocation(0.101,-8.027,81), relativeScale(1,1,1). Actual actor boundsZ2849.992..2954.979. Existing cooked captures show both complete text lines and all eight screens; no demonstrated internal clipping yet. Editor viewport capture shows blank preview surfaces and cannot establish cooked text clipping.

Nearby retained boards behind new solid structure:
- hub_loop_route: PATTERN SCANNER >, boundsX-801.985..-498.015/Y3076.557..3100.464/Z2649.990..2787.281.
- field_note_human_board: AI DISCOVERY TRAIL: HUMAN DECISION / Pix says RouteA | RouteA closed / Choose with new information; boundsX-800.710..-764.145/Y2467.553..2932.447/Z2649.985..2859.959.
- field_note_lantern_board: AI DISCOVERY TRAIL: PATTERN / 1>2>1>2>1>? / Optional use button; boundsX-1050.710..-1014.145/Y3217.553..3682.447/Z2649.985..2859.959.
- cargo_circuit_predict_board:0/3 SOLVED / SHOOT THE MISSING SYMBOL / A B A B A ?; boundsX-501.056..301.259/Y4680.446..4708.573/Z2678.988..2840.507.

Wall occupiesY2335..2370, upper lintel beginsZ2642; hub-facing sightlines to these retained boards can intersect wall/lintel/TV bank. Prior cooked arrival images visibly crop distant Pattern instruction board through passage top. This is distinct from text inside academy TVs. No unrelated boards were moved.

Candidate fixes contingent on clarification, not implementation instructions:
1. If missing lower TV row: reproduce exact player camera/side; inspect housing face vs widget rectangle, then fit housing clearance without moving billboard identities/positions.
2. If additional text expected within TVs: original content only has title/status; identify intended original source before changing text or status semantics.
3. If rear lesson signs are intended visible from hub: revise sightline design offline with Planner (open supporting structure or specifically reposition relevant sign), preserve full passage and bindings. Need exact affected sign and user intent; do not relocate all retained signs speculatively.
4. If rear TV faces: originalTwoSided devices now have solid backing on positiveY; establish desired two-direction readability before proposing paired/rear display treatment.

Fresh session already launched before Supervisor stop instruction; capture/shutdown follow. Goal remains incomplete. No design/source/scene mutations performed in this investigation.

Fresh cooked front saved hidden-content-fresh-front.png: title+WAITING visible in both TV rows. Character occludes part of screen7; distant Pattern board is partly masked through passage. No UI movement performed. Native StopGame Completed, StopSession normal null, final GetGameState Unconnected. Editor left open, all calls complete; ownership released awaiting user clarification.
