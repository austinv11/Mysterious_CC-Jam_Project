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
	
mc.hook("worldgen-dir")
mc.log("dir made", "NORMAL", "MINECRAFT-WORLDGEN")
fs.makeDir(",minecraft/world/"..tArgs[1])

local x = 0
local y = 0
local x2, y2 = term.getSize()
--[[local sseed = tArgs[2]
mc.log("seed = "..sseed, "NORMAL", "MINECRAFT-WORLDGEN")
local seed = {}
for j = 1, seed:len() do
	table.insert(seed, seed:sub(j, j))
	end
local tx = 0]]--
mc.log("generating...", "SEVERE", "MINECRAFT-WORLDGEN")
mc.hook("worldgen-world")

for i = 1, y2 do
	y = y + 1
	x = 0
	mc.log("Generating y = "..y, "STDDER", "MINECRAFT-WORLDGEN")
	for f = 1, x2 do
		--tx = tx + 1
		x = x + 1
		--[[if seed[tx] == nil then
			tx = 1
			end
		local seedNum = tonumber(seed[tx])
		math.randomseed(seedNum)]]--
		if y <= 3 then
			if y >= 1 and y <= 3 and x >= 1 and x <= 3 then
				mc.docGen(tArgs[1], x, y, 1)
			else
				local block = math.random(2, 3)
				local cBlock1 = mc.getBlockData(tArgs[1], (x-1), y)
				if cBlcok1 then
					mc.log("CBLOCK1", "NORMAL", "MINECRAFT-DEBUG")-- debug
					end
				local cBlock2 = mc.getBlockData(tArgs[1], x, (y+1))
				if cBlcok2 then
					mc.log("CBLOCK2", "NORMAL", "MINECRAFT-DEBUG")--debug
					end
				if cBlock1 ~= blockids[block] and cBlock2 ~= blockids[block] then
					block = math.random(2, 3)
					if cBlock1 ~= blockids[block] then
						block = math.random(2, 3)
						end
					end
				mc.docGen(tArgs[1], x, y, block)
				end
		elseif y <= 7 then
			mc.docGen(tArgs[1], x, y, 3)
		elseif y >= 8 and y <= 15 then
			if y>= 8 and y <= 9 then
				local block = math.random(5, 7)
				if block == 5 then
					block = 3
					end
				cBlock1 = mc.getBlockData(tArgs[1], (x-1), y)
				cBlock2 = mc.getBlockData(tArgs[1], x, (y+1))
				if cBlock1 ~= blockids[block] and cBlock2 ~= blockids[block] then
					block = math.random(5, 7)
					if block == 5 then
						block = 3
						end
					if cBlock1 ~= blockids[block] then
						block = math.random(5, 7)
						if block == 5 then
							block = 3
							end
						end
					end
				if blockids[block] == "blocks.dirt" then
					if cBlock2 == "background.sky" then
						mc.log("Dirt > Grass, x = "..x.." y = "..y, "NORMAL", "MINECRAFT-WORLDGEN")
						block = 6
						end
					end
				--[[if blockids[block] == "blocks.grass" then
					if cBlock2 ~= "background.sky" then
						mc.log("Grass > Dirt, x = "..x.." y = "..y, "NORMAL", "MINECRAFT-WORLDGEN")
						block = 7
						end
					end]]--
				mc.docGen(tArgs[1], x, y, block)
			else
				local block = math.random(7, 8)
				local cBlock1 = mc.getBlockData(tArgs[1], (x-1), y)
				local cBlock2 = mc.getBlockData(tArgs[1], x, (y+1))
				if cBlock1 ~= blockids[block] and cBlock2 ~= blockids[block] then
					block = math.random(7, 8)
					if blockids[block] == "blocks.dirt" then
						block = math.random(7,8)
						end
					if cBlock1 ~= blockids[block] then
						block = math.random(7, 8)
						end
					end
				mc.docGen(tArgs[1], x, y, block)
				end
		elseif y >= 16 and y <= 18 then
			mc.docGen(tArgs[1], x, y, 8)
		elseif y == 19 then
			mc.docGen(tArgs[1], x, y, 12)
			end
		end
	end

mc.log("World: '"..tArgs[1].."' has been successfully generated!", "NORMAL", "MINECRAFT-WORLDGEN")
mc.log("Setting Spawn Point...", "STDDER", "MINECRAFT-WORLDGEN")
local px = 3
local py = 10
while true do
	local spawn1 = mc.getBlockData(tArgs[1], px, py)
	local spawn2 = mc.getBlockData(tArgs[1], px, (py - 1))
	local spawn3 = mc.getBlockData(tArgs[1], px, (py + 1))
	if spawn1 == "background.sky" and spawn2 == "background.sky" and spawn3 ~= "background.sky" then
		break
	elseif spawn3 == "background.sky" then
		py = py + 1
	else
		py = py - 1
		end
	end
mc.docGen(tArgs[1], px, py, 16)
mc.docGen(tArgs[1], px, (py - 1), 15)
mc.log("Spawn set! At x:"..px.." y:"..py, "NORMAL", "MINECRAFT-WORLDGEN")
