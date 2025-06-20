ziton = [[
          $$\   $$\                             
          \__|  $$ |                            
$$$$$$$$\ $$\ $$$$$$\    $$$$$$\  $$$$$$$\      
\____$$  |$$ |\_$$  _|  $$  __$$\ $$  __$$\     
  $$$$ _/ $$ |  $$ |    $$ /  $$ |$$ |  $$ |    
 $$  _/   $$ |  $$ |$$\ $$ |  $$ |$$ |  $$ |    
$$$$$$$$\ $$ |  \$$$$  |\$$$$$$  |$$ |  $$ |$$\ 
\________|\__|   \____/  \______/ \__|  \__|\__|
 2025 - Ziton Systems
 Player Count Boards
 Updated 18.04.25
]]

Info = require(script.Infomation)
Whitelist = Info.Whitelist

--[[  ONLY EDIT BELOW IF YOU KNOW WHAT YOU ARE DOING!!  ]]--
WLS = function(Player:Player)
	if Whitelist.Enabled == true then
		local GroupRank = Player:GetRankInGroup(Whitelist.Group)
		if table.find(Whitelist.IDs, GroupRank) then
			return true
		elseif table.find(Whitelist.Users, Player.UserId) then
			return true
		elseif table.find(Whitelist.Users, Player.Name) then
			return true
		elseif table.find(Whitelist.Users, Player.DisplayName) then
			return true
		elseif table.find(Whitelist.IDs, 'all') and GroupRank >= 1 then
			return true
		else
			return false
		end
	else
		return true
	end
end
Count = 0
GUI = script.Parent.Screen.GUI.GUI.Text.Count
GUI.Text = '0'

game.Players.PlayerAdded:Connect(function(player)
	if WLS(player) then
		Count = Count + 1
		GUI.Text = Count
	end
end)
game.Players.PlayerRemoving:Connect(function(player)
	if WLS(player) then
		Count = Count - 1
		GUI.Text = Count
	end
end)
