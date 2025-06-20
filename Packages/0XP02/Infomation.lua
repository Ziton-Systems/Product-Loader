--// This is intended to be a module script under the 'Loader.lua' file

local module = {
	Whitelist = {
		Enabled = false,
		Group = 33356595, -- GroupID 
		IDs = {}, -- Group Ranks to apply to, put 'all' to do all.
		Users = {'yep_zane',} -- Supports UserIDs and names/displaynames
	},
	Volume = 0.5,
	Songs = { -- Copy and paste and change ID to SoundID and Name to the name you want.
		{ID = 'rbxassetid://1848354536', Name = 'Example'},
		--{ID = 0, Name = ''},

	}}

return module
