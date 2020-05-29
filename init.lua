-- LUALOCALS < ---------------------------------------------------------
local dofile, minetest, rawset
    = dofile, minetest, rawset
-- LUALOCALS > ---------------------------------------------------------

local thismod = minetest.get_current_modname()
local modpath = minetest.get_modpath(thismod)
parentmod = minetest.get_modpath("nc_concrete")

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
		"Bordywalk", "Bordyrun", "Foote"},
	wca = {"Bindy", "Bricky", "Hashy","Icebox","Ridgey", "Vermi", "Barry"},
	dep = {"Bordy-Thin", "Bordy-Thick"},
	posts = {"Thick", "Thin"},
}



nms = {
	mod = "nc_concrete",
	na = {"sandstone", "adobe", "coalstone"}
}

rawset(_G, thismod, nc_stuccol)


dofile(modpath .. "/nodes.lua")


minetest.after(1, function()
for k,_ in pairs(minetest.registered_nodes) do
	if(string.find(k,"nc_concrete:concrete_") and not string.find(k,"ply"))then
		local ngroups = minetest.registered_nodes[k]["groups"]
		if(string.find(k, "ad"))then
		ngroups.nc_stucco_etched_hard_adobe = 1
		minetest.override_item(k, {groups = ngroups})
		elseif(string.find(k, "co"))then
		ngroups.nc_stucco_etched_hard_coalstone = 1
		minetest.override_item(k, {groups = ngroups})
		else end
	else end

end
end)

