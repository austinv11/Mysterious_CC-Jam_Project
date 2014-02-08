version = "0.1"

function createLog()
	local time = os.time()
	local w = fs.open(".minecraft/logs/minecraft-log", "w")
	w.writeLine("[MINECRAFT]["..time.."][NORMAL]")
	w.close()
	end
	
function log(event, tagname, tag)
	local time = os.time()
	if tag == nil then
		tag = "NORMAL"
		end
	if tagname == nil then
		tagname = "MINECRAFT"
		end
	local w = fs.open(".minecraft/logs/minecraft-log", "a")
	w.writeLine("["..tagname.."]["..time.."]["..tag.."] "..event)
	w.close()
	end
