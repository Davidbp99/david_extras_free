--[[---------------------------------------------------------
    SERVERSIDE.
---------------------------------------------------------]]
if SERVER then
    hook.Add("OnPlayerChangedTeam", "gFixWorkshop:RemoveOnJobChange", function(player, oldTeam, newTeam)
        if gFixWorkshop.config.JetPackTeamFix == true then
                local jet = player:GetNWEntity("Jetted")
                if not IsValid(jet) then return end
                jet:Remove()
            -- Send the message.
            if gFixWorkshop.config.JetPackTeamFixMessageSend then
                net.Start("gFixWorkshop")
                    net.WriteTable({Color(105, 50, 150),gFixWorkshop.config.GlobalMessage, player:Name() .. gFixWorkshop.config.JetPackTeamFixMessage})
                net.Send(player)
            end 
            
    end
end)


hook.Add("PlayerSpawn", "gFixWorkshop:AddJetPackOnSpawn", function(ply)
    if gFixWorkshop.config.JetPackTeamFixAutoEquip == true then
        -- here we grab the team and mk for later
        for k, v in pairs(gFixWorkshop.config.JetPackTeamFixTeams) do
            if ply:Team() == k then
                local ex = ply:GetNWEntity('Jetted')

                if IsValid(ex) then
                    ex:Remove()
                    ply:SetNWEntity('Jetted', NULL)
                else
                    local jp = ents.Create(v) 
                    jp:SetSlotName(v)
                    jp:Spawn()
                    jp:Attach(ply)
                    ply.Jetted = jp
                    ply:SetNWEntity('Jetted', jp)
                end

                ply:EmitSound('buttons/button14.wav')

                -- Send the message.
                if gFixWorkshop.config.JetPackTeamFixMessageSend then
                    net.Start("gFixWorkshop")

                    net.WriteTable({Color(105, 50, 150), gFixWorkshop.config.GlobalMessage, player:Name() .. gFixWorkshop.config.JetPackTeamAutoEquipFixMessage})

                    net.Send(ply)
                end
            end
        end
    end
end)

    --[[---------------------------------------------------------
        Networking.
    ---------------------------------------------------------]]
    util.AddNetworkString("gFixWorkshop")
end