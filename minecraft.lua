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
		if name ~= "New_World" then
			mc.log("New world name = "..name, "NORMAL", "MINECRAFT-WORLDGEN")
			break
		else
			mc.log("Error: world name = 'New_World'", "SEVERE", "MINECRAFT-WORLDGEN")
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
	mc.log("generating...", "SEVERE", "MINECRAFT-WORLDGEN")
	shell.run(",minecraft/worldgen", name, seed)
	end

local function loadWorld(world)
	mc.log("Loading "..tArgs[1], "SEVERE")
	mc.hook("loading world")
	term.clear()
	term.setCursorPos(1,1)
	term.setBackgroundColor(colors.brown)
	local a, s = term.getSize()
	for i = 1, s do
		local n, m = term.getCursorPos()
		m = m + 1
		for o = 1, a do
			term.write(" ")
			end
		term.setCursorPos(1, m)
		end
	term.setCursorPos(1, 8)
	mc.center("Loading World")
	term.setBackgroundColor(colors.white)
	ax = 0
	ay = 0
	for i = 1, s do
		ay = ay + 1
		local n, m = term.getCursorPos()
		m = m + 1
		for o = 1, a do
			ax = ax + 1
			axx = tostring(ax)
			ayy = tostring(ay)
			local r = fs.open(",minecraft/world/"..name.."/"..axx..","..ayy, "r")
			local k = r.readAll()
			r.close()
			k = tonumber(k)
			term.setBackgroundColor(k)
			term.write(" ")
			end
		ax = 0
		term.setCursorPos(1, m)
		end
	end

if tArgs[1] == "New_World" then
	genWorld()
	loadWorld(name)
elseif tArgs[1]  ~= "New_world" and tArgs[1] ~= nil then
	loadWorld(tArgs[1])
else
	shell.run(",minecraft/start")
	end
