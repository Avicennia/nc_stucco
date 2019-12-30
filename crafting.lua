-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore, pairs, string
    = minetest, nodecore, pairs, string
local string_lower
    = string.lower
-- LUALOCALS > ---------------------------------------------------------

-- -- -- -- -- -- Stylus -- -- -- -- -- --

minetest.register_tool("nc_stucco:stylusW", {
		description = "Stone-Tipped Stylus",
		tool_wears_to = "nc_tree:stick",
		inventory_image = "nc_stucco_tool_stylus.png",
		groups = {
			flammable = 2
		},
		tool_capabilities = nodecore.toolcaps({
				uses = 0.034,
				["snappy"] = 4
			}),
		on_ignite = "nc_stonework:chip",
		sounds = nodecore.sounds("nc_terrain_stony")
	})

nodecore.register_craft({
		label = "Fit stylus nib",
		normal = {y = 1},
		nodes = {
			{match = "nc_stonework:chip", replace = "air"},
			{y = -1, match = "nc_tree:stick", replace = "air"},
		},
		items = {
			{y = -1, name = "nc_stucco:stylusW"}
		}
	})
-- -- -- -- -- -- Stylus -- -- -- -- -- -- ^^

nodecore.register_craft({
		label = "mix stucco mud",
		action = "pummel",
		priority = 1,
		toolgroups = {thumpy = 1},
		normal = {y = 1},
		nodes = {
			{
				match = "nc_terrain:dirt",
				replace = "air"
			},
			{
				y = -1,
				match = "nc_fire:ash",
				replace = "nc_stucco:stucco_powdered_clay"
			}
		}
	})
nodecore.register_craft({
		label = "mix stucco slate",
		action = "pummel",
		priority = 1,
		toolgroups = {thumpy = 2},
		normal = {y = 1},
		nodes = {
			{
				match = "nc_concrete:aggregate",
				replace = "air"
			},
			{
				y = -1,
				match = "nc_concrete:aggregate",
				replace = "nc_stucco:stucco_powdered_slate"
			}
		}
	})

for _, material in pairs({"clay", "slate"}) do

	for _, stage in pairs({"moist", "damp"}) do
		nodecore.register_craft({
				label = "stucco inscribe " .. stage .. " " .. material,
				action = "pummel",
				priority = 1,
				toolgroups = {snappy = 2},
				nodes = {
					{
						match = "nc_stucco:stucco_" .. stage .. "_" .. material,
						replace = "nc_stucco:stucco_gkey_" .. material
					},
				}
			})
	end

	nodecore.register_craft({
			label = "crush dry " .. material,
			action = "pummel",
			priority = 1,
			toolgroups = {thumpy = 2},
			duration = 0.3,
			nodes = {
				{
					match = "nc_stucco:stucco_dry_" .. material,
					replace = "nc_stucco:stucco_powdered_" .. material
				},
			}
		})
	for _, v in pairs(nc_stuccol.patterns) do
		local pat = string_lower(v)
		nodecore.register_craft({
				label = "crush dry " .. material,
				action = "pummel",
				priority = 1,
				toolgroups = {thumpy = 2},
				duration = 0.3,
				nodes = {
					{
						match = "nc_stucco:stucco_" .. pat .. "_" .. material .. "_dry",
						replace = "nc_stucco:stucco_powdered_" .. material
					},
				}
			})
	end

	nodecore.register_craft({
			label = "chop posts " .. material,
			action = "pummel",
			priority = 1,
			toolgroups = {choppy = 2},
			duration = 1.5,
			nodes = {
				{
					match = "nc_stucco:stucco_damp_" .. material,
					replace = "air"
				},
			},
			items = {
				{y = -1, name = "nc_stucco:post_1_" .. material, count = 8, scatter = 6}
			},
			itemscatter = 6
		})
end
