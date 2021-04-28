local obj = {}
obj.__index = obj
obj.name = "Command"

--- Load dependencies
local function script_path()
  local str = debug.getinfo(2, "S").source:sub(2)
  return str:match("(.*/)")
end
obj.spoonPath = script_path()

Validate = dofile(obj.spoonPath.."/validator.lua")
Resize = dofile(obj.spoonPath.."/resize.lua")

--- Command:fullscreen(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
obj.fullScreen = function(windowFrame, screenFrame)
  local newFrame = Resize:fullScreen(windowFrame, screenFrame)
  return newFrame
end

--- Command:center(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
obj.center = function(windowFrame, screenFrame)
  local newFrame = Resize:center(windowFrame, screenFrame)
  return newFrame
end

--- Command:leftHalf(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
obj.leftHalf = function(windowFrame, screenFrame)
  local newFrame

  if Validate:leftTwoThirds(windowFrame, screenFrame) then
    newFrame = Resize:leftFull(windowFrame, screenFrame)
  elseif Validate:leftHalf(windowFrame, screenFrame) then
    newFrame = Resize:leftTwoThirds(windowFrame, screenFrame)
  elseif Validate:leftThird(windowFrame, screenFrame) then
    newFrame = Resize:leftHalf(windowFrame, screenFrame)
  else
    newFrame = Resize:leftThird(windowFrame, screenFrame)
  end

  return newFrame
end

--- Command:topHalf(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
obj.topHalf = function(windowFrame, screenFrame)
  local newFrame

  if Validate:topTwoThirds(windowFrame, screenFrame) then
    newFrame = Resize:topFull(windowFrame, screenFrame)
  elseif Validate:topHalf(windowFrame, screenFrame) then
    newFrame = Resize:topTwoThirds(windowFrame, screenFrame)
  elseif Validate:topThird(windowFrame, screenFrame) then
    newFrame = Resize:topHalf(windowFrame, screenFrame)
  else
    newFrame = Resize:topThird(windowFrame, screenFrame)
  end

  return newFrame
end

--- Command:bottomHalf(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
obj.bottomHalf = function(windowFrame, screenFrame)
  local newFrame

  if Validate:bottomTwoThirds(windowFrame, screenFrame) then
    newFrame = Resize:bottomFull(windowFrame, screenFrame)
  elseif Validate:bottomHalf(windowFrame, screenFrame) then
    newFrame = Resize:bottomTwoThirds(windowFrame, screenFrame)
  elseif Validate:bottomThird(windowFrame, screenFrame) then
    newFrame = Resize:bottomHalf(windowFrame, screenFrame)
  else
    newFrame = Resize:bottomThird(windowFrame, screenFrame)
  end

  return newFrame
end



--- Command:rightHalf(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
obj.rightHalf = function(windowFrame, screenFrame)
  local newFrame

  if Validate:rightTwoThirds(windowFrame, screenFrame) then
    newFrame = Resize:rightFull(windowFrame, screenFrame)
  elseif Validate:rightHalf(windowFrame, screenFrame) then
    newFrame = Resize:rightTwoThirds(windowFrame, screenFrame)
  elseif Validate:rightThird(windowFrame, screenFrame) then
    newFrame = Resize:rightHalf(windowFrame, screenFrame)
  else
    newFrame = Resize:rightThird(windowFrame, screenFrame)
  end

  return newFrame
end

--- Command:enlarge(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
obj.enlarge = function(windowFrame, screenFrame)
  local newFrame = Resize:enlarge(windowFrame, screenFrame)
  return newFrame
end

--- Command:shrink(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
obj.shrink = function(windowFrame, screenFrame)
  local newFrame = Resize:shrink(windowFrame, screenFrame)
  return newFrame
end

--- Command:nextThird(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
obj.nextThird = function(windowFrame, screenFrame)
  local newFrame

  if Validate:leftThird(windowFrame, screenFrame) then
    newFrame = Resize:centerVerticalThird(windowFrame, screenFrame)
  elseif Validate:centerVerticalThird(windowFrame, screenFrame) then
    newFrame = Resize:rightThird(windowFrame, screenFrame)
  elseif Validate:rightThird(windowFrame, screenFrame) then
    newFrame = Resize:topThird(windowFrame, screenFrame)
  elseif Validate:topThird(windowFrame, screenFrame) then
    newFrame = Resize:centerHorizontalThird(windowFrame, screenFrame)
  elseif Validate:centerHorizontalThird(windowFrame, screenFrame) then
    newFrame = Resize:bottomThird(windowFrame, screenFrame)
  else
    newFrame = Resize:leftThird(windowFrame, screenFrame)
  end

  return newFrame
end

--- Command:prevThird(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
obj.prevThird = function(windowFrame, screenFrame)
  local newFrame

  if Validate:leftThird(windowFrame, screenFrame) then
    newFrame = Resize:bottomThird(windowFrame, screenFrame)
  elseif Validate:bottomThird(windowFrame, screenFrame) then
    newFrame = Resize:centerHorizontalThird(windowFrame, screenFrame)
  elseif Validate:centerHorizontalThird(windowFrame, screenFrame) then
    newFrame = Resize:topThird(windowFrame, screenFrame)
  elseif Validate:topThird(windowFrame, screenFrame) then
    newFrame = Resize:rightThird(windowFrame, screenFrame)
  elseif Validate:rightThird(windowFrame, screenFrame) then
    newFrame = Resize:centerVerticalThird(windowFrame, screenFrame)
  else
    newFrame = Resize:leftThird(windowFrame, screenFrame)
  end

  return newFrame
end

--- Command:nextScreen(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
obj.nextDisplay = function(windowFrame, screenFrame)
  local currentWindow = hs.window.focusedWindow()
  local currentScreen = currentWindow:screen()
  local nextScreen = currentScreen:next()
  local nextScreenFrame = nextScreen:frame()
  local newFrame

  if Validate:inScreenBounds(windowFrame, nextScreenFrame) then
    newFrame = Resize:center(windowFrame, nextScreenFrame)
  else
    newFrame = Resize:fullScreen(windowFrame, nextScreenFrame)
  end

  return newFrame
end

obj.prevDisplay = function(windowFrame, screenFrame)
  local currentWindow = hs.window.focusedWindow()
  local currentScreen = currentWindow:screen()
  local prevScreen = currentScreen:previous()
  local prevScreenFrame = prevScreen:frame()
  local newFrame

  if Validate:inScreenBounds(windowFrame, prevScreenFrame) then
    newFrame = Resize:center(windowFrame, prevScreenFrame)
  else
    newFrame = Resize:fullScreen(windowFrame, prevScreenFrame)
  end

  return newFrame
end

return obj
