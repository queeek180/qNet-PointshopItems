ITEM.Name = 'Disable Hider Pets'
ITEM.Price = 0
ITEM.Material = "icon16/cross.png"


function ITEM:OnEquip(ply, itm)
      timer.Create("nohiderpet_" ..ply:Nick(), 1, 0, function ()
      if !IsValid(ply:Fo_GetFollower(PS_Pet)) or ply:Team() != TEAM_HIDE then return end
      ply:Fo_RemoveFollower(ply.PS_Pet)
    end)
end

function ITEM:OnHolster(ply)
    timer.Destroy("nohiderpet_" ..ply:Nick())
end

function ITEM:PlayerSpawn(ply, itm)
    timer.Simple(0.1, function()
        if (!IsValid(ply)) then
            return end

        self:OnEquip(ply, itm)
    end)
end
