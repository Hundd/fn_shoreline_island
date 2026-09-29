# Target trigger settings — 2026-09-29

Read-only live UEFN inspection used the 15 ordered `hitSurface` actor paths from `target-readback-2026-09-29.json`. `ObjectTools.list_properties` exposed the native Trigger device fields; serialized `ObjectTools.get_properties` on every actor returned identical settings:

| Target indices | triggeredByPlayer | triggeredByDamage | triggeredByItems | bReceiveDamageWhenInvisible |
|---|---:|---:|---:|---:|
| 0–14 | false | true | false | true |

The native schema describes `triggeredByDamage` as activating when damaged and `bReceiveDamageWhenInvisible` as permitting damage while hidden. These settings match the intended shot-only, invisible hit surfaces and avoid player proximity activation. This is saved-editor configuration evidence, not a cooked rifle trace or proof of agent attribution. AC-02/03/04/08 remain open until shots are observed in Fortnite.
