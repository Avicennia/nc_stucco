-- LUALOCALS < ---------------------------------------------------------
local ItemStack, minetest, nodecore, pairs, tostring
    = ItemStack, minetest, nodecore, pairs, tostring
-- LUALOCALS > ---------------------------------------------------------

--
--

-- Wet and Dry versions of patterned nodes.

local function lc(n) return tostring(n):lower():gsub("%W", "") end

local function stylus_change(pos, player, idx, type)
	local wield = player:get_wielded_item()
	if wield:get_name() ~= "nc_stucco:stylusW" then return end
	if idx < 1 then idx = #nc_stuccol.patterns end
	if idx > #nc_stuccol.patterns then idx = 1 end
	minetest.set_node(pos, {name = "nc_stucco:stucco_"
			.. lc(nc_stuccol.patterns[idx]) .. "_" .. type})
	nodecore.show_touchtip(player, nodecore.touchtip_node(pos))
	wield:add_wear(65536 / 250)
	if wield:get_count() == 0 then
		minetest.sound_play("nc_api_toolbreak",
			{object = player, gain = 0.5})
		wield = ItemStack("nc_tree:stick")
	end
	player:set_wielded_item(wield)
end

--Clay
for k, v in pairs(nc_stuccol.patterns) do
	minetest.register_node("nc_stucco:stucco_" .. lc(v) .. "_clay", {
			description = "Wet Clay Stucco with " .. v .. " Pattern",
			tiles = {"nc_stucco_canvas_1a.png^nc_stucco_pattern_" .. lc(v) .. ".png"},
			groups = {workable = 1, crumbly = 2, stucco_damp = 1},
			on_punch = function(pos, node, puncher, pointed_thing)
				minetest.node_punch(pos, node, puncher, pointed_thing)
				return stylus_change(pos, puncher, k + 1, "clay")
			end,
			on_rightclick = function(pos, _, clicker)
				return stylus_change(pos, clicker, k - 1, "clay")
			end,
			stucco_wetter = "nc_stucco:stucco_sodden_clay",
			stucco_drier = "nc_stucco:stucco_" .. lc(v) .. "_clay_dry",
			sounds = nodecore.sounds("nc_stucco_chulky")
		})
	minetest.register_node("nc_stucco:stucco_" .. lc(v) .. "_clay_dry", {
			description = "Dry Clay Stucco with " .. v .. " Pattern",
			tiles = {"nc_stucco_canvas_1b.png^nc_stucco_pattern_" .. lc(v) .. ".png"},
			groups = {cracky = 2, stucco_clay_dry = 1},
			sounds = nodecore.sounds("nc_stucco_hard")
		})
	-- Slate
	minetest.register_node("nc_stucco:stucco_" .. lc(v) .. "_slate", {
			description = "Wet Slate Stucco with " .. v .. " Pattern",
			tiles = {"nc_stucco_canvas_2.png^nc_stucco_pattern_"
				.. lc(v) .. ".png^nc_stucco_pattern_" .. lc(v) .. ".png"},
			groups = {workable = 1, crumbly = 2},
			on_punch = function(pos, node, puncher, pointed_thing)
				minetest.node_punch(pos, node, puncher, pointed_thing)
				return stylus_change(pos, puncher, k + 1, "slate")
			end,
			on_rightclick = function(pos, _, clicker)
				return stylus_change(pos, clicker, k - 1, "slate")
			end,
			stucco_wetter = "nc_stucco:stucco_sodden_slate",
			stucco_drier = "nc_stucco:stucco_" .. lc(v) .. "_clay_slate", sounds = nodecore.sounds("nc_stucco_chulky")
		})
	minetest.register_node("nc_stucco:stucco_" .. lc(v) .. "_slate_dry", {
			description = "Dry Slate Stucco with " .. v .. " Pattern",
			tiles = {"nc_stucco_canvas_2.png^nc_stucco_pattern_" .. lc(v) .. ".png"},
			groups = {cracky = 2, stucco_slate_dry = 1},
			sounds = nodecore.sounds("nc_stucco_hard")
		})
end
-- Curing Stage Nodes.
local function nextstage(lut, v, material)
	local x = nc_stuccol.curing[lut][lc(v)]
	return x and ("nc_stucco:stucco_" .. x .. "_" .. material)
end
for _, v in pairs(nc_stuccol.curing.stages) do
	minetest.register_node("nc_stucco:stucco_" .. lc(v) .. "_clay", {
			description = v .. " Clay Stucco",
			tiles = {"nc_stucco_canvas_1a.png^nc_stucco_curing_" .. lc(v) .. ".png"},
			groups = {crumbly = 2, stucco_damp = 1, falling_node = 1},
			sounds = nodecore.sounds("nc_stucco_chulky"),
			stucco_wetter = nextstage("wetter", v, "clay"),
			stucco_drier = nextstage("drier", v, "clay")
		})
	minetest.register_node("nc_stucco:stucco_" .. lc(v) .. "_slate", {
			description = v .. " Slate Stucco",
			tiles = {"nc_stucco_canvas_2.png^nc_stucco_curing_" .. lc(v) .. ".png"},
			groups = {crumbly = 2, stucco_damp = 1, falling_node = 1},
			sounds = nodecore.sounds("nc_stucco_chulky"),
			stucco_wetter = nextstage("wetter", v, "slate"),
			stucco_drier = nextstage("drier", v, "slate")
		})
end
-- Crushed Nodes.
minetest.register_node("nc_stucco:crushed_stucco_clay", {
		description = "Crushed Clay Stucco",
		tiles = {"nc_stucco_canvas_1a.png^[mask:nc_stucco_pattern_vermi.png"},
		groups = {crumbly = 1, falling_node = 1},
		sounds = nodecore.sounds("nc_stucco_hard")
	})

minetest.register_node("nc_stucco:crushed_stucco_slate", {
		description = "Crushed Slate Stucco",
		tiles = {"nc_stucco_canvas_2.png^[mask:nc_stucco_pattern_vermi.png"},
		groups = {crumbly = 1, falling_node = 1},
		sounds = nodecore.sounds("nc_stucco_hard")
	})
-- Post Nodes.
for n=1, #nc_stuccol.posts, 1 do
	minetest.register_node("nc_stucco:post_" .. lc(n) .. "_slate", {
			description = "Slate Stucco Post with " .. lc(nc_stuccol.posts[n]) .. " Border",
			tiles = {"nc_stucco_canvas_2.png^nc_stucco_post_bordy"
				.. lc(nc_stuccol.posts[n]) .. ".png"},
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
	minetest.register_node("nc_stucco:post_" .. lc(n) .. "_clay", {
			description = "Clay Stucco Post with " .. lc(nc_stuccol.posts[n]) .. " Border",
			tiles = {"nc_stucco_canvas_1a.png^nc_stucco_post_bordy"
				.. lc(lc(nc_stuccol.posts[n])) .. ".png"},
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
