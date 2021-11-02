--menu program
local component = require("component")
local isSmelteryConnected = component.isAvailable("smeltery")
local isFurnaceConnected = component.isAvailable("seared_furnace")
local isTankConnected = component.isAvailable("tinker_tank")
smelteryInfo = require("smeltery")
furnaceInfo = require("seared_furnace")
tankInfo = require("tinker_tank")
local active = true

function isConnected(connected)
	string = ""
	if connected == false then
		string = " - Not connected"
	end
	return string
end

smelteryNotConnected = isConnected(isSmelteryConnected)
furnaceNotConnected = isConnected(isFurnaceConnected)
tankNotConnected = isConnected(isTankConnected)

while active do
	print("---")
	print("a = Smeltery" .. smelteryNotConnected)
	print("b = Furnace" .. furnaceNotConnected)
	print("c = Tank" .. tankNotConnected)
	print("d = Exit program")
  userIn = io.read()
	if userIn == "a" or userIn == "A" and isSmelteryConnected == true then
		smelteryInfo.main()
	elseif userIn == "b" or userIn == "B" and isFurnaceConnected == true then
		furnaceInfo.main()
	elseif userIn == "c" or userIn == "C" and isTankConnected == true then
		tankInfo.main()
  elseif userIn == "d" or userIn == "D" then
    active = false
  else
    print("Invalid input")
  end
end
