local GROUNDED = {}

function GROUNDED.enter(player, dt)
   
end

function GROUNDED.update(player, dt)
   local position = VECTOR.new(player.collider:getPosition())
   local velocity = VECTOR.new(player.collider:getLinearVelocity())

   player.animations[player.animationState][player.powerup]:update(dt)

   --> Handling climbing
   if player.canClimb and (CONTROLS.isDown("up") or CONTROLS.isDown("down")) then
      return "climb"
   end

   --> Handling jumping
   if CONTROLS.isDown("jump", 0.1) and player.onGround then
      return "jump"
   end

   --> Handling picking up items
   if player.throwing <= 0 and player.targetItem and CONTROLS.isDown("run", 0.1) then
      return "pickup"
   end

   return
end


return GROUNDED