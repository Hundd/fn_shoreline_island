# AI Classifier and AI Error Lab presentation — 2026-09-22

## AI Classifier

- Preserved the Signal Lighthouse routing IDs, player progress map, correct
  rule, animated route, retry handling, and one-time Classifier Badge guard.
- Converted the displayed items from Leaf/Gear/Plain to **Apple/Puppy/Car**.
- Converted the displayed destinations from Garden/Workshop/Storage to
  **Food/Animal/Vehicle**.
- Updated the queue, rules, feedback, and two help levels to explain
  classification as placing items in categories.

## AI Error Lab

- Preserved Debug Workshop state, one-edit mechanic, expected-versus-actual
  boards, safe rerun, and badge guard.
- Converted presentation from supplied programs/debugging terminology to Pix's
  **AI plan**, its visible result, and a player correction.
- Converted the classification error example to Apple -> Food and Car ->
  Vehicle, retaining the original binary routing behavior.
- Its safe retry feedback now tells players to compare the visible EXPECTED
  and ACTUAL results before editing the bracketed part of Pix's AI plan and
  running it again.

## Verification

- Verse `BuildAll` completed with zero diagnostics.
- A fresh UEFN session upload reached `Connected` / `Running`.
- A subsequent fresh session also cooked successfully after importing and
  saving the three classifier textures.
- The match and session were stopped; final state was `Disconnected` /
  `Unconnected`.
- Verse `BuildAll` returned zero diagnostics after the Error Lab retry-text
  clarification. A fresh session reached `Running` and was stopped to
  `Disconnected` / `Unconnected`.

## Limits

The legacy material assignment has been replaced by a dedicated masked, unlit
classifier-icon material (`m_ai_classifier_icon`) and three instances for the
Apple, Puppy, and Car. The Signal station applies only these new instances to
its moving item; routing and interaction materials elsewhere are untouched.
Three project-owned source textures are imported and saved at
`/fn_shoreline_island/Academy/Cargo/t_ai_classifier_{apple,puppy,car}` from
the corresponding transparent PNG files in `Resources/Cargo/`. UEFN local
validation required power-of-two dimensions, so each texture now uses
transparent square padding and a 1024 px cap. The material has one pixel
texture sample and one sampler. The corrected assets cooked in a fresh running
session, which was stopped and verified disconnected.

In-client input, visual readability, and two-player behavioral checks remain
required before either zone is complete.
