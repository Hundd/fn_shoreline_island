# Art director review — station display wall

Date: 2026-10-10. Advisory offline review for the Supervisor's requested review/refinement/implementation workflow. Host: Codex; configured worker model: gpt-6.1-sol; worker: /root/art_director. No editor access, gameplay edits, approval records, or design artifacts changed.

Evidence: feature 060 spec.md (R1–R5), plan.md (Measured basis, Concrete proposed scene delta, Display facing verification), map.yaml (scene delta digest 64d4ed483889dfc03066222feb4359283bfd8699e5251c833b86831b4e2da5a6), review.md, scene-delta.json, and generated/station-elevation.png. Also read project plan.md and docs/AI_MAP_WORKFLOW.md. The elevation is a schematic, not completed-scene evidence; no current in-game screenshot was supplied to this worker.

## Direction and strengths

The cream architecture, repeated navy housings and single teal band establish a recognizable station information bank while fitting the bright coastal academy. The numbered four-by-two grid is the primary landmark; screen content must remain the highest-priority information. Keep the pale wall subordinate, navy as enclosure/grounding, and teal as a restrained architectural accent. Existing named campus material instances are specified, not newly discovered or validated by this review. Use existing daylight first; there is no evidence requiring new lighting or emissive strips.

The scene delta provides a continuous physical chain: wall front Y2266, mount Y2266–2270, backbox Y2270–2282, then bezel Y2282–2307. This is credible wall mounting rather than a decorative frame floating independently. Eight consistent 244cm-wide outer housings and 56cm column gaps preserve a clear rhythm. The upper wall carries the right-hand lower pair over the passage, which reads as concourse architecture.

## Focused findings and recommendations

1. **Prioritize side-view proof of support (R1).** Mount depth is only 4cm. It connects geometrically but may be hard to see in a front-facing capture. Capture one close oblique side view showing the wall, mounting block, backbox and front face. Keep the specified chain and preserve the one-sided widget's +Y viewing direction. Do not thicken brackets speculatively or move the billboards to make a front view show hidden structure.

2. **Inspect the unusually deep screen recess (R1/R4).** The bezel extends 25cm forward of the backbox; the text plane is approximately Y2305.2 against bezel front Y2307. This is nearly flush at the front, but the dark surrounding cavity may read as a chunky box from the side. Preserve the same depth on all eight units and evaluate an oblique daylight view before accepting. The interior opening width is 233cm; nominal draw width is 195cm (300 × 0.65), leaving about 19cm per side when centered. This calculated fit is reassuring but does not prove the actual runtime text fits or remains visible at oblique angles.

3. **Finish ground contact coherently (R4).** The left plinth is navy, 20cm tall, and terminates at the opening; the right cream pier starts 12cm higher at its measured floor and has no corresponding plinth. This is a deliberate asymmetry visible in the elevation. Keep passage edges free of a threshold. If the cooked view makes the bare pier look unfinished, a small navy treatment confined to that pier is the most focused optional refinement; the Planner must resolve exact geometry and update the delta before implementation. It is aesthetic, not a blocker, and must follow the local floor rather than add a floating continuous base.

4. **Protect the passage and avoid visual clutter (R3/R4).** The lower housing starts at Z2644, only 2cm above lintel underside Z2642. Do not add a downward lintel trim or bottom screen lip: the stated minimum 230cm clear headroom already uses the highest measured adjacent surface. The 500cm opening overlaps 470cm of the rear route; preserve that overlap and both corners. An open passage is legible in the schematic, but actual contrast through it and Pix visibility need cooked evidence. Keep the large blank lower-left wall quiet; extra posters, benches, signs or an enclosing roof would dilute the screen bank and expand scope.

5. **Keep station styling subordinate to actionable status (R2/R4).** Teal band height is 30cm and ends 29cm above the upper housing top; this creates enough separation without another sign competing with lessons. Retain the single accent and consistent navy family. Do not infer runtime teal status text from the illustrative elevation: existing WAITING/RESTORED words and numbering must carry meaning beyond color, and current status lighting/bindings remain authoritative.

## Handoff and review criteria

No mandatory aesthetic redesign is identified from the offline evidence. The strongest refinement is implementation discipline: consistent housing depths, clean ground contacts, unobstructed opening, and side-view proof of every mount. Optional right-pier base treatment is lower priority than preserving clearance and readability; no additional asset family is warranted.

Planner/Supervisor should consolidate any optional geometry refinement before generating the final approved revision. Implementer/QA should record front and oblique daylight views; inspect all eight faces for clipping/flicker; verify actual cream/navy/teal rendering; show right-pier ground contact; and traverse both passage corners in cooked play. Actual readability at the existing upper-screen height (about 4.5m pivot above floor), widget backgrounds, contact shadows, nearby occlusion and collision cannot be accepted from this schematic. This report provides advice, not human approval or gameplay acceptance.
