local CLIMB = {}

local FRAME_DURATION = 8/60
local DOWN_VELOCITY_MULTIPLIER = 2
local lastDirection = 0
local t = 0

function CLIMB.enter(player, dt)
   lastDirection = player.horizontal
   player.jumping = 0
end

function CLIMB.update(player, dt)
   if not player.canClimb then
      player.horizontal = math.sign(lastDirection, player.horizontal)
      return "grounded"
   end

   local joystick = CONTROLS.getJoystick()

   --player.collider:applyForce(0, -GRAVITY)
   local lastDirection = math.sign(joystick.x, lastDirection)
   if joystick.y > 0 then
      joystick.y = joystick.y * DOWN_VELOCITY_MULTIPLIER
   end
   player.collider:setLinearVelocity(joystick.x * player.maxSpeeds.climbing * 16, joystick.y * player.maxSpeeds.climbing * 16)

   if CONTROLS.isDown("up") then
      t = t - dt

      if t <= 0 then
         t = FRAME_DURATION
         player.horizontal = -player.horizontal
      end
   else
      t = 0
   end

   --> Handling jumping
   if CONTROLS.isDown("jump", 0.1) then
      return "jump"
   end

   if joystick.x == 0 and joystick.y == 0 and player.onGround then
      return "grounded"
   end
end

return CLIMB