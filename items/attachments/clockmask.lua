ITEM.Name = 'Clock Mask'
ITEM.Price = 250
ITEM.Model = 'models/props_c17/clock01.mdl'
ITEM.Attachment = 'eyes'
ITEM.SubCategory = "Heads, Hats & Masks"

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	ang:RotateAroundAxis(ang:Right(), -90)
	
	return model, pos, ang
end
