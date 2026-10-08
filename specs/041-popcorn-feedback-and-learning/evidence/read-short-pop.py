import json,pathlib
p=pathlib.Path('specs/041-popcorn-feedback-and-learning/evidence');exec((p/'read-feasibility.py').read_text().split('if __name__')[0])
call('device-pop-wave-duration','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':{'refPath':'/Game/Sounds/Quests/SFX/Device/Device_Call_End_Pop_01.Device_Call_End_Pop_01'},'properties':['duration','bLooping','volume']})
call('balloon-pop-wave-duration','editor_toolset.toolsets.object.ObjectTools','get_properties',{'instance':{'refPath':'/Game/Sounds/Fort_Gadgets/Balloons/Balloon_Pop_01.Balloon_Pop_01'},'properties':['duration','bLooping','volume']})
