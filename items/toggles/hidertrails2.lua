ITEM.Name = 'Disable Hider Trails 2'
ITEM.Price = 0
ITEM.Material = "pointshop/nohidertrail.png"
ITEM.NoPreview = true
ITEM.Description = "Does nothing rigt now. will be used when trail code gets updated"

function ITEM:OnEquip(ply, itm)
	if ply:Team() == TEAM_HIDE and IsValid(ply.PS_Trail) then
		ply.PS_Trail:SetNoDraw(true)
	end
end

function ITEM:OnHolster(ply)
	if IsValid(ply.PS_Trail) then
		ply.PS_Trail:SetNoDraw(false)
	end
end

function ITEM:HASPlayerCaught(ply, self, itm)
 	if IsValid(ply.PS_Trail) then
		ply.PS_Trail:SetNoDraw(false)
	end	
end
