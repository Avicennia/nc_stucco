local modname = "nc_stucco:"


minetest.register_tool("nc_stucco:stylusW", {
    description = "Stone-Tipped Stylus",
    tool_wears_to = "nc_tree:stick",
    inventory_image = "stylus.png",
    groups = {
        flammable = 2
    },
    tool_capabilities = nodecore.toolcaps({
            uses = 0.25,
            ["snappy"] = 6
        }),
    on_ignite = "nc_stonework:chip",
    sounds = nodecore.sounds("nc_terrain_stony")
})


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
            replace = "nc_stucco:stucco_powdered_render"
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
    toolgroups = {snappy = 6},
    nodes = {
        {
            match = "nc_stucco:stucco_damp_clay" or "nc_stucco:stucco_moist_clay",
            replace = "nc_stucco:stucco_gkey_clay"
        },
    }
})
nodecore.register_craft({
    label = "nc_stucco;craft_inscrip_granite",
    action = "pummel",
    priority = 1,
    toolgroups = {snappy = 6},
    nodes = {
        {
            match = "nc_stucco:stucco_damp_granite" or "nc_stucco:stucco_moist_granite",
            replace = "nc_stucco:stucco_gkey_granite"
        },
    }
})
for n=1,#nc_stuccol.theseNodes - 1, 1 do
nodecore.register_craft({
    label = "nc_stucco;craft_"..nc_stuccol.patterns[n].."_clay",
    action = "pummel",
    priority = 1,
    toolgroups = {snappy = 3},
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
    toolgroups = {snappy = 3},
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