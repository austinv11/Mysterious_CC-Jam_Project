local function header()
	term.setCursorPos(1,1)
	term.setTextColor(colors.yellow)
	print("Version: "..mc.version)
	term.setTextColor(colors.lightGray)
	term.setCursorPos(1, 3)
	mc.center("MINECRAFT!")
	mc.center("     -In CC!")
	term.setTextColor(colors.white)
	term.setCursorPos(1, 6)
	end
	
local function internal1()
	_, mButton, x, y = os.pullEvent("mouse_click")
	return mButton, x, y
	end
	
local function internal2()
	_, keycode = os.pullEvent("key")
	return keycode
	end
	
local function play()
	term.clear()
	term.setCursorPos(1,1)
	term.setTextColor(colors.lime)
	mc.center("Worlds")
	term.setTextColor(colors.yellow)
	local q, w = term.getSize()
	for l = 1, q do
		term.write("~")
		end
	term.setTextColor(colors.white)
	term.setCursorPos(1, 4)
	mc.log("Getting worlds...", "STDDER")
	local check = {}
	check = fs.list(",minecraft/world")
	local w = 0
	for name, data in pairs(check) do
		w = w + 1
		end
	mc.log(w.." worlds found! Listing...")
	mc.center("New World")
	local pos = 0
	w2 = 0
	while true do
		mc.log("Drawing menu...")
		if pos == 0 then
			for name, data in pairs(check) do
				mc.center(" "..data.." ")
				mc.center(" ")
				end
			mc.center(" New World ")
		elseif pos <= w then
			for name, data in pairs(check) do
				w2 = w2 + 1
				if w2 == pos then
					mc.center("["..data.."]")
				else
					mc.center(" "..data.." ")
					end
				mc.center(" ")
				end
			mc.center(" New World ")
		elseif pos > w then
			for name, data in pairs(check) do
				mc.center(" "..data.." ")
				mc.center(" ")
				end
			mc.center("[New World]")
			end
		key = internal2()
		--local mousef = internal1()
		--local keyf = internal2()
		--parallel.waitForAny(mousef, keyf)
		--[[if mButton == 1 then
			if y == 6 then
				term.setCursorPos(1, 6)
				term.setTextColor(colors.red)
				mc.center("Play")
				term.setTextColor(colors.white)
				mc.log("playing..", "STDDER")
				play()
				break
			elseif y == 9 then
				term.setCursorPos(1, 9)
				term.setTextColor(colors.red)
				mc.center("Settings")
				term.setTextColor(colors.white)
				mc.log("editing configs...", "STDDER")
				settings()
			elseif y == 12 then
				term.setCursorPos(1, 12)
				term.setTextColor(colors.red)
				mc.center("Quit")
				term.setTextColor(colors.white)
				mc.log("quitting...", "STDDER")
				quit()
				break
				end
		else ]]--
			if key == 200 then
				if pos == 1 or pos == 0 then
					pos = w + 1
				else
					pos = pos - 1
					end
			elseif key == 208 then
				if pos == (w + 1) or pos == 0 then
					pos = 1
				else
					pos = pos + 1
					end
			elseif key == 28 then
				if pos > w then
					mc.log("Preparing new world...", "STDDER")
					shell.run("minecraft", "New World")
					break
				else
					mc.log("Preparing "..check[pos], "STDDER")
					shell.run("minecraft", check[pos])
					break
					end
					--end
				end
			end
		end
	
local function settings()
	shell.run("edit ,minecraft/configs/minecraft.cfg")
	mc.log("Editted configs")
	end
	
local function quit()
	mc.log("Shutting down...", "SEVERE")
	os.reboot()
	end
	
local function selection()
	local pos = 0
	while true do
		mc.log("Drawing menu...")
		header()
		if pos == 0 then
			mc.center(" Play ")
			print(" ")
			print(" ")
			mc.center(" Settings ")
			print(" ")
			print(" ")
			mc.center(" Quit ")
		elseif pos == 1 then
			mc.center("[Play]")
			print(" ")
			print(" ")
			mc.center(" Settings ")
			print(" ")
			print(" ")
			mc.center(" Quit ")
		elseif pos == 2 then
			mc.center(" Play ")
			print(" ")
			print(" ")
			mc.center("[Settings]")
			print(" ")
			print(" ")
			mc.center(" Quit ")
		elseif pos == 3 then
			mc.center(" Play ")
			print(" ")
			print(" ")
			mc.center(" Settings ")
			print(" ")
			print(" ")
			mc.center("[Quit]")
			end
		key = internal2()
		--local mousef = internal1()
		--local keyf = internal2()
		--parallel.waitForAny(mousef, keyf)
		--[[if mButton == 1 then
			if y == 6 then
				term.setCursorPos(1, 6)
				term.setTextColor(colors.red)
				mc.center("Play")
				term.setTextColor(colors.white)
				mc.log("playing..", "STDDER")
				play()
				break
			elseif y == 9 then
				term.setCursorPos(1, 9)
				term.setTextColor(colors.red)
				mc.center("Settings")
				term.setTextColor(colors.white)
				mc.log("editing configs...", "STDDER")
				settings()
			elseif y == 12 then
				term.setCursorPos(1, 12)
				term.setTextColor(colors.red)
				mc.center("Quit")
				term.setTextColor(colors.white)
				mc.log("quitting...", "STDDER")
				quit()
				break
				end
		else ]]--
			if key == 200 then
				if pos == 1 or pos == 0 then
					pos = 3
				else
					pos = pos - 1
					end
			elseif key == 208 then
				if pos == 3 or pos == 0 then
					pos = 1
				else
					pos = pos + 1
					end
			elseif key == 28 then
				if pos == 1 then
					term.setCursorPos(1, 6)
					term.setTextColor(colors.yellow)
					mc.center("[Play]")
					term.setTextColor(colors.white)
					mc.log("playing..", "STDDER")
					play()
					break
				elseif pos == 2 then
					term.setCursorPos(1, 9)
					term.setTextColor(colors.yellow)
					mc.center("[Settings]")
					term.setTextColor(colors.white)
					mc.log("editing configs...", "STDDER")
					settings()
					break
				elseif pos == 3 then
					term.setCursorPos(1, 12)
					term.setTextColor(colors.yellow)
					mc.center("[Quit]")
					term.setTextColor(colors.white)
					mc.log("quitting...", "STDDER")
					quit()
					break
					--end
				end
			end
		end
	end
	
selection()
