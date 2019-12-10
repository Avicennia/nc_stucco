-- LUALOCALS < ---------------------------------------------------------
local minetest
    = minetest
-- LUALOCALS > ---------------------------------------------------------

local function waterchk(pos)
	return minetest.find_node_near(pos, 2, "nc_terrain:water_source", false)
end

minetest.register_abm({
		label = "Powdered Stucco Moisturizing",
		nodenames = {"group:stucco_damp"},
		neighbors = {"nc_terrain:water_source"},
		interval = 2.5,
		chance = 1,
		action = function(pos, node)
			node = node or minetest.get_node(pos)
			local def = minetest.registered_nodes[node.name]
			if def.stucco_wetter then
				return minetest.set_node(pos, {name = def.stucco_wetter})
			end
		end
	})
minetest.register_abm({
		label = "Dry Stucco Dessication",
		nodenames = {"group:stucco_damp"},
		neighbors = {"air"},
		interval = 24,
		chance = 4,
		action = function(pos, node)
			if waterchk(pos) then return end
			node = node or minetest.get_node(pos)
			local def = minetest.registered_nodes[node.name]
			if def.stucco_drier then
				return minetest.set_node(pos, {name = def.stucco_drier})
			end
		end
	})
minetest.register_abm({
		label = "Worked Clay Drying",
		nodenames = {"group:workable"},
		interval = 38,
		chance = 4,
		action = function(pos)
			local noden = minetest.get_node(pos).name
			minetest.set_node(pos, {name = noden .. "_dry"})
		end
	})
