# Restricted prop references removed ? 2026-09-29

User supplied validation errors for cargo_circuit_carrier_a and cargo_circuit_predict_conveyor_a. Live find_actors confirmed exactly those two samples and their restricted WildEstate blueprint classes. Saved checkpoint, removed each through SceneTools.remove_from_scene (both returned true), and saved all affected assets (true). Re-query of cargo_circuit_ returned an empty array. No external-actor file was edited manually; git status no longer lists the two sample external-actor packages.

Fresh SessionToolset.StartSession completed successfully. This run passed local validation and cook; the returned game state was CanStart. This establishes the reported disallowed-reference launch failure is fixed, not that the new minigame is implemented. The new controller remains disabled/unbound; the legacy stations remain intact, and eligible replacement props still need selection.

Stopped the test session with StopSession. Final readbacks: GetGameState=Unconnected; GetSessionStatus=Disconnected. UEFN remains open.
