tArgs = {...} --tArgs[1] == name tArgs[2] == seed

--Block id table set
blockids = {
sun = 1,
cloud = 2,
sky = 3,
nightSky = 4,
moon = 5,
grass = 6,
dirt = 7,
stone = 8,
obsidian = 9,
netherrack = 10,
netherPortal = 11,
bedrock = 12,
water = 13,
lava = 14,
}

local function convertBlock(blk)
	
	end

mc.log("dir made", "NORMAL", "MINECRAFT-WORLDGEN")
fs.makeDir(",minecraft/world/"..tArgs[1])

local x = 0
local y = 0
local x2, y2 = term.getSize()
local seed = tonumber(tArgs[2])
mc.log("seed = "..seed, "NORMAL", "MINECRAFT-WORLDGEN")

for i = 1, y2 do
	y = y + 1
	for f = 1, x2 do
		x = x + 1
		math.randomseed(tArgs[2])
		local block = math.random(6, 8)
		posx = tostring(x)
		posy = tostring(y)
		local w = fs.open(",minecraft/world/"..tArgs[1].."/"..posx..","..posy, "w")
		local aBlock = convertBlock(block)
		w.write(aBlock)
		w.close()
		end
	end
