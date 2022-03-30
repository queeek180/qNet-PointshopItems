ITEM.Name = 'Reimu'
ITEM.Price = 0
ITEM.Model = 'models/player/reimu_hakurei_bikini.mdl'
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

function ITEM:CanPlayerBuy(ply)
    return false
end

function ITEM:CanPlayerSell(ply)
    return false
end

function ITEM:PlayerSetModel(ply)
	ply:SetModel(self.Model)
end
