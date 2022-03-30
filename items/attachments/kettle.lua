ITEM.Name = 'Kettle'
ITEM.Price = 500
ITEM.Model = 'models/props_interiors/pot01a.mdl'
ITEM.Attachment = 'anim_attachment_head'
ITEM.SubCategory = "Heads, Hats & Masks"

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	local Size = Vector(0.80000001192093,0.80000001192093,0.80000001192093)
	local mat = Matrix()
	mat:Scale(Size)
	model:EnableMatrix('RenderMultiply', mat)

	model:SetMaterial('')

	local MAngle = Angle(300,180,0)
	local MPos = Vector(0,-8,3)

	pos = pos + (ang:Forward() * MPos.x) + (ang:Up() * MPos.z) + (ang:Right() * MPos.y)
	ang:RotateAroundAxis(ang:Forward(), MAngle.p)
	ang:RotateAroundAxis(ang:Up(), MAngle.y)
	ang:RotateAroundAxis(ang:Right(), MAngle.r)

	return model, pos, ang
end

