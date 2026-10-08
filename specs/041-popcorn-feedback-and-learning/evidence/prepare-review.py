from pathlib import Path
import yaml, json, copy
p=Path('specs/041-popcorn-feedback-and-learning'); p.mkdir(exist_ok=True); (p/'evidence').mkdir(exist_ok=True)
d=yaml.safe_load(Path('specs/040-popcorn-spacing-and-finish/map.yaml').read_text())
d['map']['id']='popcorn_feedback_and_learning'; d['map']['title']='Popcorn Parkour: hear the hit, see the pulse, understand the skill'; d['map']['source_feature']=str(p/'spec.md').replace('\\','/')
d['map']['learning_objective']='An instruction is one action; order matters; a named skill groups LOAD, HEAT, POP and repeats those instructions at each new machine. Jumping checks the created result.'
c=next(x for x in d['devices'] if x['id']=='controller'); old=c['settings']; contract=copy.deepcopy(old['course_contract']); contract['status']='existing_mirrored_040_route_preserved'; contract['coordinate_provenance']='Saved production source and feature040 final-native-readback; no fresh editor measurement in041.'; contract.pop('adapter_gate',None)
c['source']='Existing PopBridge controller/production source; native bindings in039 evidence,040 saved readback. Inspect before editing.'
c['settings']={'reuse_existing':True,'course_contract':contract,'scope':'Presentation only; zero receiver/deck/ramp/hit-surface relocation;040 spacing, full hide, finished free movement preserved','learning_content_file':'learning-content.yaml','feedback_contract':{'accepted_only':'fixtures.shot results1/2; never raw gun event','onset_target_seconds':0.15,'halo_seconds':0.5,'halo_lifetime':'Independent controller-owned per-receiver VFX; does not participate in target deactivate/refresh','audio':'Reuse target.hit_sound.Play(agent) from accept; bind one short nonlooping pop per receiver; live asset/settings unresolved','outcome':'Existing flourish only on fixtures.complete success; no extra reward authority'},'presentation_adapter':'Planned scoped PopBridge lesson arbitration and halo cancellation; currently absent. Reuse existing feedback/ribbon/journal; no generic configurable lesson engine claimed.'}
for x in d['devices']:
    if x['id']=='targets':
        x['source']='Existing eight mission_id39 damage targets; exact040 positions preserved'; x['settings']={'reuse_existing':True,'target_ids':list(range(8)),'no_surface_change':True,'hit_sound':'Existing editable hook, currently unverified binding; do not treat default device{} as configured','hit_flash':'Existing hook ends on deactivate; do not bind independent halo here'}
    elif x['id']=='props':
        x['source']='Existing seven decks, ramp and stylized decor, preserved; count1 is inventory group, no spawn'; x['settings']={'reuse_existing':True,'deck_count':7,'no_transform_delta':True,'no_mesh_collision_delta':True}
    elif x['id']=='controls':
        x['source']='Existing Replay and both Returns'; x['settings']={'reuse_existing':True,'count_meaning':'Replay plus entry Return plus finish Return','preserve':'Existing permissions/ownership/teleport/reset'}
