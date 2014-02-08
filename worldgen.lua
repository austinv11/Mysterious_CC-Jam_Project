tArgs = {...} --tArgs[1] == name tArgs[2] == seed

--[[World Gen depth map
1-3; background.sun
1-7; background.cloud, background.sky, background.nightSky, background.moon
8-10; blocks.grass
9-15; blocks.dirt
9-18; blocks.stone
19; tiles.bedrock

]]--

--Block id table set
blockids = {
"background.sun",
"background.cloud",
"background.sky",
"background.nightSky",
"background.moon",
"blocks.grass",
"blocks.dirt",
"blocks.stone",
"blocks.obsidian",
"blocks.netherrack",
"tiles.netherPortal",
"tiles.bedrock",
"tiles.water",
"tiles.lava",
"tiles.playerHead",
"tiles.playerBottom"
}

local function convertBlock(blk)
	local z = 1
	for name, data in pairs(blockids) do
		if z == blk then
			return data
			end
		z = z + 1
		end
	end

local function docGen(x2, y2, blllck)
	posx = tostring(x2)
	posy = tostring(y2)
	local w = fs.open(",minecraft/world/"..tArgs[1].."/"..posx..","..posy, "w")
	local aBlock = convertBlock(blllck)
	w.write(aBlock)
	w.close()
	end
	
mc.hook("worldgen")
mc.log("dir made", "NORMAL", "MINECRAFT-WORLDGEN")
fs.makeDir(",minecraft/world/"..tArgs[1])

local x = 0
local y = 0
local x2, y2 = term.getSize()
local seed = tonumber(tArgs[2])
mc.log("seed = "..seed, "NORMAL", "MINECRAFT-WORLDGEN")
mc.log("generating...", "SEVERE", "MINECRAFT-WORLDGEN")

for i = 1, y2 do
	y = y + 1
	x = 0
	mc.log("y = "..y, "STDDER", "MINECRAFT-WORLDGEN")
	for f = 1, x2 do
		x = x + 1
		mc.log("x = "..x, "NORMAL", "MINECRAFT-WORLDGEN")
		math.randomseed(tArgs[2])
		if y <= 7 then
			if y >= 1 and y <= 3 and x >= 1 and x <= 3 then
				docGen(x, y, 1)
			else
				local block = math.random(2, 3)
				docGen(x, y, block)
				end
		elseif y >= 8 and y <= 15 then
			if y>= 8 and y <= 9 then
				local block = math.random(6, 7)
				docGen(x, y, block)
			else
				local block = math.random(7, 8)
				docGen(x, y, block)
				end
		elseif y >= 16 and y <= 18 then
			docGen(x, y, 8)
		elseif y == 19 then
			docGen(x, y, 12)
			end
		end
	end

mc.log("World: '"..tArgs[1].."' has been successfully generated!", "NORMAL", "MINECRAFT-WORLDGEN")
