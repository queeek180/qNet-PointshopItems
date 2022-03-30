ITEM.Name = 'Cleaver'
ITEM.Price = 1000
ITEM.Model = 'models/props_lab/cleaver.mdl'
ITEM.Attachment = 'anim_attachment_head'
ITEM.SubCategory = "Accessories"

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	local Size = Vector(0.60000002384186,0.60000002384186,0.60000002384186)
	local mat = Matrix()
	mat:Scale(Size)
	model:EnableMatrix('RenderMultiply', mat)

	model:SetMaterial('')

	local MAngle = Angle(300,120,10)
	local MPos = Vector(-6,-14,-5.5)

	pos = pos + (ang:Forward() * MPos.x) + (ang:Up() * MPos.z) + (ang:Right() * MPos.y)
	ang:RotateAroundAxis(ang:Forward(), MAngle.p)
	ang:RotateAroundAxis(ang:Up(), MAngle.y)
	ang:RotateAroundAxis(ang:Right(), MAngle.r)

	return model, pos, ang
end

