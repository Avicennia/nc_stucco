-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore, pairs
    = minetest, nodecore, pairs
-- LUALOCALS > ---------------------------------------------------------

local modname = "nc_stucco:"

local function concrete_type(node)
    local name = node and string.find(node.name, "blank_ply") and node.name
    
    return name and string.find(name, "adobe") and name or string.find(name, "coalstone") and name or string.find(name, "sandstone") and name or "lol"
end

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

--Sculpting crafts
for n = 1, #nc_stuccol.boss.concrete_mats-1 do

    local nombre =  nc_stuccol.boss.mod..":".."concrete_"..nc_stuccol.boss.concrete_mats[n].."_blank_ply"

nodecore.register_craft({
    label = "dig up tacky material",
    action = "pummel",
    priority = 1,
    toolgroups = {crumbly = 3},
    duration = 0.3,
    nodes = {
        {
            match = {name = nombre},
            replace = "air"
        },
    },
    after = function(pos)
        local itemstack = ItemStack({name = nombre, count = 1})
        minetest.add_item(pos, itemstack)
    end
})

end

nodecore.register_craft({
    label = "dig up tacky smoothstone",
    action = "pummel",
    priority = 1,
    toolgroups = {crumbly = 3},
    duration = 0.3,
    nodes = {
        {
            match = {name = "nc_concrete:terrain_stone_blank_ply"},
            replace = "air"
        },
    },
    after = function(pos)
        local itemstack = ItemStack({name = "nc_concrete:terrain_stone_blank_ply", count = 1})
        minetest.add_item(pos, itemstack)
    end
})

