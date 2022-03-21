ITEM.Name = 'Blue'
ITEM.Price = 5000
ITEM.Material = 'trails/blue.vmt'
ITEM.Trail = 'blue'
ITEM.SubCategory = "Anime"

function ITEM:OnEquip(ply, modifications)
   timer.Create("PS_Trail_" ..ply:Nick(), 1, 0, function ()
   if IsValid(ply.PS_Trail) or ply:Team() == TEAM_SPECTATOR or timer.Exists("nohidertrail_" ..ply:Nick()) and ply:Team() != TEAM_SEEK then return end
   if (!IsValid(ply)) then return end
		self.Trail = util.SpriteTrail(ply, 0, modifications.color, false, 15, 1, 4, 0.125, self.Material)		ply.PS_Trail = self.Trail
   end)
end

function ITEM:OnHolster(ply)
	timer.Destroy("PS_Trail_" ..ply:Nick())
	SafeRemoveEntity(ply.PS_Trail)
end

function ITEM:Modify(modifications)
	PS:ShowColorChooser(self, modifications)
end

function ITEM:OnModify(ply, modifications)
	SafeRemoveEntity(ply.PS_Trail)
	self:OnEquip(ply, modifications)
end
