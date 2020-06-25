-- LUALOCALS < ---------------------------------------------------------
local ItemStack, minetest, nodecore, pairs, tostring
    = ItemStack, minetest, nodecore, pairs, tostring
-- LUALOCALS > ---------------------------------------------------------

--
--

-- Wet and Dry versions of patterned nodes.

local function lc(n) return tostring(n):lower():gsub("%W", "") end
local function cl(n)
    n = n:lower()
    n = (n == "vermi" and "vermy") or (n == "barry" and "verty") or (n == "ridgey" and "horzy") or (n == "icebox" and "iceboxy") or n
    return n
end

minetest.register_alias("nc_stucco:stylusW", "nc_concrete:stylus")

nc_stuccol.register_stucco = function(pat, mat, iswet)
    iswet = iswet and "_wet" or ""
    local isply = iswet and "_ply" or ""
    local nmat = mat == "clay" and "adobe" or mat == "slate" and "coalstone"
    local oldname,newname = "nc_stucco:stucco_"..pat.."_"..mat..iswet, "nc_concrete:concrete_"..lc(nmat)..isply
    return minetest.register_node(oldname, {}), minetest.register_alias_force(newname, oldname)
end


-- Refashioning legacy nodes into new, stronger, concrete versions
local gentrify_masonry = function()
local mats = {"clay","slate"}

for n = 1, 2, 1 do
local mat = mats[n]

for n = 1, #nc_stuccol.patterns, 1 do
    local v = nc_stuccol.patterns[n]
    nc_stuccol.register_stucco(v, mat, true)
    nc_stuccol.register_stucco(v, mat, false)
end


end

if(minetest.registered_nodes[nc_stuccol.dep[1]])then
    minetest.register_alias_force("nc_stucco:stucco_bordywalk_clay", "nc_stucco:stucco_Bordy-Thin_clay")
    minetest.register_alias_force("nc_stucco:stucco_bordyrun_clay", "nc_stucco:stucco_Bordy-Thick_clay")
    minetest.register_alias_force("nc_stucco:stucco_bordywalk_clay_wet", "nc_stucco:stucco_Bordy-Thin_clay_wet")
    minetest.register_alias_force("nc_stucco:stucco_bordyrun_clay_wet", "nc_stucco:stucco_Bordy-Thick_clay_wet")
    minetest.register_alias_force("nc_stucco:stucco_bordywalk_slate", "nc_stucco:stucco_Bordy-Thin_slate")
    minetest.register_alias_force("nc_stucco:stucco_bordyrun_slate_wet", "nc_stucco:stucco_Bordy-Thick_slate_wet")
    minetest.register_alias_force("nc_stucco:stucco_bordywalk_slate_wet", "nc_stucco:stucco_Bordy-Thin_slate_wet")
    minetest.register_alias_force("nc_stucco:stucco_bordyrun_slate", "nc_stucco:stucco_Bordy-Thick_slate")
else end

end
gentrify_masonry()

--Clay
for n = 1, #nc_stuccol.wca, 1 do
    local v = nc_stuccol.wca[n]
    minetest.register_alias_force("nc_stucco:stucco_" .. lc(v) .. "_clay", "nc_concrete:concrete_adobe_"..cl(v).."_ply")
    minetest.register_alias_force("nc_stucco:stucco_" .. lc(v) .. "_clay_dry", "nc_concrete:concrete_adobe_"..cl(v))


    -- Slate
    minetest.register_alias_force("nc_stucco:stucco_" .. lc(v) .. "_slate", "nc_concrete:concrete_coalstone_"..cl(v).."_ply")
    minetest.register_alias_force("nc_stucco:stucco_" .. lc(v) .. "_slate_dry", "nc_concrete:concrete_coalstone_"..cl(v))


end

for n = 1, #nc_stuccol.patterns, 1 do
    local v = nc_stuccol.patterns[n]
    nodecore.register_concrete_pattern({name = lc(v), description = lc(v), pattern_tile = "nc_stucco_pattern_"..lc(v)..".png"})
    
end
minetest.after(10, function() 
for k, v in pairs(minetest.registered_nodes)do
    
    local n = string.find(k, "nc_concrete:") and minetest.chat_send_all(k) or "-----------------------------"
end
end)
-- Curing Stage Nodes.
for n = 1, #nc_stuccol.curing.stages, 1 do
    local v = nc_stuccol.curing.stages[n]
    minetest.register_alias("nc_stucco:stucco_" .. lc(v) .. "_clay","nc_concrete:concrete_adobe_".."blank".."_ply")
    minetest.register_alias("nc_stucco:stucco_" .. "powdered" .. "_clay","nc_concrete:concrete_adobe_".."blank".."_ply")

    minetest.register_alias("nc_stucco:stucco_" .. lc(v) .. "_slate","nc_concrete:concrete_coalstone_".."blank".."_ply")
    minetest.register_alias("nc_stucco:stucco_" .. "powdered" .. "_slate","nc_concrete:concrete_coalstone_".."blank".."_ply")

end
-- Crushed Nodes.
local namepool = {}
for k,v in pairs(minetest.registered_nodes) do
    if(string.find(k,"nc_concrete:concrete_") and not string.find(k,"ply"))then
        table.insert(namepool, k)
    else end

end

-- Sculpting Nodes


for n = 1, #nc_stuccol.meshies do
minetest.register_node(tm..nc_stuccol.meshies.names[n], {
	tiles = {"nc_terrain_stone.png^[resize:8x8"},
    drawtype = "mesh",
    mesh = nc_stuccol.meshies[n],
    paramtype = "light",
    paramtype2 = "facedir"
	
})
end