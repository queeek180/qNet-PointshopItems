ITEM.Name = 'Gas'
ITEM.Price = 750
ITEM.Model = 'models/props_junk/metalgascan.mdl'
ITEM.Bone = 'ValveBiped.Bip01_Spine2'
ITEM.SubCategory = "Backpacks"

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	model:SetModelScale(0.8, 0)
	pos = pos + (ang:Right() * 5) + (ang:Up() * 0) + (ang:Forward() * 2)

	local MAngle = Angle(90,0,-90)
	ang:RotateAroundAxis(ang:Forward(), MAngle.p)
	ang:RotateAroundAxis(ang:Up(), MAngle.y)
	ang:RotateAroundAxis(ang:Right(), MAngle.r)

	
	return model, pos, ang
end
