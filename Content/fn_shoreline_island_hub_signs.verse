using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

# Only static instructions; progression and station displays have separate owners.
fn_shoreline_island_hub_signs := class(creative_device):
    @editable
    core_legend:billboard_device = billboard_device{}
    @editable
    academy_title:billboard_device = billboard_device{}
    @editable
    path_garden_sign:billboard_device = billboard_device{}
    @editable
    path_water_label:billboard_device = billboard_device{}
    @editable
    path_plant_label:billboard_device = billboard_device{}
    @editable
    path_wait_label:billboard_device = billboard_device{}
    @editable
    path_harvest_label:billboard_device = billboard_device{}
    @editable
    path_return_sign:billboard_device = billboard_device{}
    @editable
    hub_route_sign:billboard_device = billboard_device{}
    @editable
    hub_loop_route:billboard_device = billboard_device{}
    @editable
    garden_repair_route:billboard_device = billboard_device{}
    @editable
    academy_journal_sign:billboard_device = billboard_device{}
    @editable
    signal_hub_route:billboard_device = billboard_device{}
    @editable
    energy_0_route:billboard_device = billboard_device{}
    academy_title_text<localizes>:message = "AI ISLAND ACADEMY\nSolo: restore Pix\nStart: 1 Workshop"
    path_garden_sign_text<localizes>:message = "OPTIONAL PROMPT ARENA\nSame Prompt badge\nShoot glowing cores to the LEFT"
    path_water_label_text<localizes>:message = "1  SCAN BLUE CORE"
    path_plant_label_text<localizes>:message = "2  CHOOSE THE CORE"
    path_wait_label_text<localizes>:message = "3  FIND THE REACTOR"
    path_harvest_label_text<localizes>:message = "4  SEND TO PIX"
    path_return_sign_text<localizes>:message = "RETURN TO HUB\nUse the button"
    hub_route_sign_text<localizes>:message = "START: 1 PROMPT WORKSHOP\nFollow the teal path to inspect the clue."
    hub_loop_route_text<localizes>:message = "2 PATTERN SCANNER >\nShoot the missing symbol"
    garden_repair_route_text<localizes>:message = "1 PROMPT WORKSHOP\nTell Pix WHAT, WHICH ONE, WHERE\nFollow the teal path"
    academy_journal_sign_text<localizes>:message = "MY AI CORE JOURNAL\nSee your personal module status\nUse the button below"
    signal_hub_route_text<localizes>:message = "3 AI CLASSIFIER >\nShoot the category"
    energy_0_route_text<localizes>:message = "4 CONFIDENCE CORE\nCheck Pix's claim. Cool, then check again.\nFollow the wide path southwest."
    core_legend_text<localizes>:message = "PIX AI CORE\nRestore eight abilities.\nFollow the numbered lessons."
    refreshed_text<localizes>(text:message):message = "{text} "

    OnBegin<override>()<suspends>:void =
        Hide()
        for (retired_label : array{path_water_label, path_plant_label, path_wait_label, path_harvest_label}):
            retired_label.HideText()
        var alternate:logic = false
        loop:
            signs := array{core_legend, academy_title, path_garden_sign, path_return_sign, hub_route_sign, hub_loop_route, garden_repair_route, academy_journal_sign, signal_hub_route, energy_0_route}
            texts := array{core_legend_text, academy_title_text, path_garden_sign_text, path_return_sign_text, hub_route_sign_text, hub_loop_route_text, garden_repair_route_text, academy_journal_sign_text, signal_hub_route_text, energy_0_route_text}
            for (index -> sign : signs, text := texts[index]):
                if (alternate?):
                    sign.SetText(refreshed_text(text))
                else:
                    sign.SetText(text)
                sign.ShowText()
                sign.UpdateDisplay()
            if (alternate?):
                set alternate = false
            else:
                set alternate = true
            Sleep(3.0)
