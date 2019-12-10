-- LUALOCALS < ---------------------------------------------------------
local dofile, minetest, rawset
    = dofile, minetest, rawset
-- LUALOCALS > ---------------------------------------------------------

local thismod = minetest.get_current_modname()
local modpath = minetest.get_modpath(thismod)

nc_stuccol = {
	curing = {
		stages = {"Sodden", "Moist", "Damp", "Dry", "Powdered"},
		wetter = {
			powdered = "sodden",
			moist = "sodden",
			damp = "sodden"
		},
		drier = {
			sodden = "moist",
			moist = "damp",
			damp = "dry"
		}
	},
	patterns = {"GKey", "Beetle", "Bindy", "Crossy", "Corinth", "Hashy",
		"Icebox", "Vermi", "Bricky", "Hexy", "Brexy", "Barry", "Ridgey",
		"Lamby", "Doric", "Starry", "Targey", "Stakey", "Panelly",
		"Slatty", "Logos", "Peeky", "Mucky", "Enol", "SN", "Hatchy",
		"Bordy-Thin", "Bordy-Thick", "Foote"},
	posts = {"Thick", "Thin"},
}
rawset(_G, thismod, nc_stuccol)

dofile(modpath .. "/curing.lua")
dofile(modpath .. "/crafting.lua")
dofile(modpath .. "/nodes.lua")
dofile(modpath .. "/particles.lua")
