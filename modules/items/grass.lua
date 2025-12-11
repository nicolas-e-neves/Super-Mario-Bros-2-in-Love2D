local grass = {}

function grass.postNew(self)
   self.sprite = love.graphics.newImage("sprites/tiles/items/grass.png")

   self.grid = anim8.newGrid(16, 16, self.sprite:getWidth(), self.sprite:getHeight())
   self.animation = anim8.newAnimation(self.grid("1-8",1), 16/60)
   self.collider.collisionOff = true
   self.droppable = false

   self.collider:setPreSolve(function(collider_1, collider_2, contact)
      contact:setEnabled(false)
   end)
end

function grass.pickingUp(self)
   if not self.content or self.content == "" then return end

   self.sprite = love.graphics.newImage("sprites/tiles/items/" .. self.content .. ".png")
   self.animation = nil
end

function grass.thrown(self)
   self.rotation = player.horizontal * 0.01
end

return grass