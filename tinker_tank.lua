print("")
print("Now in Tank")
print("")
local _tank = {}

function _tank.main()
  local component = require("component")
  local computer = require("computer")
  local tank = component.tinker_tank
  local active = true

  while active do
    print("---")
    print("a = Get stored fluids")
    print("b = Get tank storage")
    print("c = Return to menu")
    userIn = io.read()
    if userIn == "a" or userIn == "A" then
      fluids = tank.getFluids()
      for i = 1, #fluids, 1 do
        print("--- Fluid: " .. i)
        print("Name of fluid: " .. fluids[i].label)
        print("Amount of fluid: " .. fluids[i].amount)
        if i%3 == 0 and i ~= #fluids then
          print("---")
          print("Press enter to continue")
        io.read()
        end
      end

    elseif userIn == "b" or userIn == "B" then
      --144 mbuckets = 1 ingot
      fillLevel = string.format("%.0f", tank.getFillLevel() / 144)
      fillCap = string.format("%.0f", tank.getCapacity() / 144)
      print("---")
      print("Furnace is " .. fillLevel .. " ingots full out of " .. fillCap .. " ingots")
      print(string.format("%.2f", (fillLevel / fillCap) * 100) .. "% full")

    elseif userIn == "c" or userIn == "C" then
      active = false
    else
      print("Invalid selection")
    end
  end
  print("Exiting")
end

return _tank