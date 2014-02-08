local tArgs = {...}

local function genWorld()
	mc.log("Getting user info","NORMAL","MINECRAFT-WORLDGEN")
	term.clear()
	term.setCursorPos(1,2)
	while true do
		term.write("Please enter the name of the world: ")
		term.setTextColor(colors.yellow)
		name = read()
		term.setTextColor(colors.white)
		if name ~= "New World" then
			mc.log("New world name = "..name, "NORMAL", "MINECRAFT-WORLDGEN")
			break
		else
			mc.log("Error: world name = 'New World'", "SEVERE", "MINECRAFT-WORLDGEN")
			end
		end
	term.write("Seed (Type 'void' for random seed): ")
	term.setTextColor(colors.yellow)
	seed = read()
	seed = string.lower(seed)
	term.setTextColor(colors.white)
	if seed == "void" then
		mc.log("seed = 'void', generating random seed", "STDDER", "MINECRAFT-WORLDGEN")
		seed = math.random(100, 100000000)
		mc.log("seed determined; "..seed, "NORMAL", "MINECRAFT-WORLDGEN")
	else
		mc.log("converting seed to become readable...", "NORMAL", "MINECRAFT-WORLDGEN")
		seed = string.byte(seed)
		seed = tonumber(seed)
		mc.log("done", "NORMAL", "MINECRAFT-WORLDGEN")
		end
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
