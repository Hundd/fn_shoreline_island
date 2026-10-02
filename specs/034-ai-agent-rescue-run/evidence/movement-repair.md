# Movement repair

The first cooked rifle-driven delivery attempt selected Medical correctly, but after approximately 5.5 seconds restored home and gave no credit. Instrumented recook reproduced `RESCUE: movement failure ROBOT endpoint` at 2026-10-02 12:07:59 UTC. No robot/cargo/label TeleportTo failure branch fired.

The frame loop called transacting TeleportTo inside `not`, which rolls back the successful call in Verse's failure context. All three motion calls now use positive success branches with explicit failure handling. Endpoint and physical cargo checks remain intact. BuildAll returned an empty diagnostic array after this repair. Cooked verification of repaired travel remains pending.
