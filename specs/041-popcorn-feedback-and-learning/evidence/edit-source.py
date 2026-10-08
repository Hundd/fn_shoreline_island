"""Scoped source edits and regeneration; no tests or editor operations."""
from pathlib import Path
root = Path.cwd()
p = root/'tools/build_popbridge_production.py'
s = p.read_text(encoding='utf-8')
s = s.replace("specs/039-popcorn-parkour/map.yaml", "specs/041-popcorn-feedback-and-learning/map.yaml")
s = s.replace("('course_flourishes','vfx_creator_device',8)","('course_flourishes','vfx_creator_device',8),('course_hit_halos','vfx_creator_device',8)")
s = s.replace('course_flourishes.Length <> 8 or course_decor', 'course_flourishes.Length <> 8 or course_hit_halos.Length <> 8 or course_decor')
s = s.replace('        return 0\n\n    claim_owner', '''        for (index -> halo : course_hit_halos):
            if (halo.GetTransform().Translation = vector3{}):
                return 9000 + index
            for (other_index -> other : course_hit_halos):
                if (index <> other_index, halo = other):
                    return 9100 + index
            for (effect : course_instructions + course_puffs + course_flourishes):
                if (halo = effect):
                    return 9200 + index
        for (index -> target : course_targets):
            if (target.hit_sound.GetTransform().Translation = vector3{}):
                return 9300 + index
            for (other_index -> other : course_targets):
                if (index <> other_index, target.hit_sound = other.hit_sound):
                    return 9400 + index
        return 0

    claim_owner''')
s = s.replace('text("PopBridge: LOAD > HEAT > POP. Shoot, then jump onto what you make.")', 'text(card_for(lesson_id))')
s = s.replace("        geometry_changed()\n'''.splitlines()", """        geometry_changed()
        mission_board.SetText(text(card_for("entry")))
        mission_board.ShowText()
        mission_board.UpdateDisplay()
        final_board.SetText(text("START AT LOAD ->\\\\nFollow the ramp."))
        final_board.ShowText()
        final_board.UpdateDisplay()
        set_ribbon("Draft: LOAD > HEAT > POP (0/3). Next: LOAD.")
'''.splitlines()""")
# Earlier OnBegin fixed strings would overwrite reset_presentation; replace them.
s = s.replace('POPCORN PARKOUR -> ramp. Shoot LOAD HEAT POP. Jump onto what you make.', 'A skill is a few steps you can use again.\\\\nBuild PopBridge: shoot LOAD. Follow the ramp.')
tail = "(root/'Content/fn_shoreline_island_popbridge_production.verse').write_text"
addition = '''learning = yaml.safe_load((root/'specs/041-popcorn-feedback-and-learning/learning-content.yaml').read_text(encoding='utf-8'))
lines += (root/'tools/popbridge_presentation.verse.txt').read_text(encoding='utf-8').splitlines()
import json
lines += ['', '    lesson_line(event_id:string):string =']
for row in learning['rows']:
    lines += [f'        if (event_id = {json.dumps(row["id"])}):']
    if row['id'] == 'recovery':
        lines += ['            if (recipe_saved?):', '                return '+json.dumps(learning['recovery_saved_variant'])]
    lines += ['            return '+json.dumps(row['lesson'])]
lines += ['        return ""', '', '    action_line(event_id:string):string =']
for row in learning['rows']:
    lines += [f'        if (event_id = {json.dumps(row["id"])}):']
    if row['id'] == 'wrong_order':
        lines += ['            return "Next: {instruction_name(state.prefix)}."']
    elif row['id'] in {'wrong_position','consumed'}:
        lines += ['            return "Next: {action_line(lesson_id)}"']
    else:
        lines += ['            return '+json.dumps(row['action'])]
lines += ['        return ""']
'''
s = s.replace(tail,addition+tail)
p.write_text(s,encoding='utf-8')
q = root/'tools/popbridge_presentation.verse.txt'
s = q.read_text()
s = s.replace('        set recipe_saved = false\n        set last_rejection','        set presentation_owner = option{input_player}\n        set recipe_saved = false\n        set last_rejection')
q.write_text(s,encoding='utf-8')
