os.loadAPI(".minecraft/apis/mc")
os.loadAPI(".minecraft/blockData/blocks")
os.loadAPI(".minecraft/blockData/background")
os.loadAPI(".minecraft/blockData/tiles")

mc.createLog()
mc.log("Launching Minecraft ver."..mc.version)
mc.log("Checking for mods...", "MINECRAFT-MODLOADER", "STDDER")

local table = {}
table = fs.list(".minecraft/mods")
local x = 0
for name, data in pairs(table) do
	x = x + 1
	end
if x ~= 0 then
	mc.log(x.." mods found!", "MINECRAFT-MODLOADER")
	mc.log("Loading mods...", "MINECRAFT-MODLOADER", "STDDER")
	for name, data in pairs(table) do
		local data2 = string.upper(data)
		mc.log("Loading...", data2, "SEVERE")
		od.loadAPI(".minecraft/mods/"..data)
		mc.log("Loaded!", data2)
		end
	mc.log(x.." mods loaded!", "MINECRAFT-MODLOADER")
	end
	

