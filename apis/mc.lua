version = "ALPHABUILD 1.0"

function createLog()
	local time = os.time()
	local w = fs.open(",minecraft/logs/minecraft-log", "w")
	w.writeLine("[MINECRAFT]["..time.."][NORMAL]")
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
	w.writeLine("["..tagname.."]["..time.."]["..tag.."] "..event)
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
	local tble = {}
	tble = fs.list(",minecraft/mods")
	for name, data in pairs do
		shell.run(",minecraft/mods/"..data.." "..event)
		end
	end