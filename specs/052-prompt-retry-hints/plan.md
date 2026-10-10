# Exact message matrix and minimal implementation

| Controller stage | Wrong target index | Localized copy |
|---|---|---|
|1 BLUE|1 RED,2 GREEN|Check the color: the prompt says BLUE.|
|3 LARGE BLUE|1 RED|Check the color: choose a BLUE core.|
|3 LARGE BLUE|4 SMALL BLUE|Blue is right. Now match LARGE.|
|5 destination|7 SCANNER,8 STORAGE|Check WHERE: the prompt says REACTOR.|
|Any other pair|Unexpected index/stage|Not quite! Check the prompt and try another target.|

Add four local `<localizes>:message` constants to the Prompt controller. Keep current `wrong` fallback unchanged. Suggested names: wrong_color_choice, wrong_large_color, wrong_large_size, wrong_destination.

Add a pure local message-selection helper taking current_stage:int and index:int, returning message. Match exact six combinations above, returning existing wrong for every other pair. Do not use target.target_id as a replacement for the controller's existing ordered-array index authority. No state mutations, device calls, sleeps or reward logic in selection.

At each of the three existing reject call sites pass selected message as the third argument, using current stage/index. Extend existing reject helper with content:message and substitute content only in feedback.Show. Keep target.reject(input_player) once before Show, and ?DisplayTime := 2.0 unchanged. Existing reject branch conditions and correct branches remain identical. Do not add reject calls in stages2/4 or previously ignored paths.

Baseline: source hash EDC2A79F48A9C4B6E461A81F476F581323451BD9D2A7516F3C65A1AE1F211DCD for Prompt controller; shared data_target hash D8E8402EBE577206C825BDCED9E0F3E3604F9DA3288297BC8DC741CA10237639. Current source has generic wrong at line100, rejects at242/255/271 and helper273. Controller stage1 active[0,1,2] accepts0; stage3 active[1,4,5] accepts5; stage5 active[6,7,8] accepts6. Stage2 only3 and stage4 only5. Native051 evidence already preserves ordered nine target bindings. No new editor inspection needed.

Build and verification: inspect source diff for exact four messages/six mappings/fallback and unchanged three reject branches; confirm no state/reward/timing changes, shared source hash unchanged. Run native BuildAll once after implementation and capture diagnostics. Rebuild only for actual failure/repair. Editor-only project validation if supported; otherwise pending. No redundant unit harness that mirrors string branches and no game test. Owner manual checklist covers all six cases, retry, final8 DATA, badge and Replay.

Rollback: restore only the localized constants/helper/three caller arguments/reject signature+HUD argument from this change, preserving unrelated existing work.

Geometry exception: This narrow source edit changes only which explanatory message an already-existing rejection shows; it does not change layout, target correctness, progression, timing, interaction or mission mechanics. Under the documented small-code-change exception, no geometry regeneration or new map.yaml is needed. Existing051 map remains context, untouched; do not rewrite its approved/reviewed artifacts or treat it as new approval. Feature052 spec supplies player-visible copy intent and delegated Producer review supplies concrete content review.
