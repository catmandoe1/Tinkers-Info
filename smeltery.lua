
local _smeltery = {}

function _smeltery.main()
	print("")
	print("Now in Smeltery")
	print("")
	local component = require("component")
	local computer = require("computer")
	local smelt = component.smeltery
	active = true
	smelteryCap = smelt.getInventorySize()

	function showFluids()
		exit = false
		moveCounter = 2
		while not exit do
			table = smelt.getContainedFluids()
			exit = not smelt.moveFluidToBottom(moveCounter)
			moveCounter = moveCounter + 1
			print("---")
			print("Name of Fluid: " .. table.label)
			print("Amount of bars: " .. string.format("%.1f", table.amount / 144) .. " bars")
		end
	end

	while active do
		print("---")
		print("a = Get info about a smeltery slot")
		print("b = Get smeltery fuel information")
		print("c = Get info about smelted products")
		print("d = Return to menu")
		userIn = io.read()
		if userIn == "a" or userIn == "A" then
			print("---")
			print("Enter slot number to examine")
			print("There are " .. smelteryCap .. " slots")
			choosenSlot = io.read()
			intChoosenSlot = tonumber(choosenSlot)
			if intChoosenSlot ~= nil and intChoosenSlot >= 1 and intChoosenSlot <= smelteryCap then
				smelterySlotInfo = smelt.getStackInSlot(intChoosenSlot)
				--broken
				--smeltProgress = string.format("%.0f", smelt.getHeatingProgress(intChoosenSlot))
				--print(type(smelt.getHeatingProgress(intChoosenSlot)))
				--print(smelt.getHeatingProgress(intChoosenSlot))
				
				if smelterySlotInfo ~= nil then
					--hasTag
					--label
					--name
					print("---")
					print("Info for slot " .. choosenSlot .. ":-")
					print("Name: " .. smelterySlotInfo.label)
					print("String name: " .. smelterySlotInfo.name)
					print("Has tag: " .. tostring(smelterySlotInfo.hasTag))
					--print("Temperature needed to smelt: " .. smelt.getTemperature(intChoosenSlot))
					print("Can be Smelted: " .. tostring(smelt.canHeat(intChoosenSlot)))
					--if smeltProgress ~= nil then
						--print("Smelting progress:" .. smeltProgress)
					--else
						--print("Smelting progress: 0%")
					--end
				else
					print("---")
					print("There is nothing in this slot")
				end
			else
				print("Invalid slot")
			end
		end

		if userIn == "b" or userIn == "B" then
			fuelInfo = smelt.getFuelInfo()
			fuelInfoFluid = fuelInfo.fluid.label
			print("---")
			print("Fuel Type: " .. fuelInfoFluid)
			print("Fuel temperature: " .. smelt.getTemperature() .. "°C")
		end

		if userIn == "c" or userIn == "C" then
			isSmelting = smelt.isEmpty()
			if isSmelting == true then
				isSmelting = false
			elseif isSmelting == false then
				isSmelting = true
			end
			fillLevel = string.format("%.0f", smelt.getFillLevel() / 144)
			fillCap = string.format("%.0f", smelt.getCapacity() / 144)
			print("---")
			print("Is smeltery smelting: " .. tostring(isSmelting))
			print("Smeltery is " .. fillLevel .. " ingots full out of " .. fillCap .. " ingots")
			print(string.format("%.2f", (fillLevel / fillCap) * 100) .. "% full")
			print(showFluids())
		end

		if userIn == "d" or userIn == "D" then
			active = false
		end
		if userIn ~= "a" and userIn ~= "A" and userIn ~= "b" and userIn ~= "B" and userIn ~= "c" and userIn ~= "C" and userIn ~= "d" and userIn ~= "D" then
			print("Invalid selection")
		end
	end
	print("Exiting")
end

return _smeltery
