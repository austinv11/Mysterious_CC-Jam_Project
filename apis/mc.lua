version = "ALPHABUILD 1.0"

function createLog()
	local time = os.time()
	local w = fs.open(",minecraft/logs/minecraft-log", "w")
	w.writeLine("["..[["]].."MINECRAFT"..[["]].."]["..time.."][NORMAL]")
	w.close()
	end
	
function log(event, tag, tagname)
	local time = os.time()
	if tag == nil then
		tag = "NORMAL"
		end
	if tagname == nil then
		tagname = "MINECRAFT"
		end
	local w = fs.open(",minecraft/logs/minecraft-log", "a")
	w.writeLine("["..[["]]..tagname..[["]].."]["..time.."]["..tag.."] "..event)
	w.close()
	end
	
function center(text)
  local x, y = term.getSize()
  local x2, y2 = term.getCursorPos()
    term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)
    term.write(text)
    y2 = y2 + 1
    term.setCursorPos(1, y2)
  end
  
function hook(event)
	log("Hooking '"..event.."'", "STDDER", "MINECRAFT-MODLOADER")
	local tble = {}
	tble = fs.list(",minecraft/mods")
	if tble[1] then
		for name, data in pairs do
			shell.run(",minecraft/mods/"..data.." "..event)
			end
		end
	log("Hooked!", "NORMAL", "MINECRAFT-MODLOADER")
	end
	
function convertColor(blockString)
	if blockString == "background.sun" then
		return background.sun
	elseif blockString == "background.cloud" then
		return background.cloud
	elseif blockString == "background.sky" then
		return background.sky
	elseif blockString == "background.nightSky" then
		return background.nightSky
	elseif blockString == "background.moon" then
		return background.moon
	elseif blockString == "blocks.grass" then
		return blocks.grass
	elseif blockString == "blocks.dirt" then
		return blocks.dirt
	elseif blockString == "blocks.stone" then
		return blocks.stone
	elseif blockString == "blocks.obsidian" then
		return blocks.obsidian
	elseif blockString == "blocks.netherrack" then
		return blocks.netherrack
	elseif blockString == "tiles.netherPortal" then
		return tiles.netherPortal
	elseif blockString == "tiles.bedrock" then
		return tiles.bedrock
	elseif blockString == "tiles.water" then
		return tiles.water
	elseif blockString == "tiles.lava" then
		return tiles.lava
	elseif blockString == "tiles.playerHead" then
		return tiles.playerHead
	elseif blockString == "tiles.playerBottom" then
		return tiles.playerBottom
		end
	end
	
function getBlockData(worldname, axxx, ayyy)
	local r = fs.open(",minecraft/world/"..worldname.."/"..axxx..","..ayyy, "r")
	if r then
		local k = r.readAll()
		mc.log("R = "..k, "NORMAL", "MINECRAFT-DEBUG")
		r.close()
		return k

	else
		mc.log("Error: fs is closed!", "SEVERE")
		end
	end
