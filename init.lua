-- LUALOCALS < ---------------------------------------------------------
local dofile, minetest, rawset
    = dofile, minetest, rawset
-- LUALOCALS > ---------------------------------------------------------

local thismod = minetest.get_current_modname()
local modpath = minetest.get_modpath(thismod)
parentmod = minetest.get_modpath("nc_concrete")
tm = "nc_stucco:"

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
	patterns = {"GKey", "Beetle", "Crossy", "Corinth", "Hexy", "Brexy",
		"Lamby", "Doric", "Starry", "Targey", "Stakey", "Panelly",
		"Slatty", "Logos", "Peeky", "Mucky", "Enol", "SN", "Hatchy",
		"Foote","Signy","Signy2", "Signy3"},
	wca = {"Bindy", "Bricky", "Hashy","Icebox","Ridgey", "Vermi", "Barry"},
	dep = {"Bordy-Thin", "Bordy-Thick"},
	posts = {"Thick", "Thin"},
	meshies = {"st_sword_corr.obj", "st_bowl_inv_corr.obj", "st_post_corr.obj", "st_signpost_corr.obj",
 "st_pillar_base_corr.obj", "st_pillar_base_inv_corr.obj", "st_pillar_mid_corr.obj","sarco_corr.obj","stone1_corr.obj","bcage.obj","bcage_closed_corr.obj", "urn_corr.obj", "urn_closed_corr.obj",
names = {"sword", "bowl","post","spost","pillar_end","pillar_end_inv", "pillar_mid", "sarco","stone1","bcage","bcage_closed", "urn", "urn_closed"}
},
bench = "nc_stucco:sculptier",
boss = {
	mod = "nc_concrete",
	concrete_mats = {"sandstone", "adobe", "coalstone","terrain_stone"},
	textures = {}
}
}




rawset(_G, thismod, nc_stuccol)


dofile(modpath .. "/nodes.lua")
dofile(modpath .. "/crafting.lua")
dofile(modpath .. "/sculpt.lua")
dofile(modpath .. "/curing.lua")


