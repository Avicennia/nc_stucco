local thismod = minetest.get_current_modname()
local modpath = minetest.get_modpath(thismod)


function ncchk()
    local ind = minetest.registered_nodes["nc_terrain:dirt"]
    local i;
    if (ind) then
        i = true
        return i
    else
    end
    return i
end

local isnc = ncchk()

nc_stuccol = {curing = {stages = {"sodden","moist","damp","dry","powdered"}},
patterns = {"gkey","beetle","bindy","crossy","corinth","hashy","icebox","vermi","bricky",
"hexy","brexy","barry","ridgey","lamby","doric","starry","targey","stakey","panelly","slatty","logos","peeky","mucky","enol","sn","hatchy","bordythin","bordythick"},
theseNodes = {}}
for k,v in ipairs(nc_stuccol.patterns)do
    nc_stuccol.theseNodes[k] = "nc_stucco:stucco_" .. v
end
rawset(_G, thismod, nc_stuccol)


dofile(modpath .. "/curing.lua")
if(isnc)then
    dofile(modpath .. "/crafting_nc.lua")
    dofile(modpath .. "/nodes_nc.lua")
else 
    dofile(modpath .. "/crafting_df.lua")
    dofile(modpath .. "/nodes_df.lua")
    dofile(modpath .. "/particles.lua")
end
