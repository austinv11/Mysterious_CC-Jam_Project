local ver = "0.1"

local dirs = {"apis", "assets", "blockData", "configs", "logs", "mods", "world"}
	
local function gitGet(path, toPath)
        local dl = http.get("https://raw.github.com/austinv11/Mysterious_CC-Jam_Project/master/"..path)
        if dl then
                local file = dl.readAll()
                dl.close()
                        local w = fs.open(toPath,"w")
                        if w then
                                w.write(file)
                                w.close()
                                return true
                        else
                                w.close()
                                end
        else
                term.setTextColor(colors.red)
                print("Connection Failed!")
                term.setTextColor(colors.white)
                end
        end
        
local function center(text)
  local x, y = term.getSize()
  local x2, y2 = term.getCursorPos()
    term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)
    term.write(text)
    y2 = y2 + 1
    term.setCursorPos(1, y2)
  end
  
local function prepInstall()
	for name, data in pairs(dirs) do
		fs.makeDir(data)
		end
	end
        
local function download()
	gitGet("assets/mojang.lua", "assets/mojang")
	end
	
local function setScreen()
	while true do
		term.clear()
		term.setCursorPos(1,1)
		term.setTextColor(colors.yellow)
		print("MCCCMC-Installer Version "..ver)
		term.setTextColor(colors.white)
		print("Are you sure you want to install this? (Y/N")
		print("*You won't regret it ;)*")
		local input = read()
		input = string.lower(input)
		if input == "y" then
			prepInstall()
			download()
			print("Restarting!")
			sleep(0.25)
			os.reboot()
			break
		elseif input == "n" then
			break
			end
		end
	end

setScreen()
