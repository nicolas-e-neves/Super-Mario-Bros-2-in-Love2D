local GROUNDED = {}

function GROUNDED.enter(player, dt)
   
end

function GROUNDED.update(player, dt)
   if CONTROLS.isDown("jump", 0.1) then
      if player.onGround then
         return "jump"
      end
   end

   --> Handling picking up items
   if player.targetItem and CONTROLS.isDown("run", 0.1) then
      return "pickup"
   end

   return
end


return GROUNDED