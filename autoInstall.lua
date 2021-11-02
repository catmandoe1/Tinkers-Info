local shell = require("shell")
local filesystem = require("filesystem")
local computer = require("computer")

if not filesystem.exists("/home/TinkersInfo") then
	filesystem.makeDirectory("/home/TinkersInfo")
	shell.setWorkingDirectory("/home/TinkersInfo/")
	print("Downloading")
	shell.execute("wget https://raw.githubusercontent.com/catmandoe1/Tinkers-Info/main/menu.lua")
	shell.execute("wget https://raw.githubusercontent.com/catmandoe1/Tinkers-Info/main/seared_furnace.lua")
	shell.execute("wget https://raw.githubusercontent.com/catmandoe1/Tinkers-Info/main/smeltery.lua")
	shell.execute("wget https://raw.githubusercontent.com/catmandoe1/Tinkers-Info/main/tinker_tank.lua")
	print("Downloaded files")
	shell.setWorkingDirectory("/home/")
	print("Removing autoInstall.lua")
	filesystem.remove("home/autoInstall.lua")
	print("Finished installing")
	print("Open \"TinkersInfo\" and run \"menu\" ")
else
	print("TinkersInfo already installed")
	print("Check directories")
end
