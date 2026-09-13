using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

# Only static instructions; progression and station displays have separate owners.
fn_shoreline_island_hub_signs := class(creative_device):
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
    academy_title_text<localizes>:message = "BYTE ISLAND ACADEMY"
    path_garden_sign_text<localizes>:message = "PATH GARDEN\nWater > Plant > Wait > Harvest"
    path_water_label_text<localizes>:message = "1  WATER"
    path_plant_label_text<localizes>:message = "2  PLANT"
    path_wait_label_text<localizes>:message = "3  WAIT"
    path_harvest_label_text<localizes>:message = "4  HARVEST"
    path_return_sign_text<localizes>:message = "RETURN TO HUB\nUse the button"
    hub_route_sign_text<localizes>:message = "PATH GARDEN\nAhead to the buttons"
    hub_loop_route_text<localizes>:message = "LOOP LAGOON >"
    garden_repair_route_text<localizes>:message = "GARDEN REPAIR\nOptional: fix a program\nFollow the teal path"
    academy_journal_sign_text<localizes>:message = "MY RESTORATION JOURNAL\nUse the button below"
    signal_hub_route_text<localizes>:message = "SIGNAL LIGHTHOUSE >\nGuide cargo to help the academy."
    energy_0_route_text<localizes>:message = "VARIABLE VAULT\nPower the academy.\nFollow the wide path southwest."
    refreshed_text<localizes>(text:message):message = "{text} "

    OnBegin<override>()<suspends>:void =
        Hide()
        var alternate:logic = false
        loop:
            signs := array{academy_title, path_garden_sign, path_water_label, path_plant_label, path_wait_label, path_harvest_label, path_return_sign, hub_route_sign, hub_loop_route, garden_repair_route, academy_journal_sign, signal_hub_route, energy_0_route}
            texts := array{academy_title_text, path_garden_sign_text, path_water_label_text, path_plant_label_text, path_wait_label_text, path_harvest_label_text, path_return_sign_text, hub_route_sign_text, hub_loop_route_text, garden_repair_route_text, academy_journal_sign_text, signal_hub_route_text, energy_0_route_text}
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

