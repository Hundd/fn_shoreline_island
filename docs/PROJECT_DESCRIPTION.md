# AI Island Academy

AI Island Academy is a bright, non-combat UEFN learning adventure for approximately ages 8–10. Pix is a friendly AI assistant whose AI Core has lost seven abilities and locked Agent Mode. Players explore the coastal academy, restore the modules through short visual challenges, and finish with an AI Agent Mission.

## Player-facing description

> Restore Pix's AI Core! Explore a futuristic island academy, teach Pix clear instructions, patterns, categories, tools, and safe mistake-checking before the AI Agent Mission.

The hub has an AI Core centerpiece and a personal journal that shows restored modules and suggests an unfinished destination. Each main zone earns one badge per player per round. Replaying a zone does not duplicate its badge. Feature 024 is introducing a permanent Data Blaster as a non-combat interaction tool: unlimited ammunition, invincible players, no PvP, no environmental destruction and no punitive timers. Its shooting missions preserve the puzzle and earned Data Energy after wrong answers. Prompt Lab is the first conversion; the other labs retain their current controls until its validation gate passes. Implementation and playtest status are recorded in `specs/024-data-blaster-redesign/`.

| Zone | AI idea | Player activity | Reward |
| --- | --- | --- | --- |
| Prompt Lab | Clear instructions | Shoot BLUE, add LARGE before selecting the large blue core, then acquire the moving core and shoot REACTOR to restore the module. Conversion and playtest verification are in progress. | Prompt Badge |
| Fix the Prompt | Improving instructions | Swap two steps in a faulty instruction and run it again. Optional practice. | No extra badge |
| Pattern Scanner | Patterns and prediction | Predict a robot's repeat count, use Move + Light for dock markers, then adapt when the target moves. | Pattern Badge |
| AI Classifier | Categories | Route items to Food, Animal, or Vehicle and choose a complete sorting rule. | Classifier Badge |
| Confidence Core | Confidence and uncertainty | Use clues and percentage controls to revise Pix's confidence. | Confidence Badge |
| AI Error Lab | Checking mistakes | Compare expected and actual results, fix one faulty element, and rerun. | AI Detective Badge |
| AI Tool Lab | Tool use | Connect a supply request to the chute and a beacon request to the lamp, then test both. | Tool Master Badge |
| AI Skills Lab | Reusable skills | Define and call the Care skill across planter beds. | AI Skills Badge |
| AI Agent Mission | Agent workflow | Restore the Research Station by delivering a seed, lighting its dock, and sorting arrivals. | AI Agent Badge |
| AI Discovery Trail | AI literacy | Make optional predictions, check a classification, and consider a human decision. | No extra badge |

Pix is helpful but can be uncertain or wrong. The lessons encourage players to check important answers and make important decisions themselves. AI Discovery Trail never blocks the main route.

The project is still in development. The owner reported successful UEFN validation and memory calculation on 2026-09-23. In-client readability, full solo progression, and multiplayer independence still need recorded playtest evidence. See the [migration specification](../specs/022-ai-island-academy-migration/spec.md) and [task record](../specs/022-ai-island-academy-migration/tasks.md).
