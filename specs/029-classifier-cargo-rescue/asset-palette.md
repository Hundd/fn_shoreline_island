# Functional palette - revision 2

Only objects needed to identify examples, choose a category, read feedback or use the bay belong in the redesign. No decoration quota or required native-prop percentage. Prior candidates/dressing lists are archived in history/revision-1/asset-palette.md; none of those industrial props is implicitly required now.

| Role | Selection / constraint |
|---|---|
| Burger | Eligible native edible burger; old candidate `/Game/Environments/Helios/Props/Commerce/Commerce_VendorGoods_A/Meshes/SM_Commerce_CheeseburgerPlate_A.SM_Commerce_CheeseburgerPlate_A`. |
| Chair | Eligible native ordinary chair; candidate `/WildEstate/Environment/Props/Furniture/Furniture_WoodChair_A/Meshes/SM_Furniture_WoodChair_A.SM_Furniture_WoodChair_A`. |
| Car | Eligible native recognizable car display; candidate `/Game/Vehicles/FORT_Vehicles_01/Meshes/KCar_01.KCar_01`. |
| Banana | Eligible native banana. Old DelMar banana registry hit is unqualified; do not assume it is placeable. Another clearly edible example may substitute under spec.md's rule. |
| Sofa | Eligible native sofa; candidate `/Game/Environments/Helios/Props/Furniture/Furniture_OrnateSofa_A/Meshes/SM_Furniture_OrnateSofa_A.SM_Furniture_OrnateSofa_A`. |
| Tractor | Eligible native tractor; candidate `/Game/Vehicles/FORT_Vehicles_01/Meshes/Car_Tractor_01.Car_Tractor_01`. |
| Answers | Existing project ring/cue assets, FOOD/FURNITURE/VEHICLE words with eat/seat/transport icons; same neutral treatment before feedback. |
| Support and lighting | Reuse one low display support if necessary, at most two practical lamps, one shelter only if useful; exact boundary rails for real edge safety. |

Six examples share one display anchor; hide/park five so they cannot distract, block shots or show a future answer. Fit each in a 1.5 m cube with uniform scale and a recognizable silhouette. Name miniature vehicle displays CAR/TRACTOR, not toys. Recognizability must be demonstrated visually in cooked content, not supplied only by a word label. No sealed generic crate representing food.

Registry matches in evidence/editor-inventory.json are candidates only. Qualify Creative-placeable variants, bounds/pivots and cook eligibility before use. A substitute keeps category, same educational role, visibly different held-out example and envelope; update fixtures/copy together. If none qualifies, return to review. No new artwork import is planned. Never add conveyors, lifting gates, repair equipment, cargo dispatch, shelving clusters or planters just to fill the retained footprint.

Use existing board/HUD/buttons and shared feedback. Per-target labels/optional FX are part of the assembly audit. Text must duplicate meaning of icons/color/audio, and icons must render in the actual cooked font; missing glyphs are a defect, not an acceptable placeholder.


## Approved-scope implementation update (2026-09-29)

The owner authorized revision 2 with "when you finish, run 29 implementation". Approval and readiness are recorded in approval.yaml. Implementation is in progress; gameplay acceptance remains open. The new food example uses a recognizable APPLE under the approved same-category substitution rule: the inspected banana-pile candidate depicted discarded peels. The immutable reviewed map retains new_banana as its original role identifier; implementation fixtures and displayed copy use APPLE and "An apple is food we can eat too." Category order, six-example count, dimensions and lesson are unchanged. Eligibility/visual verification is recorded separately from registry discovery.

## Native prop replacement (2026-09-30)

Raw mesh references above failed validation and were removed. Current placed native blueprint classes are Creative_Prop_DurrBurger, CP_Chair_Kitchen02, Car_KCar, Creative_Prop_Apple02, Creative_Prop_Couch01 and Car_Tractor. Full actor/component identities and bounds are in evidence/native-props-r2-2026-09-30.json. These passed local launch validation; cook and recognizable cooked silhouettes remain unverified because UEFN crashed with DXGI_ERROR_DEVICE_REMOVED during cooking. Do not restore the rejected raw mesh overrides.

Cook qualification recovered after editor restart: 2026-09-30 04:34:21 UTC logs confirm successful client/server cooking and activation. All six native actor references and bounds survived restart. Cooked visual recognition still requires playtest observations; see evidence/implementation-status-r2.md.
