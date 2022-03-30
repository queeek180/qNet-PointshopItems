ITEM.Name = 'Harpoon'
ITEM.Price = 1000
ITEM.Model = 'models/props_junk/harpoon002a.mdl'
ITEM.Attachment = 'anim_attachment_head'
ITEM.SubCategory = "Accessories"

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	model:SetModelScale(0.5, 0)
	pos = pos + (ang:Forward() * -5) + (ang:Up() * 1)
	
	local MAngle = Angle(0,20,0)
	ang:RotateAroundAxis(ang:Up(), MAngle.y)
	
	return model, pos, ang
end

