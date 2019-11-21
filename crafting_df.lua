local iname = "nc_stucco:stylusW";
minetest.register_tool("nc_stucco:stylusW", {
    description = "Stone-Tipped Stylus",
    inventory_image = "stylus.png",
    groups = {
        flammable = 2,
        snappy = 2
    },
    tool_capabilities = {full_punch_interval = 0.8},
})
minetest.register_craft({
    output = iname,
    recipe = {
        {'', '', ''},
        {'', '', 'default:cobble'},
        {'', 'default:stick', ''},
    },
})