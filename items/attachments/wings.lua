ITEM.Name = 'Wings'
ITEM.Price = 2500
ITEM.Model = 'models/sinful/angel_wings.mdl'
ITEM.Attachment = 'chest'
ITEM.NoPreview = true
ITEM.SubCategory = "Backpacks"

function ITEM:OnEquip(ply, modifications, model)
	if !IsValid(ply.wings) then
		local ent = ents.Create( "wings_color")
		ent:SetPos(ply:GetPos())
		ent:Spawn()
		ent:Activate()
		ent:SetOwner(ply)
		ent:SetParent(ply)
		ply.wings = ent
	end
end

function ITEM:OnHolster(ply)
	SafeRemoveEntity(ply.wings)
end
