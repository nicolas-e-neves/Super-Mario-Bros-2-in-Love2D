local mushBlock = {}

function mushBlock.postNew(self)
   self.sprite = love.graphics.newImage("sprites/tiles/items/mushroomblock1.png")
   self.collider:setPreSolve(function(collider_1, collider_2, contact)
      if collider_2.collision_class == 'Solid' or collider_2.collision_class == 'SemiSolid' then
         self:groundTouched()
      end
   end)
end

return mushBlock