-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore, pairs
    = minetest, nodecore, pairs
-- LUALOCALS > ---------------------------------------------------------

local modname = "nc_stucco:"


nodecore.register_craft({
    label = "crush dry concrete",
    action = "pummel",
    priority = 1,
    toolgroups = {thumpy = 2},
    duration = 0.3,
    nodes = {
        {
            match = { groups = {nc_stucco_etched_hard_adobe = true}},
            replace = "nc_concrete:mud"
        },
    }
})
nodecore.register_craft({
    label = "crush dry concrete",
    action = "pummel",
    priority = 1,
    toolgroups = {thumpy = 2},
    duration = 0.3,
    nodes = {
        {
            match = { groups = {nc_stucco_etched_hard_coalstone = true}},
            replace = "nc_concrete:render"
        },
    }
})
