--menu program
local component = require("component")
local gpu = component.gpu
local w, h = gpu.getResolution()
smelteryInfo = require("smeltery")
furnaceInfo = require("seared_furnace")
tankInfo = require("tinker_tank")
--lazy
gpu.fill(1, 1, w, h, " ")
local active = true

while active do
  print("---")
  print("a = Smeltery")
  print("b = Furnace")
  print("c = Tank")
  print("d = Exit program")
  userIn = io.read()
  if userIn == "a" or userIn == "A" then
    smelteryInfo.main()
  elseif userIn == "b" or userIn == "B" then
    furnaceInfo.main()
  elseif userIn == "c" or userIn == "C" then
    tankInfo.main()
  elseif userIn == "d" or userIn == "D" then
    active = false
  else
    print("Invalid input")
  end
end
