


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
            replace = "nc_stucco:stuccopowdered_render"
        }
    }
})
nodecore.register_craft({
    label = "mix stucco aggregate",
    action = "pummel",
    priority = 1,
    toolgroups = {thumpy = 1},
    normal = {y = 1},
    nodes = {
        {
            match = "nc_concrete:aggregate",
            replace = "air"
        },
        {
            y = -1,
            match = "nc_concrete:aggregate",
            replace = "nc_stucco:stuccopowdered"
        }
    }
})
for n=1,#nc_stuccol.theseNodes, 1 do
nodecore.register_craft({
    label = "nc_stucco;craft_"..nc_stuccol.patterns[n],
    action = "pummel",
    priority = 2,
    toolgroups = {thumpy = 1},
    nodes = {
        {
            match = nc_stuccol.theseNodes[n],
            replace = nc_stuccol.theseNodes[n+1] or nc_stuccol.theseNodes[1]
        },
    }
})
end