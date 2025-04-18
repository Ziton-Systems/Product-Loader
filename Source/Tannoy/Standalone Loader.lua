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
 Tannoy System 
 Updated 18.04.25
]]

Whitelist = {
	Enabled = false,
	Group = 33356595, -- GroupID 
	IDs = {}, -- Group Ranks to apply to, put 'all' to do all.
	Users = {'yep_zane',} -- Supports UserIDs and names/displaynames
}
Volume = 0.5
Songs = { -- Copy and paste and change ID to SoundID and Name to the name you want.
	{ID = 'rbxassetid://1848354536', Name = 'Example'},
	--{ID = 0, Name = ''},
	
}

--[[  ONLY EDIT BELOW IF YOU KNOW WHAT YOU ARE DOING!!  ]]-- 

local WLS = function(Player:Player)
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
local A = script
local Frame = A.Song
local Active = false
local GUI = A.Parent.Display.GUI
local Mode = 1 -- 1 Boot 2 Locked 3 Active
local Soundpart = nil
if workspace:FindFirstChild('ZITON - TANNOY') then
	Soundpart = workspace:FindFirstChild('ZITON - TANNOY')
else
	local Audio = Instance.new('Sound')
	Audio.Parent = workspace
	Audio.Volume = Volume
	Audio.Name = 'ZITON - TANNOY'
	Soundpart = Audio
end
Tween = game:GetService('TweenService')
local TweenInfo = TweenInfo.new(
	14,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.Out
)
local Load = Tween:Create(GUI.Boot.Load["Loading Screeen"].Move, TweenInfo, {Position = UDim2.new(0, 0, 0, 0)}) 
GUI.Locked.Visible = false
GUI.Session.Visible = false
GUI.Boot.Load.Visible = true
Load:Play()
task.wait(15)
Mode = 2
GUI.Boot.Load.Visible = false
GUI.Locked.Visible = true

local debounce = false
A.Parent.Body['-'].ClickDetector.MouseClick:Connect(function(Player)
	if Mode == 2 and debounce == false then
		debounce = true
		if WLS(Player) then
			Mode = 3
			GUI.Locked.Visible = false
			GUI.Session.Visible = true
			task.wait(5)
			debounce = false
	elseif Mode == 3 then
		if WLS(Player) then
			Mode = 2
			GUI.Locked.Visible = true
			GUI.Session.Visible = false
				task.wait(5)
				debounce = false
		end
	end
	end
end)




for i, v in pairs(Songs) do
local clone = Frame:Clone()
	clone.Name = v.Name
	clone.Value.Value = v.ID
	clone.Textlabal.Text = v.Name
	clone.Parent = GUI.Session.Tiles.Frame
	
	clone.ImageButton.MouseButton1Click:Connect(function(Player:Player)
		if WLS(Player) then
			Soundpart.SoundId = clone.Value.Value
			Soundpart:Play()
			
		end
	end)
end
