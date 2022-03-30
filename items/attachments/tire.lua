ITEM.Name = 'Tire'
ITEM.Price = 500
ITEM.Model = 'models/props_vehicles/carparts_tire01a.mdl'
ITEM.Bone = 'ValveBiped.Bip01_Spine2'
ITEM.SubCategory = "Backpacks"

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	model:SetModelScale(0.6, 0)
	pos = pos + (ang:Right() * 5) + (ang:Up() * 0) + (ang:Forward() * 2)
	
	return model, pos, ang
end
