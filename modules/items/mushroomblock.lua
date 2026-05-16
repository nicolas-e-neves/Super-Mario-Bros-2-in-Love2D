local mushBlock = {}

function mushBlock.postNew(self)
   self.sprite = love.graphics.newImage("sprites/tiles/items/mushroomblock" .. (self.variant or 1) .. ".png")
   self.droppable = true
   self.collider:setPreSolve(function(collider_1, collider_2, contact)
      if collider_2.collision_class == 'Solid' or collider_2.collision_class == 'SemiSolid' or collider_2.collision_class == 'Item' then
         self:groundTouched()
      end
   end)
end

return mushBlock