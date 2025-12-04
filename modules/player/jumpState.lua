local JUMP = {}

function JUMP.enter(player, dt)
   player.jumping = player.jumping + dt

   local jumpHeight = player.maxJumpHeight
   if player.crouching >= player.chargeTime then
      jumpHeight = player.chargedJumpHeight
      player.crouching = 0
   end

   local impulse = impulseForHeight(jumpHeight)
   player.collider:applyLinearImpulse(0, -impulse)
   
   AUDIO.jump:play()
end

function JUMP.update(player, dt)
   player.animations[player.animationState][player.powerup]:update(dt)

   --> Handling climbing
   if player.canClimb and (CONTROLS.isDown("up") or CONTROLS.isDown("down")) then
      return "climb"
   end

   if CONTROLS.isDown("jump") then
      if player.jumping > 0 then
         player.jumping = player.jumping + dt
      end
   end
   
   if player.onGround then
      player.jumping = 0
      player.jumpDone = false
      return "grounded"
   end

   if (not player.jumpDone) and (not CONTROLS.isDown("jump")) and (player.jumping > 0) then
      --> Cut jump short
      local velocity = VECTOR.new(player.collider:getLinearVelocity())
      local desiredVelocityY = -impulseForHeight(player.minJumpHeight)

      if velocity.y < desiredVelocityY then
         player.collider:applyLinearImpulse(0, desiredVelocityY - velocity.y)
         player.jumpDone = true
      end
   end
end

return JUMP