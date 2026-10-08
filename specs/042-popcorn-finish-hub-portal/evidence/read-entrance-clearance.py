import json,pathlib
p=pathlib.Path('specs/042-popcorn-finish-hub-portal/evidence');exec((p/'read-only-placement.py').read_text().split('if __name__')[0]);refs=json.loads((p/'known-native-refs.json').read_text())
call('teleporter-native-current-settings','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':refs['hub_destination'],'properties':['overlapCapsule','enabledDuringPhase','knob_TeleporterGroup','knob_TargetTeleporterGroup','teleporter Rift Visible','playVisualEffect','playSoundEffects','face Player In Teleporter Direction','maintainMomentumDuringTeleportToEvent','destinationTeleporter']})
call('finish-deck-native-bounds','editor_toolset.toolsets.actor.ActorTools','get_actor_bounds',{'actor':refs['finish_deck']})