d['devices'] += [
{'id':'learning_hud','class':'hud_message_device','count':1,'source':'Existing controller.feedback native binding from039; reuse, layout inspect required','settings':{'reuse_existing':True,'queue':'None; replace current owner card directly','display':'Persistent until meaningful event/release; retry override2s; three short lines maximum','placement_intent':'Lower-left card x4%,y78%,width42%, bottom safe margin8%; aim centre and Academy top HUD clear; journal masks card'}},
{'id':'hit_halos','class':'vfx_creator_device','count':8,'source':'Proposed separate per-receiver cosmetic lifecycle; inspect reusable native pulse assets first; asset unknown','settings':{'reuse_before_create':True,'per_receiver':list(range(8)),'on_seconds':0.5,'shape':'Hollow glowing annulus expands once from0.65m to0.9m diameter, no solid fill; receiver plane, centre at saved target position','collision':'None','strobe':'No flashing repetition','detach_lifetime':True,'reset':'Stop all on release/replay/return/round/departure; per-effect epoch prevents old task ending a new pulse'}},
{'id':'hit_audio','class':'audio_player_device','count':8,'source':'Bind existing target.hit_sound hook; inspect/reuse eight distinct positioned players; proposed count, no native presence claim','settings':{'reuse_before_create':True,'duration_max_seconds':0.2,'looping':False,'autoplay':False,'instigator_only':True,'attenuation_intent':'spatial origin receiver, full within6m/fade to zero by12m; tune supported native properties at live inspection','volume_intent':'Start normalized0.35; audible below gunfire with no sharp peaks; verify cooked mix','concurrency':'One per target accepted event, global min gap0.15s cosmetic only; reject held repeats and stop all on cancellation'}}]
d['zones'][0]['devices'] += ['learning_hud','hit_halos','hit_audio']; d['zones'][0]['purpose']='Existing shooting/jumping bay; learn-by-doing with contextual HUD and recipe, eight cosmetic hit pulses; no new walking or lesson room.'
for m in d['markers']:
    if m['kind'] in ['target','checkpoint','reward']: m['source']='Preserved040 mirrored local annotation; current production source for nodes;040 native readback for teaching receivers. No fresh041 live measurement.'
    elif m['id']=='ribbon': m['source']='Existing ribbon annotation; HUD gives persistent recipe from every landing; physical readable placement remains live check.'
for s in d['stages']:
    s['purpose']={'teach_load':'One instruction performs one action: LOAD','teach_heat':'Instructions have an order: HEAT after LOAD','teach_pop':'POP completes three steps and saves PopBridge on commit','first_reuse':'One invocation runs the saved three steps; actual landing checks result','course_routes':'Same skill at another machine; either path valid; actual jumping checks built output','finale':'One skill made many bridges; existing reward only after finish commit'}[s['id']]
