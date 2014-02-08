os.loadAPI(".minecraft/apis/mc")
os.loadAPI(".minecraft/blockData/blocks")
os.loadAPI(".minecraft/blockData/background")
os.loadAPI(".minecraft/blockData/tiles")

local function loadingScreen()
	local r = fs.open(".minecraft/assets/mojang")
	local mj = {}
	mj = r.readAll()
	r.close()
	term.setTextColor(colors.orange)
	term.clear()
	term.setCursorPos(1,2)
	for name, data in pairs(mj) do
		mc.center(data)
		end
	term.setTextColor(colors.white)
	end

loadingScreen()
mc.createLog()
mc.log("Launching Minecraft ver."..mc.version)
mc.log(" ")
mc.log("Minecraft (c) is the propety of Mojang")
mc.log("This Minecraft 'port' is made by austinv11 (c) 2014")
mc.log(" ")
mc.log("Checking for mods...", "STDDER", "MINECRAFT-MODLOADER")

local table = {}
table = fs.list(".minecraft/mods")
local x = 0
for name, data in pairs(table) do
	x = x + 1
	end
if x ~= 0 then
	mc.log(x.." mods found!", "NORMAL", "MINECRAFT-MODLOADER")
	mc.log("Loading mods...",  "STDDER", "MINECRAFT-MODLOADER")
	for name, data in pairs(table) do
		local data2 = string.upper(data)
		mc.log("Loading...", "SEVERE", data2)
		od.loadAPI(".minecraft/mods/"..data)
		mc.log("Loaded!", "NORMAL", data2)
		end
	mc.log(x.." mods loaded!", "NORMAL", "MINECRAFT-MODLOADER")
	end

mc.log("Looking for configs...", "STDDER")
local table = {}
table = fs.list(".minecraft/configs")
local x = 0
for name, data in pairs(table) do
	x = x + 1
	end
mc.log("Found "..x.." configs! Loading them...", "SEVERE")
for name, data in pairs(table) do
	os.loadAPI(".minecraft/configs/"..data)
	mc.log("Loaded "..data, "STDDER")
	end
mc.log("Finished loading "..x.." configs!")
