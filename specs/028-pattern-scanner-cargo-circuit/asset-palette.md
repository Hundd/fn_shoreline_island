# Fortnite asset palette

These exact static-mesh catalog candidates were discovered live. Registry presence is not proof of placeability or cook eligibility. Before implementation, inspect associated placeable props and actual mesh bounds/pivots; substitute an eligible Fortnite equivalent in the same envelope if necessary. Do not use restricted internal assets merely because their paths exist.

- `/WildEstate/Environment/Props/PalletJack/PalletJack_Conveyors_A/Meshes/SM_PalletJack_ConveyorLow_A.SM_PalletJack_ConveyorLow_A`
- `/WildEstate/Environment/Props/Container/Container_WoodCrates_A/Meshes/SM_Container_WoodCrateMedium_A.SM_Container_WoodCrateMedium_A`
- `/WildEstate/Environment/Props/PalletJack/PalletJack_IndustrialLight_A/Meshes/SM_PalletJack_IndustrialLightFixture_A.SM_PalletJack_IndustrialLightFixture_A`
- `/WildEstate/Environment/Props/Industrial/Industrial_MetalShelving_A/Meshes/SM_Industrial_Shelving_B.SM_Industrial_Shelving_B`
- `/Hermes/Props/Industrial/Industrial_ProcessingMachine_A/Meshes/SM_Industrial_ProcessingModule_A.SM_Industrial_ProcessingModule_A`
- `/Hermes/Props/Industrial/Industrial_Signs_A/Meshes/SM_Industrial_SignTriangle_A.SM_Industrial_SignTriangle_A`

Use the low conveyor for line bodies, medium wooden crates for cargo, industrial modules for the scanner housing, native practical lights and shelving for edge dressing. Native railings and coastal planters remain catalog-selection tasks. Fit conveyor runs within Y=13..21 and keep Y=6.5..9.5 clear. Decorations: six lamps, four shelving/crate clusters, two small planters, low machinery railings and entry/dispatch frames. At least 75% of visible non-device prop instances should be eligible Fortnite props, measured in AC-08. Keep cyan markings and warm lamps consistent across all four tiles. Native prop proportions should stay recognizable.

No new imported art or marketplace download is required. Full transforms and exact mesh scale are measured during preflight, before each approved placement.

## Qualified placed palette (2026-09-29)

The original WildEstate candidates failed UEFN content validation and were removed. Exact native substitutes that passed a full Launch Session cook are the Creative Military Base metal crate (12 moving cargo props plus eight stacked props), `/Game/Building/ActorBlueprints/Prop/IND_ConveyorBelt_01` (21 static line bodies), Creative Asteria warehouse door (one dispatch shutter), Creative rusty industrial catwalk railing (13 low segments), Military Base warm light stand (six), and Artemis planter (two). Four pre-existing dock canopy roofs, eight edge supports, entrance treatment and markers were retained and repositioned as recorded in `evidence/final-sign-and-canopy-readback-2026-09-29.json`.

There are 63 placed Fortnite non-device prop instances in those six roles. Counting the retained simple-shape canopy pieces conservatively as 18 additional visible non-device pieces gives 63/81 = 77.8% qualified Fortnite props. This is an instance tally, not a cooked visual acceptance; the final signs, motion readability and collision traces still need in-game review.
