local modname = "nc_stucco:"
local parentmod = "nc_tree:"

--  --  --  --  --  --  Stylus  --  --  --  --  --  --

minetest.register_node("nc_stucco:stylus_rod",{
    description = "Stylus Rod",
    tiles = {"styltex.png"},
    groups = {crumbly = 1},
    drawtype = "nodebox",
    paramtype = "light",
    node_box = {
      type = "fixed",
      fixed = {
        {-0.0625, -0.5, -0.0625, 0.0625, -0.1875, 0.0625},
              {-0.0625, -0.1875, -0.0625, 0, -0.125, 0.0625},
      }
    },
  })
minetest.register_tool("nc_stucco:stylusW", {
    description = "Stone-Tipped Stylus",
    tool_wears_to = "nc_tree:stick",
    inventory_image = "stylus.png",
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
    label = "craft stylus rod",
    action = "pummel",
    priority = 1,
    toolgroups = {choppy = 1},
    nodes = {
        {
            match = parentmod .. "stick",
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
    label = "nc_stucco;craft_inscrip_slate",
    action = "pummel",
    priority = 1,
    toolgroups = {snappy = 2},
    nodes = {
        {
            match = "nc_stucco:stucco_damp_slate" or "nc_stucco:stucco_moist_slate",
            replace = "nc_stucco:stucco_gkey_slate"
        },
    }
})
nodecore.register_craft({
    label = "nc_stucco;craft_inscrip_slate2",
    action = "pummel",
    priority = 1,
    toolgroups = {snappy = 2},
    nodes = {
        {
            match = "nc_stucco:stucco_moist_slate",
            replace = "nc_stucco:stucco_gkey_slate"
        },
    }
})
for n=1,#nc_stuccol.theseNodes - 1, 1 do
nodecore.register_craft({
    label = "nc_stucco;craft_"..nc_stuccol.patterns[n].."_clay",
    action = "pummel",
    priority = 1,
    toolgroups = {snappy = 2},
    duration = 0.1,
    nodes = {
        {
            match = nc_stuccol.theseNodes[n] .. "_clay",
            replace = nc_stuccol.theseNodes[n+1] .. "_clay" or nc_stuccol.theseNodes[1] .. "_clay"
        },
    }
})
nodecore.register_craft({
    label = "nc_stucco;craft_"..nc_stuccol.patterns[n].."_slate",
    action = "pummel",
    priority = 1,
    toolgroups = {snappy = 2},
    duration = 0.1,
    nodes = {
        {
            match = nc_stuccol.theseNodes[n] .. "_slate",
            replace = nc_stuccol.theseNodes[n+1] .. "_slate" or nc_stuccol.theseNodes[1] .. "_slate"
        },
    }
})
end
nodecore.register_craft({
    label = "Crush Dry Clay",
    action = "pummel",
    priority = 1,
    toolgroups = {thumpy = 2},
    duration = 0.3,
    nodes = {
        {
            match = modname .. "stucco_dry_clay",
            replace = modname .. "stucco_powdered_clay"
        },
    }
})
nodecore.register_craft({
    label = "Crush Dry slate",
    action = "pummel",
    priority = 1,
    toolgroups = {thumpy = 3},
    duration = 1.5,
    nodes = {
        {
            match = modname .. "stucco_dry_slate",
            replace = "nc_concrete:aggregate_dry"
        },
    }
})
for k,v in pairs(nc_stuccol.patterns)do
nodecore.register_craft({
    label = "Crush Clay Nodes to powder",
    action = "pummel",
    priority = 1,
    toolgroups = {thumpy = 2},
    duration = 0.3,
    nodes = {
        {
            match = modname .. "stucco_"..v.."_clay_dry",
            replace = modname .. "stucco_powdered_clay"
        },
    }
})
nodecore.register_craft({
    label = "Crush slate Nodes to powder",
    action = "pummel",
    priority = 1,
    toolgroups = {thumpy = 3},
    duration = 1.5,
    nodes = {
        {
            match = modname .. "stucco_"..v.."_slate_dry",
            replace = "nc_concrete:aggregate"
        },
    }
})
end
nodecore.register_craft({
    label = "Chop Posts Clay",
    action = "pummel",
    priority = 1,
    toolgroups = {choppy = 2},
    duration = 1.5,
    nodes = {
        {
            match = modname .. "stucco_damp_clay",
            replace = "air"
        },
    },
    items = {
        {y = -1, name = modname .. "post_1_clay", count = 8, scatter = 6}
    },
    itemscatter = 6
})
nodecore.register_craft({
    label = "Chop Posts Slate",
    action = "pummel",
    priority = 1,
    toolgroups = {choppy = 3},
    duration = 1.5,
    nodes = {
        {
            match = modname .. "stucco_damp_slate",
            replace = "air"
        },
    },
    items = {
        {y = -1, name = modname .. "post_1_slate", count = 8, scatter = 6}
    },
    itemscatter = 6
})