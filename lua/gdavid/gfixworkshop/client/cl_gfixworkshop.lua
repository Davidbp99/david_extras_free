/*---------------------------------------------------------
    CLIENTSIDE.
---------------------------------------------------------*/
if CLIENT then

    net.Receive("gFixWorkshop", function()
        local t = net.ReadTable()
        chat.AddText(unpack(t))
    end)





end