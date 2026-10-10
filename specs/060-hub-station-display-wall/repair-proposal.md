# Sightline repair candidate — not an approved mutation plan

The user's screenshot shows all eight academy TV titles/statuses, while the new structure masks nearby SCANNER and SHOOT THE MISSING SYMBOL instructions. This is a scene occlusion defect. Do not alter TV text or claim that removing only the lintel fixes it.

## Measured sightline evidence

Evidence: evidence/hidden-content-diagnosis.md and evidence/hidden-content-fresh-front.png. Eye (-1050,1300,2570) is the reported fresh-front camera; projection is geometric inference against measured board bounds, not a new cooked observation. Rays to board AABB corners intersect wall plane Y2335 as follows:

| Retained board | Projected X cm | Projected Z cm | Conflict |
| --- | --- | --- | --- |
| SCANNER / hub_loop_route | -907 to -729 | 2616 to 2696 | Lintel and lower TV7 |
| Pattern / cargo_circuit_predict_board | -883 to -636 | 2603 to 2653 | Lintel and lower TV7/8 edges |
| Human decision / field_note_human_board | -892 to -797 | 2621 to 2827 | Lintel, lower TV7 and backing |

The academy row itself remains opaque after replacing the wall with posts. At return-eye (-700,1500,2570), SCANNER still projects through lowerTV8. At a closer eye (-700,2000,2570), its full vertical rectangle falls below Z2638 and may clear the TVs, but requiring one narrow viewing position does not satisfy the repair.

## Candidate A — relocate the intact bank to the west

Proposed horizontal translation: X minus1300cm, with Y/Z and rotations unchanged. Close the former passage with a continuous lower wall and base; no doorway is retained at the new site. Structural wall becomes X[-2980,-1720], Y[2335,2370]; trim/housing full extent X[-2985,-1715]. Eight TVs remain a coherent four-by-two station bank, with the same identities, text, bindings and appearance. Their revised columns are X=-2800,-2500,-2200,-1900. No retained SCANNER, Pattern, Human or Lantern instruction board moves.

This clears the measured central instruction cones from representative arrival/return positions and reopens the original central approach. It also moves the bank off the main axis, so it is a material layout choice requiring a concrete review before mutation. The user still needs an easy view of the relocated status bank. The existing cutout is closed, because the surveyed rear platform ends at Y2700 with a 96.25cm grass drop and has no safe east turn immediately behind the bank.

Survey evidence/west-relocation-survey.json/.md records Z2400 support across sampled footprint and no static prop intersection. The nearest classifier column is outside the wall volume with 187cm Y separation. All eight status lights have exact live transforms and are included in the candidate with the same X translation, preserving identities and bindings. The wall remains on the surveyed footprint. Cooked visibility/collision remain acceptance checks, not claimed results.

## Candidate B — open supports in the current location

Replace opaque wall with grounded posts and narrow rails while retaining all TV poses. This substantially reduces obstruction and restores some former visibility, but does not clear the screenshot's SCANNER rectangle because lower TVs still cross it. Therefore this is not a sufficient standalone fix. Raising/repositioning lower screens or relocating instruction signs would be an additional layout change, with worse readability or gameplay-wayfinding tradeoffs; no such changes are authored.

Recommendation: A with the former passage closed, as shown in repair-review/preview.html. The user must review this concrete material relocation before scene changes. No original scene delta, map, approval or tasks are changed by this candidate document.

## Acceptance for any selected correction

Use the actual reported arrival camera plus default-spawn approach, hub return and an ordinary walk toward the rear activities. Full SCANNER title and all Pattern instruction lines must remain visible without a thin cutout cropping them, across useful approach positions; camera-only title visibility is insufficient. Preserve access/readability of the Human/Lantern boards at their existing interactions. Check eight TV texts, matching light/status behavior, grounding, collision, Pix/rear route and the unchanged lesson/reward flow. Save, validate/cook, independently QA and stop the playtest. No passing result is claimed here.

## Final concrete candidate for review

- Wall extent X[-2980,-1720], Y[2335,2370], Z[2400,3060]cm; all ground footings start Z2400. Full trim extent X[-2985,-1715], top Z3068.
- Expand existing hub060_left_wall across the full 1260cm width at Z2400..2642, retain upper_wall. Remove redundant hub060_right_pier. Expand left_plinth across full width at Z2400..2420; remove right_plinth. The former raised pier is therefore not left floating.
- Translate all retained housing/mount/bezel/trim pieces X-1300. Final count53 retained feature meshes:2 structural BlockAll,3 NoCollision trims,48 NoCollision TV parts. Zero new actors; remove2 feature-owned redundant actors only after review.
- Translate eight original TVs and eight original status lights X-1300, preserving all other transform fields/options/text/bindings. Source TV final columns X=-2800,-2500,-2200,-1900. No instruction boards or source logic changes.
- Player circulation uses the existing area in front/south of the relocated bank, goes east into the original hub, then north on the original central walkway. Do not route through or behind the western wall, the30cm rear strip, or the surveyed grass gap/drop. Closing the doorway removes the misleading invitation to that edge. Nearby field-note cargo board atX~-2032/Y1500 is retained; pass it using ordinary open front area rather than treating the schematic route arrow as an exact corridor centerline.
- Exact proposal: repair-review/candidate-delta.json. Preview: repair-review/preview.html and preview.svg. Original approved map/delta/approval remain untouched. This candidate is not implementation authorization.
