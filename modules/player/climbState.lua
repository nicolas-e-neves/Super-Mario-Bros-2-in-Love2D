local CLIMB = {}

local FRAME_DURATION = 8/60
local DOWN_VELOCITY_MULTIPLIER = 2
local SEARCH_HEIGHT = 4
local lastDirection = 0
local t = 0

function CLIMB.enter(player, dt)
   lastDirection = player.horizontal
   player.jumping = 0
end

function CLIMB.update(player, dt)
   local joystick = CONTROLS.getJoystick()
   local lastDirection = math.sign(joystick.x, lastDirection)
   local position = VECTOR.new(player.collider:getPosition())

   if not player.canClimb then
      player.horizontal = math.sign(lastDirection, player.horizontal)
      return "grounded"
   end

   if joystick.y > 0 then
      --> Going down is faster
      joystick.y = joystick.y * DOWN_VELOCITY_MULTIPLIER

   elseif joystick.y < 0 then
      --> Stop if there's nothing to climb above
      local colliders = WORLD:queryRectangleArea(
         position.x - player.colliderSize.width  / 2,
         position.y - player.colliderSize.height / 2 - SEARCH_HEIGHT,
         player.colliderSize.width,
         SEARCH_HEIGHT,
         {"Climbable"}
      )

      if #colliders <= 0 then
         joystick.y = 0
      end
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
      player.horizontal = math.sign(lastDirection, player.horizontal)
      player.crouching = 0
      return "jump"
   end

   if joystick.x == 0 and joystick.y == 0 and player.onGround then
      return "grounded"
   end
end

return CLIMB