local obj = {}
obj.__index = obj
obj.name = "Resize"

function obj:enlarge(window, screen)
  if (window.x - 10) >= screen.x then
    window.x = window.x - 10
  end

  if (window.y - 10) >= screen.y then
    window.y = window.y - 10
  end

  window.w = window.w + 20
  window.h = window.h + 20

 return window
end

function obj:fullScreen(window, screen)
  window.x = screen.x
  window.y = screen.y
  window.w = screen.w
  window.h = screen.h

  return window
end

function obj:center(window, screen)
  window.x = ((screen.w - window.w) // 2) + screen.x
  window.y = ((screen.h - window.h) // 2) + screen.y

  return window
end

function obj:shrink(window, screen)
  window.x = window.x + 10
  window.y = window.y + 10
  window.w = window.w - 20
  window.h = window.h - 20

  return window
end

function obj:topHalf(window, screen)
  window.y = screen.y
  window.h = screen.h // 2

  return window
end

function obj:topQuarter(window, screen)
  window.y = screen.y
  window.h = screen.h // 4

  return window
end

function obj:topThreeQuarters(window, screen)
  window.y = screen.y
  window.h = (screen.h // 4) * 3

  return window
end

function obj:topThird(window, screen)
  window.y = screen.y
  window.h = screen.h // 3

  return window
end

function obj:topTwoThirds(window, screen)
  window.y = screen.y
  window.h = (screen.h // 3) * 2

  return window
end

function obj:topFull(window, screen)
  window.y = screen.y
  window.h = screen.h

  return window
end



function obj:bottomHalf(window, screen)
  window.y = (screen.h // 2) + screen.y
  window.h = screen.h // 2

  return window
end

function obj:bottomQuarter(window, screen)
  window.y = ((screen.h // 4) * 3) + screen.y
  window.h = screen.h // 4

  return window
end

function obj:bottomThreeQuarters(window, screen)
  window.y = (screen.h // 4) + screen.y
  window.h = (screen.h // 4) * 3

  return window
end

function obj:bottomThird(window, screen)
  window.y = ((screen.h // 3) * 2) + screen.y
  window.h = screen.h // 3

  return window
end

function obj:bottomTwoThirds(window, screen)
  window.y = (screen.h // 3) + screen.y
  window.h = (screen.h // 3) * 2

  return window
end

function obj:bottomFull(window, screen)
  window.y = screen.y
  window.h = screen.h

  return window
end


function obj:leftHalf(window, screen)
  window.x = screen.x
  window.w = screen.w // 2

  return window
end

function obj:leftQuarter(window, screen)
  window.x = screen.x
  window.w = screen.w // 4

  return window
end

function obj:leftThreeQuarters(window, screen)
  window.x = screen.x
  window.w = (screen.w // 4) * 3

  return window
end

function obj:leftThird(window, screen)
  window.x = screen.x
  window.w = screen.w // 3

  return window
end

function obj:leftTwoThirds(window, screen)
  window.x = screen.x
  window.w = (screen.w // 3) * 2

  return window
end

function obj:leftFull(window, screen)
  window.x = screen.x
  window.w = screen.w

  return window
end



function obj:rightHalf(window, screen)
  window.x = (screen.w // 2) + screen.x
  window.w = screen.w // 2

  return window
end

function obj:rightQuarter(window, screen)
  window.x = (screen.w // 4) * 3 + screen.x
  window.w = screen.w // 4

  return window
end

function obj:rightThreeQuarters(window, screen)
  window.x = (screen.w // 4) + screen.x
  window.w = (screen.w // 4) * 3

  return window
end

function obj:rightThird(window, screen)
  window.x = (screen.w // 3) * 2 + screen.x
  window.w = screen.w // 3

  return window
end

function obj:rightTwoThirds(window, screen)
  window.x = (screen.w // 3) + screen.x
  window.w = (screen.w // 3) * 2

  return window
end

function obj:rightFull(window, screen)
  window.x = screen.x
  window.w = screen.w

  return window
end



function obj:centerHorizontalThird(window, screen)
  window.x = screen.x
  window.y = screen.h // 3
  window.w = screen.w
  window.h = screen.h // 3

  return window
end

function obj:centerVerticalThird(window, screen)
  window.x = screen.w // 3
  window.y = screen.y
  window.w = screen.w // 3
  window.h = screen.h

  return window
end

return obj
