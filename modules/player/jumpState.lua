local JUMP = {}
local counterGravity = 0

function JUMP.enter(player, dt)
   player.jumping = dt
   player.jumpDone = false

   local velocity = VECTOR.new(player.collider:getLinearVelocity())
   local jumpHeight = (math.abs(velocity.x) == 0) and player.maxJumpHeight or player.runningJumpHeight
   
   if player.crouching >= player.chargeTime then
      jumpHeight = player.chargedJumpHeight
      player.crouching = 0
   end

   local impulse = impulseForHeight(jumpHeight)
   counterGravity = GRAVITY * (player.gravityMultiplier - 1)
   player.collider:applyLinearImpulse(0, -impulse)
   player.collider:applyForce(0, counterGravity)
   
   AUDIO.jump:play()
end

function JUMP.update(player, dt)
   player.animations[player.animationState][player.powerup]:update(dt)
   player.collider:applyForce(0, counterGravity)
   
   local velocity = VECTOR.new(player.collider:getLinearVelocity())
   if velocity.y >= 0 then
      return "falling"
   end

   --> Handling climbing
   if player.canClimb and (CONTROLS.isDown("up") or CONTROLS.isDown("down")) then
      return "climb"
   end
   
   if player.onGround then
      player.jumping = 0
      player.jumpDone = false
      return "grounded"
   end
   
   if CONTROLS.isDown("jump") and player.jumping > 0 then
      player.jumping = player.jumping + dt
   end

   if (not player.jumpDone) and (not CONTROLS.isDown("jump")) and (player.jumping > 0) then
      --> Cut jump short
      local desiredVelocityY = -impulseForHeight(player.minJumpHeight)

      if velocity.y < desiredVelocityY then
         player.collider:applyLinearImpulse(0, desiredVelocityY - velocity.y)
         player.jumpDone = true
      end
   end
end

return JUMP