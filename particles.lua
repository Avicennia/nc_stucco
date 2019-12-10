-- DEAD CODE...??
--[[
function ps_insc_clay(pos)
	local psdef_inscrip = {
		amount = 6,
		time = 1,
		minpos = {x=pos.x -0.6, y=pos.y + 0.6, z=pos.z -0.6},
		maxpos = {x=pos.x + 0.6, y=pos.y, z=pos.z + 0.6},
		minvel = {x=0, y=0.4, z=0},
		maxvel = {x=0, y=0.8, z=0},
		minacc = {x=0, y=0, z=0},
		maxacc = {x=0.2, y=0.2, z=0.2},
		minexptime = 0.2,
		maxexptime = 3,
		minsize = 0.2,
		maxsize = 0.8,
		collisiondetection = true,
		collision_removal = false,
		vertical = true,
		texture = "canvas1a.png",
		glow = 0
	}
	minetest.add_particlespawner(psdef_inscrip);
end
--]]
