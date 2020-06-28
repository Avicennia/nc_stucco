
nodecore.register_aism({
    label = "Pliant material itemstack drying increment",
    interval = 5,
    chance = 2,
    itemnames = {"nc_concrete:terrain_stone_blank_ply"},
	action = function(stack, data)
		if(data.pos)then
			local modif = 0;
			if(data.player and data.list == "main")then
				modif = data.inv:contains_item("main", ItemStack({name = "nc_sponge:sponge_wet", count = 1}),false) and modif + 1 or modif + 0
			else end
			modif = modif + (-1*math.floor(#nodecore.find_nodes_around(data.pos, "group:igniter",1)/4))
            nodecore.smokefx(data.pos, 5, data.rate)
			local meta = stack:get_meta()
			meta:set_int("curetime", meta:get_int("curetime") + 2 - modif)
			minetest.chat_send_all(meta:get_int("curetime") or "k")
            return stack
        end
    end
})

nodecore.register_aism({
    label = "Pliant material itemstack drying complete",
    interval = 1,
    chance = 1,
    itemnames = {"nc_concrete:terrain_stone_blank_ply"},
	action = function(stack, data)
		local meta = stack:get_meta()
		if(data.pos and meta:get_int("curetime") > 20)then
			meta:set_int("curetime", 0)
            nodecore.sound_play("nc_terrain_stony", {gain = 2, pos = data.pos})
            local taken = stack:take_item(1)
            local taken = ItemStack({name = "nc_terrain:stone", count = 1})
			meta:set_int("curetime", 0)
            if(data.inv) then taken = data.inv:add_item("main", taken)  end
			if(not taken:is_empty()) then nodecore.item_eject(data.pos, taken) end
            return stack
        end
    end
})
