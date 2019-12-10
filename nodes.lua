-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore, pairs
    = minetest, nodecore, pairs
-- LUALOCALS > ---------------------------------------------------------

--
--

-- Wet and Dry versions of patterned nodes.

--Clay
for k, v in pairs(nc_stuccol.patterns) do
	minetest.register_node("nc_stucco:stucco_" .. v .. "_clay", {
			description = "Wet Stucco with " .. v .. " Pattern",
			tiles = {"nc_stucco_canvas_1a.png^nc_stucco_pattern_" .. v .. ".png"},
			groups = {workable = 1, crumbly = 2, stucco_damp = 1},
			on_punch = function(pos, node, puncher, pointed_thing)
				minetest.node_punch(pos, node, puncher, pointed_thing)
				if (puncher:get_wielded_item():get_name() == "nc_stucco:stylusW") then
					if (nc_stuccol.patterns[k + 1]) then
						minetest.set_node(pos, {name = "nc_stucco:stucco_" .. nc_stuccol.patterns[k + 1] .. "_clay"})
					elseif (nc_stuccol.patterns[k + 1] == nil) then
						minetest.set_node(pos, {name = "nc_stucco:stucco_" .. nc_stuccol.patterns[1] .. "_clay"})
					end
				end
			end,
			on_rightclick = function(pos, _, clicker)
				if (clicker:get_wielded_item():get_name() == "nc_stucco:stylusW") then
					if (nc_stuccol.patterns[k -1]) then
						minetest.set_node(pos, {name = "nc_stucco:stucco_" .. nc_stuccol.patterns[k -1] .. "_clay"})
					elseif (nc_stuccol.patterns[k -1] == nil) then
						minetest.set_node(pos, {name = "nc_stucco:stucco_" .. nc_stuccol.patterns[29] .. "_clay"})
					end
				end
			end,
			sounds = nodecore.sounds("nc_stucco_chulky")
		})
	minetest.register_node("nc_stucco:stucco_" .. v .. "_clay_dry", {
			description = "Dry Stucco with " .. v .. " Pattern",
			tiles = {"nc_stucco_canvas_1b.png^nc_stucco_pattern_" .. v .. ".png"},
			groups = {cracky = 2, stucco_clay_dry = 1},
			sounds = nodecore.sounds("nc_stucco_hard")
		})
	-- Slate
	minetest.register_node("nc_stucco:stucco_" .. v .. "_slate", {
			description = "Wet Stucco with " .. v .. " Pattern",
			tiles = {"nc_stucco_canvas_2.png^nc_stucco_pattern_"
			.. v .. ".png^nc_stucco_pattern_" .. v .. ".png"},
			groups = {workable = 1, crumbly = 2},
			on_punch = function(pos, node, puncher, pointed_thing)
				minetest.node_punch(pos, node, puncher, pointed_thing)
				if (puncher:get_wielded_item():get_name() == "nc_stucco:stylusW") then
					if (nc_stuccol.patterns[k + 1]) then
						minetest.set_node(pos, {name = "nc_stucco:stucco_" .. nc_stuccol.patterns[k + 1] .. "_slate"})
					elseif (nc_stuccol.patterns[k + 1] == nil) then
						minetest.set_node(pos, {name = "nc_stucco:stucco_" .. nc_stuccol.patterns[1] .. "_slate"})
					end
				end
			end,
			on_rightclick = function(pos, _, clicker)
				if (clicker:get_wielded_item():get_name() == "nc_stucco:stylusW") then
					if (nc_stuccol.patterns[k -1]) then
						minetest.set_node(pos, {name = "nc_stucco:stucco_" .. nc_stuccol.patterns[k -1] .. "_slate"})
					elseif (nc_stuccol.patterns[k -1] == nil) then
						minetest.set_node(pos, {name = "nc_stucco:stucco_" .. nc_stuccol.patterns[29] .. "_slate"})
					end
				end
			end,
			sounds = nodecore.sounds("nc_stucco_chulky")
		})
	minetest.register_node("nc_stucco:stucco_" .. v .. "_slate_dry", {
			description = "Dry Stucco with " .. v .. " Pattern",
			tiles = {"nc_stucco_canvas_2.png^nc_stucco_pattern_" .. v .. ".png"},
			groups = {cracky = 2, stucco_slate_dry = 1},
			sounds = nodecore.sounds("nc_stucco_hard")
		})
