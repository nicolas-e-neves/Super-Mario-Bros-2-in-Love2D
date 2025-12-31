local DOOR = {}
DOOR.__index = DOOR

DOOR.animation = {0, 9/48, 24/48, 38/48}
DOOR.shadows = {
   love.graphics.newImage("sprites/tiles/door1shadow.png"),
}
--[[
   DOOR ANIMATION:
   Frames  1-9:  Door opening
   Frames  9-24: Door open (idle)
   Frames 24-38: Door closing
   Frames 38-48: Door closed (idle)
]]


function DOOR.new(x, y, map, exit, type)
   local self = setmetatable({}, DOOR)
   self.map = map
   self.exit = exit
   self.type = tonumber(type) or 1
   self.sprite = love.graphics.newImage("sprites/tiles/door" .. (tostring(self.type) or "1") .. ".png")

   if self.type == 1 then
      local sheetWidth  = self.sprite:getWidth()
      local sheetHeight = self.sprite:getHeight()

      self.grid = anim8.newGrid(16, 32, sheetWidth, sheetHeight)
      self.animation = anim8.newAnimation(self.grid('1-8',1), 1)
   end
   self.openTimer = 0

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


function DOOR:getFrame()
   local frame = 1

   --> Open (idle)
   if self.openTimer >= DOOR.animation[2] and self.openTimer <= DOOR.animation[3] then
      frame = 8
      return frame
   end

   --> Opening
   if self.openTimer >= DOOR.animation[1] and self.openTimer <= DOOR.animation[2] then
      frame = 7 * self.openTimer / DOOR.animation[2] + 1
      return frame
   end

   --> Closing
   if self.openTimer >= DOOR.animation[3] and self.openTimer <= DOOR.animation[4] then
      frame = 7 * ((DOOR.animation[3] - self.openTimer) / (DOOR.animation[4] - DOOR.animation[3]) + 1) + 1
      return frame
   end

   return frame
end

function DOOR:update(dt, openDuration)
   self.openTimer = math.min(openDuration, self.openTimer + dt / openDuration)
   local frame = math.round(self:getFrame())

   self.animation:gotoFrame(frame)
end


function DOOR:drawShadow()
   local position = VECTOR.new(self.collider:getPosition())
   
   love.graphics.draw(
      DOOR.shadows[1],
      position.x, position.y,
      0,
      1, 1,
      8, 16
   )
end


function DOOR:draw()
   local position = VECTOR.new(self.collider:getPosition())

   if self.type ~= 1 then
      love.graphics.draw(
         self.sprite,
         position.x, position.y,
         0,
         1, 1,
         8, 16
      )
      return
   end
   self.animation:draw(
      self.sprite,
      position.x, position.y,
      0,
      1, 1,
      8, 16
   )
end


function DOOR:destroy()
   self.collider:destroy()
   self.collider = nil
   self.animation = nil
end


return DOOR