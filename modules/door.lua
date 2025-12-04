local DOOR = {}
DOOR.__index = DOOR

function DOOR.new(x, y, map, exit, sprite)
   local self = setmetatable({}, DOOR)
   self.sprite = love.graphics.newImage("sprites/tiles/door" .. (tostring(sprite) or "1") .. ".png")
   self.map = map
   self.exit = exit

   local width = 1
   self.collider = WORLD:newRectangleCollider(x + (16 - width) / 2, y, width, 32)
   self.collider.parentDoor = self
   self.collider:setType("static")
   self.collider:setCollisionClass("Door")
   self.collider:setPreSolve(function(collider_1, collider_2, contact)
      contact:setEnabled(false)
   end)

   return self
end


function DOOR:draw()
   local position = VECTOR.new(self.collider:getPosition())
   love.graphics.draw(
      self.sprite,
      position.x, position.y,
      0,
      1, 1,
      8, 16
   )
end


function DOOR:destroy()
   self.collider:destroy()
   self = nil
end


return DOOR