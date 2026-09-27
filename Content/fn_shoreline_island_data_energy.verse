using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/SpatialMath }

data_orb_delivery := class:
    origin:vector3
    generation:int

# One shared Data Energy ledger and five reusable world orbs for the academy.
# Controllers validate a meaningful hit before awarding. Wrong hits never call
# this manager. Visual deliveries queue without delaying mission progress.
fn_shoreline_island_data_energy := class(creative_device):
    @editable
    configured:logic = false
    @editable
    meter:hud_message_device = hud_message_device{}
    @editable
    round_settings:round_settings_device = round_settings_device{}
    @editable
    receiver:creative_prop = creative_prop{}
    @editable
    orb_a:creative_prop = creative_prop{}
    @editable
    orb_b:creative_prop = creative_prop{}
    @editable
    orb_c:creative_prop = creative_prop{}
    @editable
    orb_d:creative_prop = creative_prop{}
    @editable
    orb_e:creative_prop = creative_prop{}

    var energy:[player]int = map{}
    var deliveries:[]data_orb_delivery = array{}
    var generation:int = 0
    ResetEvent:event() = event(){}
    energy_text<localizes>(amount:int):message = "DATA ENERGY\n{amount} DATA"

    orbs()<transacts>:[]creative_prop = array{orb_a, orb_b, orb_c, orb_d, orb_e}

    OnBegin<override>()<suspends>:void =
        Hide()
        if (not configured?):
            return
        reset()
        round_settings.RoundBeginEvent.Subscribe(reset)
        GetPlayspace().PlayerAddedEvent().Subscribe(on_join)
        GetPlayspace().PlayerRemovedEvent().Subscribe(on_leave)
        loop:
            if (delivery := deliveries[0]):
                if (remaining := deliveries.Slice[1]):
                    set deliveries = remaining
                if (delivery.generation = generation):
                    for (index -> orb : orbs()):
                        spawn { fly_orb(orb, index, delivery) }
                    Sleep(1.1)
            else:
                Sleep(0.05)

    award(input_player:player, value:int, origin:vector3):void =
        if (not configured? or value <= 0):
            return
        var amount:int = value
        if (previous := energy[input_player]):
            set amount += previous
        if (set energy[input_player] = amount) {}
        meter.Show(input_player, energy_text(amount), ?DisplayTime := 0.0)
        set deliveries += array{data_orb_delivery{origin := origin, generation := generation}}

    reset():void =
        ResetEvent.Signal()
        set generation += 1
        set energy = map{}
        set deliveries = array{}
        for (orb : orbs()):
            if (orb.TeleportTo[orb.GetTransform()]) {}
            orb.Hide()
        for (input_player : GetPlayspace().GetPlayers()):
            meter.Show(input_player, energy_text(0), ?DisplayTime := 0.0)

    on_join(input_player:player):void =
        var amount:int = 0
        if (previous := energy[input_player]):
            set amount = previous
        meter.Show(input_player, energy_text(amount), ?DisplayTime := 0.0)

    on_leave(input_player:player):void =
        var remaining:[player]int = map{}
        for (other -> amount : energy, other <> input_player):
            if (set remaining[other] = amount) {}
        set energy = remaining

    fly_orb(orb:creative_prop, index:int, delivery:data_orb_delivery)<suspends>:void =
        race:
            animate_orb(orb, index, delivery)
            ResetEvent.Await()

    animate_orb(orb:creative_prop, index:int, delivery:data_orb_delivery)<suspends>:void =
        if (delivery.generation <> generation):
            return
        var pose:transform = orb.GetTransform()
        set pose.Translation = delivery.origin + vector3{Y := (index * 45.0) - 90.0, Z := 80.0}
        if (orb.TeleportTo[pose]):
            orb.Show()
            set pose.Translation = pose.Translation + vector3{Z := 70.0}
            orb.MoveTo(pose, 0.2)
            if (delivery.generation <> generation):
                return
            set pose.Translation = receiver.GetTransform().Translation + vector3{Z := 80.0}
            orb.MoveTo(pose, 0.6)
            if (delivery.generation = generation):
                orb.Hide()
