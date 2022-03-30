ITEM.Name = 'Super Slow'
ITEM.Price = 0
ITEM.Material = "icon16/cross.png"
ITEM.Description = "-20% speed, 1.2x points! WIP"
ITEM.AdminOnly = true

function ITEM:OnEquip(ply, itm)
	if ply:Team() != TEAM_HIDE then
		ply:SetWalkSpeed(GAMEMODE.CVars.SeekerWalkSpeed:GetInt() / 1.2)
		ply:SetRunSpeed(GAMEMODE.CVars.SeekerRunSpeed:GetInt() / 1.2)
	else
		ply:SetWalkSpeed(GAMEMODE.CVars.HiderWalkSpeed:GetInt() / 1.2)
		ply:SetRunSpeed(GAMEMODE.CVars.HiderRunSpeed:GetInt() / 1.2)
	end
	
      timer.Create("superslow_" ..ply:Nick(), 600, 0, function ()
      if ply:Team() == TEAM_SPECTATOR then return end
		 ply:PS_GivePoints(4)
		 ply:PS_Notify("You've been given a bonus 4", " ", PS.Config.PointsName, " !")
    end)
end

function ITEM:OnHolster(ply)
    timer.Destroy("superslow_" ..ply:Nick())
	if ply:Team() != TEAM_HIDE then
		ply:SetWalkSpeed(GAMEMODE.CVars.SeekerWalkSpeed:GetInt())
		ply:SetRunSpeed(GAMEMODE.CVars.SeekerRunSpeed:GetInt())
	else
		ply:SetWalkSpeed(GAMEMODE.CVars.HiderWalkSpeed:GetInt())
		ply:SetRunSpeed(GAMEMODE.CVars.HiderRunSpeed:GetInt())
	end
end

function ITEM:PlayerSpawn(ply, itm)
    timer.Simple(0.1, function()
        if (!IsValid(ply)) then
            return end

        self:OnEquip(ply, itm)
    end)
end

function ITEM:HASPlayerCaught(self, ply, itm)
	self:SetWalkSpeed(GAMEMODE.CVars.SeekerWalkSpeed:GetInt() / 1.2)
	self:SetRunSpeed(GAMEMODE.CVars.SeekerRunSpeed:GetInt() / 1.2)
end
