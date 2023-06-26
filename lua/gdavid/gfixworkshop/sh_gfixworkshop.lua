gFixWorkshop = {} or gFixWorkshop
gFixWorkshop.config = {} or gFixWorkshop.config
gFixWorkshop.config.GlobalMessage = "[gFixWorkshop] "

-- https://steamcommunity.com/sharedfiles/filedetails/?id=2097133231
-- You can run the jetpack fix on jobs.lua OnPlayerChangedTeam + playerspawn

gFixWorkshop.config.JetPackTeamFix = true
gFixWorkshop.config.JetPackTeamFixMessageSend = false
gFixWorkshop.config.JetPackTeamFixMessage = " You lost your jetpack as you changed job"

gFixWorkshop.config.JetPackTeamFixAutoEquip = false
gFixWorkshop.config.JetPackTeamFixAutoEquipMessageSend = false
gFixWorkshop.config.JetPackTeamAutoEquipFixMessage = " Your jetpack was added on you"

gFixWorkshop.config.JetPackTeamFixTeams = {
    ["Teams_1"] = "MK2",
    ["Teams_2"] = "MK1",
}

/*---------------------------------------------------------
OnPlayerChangedTeam = function(ply)
        if gFixWorkshop.config.JetPackTeamFix == true then
                local jet = ply:GetNWEntity("Jetted")
                if not IsValid(jet) then return end
                jet:Remove()
            -- Send the message.
            if gFixWorkshop.config.JetPackTeamFixMessageSend then
                net.Start("gFixWorkshop")
                    net.WriteTable({Color(105, 50, 150),gFixWorkshop.config.GlobalMessage, ply:Name() .. gFixWorkshop.config.JetPackTeamFixMessage})
                net.Send(ply)
            end 
            
    end
end

if you dont want to use my extra checks and chat prints. Then this is the max you really need
    -- Place these on teams that should not have it
OnPlayerChangedTeam = function(ply)
                local jet = ply:GetNWEntity("Jetted")
                if not IsValid(jet) then return end
                jet:Remove()    
end
-- Place this on teams that should spawn with it
    PlayerSpawn = function(ply)
            local ex = ply:GetNWEntity('Jetted')
    if IsValid(ex) then
        ex:Remove()
        ply:SetNWEntity('Jetted',NULL)
    else
        local jp = ents.Create('mk7') -- update this to the name of the ent. So mk1 for jet_mk1
        jp:SetSlotName('mk7') -- update this to the name of the ent. So mk1 for jet_mk1
        jp:Spawn()
        jp:Attach(ply)
        ply.Jetted = jp
        ply:SetNWEntity('Jetted',jp)
    end
    ply:EmitSound('buttons/button14.wav')
    end
---------------------------------------------------------*/

