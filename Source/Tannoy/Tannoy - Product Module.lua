return function(A, Whitelist, Volume, Songs)
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
	local Tween = game:GetService('TweenService')
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
GUI.Session.TextButton.MouseButton1Click:Connect(function(Player:Player)
	if WLS(Player) then
		Soundpart:Stop()
	end
end)
	
end
