function love.load()
  windowWidth = 600
  windowHeight = 800

  if love.system.getOS() == "Android" then
    local x,y = love.window.getDimensions()
    scalex = (x/windowWidth)
    scaley = (y/windowHeight)
  else
    scalex = 1
    scaley = 1
  end
  love.window.setMode(windowWidth*scalex,windowHeight*scaley)

  total_time = 0
  inventory = {
    wood = 0,
    metal = 0,
    stone = 0,
  }
  images = {
    wood = love.graphics.newImage("images/wood.png"),
    stone = love.graphics.newImage("images/stone.png"),
    metal = love.graphics.newImage("images/metal.png"),
  }
end

function love.draw()
  love.graphics.scale(scalex,scaley)

  love.graphics.draw(images.wood, 60, 10)
  love.graphics.printf(inventory.wood, 60, 140, 120, "center")
  love.graphics.draw(images.stone, 240, 10)
  love.graphics.printf(inventory.stone, 240, 140, 120, "center")
  love.graphics.draw(images.metal, 420, 10)
  love.graphics.printf(inventory.metal, 420, 140, 120, "center")
end

function love.update(dt)
  total_time = total_time + dt
end

function insideCoords(inputX, inputY, x, y, w, h)
  return inputX >= x and inputY >= y and inputX <= x + w and inputY <= y + h
end

function love.mousereleased(x, y, button, istouch)
  if insideCoords(x, y, 60, 10, 120, 120) then --wood
    inventory.wood = inventory.wood + 1
  elseif insideCoords(x, y, 240, 10, 120, 120) then --stone
    inventory.stone = inventory.stone + 1
  elseif insideCoords(x, y, 420, 10, 120, 120) then --metal
    inventory.metal = inventory.metal + 1
  end
end
