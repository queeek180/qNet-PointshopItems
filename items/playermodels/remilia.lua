ITEM.Name = 'remilia'
ITEM.Price = 5000
ITEM.Model = 'models/loyalists/mmd/remilia/remilia_mp_pm.mdl'
ITEM.SubCategory = "Anime"

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