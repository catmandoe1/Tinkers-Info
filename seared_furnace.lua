
local _furnace = {}

function _furnace.main()
	print("")
	print("Now in Furnace")
	print("")
	local component = require("component")
	local computer = require("computer")
	local furnace = component.seared_furnace
	local active = true

	function getProgress(intChoosenSlot, Amount)
		solt = intChoosenSlot - 1
		--320 peak temp per item in solt with 16 time max
		tempCap = 320 * Amount
		curTemp = furnace.getTemperature(solt)
		progress = (curTemp / tempCap) * 100
		if curTemp == 1 then
			progress = 100
		end
		return string.format("%.1f", progress)
	end

	while active do
		print("---")
		print("a = Info about a certain Furnace slot")
		print("b = Fuel info")
		print("c = Return to menu")
		userIn = io.read()
		if userIn == "a" or userIn == "A" then
			furnaceCap = furnace.getInventorySize()
			print("---")
			print("Enter slot number to examine")
			print("There are " .. furnaceCap .. " slots")
			choosenSlot = io.read()
			intChoosenSlot = tonumber(choosenSlot)
			if intChoosenSlot ~= nil and intChoosenSlot >= 1 and intChoosenSlot <= furnaceCap then
				furnaceSlotInfo = furnace.getStackInSlot(intChoosenSlot)
				if furnaceSlotInfo ~= nil then
					Amount = furnaceSlotInfo.size
					print("---")
					print("Info for slot " .. choosenSlot .. ":-")
					print("Name: " .. furnaceSlotInfo.label)
					print("String name: " .. furnaceSlotInfo.name)
					print("Has tag: " .. tostring(furnaceSlotInfo.hasTag))
					print("Amount: " .. Amount)
					print("Can be smelted: " .. tostring(furnace.canHeat(intChoosenSlot)))
					print("Progress: " .. getProgress(intChoosenSlot, Amount) .. "%")
					--returns wrong numbers
					--print("Temperature required to cook: " .. cookTemp)

				else
					print("---")
					print("There is nothing in this slot")
				end
			else
				print("---")
				print("Invalid slot")
			end
		end

		if userIn == "b" or userIn == "B" then
			fuelInfo = furnace.getFuelInfo()
			fuelInfoFluid = fuelInfo.fluid.label
			print("---")
			print("Furnace has fuel: " .. tostring(furnace.hasFuel()))
			print("Fuel Type: " .. fuelInfoFluid)
			print("Fuel temperature: " .. furnace.getTemperature() .. "°C")
		end

		if userIn == "c" or userIn == "C" then
			active = false
		end
		if userIn ~= "a" and userIn ~= "A" and userIn ~= "b" and userIn ~= "B" and userIn ~= "c" and userIn ~= "C" then
			print("Invalid selection")
		end
	end
	print("Exiting")
end

return _furnace
