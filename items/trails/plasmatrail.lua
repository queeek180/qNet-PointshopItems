ITEM.Name = 'Plasma'
ITEM.Price = 2500
ITEM.Trail = 'plasma'
ITEM.Material = 'trails/plasma.vmt'
ITEM.SubCategory = "Effects"

function ITEM:OnEquip(ply, modifications)
	self.Trail = util.SpriteTrail(ply, 0, modifications.color, false, 15, 1, 4, 0.125, self.Material)		
	ply.PS_Trail = self.Trail
	if ply:Team() == TEAM_SPECTATOR or ply:PS_HasItemEquipped("hidertrails") and ply:Team() != TEAM_SEEK then
		ply.PS_Trail:SetNoDraw(true)
	end
end

function ITEM:OnHolster(ply)
	SafeRemoveEntity(ply.PS_Trail)
end

function ITEM:Modify(modifications)
	PS:ShowColorChooser(self, modifications)
end

function ITEM:OnModify(ply, modifications)
	SafeRemoveEntity(ply.PS_Trail)
	self:OnEquip(ply, modifications)
end

function ITEM:HASSpawnAsSpectator(ply)
	if ply:Team() == TEAM_SPECTATOR then
		ply.PS_Trail:SetNoDraw(true)
	end
end
