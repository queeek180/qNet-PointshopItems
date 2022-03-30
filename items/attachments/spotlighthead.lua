ITEM.Name = 'Spotlight Head'
ITEM.Price = 500
ITEM.Model = 'models/props_wasteland/light_spotlight01_lamp.mdl'
ITEM.Attachment = 'eyes'
ITEM.SubCategory = "Heads, Hats & Masks"

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end
