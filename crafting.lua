local modname = "nc_stucco:"
local daddymod = "nc_tree:"
--  --  --  --  --  --  Stylus  --  --  --  --  --  --
minetest.register_node("nc_stucco:stylus_rod",{
    description = "Stylus Rod",
    tiles = {"styltex.png"},
    groups = {crumbly = 1},
    drawtype = "nodebox",
    node_box = {
      type = "fixed",
      fixed = {
        {-0.0625, -0.5, -0.0625, 0.0625, -0.1875, 0.0625},
              {-0.0625, -0.1875, -0.0625, 0, -0.125, 0.0625},
      }
    },
    --[[on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
      if(itemstack:get_name() == "nc_stonework:chip")then
        itemstack:set_name("nc_stucco:stylusW")
        minetest.remove_node(pos)
      end
    end]]
  })
minetest.register_tool("nc_stucco:stylusW", {
    description = "Stone-Tipped Stylus",
    tool_wears_to = "nc_tree:stick",
    inventory_image = "stylus.png",
    groups = {
        flammable = 2
    },
    tool_capabilities = nodecore.toolcaps({
            uses = 0.25,
            ["snappy"] = 2
        }),
    on_ignite = "nc_stonework:chip",
    sounds = nodecore.sounds("nc_terrain_stony")
})

nodecore.register_craft({
    label = "craft stylus rod",
    action = "pummel",
    priority = 1,
    toolgroups = {choppy = 1},
    nodes = {
        {
            match = daddymod .. "stick",
            replace = modname .. "stylus_rod"
        },
    }
})
nodecore.register_craft({
    label = "Fit stylus nib",
    normal = {y = 1},
    nodes = {
        {match = "nc_stonework:chip", replace = "air"},
        {y = -1, match = modname .. "stylus_rod", replace = "air"},
    },
    items = {
        {y = -1, name = modname .. "stylusW"}
    }
})
--  --  --  --  --  --  Stylus  --  --  --  --  --  -- ^^

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
    label = "mix stucco granite",
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
            replace = "nc_stucco:stucco_powdered_granite"
        }
    }
})

nodecore.register_craft({
    label = "nc_stucco;craft_inscrip_clay",
    action = "pummel",
    priority = 1,
    toolgroups = {snappy = 2},
    nodes = {
        {
            match = "nc_stucco:stucco_damp_clay" or "nc_stucco:stucco_moist_clay",
            replace = "nc_stucco:stucco_gkey_clay"
        },
    }
})
nodecore.register_craft({
    label = "nc_stucco;craft_inscrip_clay2",
    action = "pummel",
    priority = 1,
    toolgroups = {snappy = 2},
    nodes = {
        {
            match = "nc_stucco:stucco_moist_clay",
            replace = "nc_stucco:stucco_gkey_clay"
        },
    }
})
nodecore.register_craft({
    label = "nc_stucco;craft_inscrip_granite",
    action = "pummel",
    priority = 1,
    toolgroups = {snappy = 2},
    nodes = {
        {
            match = "nc_stucco:stucco_damp_granite" or "nc_stucco:stucco_moist_granite",
            replace = "nc_stucco:stucco_gkey_granite"
        },
    }
})
nodecore.register_craft({
    label = "nc_stucco;craft_inscrip_granite2",
    action = "pummel",
    priority = 1,
    toolgroups = {snappy = 2},
    nodes = {
        {
            match = "nc_stucco:stucco_moist_granite",
            replace = "nc_stucco:stucco_gkey_granite"
        },
    }
})
for n=1,#nc_stuccol.theseNodes - 1, 1 do
nodecore.register_craft({
    label = "nc_stucco;craft_"..nc_stuccol.patterns[n].."_clay",
    action = "pummel",
    priority = 1,
    toolgroups = {snappy = 2},
    nodes = {
        {
            match = nc_stuccol.theseNodes[n] .. "_clay",
            replace = nc_stuccol.theseNodes[n+1] .. "_clay" or nc_stuccol.theseNodes[1] .. "_clay"
        },
    }
})
nodecore.register_craft({
    label = "nc_stucco;craft_"..nc_stuccol.patterns[n].."_granite",
    action = "pummel",
    priority = 1,
    toolgroups = {snappy = 2},
    nodes = {
        {
            match = nc_stuccol.theseNodes[n] .. "_granite",
            replace = nc_stuccol.theseNodes[n+1] .. "_granite" or nc_stuccol.theseNodes[1] .. "_granite"
        },
    }
})
end
nodecore.register_craft({
    label = "disturb stucco clay",
    action = "pummel",
    priority = 1,
    toolgroups = {crumbly = 1},
    nodes = {
        {
            match = modname .. "stucco_powdered_clay",
            replace = modname .. "stucco_powdered_clay"
        },
    }
})
nodecore.register_craft({
    label = "disturb stucco granite",
    action = "pummel",
    priority = 1,
    toolgroups = {crumbly = 1},
    nodes = {
        {
            match = modname .. "stucco_powdered_granite",
            replace = modname .. "stucco_powdered_granite"
        },
    }
})