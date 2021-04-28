 local obj = {}
 obj.__index = obj
 obj.name = "Validator"

function obj:topHalf(window, screen)
  return window.y == screen.y and
         window.h == (screen.h // 2)
end

function obj:topThird(window, screen)
  return window.y == screen.y and
         window.h == (screen.h // 3)
end

function obj:topTwoThirds(window, screen)
  return window.y == screen.y and
         window.h == ((screen.h // 3) * 2)
end

function obj:topFull(window, screen)
  return window.y == screen.y and
         window.h == screen.h
end


function obj:bottomHalf(window, screen)
  return window.y == (screen.h // 2) + screen.y and
         window.h == screen.h // 2
end

function obj:bottomThird(window, screen)
  return window.y == (((screen.h // 3) * 2) + screen.y) and
         window.h == (screen.h // 3)
end

function obj:bottomTwoThirds(window, screen)
  return window.y == ((screen.h // 3) + screen.y) and
         window.h == ((screen.h // 3) * 2)
end

function obj:bottomFull(window, screen)
  return window.y == screen.y and
         window.h == screen.h
end


function obj:leftHalf(window, screen)
  return window.x == screen.x and
         window.w == screen.w // 2
end

function obj:leftThird(window, screen)
  return window.x == screen.x and
         window.w == (screen.w // 3)
end

function obj:leftTwoThirds(window, screen)
  return window.x == screen.x and
         window.w == ((screen.w // 3) * 2)
end

function obj:leftFull(window, screen)
  return window.x == screen.x and
         window.w == screen.w
end



function obj:rightHalf(window, screen)
  return window.x == (screen.w // 2) + screen.x and
         window.w == screen.w // 2
end

function obj:rightThird(window, screen)
  return window.x == ((screen.w // 3) * 2 + screen.x) and
         window.w == (screen.w // 3)
end

function obj:rightTwoThirds(window, screen)
  return window.x == ((screen.w // 3) + screen.x) and
         window.w == ((screen.w // 3) * 2)
end

function obj:rightFull(window, screen)
  return window.x == screen.w and
         window.w == screen.w
end



function obj:centerHorizontalThird(window, screen)
  return window.x == screen.x and
         window.y == (screen.h // 3) and
         window.w == screen.w and
         window.h == (screen.h // 3)
end

function obj:centerVerticalThird(window, screen)
  return window.x == (screen.w // 3) and
         window.y == screen.y and
         window.w == (screen.w // 3) and
         window.h == screen.h
end

function obj:inScreenBounds(window, screen)
  return window.w <= screen.w and
         window.h <= screen.h
end

return obj
