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
 Package Manager
 Updated 20.06.25
]]

return function(Product, locale, Console, PT1, PT2, PT3)
	if Product == '0XP01' then
	if Console == true then warn('[ziton.] - 0XP01 Requested') end
	local Clone = script.Packages['0XP01'].Loader:Clone()
	local Info = require(Clone.Infomation)
	Info.Whitelist.Enabled = PT1.Enabled
	Info.Whitelist.Group = PT1.Group
	Info.Whitelist.Users = PT1.Users
	Info.Whitelist.IDs = PT1.IDs
	local Clone1 = script.Packages['0XP01'].GUI:Clone()
	Clone1.Parent = locale['Screen']
	Clone.Parent = locale
	Clone.Enabled = true
	
	elseif Product == '0XP02' then
	if Console == true then warn('[ziton.] - 0XP02 Requested') end
	local Clone = script.Packages['0XP02'].Loader:Clone()
	local Info = require(Clone.Infomation)
	Info.Whitelist = PT1
	Info.Volume = PT2
	Info.Songs = PT3
	local Clone1 = script.Packages['0XP02'].GUI:Clone()
	Clone1.Parent = locale['Display']
	Clone.Parent = locale
    Clone.Enabled = true	
	end

end
