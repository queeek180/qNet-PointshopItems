ITEM.Name = 'Sentient Meat Hook'
ITEM.Price = 1000
ITEM.Model = 'models/props_junk/meathook001a.mdl'
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
	pos = pos + (ang:Forward() * 0) + (ang:Up() * 2) +  (ang:Right() * -10)
	local MAngle = Angle(-50,0,0)
	ang:RotateAroundAxis(ang:Forward(), MAngle.p)

	return model, pos, ang
end

