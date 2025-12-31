local GROUNDED = {}

function GROUNDED.enter(player, dt)
   
end

function GROUNDED.update(player, dt)
   local position = VECTOR.new(player.collider:getPosition())
   local velocity = VECTOR.new(player.collider:getLinearVelocity())

   player.animations[player.animationState][player.powerup]:update(dt)

   --> Checking for doors
   local colliders = WORLD:queryRectangleArea(
      position.x - player.colliderSize.width  / 2,
      position.y - player.colliderSize.height / 2,
      player.colliderSize.width,
      player.colliderSize.height * 0.5,
      {"Door"}
   )
   local canEnterDoor = (#colliders > 0) and (player.crouching <= 0)

   if CONTROLS.isDown("up", dt) and canEnterDoor then
      local door = colliders[1].parentDoor
      local doorPosition = VECTOR.new(door.collider:getPosition())

      if doorPosition.y - player.colliderSize.height / 2 > position.y then
         --> Door is too high to enter
         return
      end

      if door.type ~= 1 then
         SETTINGS.map = tonumber(door.map)
         SETTINGS.exit = tonumber(door.exit)
         SETTINGS.loadMap()
         return
      end

      AUDIO.door:play()

      player.targetDoor = door
      player.openDoorTimer = player.openDoorDuration
      player.collider:setPosition(doorPosition.x, position.y)
      return
   end

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