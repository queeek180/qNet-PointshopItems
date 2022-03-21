ITEM.Name = 'Flaming Skull'
ITEM.Price = 5000
ITEM.Model = 'models/Gibs/HGIBS.mdl'
ITEM.Follower = 'flaming_skull'
ITEM.SubCategory = 'Objects'
ITEM.NoPreview = true

function ITEM:OnEquip(ply, modifications)
   timer.Create("PS_Pet_" ..ply:Nick(), 1, 0, function ()
  	 if IsValid(ply:Fo_GetFollower(self.Follower)) or ply:Team() == TEAM_SPECTATOR or timer.Exists("nohiderpet_" ..ply:Nick()) and ply:Team() != TEAM_SEEK then return end
   	 if (!IsValid(ply)) then return end
   	 ply:Fo_CreateFollower( self.Follower )
	 ply.PS_Pet = self.Follower
   	end)
end

function ITEM:OnHolster(ply)
	timer.Destroy("PS_Pet_" ..ply:Nick())
	ply:Fo_RemoveFollower( self.Follower )
end
