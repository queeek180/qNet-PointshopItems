ITEM.Name = 'Picolas Cage'
ITEM.Price = 2500
ITEM.Model = 'models/aap15/foldername/picolas_cage_pm/picolas_cage_reference.mdl'
ITEM.SubCategory = "Internet"

function ITEM:OnEquip(ply, modifications)
	if not ply._OldModel then
		ply._OldModel = ply:GetModel()
	end
	
	timer.Simple(1, function() ply:SetModel(self.Model) end)
end

function ITEM:OnHolster(ply)
	if ply._OldModel then
		ply:SetModel(ply._OldModel)
	end
end

function ITEM:PlayerSetModel(ply)
	ply:SetModel(self.Model)
end
