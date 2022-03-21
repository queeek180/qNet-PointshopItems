ITEM.Name = 'Disable Hider Trails'
ITEM.Price = 0
ITEM.Material = "icon16/cross.png"


function ITEM:OnEquip(ply, itm)
   timer.Create("nohidertrail_" ..ply:Nick(), 1, 0, function ()
      if !IsValid(ply.PS_Trail) or ply:Team() != TEAM_HIDE then return end
      SafeRemoveEntity(ply.PS_Trail)
    end)
end

function ITEM:OnHolster(ply)
    timer.Destroy("nohidertrail_" ..ply:Nick())
end

function ITEM:PlayerSpawn(ply, itm)
    timer.Simple(0.1, function()
        if (!IsValid(ply)) then
            return end

        self:OnEquip(ply, itm)
    end)
end