end
-- Curing Stage Nodes.
for _, v in pairs(nc_stuccol.curing.stages) do
	minetest.register_node("nc_stucco:stucco_" .. v .. "_clay", {
			description = v .. " Stucco",
			tiles = {"nc_stucco_canvas_1a.png^nc_stucco_curing_" .. v .. ".png"},
			groups = {crumbly = 2, stucco_damp = 1, falling_node = 1},
			sounds = nodecore.sounds("nc_stucco_chulky")
		})
	minetest.register_node("nc_stucco:stucco_" .. v .. "_slate", {
			description = v .. " Stucco",
			tiles = {"nc_stucco_canvas_2.png^nc_stucco_curing_" .. v .. ".png"},
			groups = {crumbly = 2, stucco_damp = 1, falling_node = 1},
			sounds = nodecore.sounds("nc_stucco_chulky")
		})
end
-- Crushed Nodes.
minetest.register_node("nc_stucco:crushed_stucco_clay", {
		description = "Crushed Stucco",
		tiles = {"nc_stucco_canvas_1a.png^[mask:vermi.png"},
		groups = {crumbly = 1, falling_node = 1},
		sounds = nodecore.sounds("nc_stucco_hard")
	})

minetest.register_node("nc_stucco:crushed_stucco_slate", {
		description = "Crushed Stucco",
		tiles = {"nc_stucco_canvas_2.png^[mask:vermi.png"},
		groups = {crumbly = 1, falling_node = 1},
		sounds = nodecore.sounds("nc_stucco_hard")
	})
-- Post Nodes.
for n=1, #nc_stuccol.posts, 1 do
	minetest.register_node("nc_stucco:post_" .. n .. "_slate", {
			description = "slate Stucco Post",
			tiles = {"nc_stucco_canvas_2.png^nc_stucco_post_bordythin.png"},
			groups = {cracky = 3},
			drawtype = "nodebox",
			paramtype = "light",
			node_box = {
				type = "connected",
				fixed = {
					{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125}
				},
				connect_front = {{-0.125, -0.5, -0.5, 0.125, 0.0625, -0.125}},
				connect_back = {{-0.125, -0.5, 0.125, 0.125, 0.0625, 0.5}},
				connect_left = {{-0.5, -0.5, -0.125, -0.125, 0.0625, 0.125}},
				connect_right = {{0.125, -0.5, -0.125, 0.5, 0.0625, 0.125}}
			},
			connects_to = {"group:cracky"},
			connect_sides = {"top", "bottom", "front", "left", "back", "right"},
			sounds = nodecore.sounds("nc_stucco_hard")
		})
	minetest.register_node("nc_stucco:post_" .. n .. "_clay", {
			description = "Clay Stucco Post",
			tiles = {"nc_stucco_canvas_1a.png^nc_stucco_post_bordythin.png"},
			groups = {cracky = 2},
			drawtype = "nodebox",
			paramtype = "light",
			node_box = {
				type = "connected",
				fixed = {
					{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125}
				},
				connect_front = {{-0.125, -0.5, -0.5, 0.125, 0.0625, -0.125}},
				connect_back = {{-0.125, -0.5, 0.125, 0.125, 0.0625, 0.5}},
				connect_left = {{-0.5, -0.5, -0.125, -0.125, 0.0625, 0.125}},
				connect_right = {{0.125, -0.5, -0.125, 0.5, 0.0625, 0.125}}
			},
			connects_to = {"group:cracky"},
			connect_sides = {"top", "bottom", "front", "left", "back", "right"},
			sounds = nodecore.sounds("nc_stucco_hard")
		})
end
