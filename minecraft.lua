local tArgs = {...}

local function genWorld()
	mc.log("Getting user info","NORMAL","MINECRAFT-WORLDGEN")
	
	end

local function loadWorld(world)
	mc.log("Loading "..tArgs[1], "SEVERE")

	end

if tArgs[1] == "New World" then
	genWorld()
elseif tArgs[1] then
	loadWorld(tArgs[1])
else
	shell.run(",minecraft/start")
	end