#040 hiding: active inventory excludes already accepted teaching receivers.
d['stages'][1]['active_targets']=['target_1','target_2']; d['stages'][2]['active_targets']=['target_2']
d['assumptions']=[
{'id':'a01_existing_route','status':'resolved','detail':'Preserve seven nodes, seven edges, eight receivers, two equal branches, 1m gaps,040160cm teaching centres and full hide/free finish. No new geometry choice.','evidence':'Current production source;040 evidence/implementation.md and final-native-readback.json; owner reports successful playtest2026-10-08.'},
{'id':'a02_halo_asset','status':'open','detail':'Exact supported native VFX asset/configuration and eight reusable candidates must be inspected. Must show hollow0.5s pulse independently of target deactivate and instruction/flourish lifecycles; no asset path invented.','evidence':'No live Unreal MCP tools in current session; data_target.accept starts hit_flash but deactivate/activate ends it.'},
{'id':'a03_pop_audio','status':'open','detail':'Exact short pop asset and target.hit_sound bindings, instigator-only play/stop and attenuation/volume schema need live discovery. Distinct positioned players avoid relocating shared audio or stacking two pops.','evidence':'Source editable hook exists; no readback proves a Popcorn audio asset is bound.'},
{'id':'a04_hud_layout','status':'open','detail':'Inspect feedback HUD layer/anchor/scale, Academy HUD and journal open state; verify proposed persistent3-line card and journal suppression are supported and legible on actual standing views.','evidence':'Existing feedback native ref in039 binding checkpoint; source show uses1s; no current screen/layout measurement.'}]
(p/'map.yaml').write_text(yaml.safe_dump(d,sort_keys=False,allow_unicode=True),encoding='utf-8')
rows=[
('entry','Existing mission board at arrival; also starter card when owner acquired','A skill is a few steps you can use again.','Build PopBridge: shoot LOAD.'),
('load','Accepted LOAD (fixture result1, prefix1)','LOAD puts in a kernel. One instruction, one action.','Next: shoot HEAT.'),
('heat','Accepted HEAT (fixture result1, prefix2)','HEAT warms the kernel. Steps work in order.','Next: shoot POP.'),
('pop_pending','Accepted teaching POP, before commit','POP releases the popcorn.','Running POP; wait for the platform.'),
('saved','Teaching POP successfully commits first platform','POP made popcorn. Three steps are saved as one skill!','Jump onto your popcorn.'),
('land_first','Actual accepted starter -> first landing','You used the popcorn you made. Now reuse the skill.','Shoot PopBridge to make the next one.'),
('reuse_first_pending','Accepted target3 invocation, before commit','One shot runs all three saved steps.','Running LOAD > HEAT > POP.'),
('reuse_first_done','Target3 commit','One shot ran all three saved steps.','Jump onto the new popcorn.'),
('land_reuse','Actual accepted first -> reuse landing','Same steps, another bridge. You checked the result by jumping.','Shoot PopBridge at the next machine.'),
('reuse_fork_pending','Accepted target4 invocation','Same skill, new machine.','Running LOAD > HEAT > POP.'),
('reuse_fork_done','Target4 commit','The same steps made another bridge.','Jump to the wide popcorn landing.'),
('land_fork','Actual accepted reuse -> fork landing','Pick either path. Both use the same skill.','Shoot the moustache or bucket machine.'),
('branch_pending','Accepted target5 or6 invocation','Your chosen machine runs the same three steps.','Running LOAD > HEAT > POP.'),
('branch_done','Target5 or6 commit','Same skill, a different popcorn surprise!','Jump onto your chosen popcorn.'),
('land_branch','Actual accepted fork -> left or right landing','Different path, same skill. Your instructions still work.','Jump onto the finish landing.'),
('land_finish','Actual accepted left/right -> finish landing','Use PopBridge once more. A skill can be reused many times.','Shoot the final machine.'),
('final_pending','Accepted target7, valid final landing and branch','The final machine runs the same saved steps.','Running LOAD > HEAT > POP.'),
('final_done','Target7 successful commit; existing reward','One skill. Many bridges! You saved three steps and reused them.','Try Replay, Return, or keep jumping.'),
('wrong_order','Fixture result3, retain actual prefix','Steps work in order. Your finished steps are safe.','Next: {LOAD|HEAT|POP from current prefix}.'),
('recovery','Successful existing recovery teleport, unfinished only','Missed the jump? Your skill and bridges are safe.','Try the jump again.'),
('recovery_fail','Existing recovery teleport failure','Your bridges are safe. Trying your last landing again.','Return is available.'),
('wrong_position','Current owner valid shot rejected for landing/progression','Use the machine from your last completed landing.','Next: {action from current committed state}.'),
('consumed','Fixture result4 if reachable; no pulse','Already popped. Your bridge stays.','Next: {action from current committed state}.')]
content={'version':1,'lesson_card':'Lesson line + recipe/status line + next action; no quiz or delay','recipe_before_commit':'Draft: LOAD > HEAT > POP ({accepted prefix}/3).','recipe_after_commit':'PopBridge = LOAD > HEAT > POP.','rows':[{'id':a,'trigger':b,'lesson':c,'action':e} for a,b,c,e in rows],'timing':{'base':'Persistent until next meaningful event; no enforced reading time or queued captions','retry_seconds':2.0,'instruction_beats_seconds':0.25,'accepted_halo_seconds':0.5,'audio_max_seconds':0.2,'accepted_onset_target_seconds':0.15},'priority':['Release/round/Return/departure hides all and invalidates epochs','Journal open masks lesson card; closing renders current state without replaying sound/halo','Recovery or rejection action overrides for2s; newer actual accepted shot/commit/landing replaces immediately','Accepted event/commit/changed accepted landing updates base card','Repeated monitor/report_state calls update journal only; never redraw base card or extend override timer'],'cancel':'Owner+attempt generation+round+lesson epoch; no speech/message queue; stale timers never restore old stage card'}
(p/'learning-content.yaml').write_text(yaml.safe_dump(content,sort_keys=False,allow_unicode=True),encoding='utf-8')
print(p)
