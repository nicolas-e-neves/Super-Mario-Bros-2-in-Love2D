local player = {}
player.x = 0
player.y = 0
player.spriteSize = {width = 16, height = 32}
player.colliderSize = {width = 10, height = 32}
player.horizontal = 1
player.vertical = -1
player.palette = nil

player.state = "grounded"
local states = {
   jump = require("modules/player/jumpState"), 
   grounded = require("modules/player/groundedState"),
   pickup = require("modules/player/pickupState"),
   climb = require("modules/player/climbState")
}

--> in tiles
player.minJumpHeight = 1
player.maxJumpHeight = 3 + 4/16
player.chargedJumpHeight = 5 + 6/16
player.chargeTime = 1

player.jumpDone = false
player.holdingJump = false
player.jumpBufferDuration = 0.1
player.jumpBufferTimer = 0

player.jumping = 0
player.onGround = true
player.canClimb = false
player.crouching = 0

player.heldItem = nil
player.targetItem = nil
player.pickupTimer = 0
player.throwing = 0

player.health = 2
player.powerup = "big"

player.acceleration = VECTOR.new(0,0)

--> in tiles per second
player.maxSpeeds = {
   walking = 5 + 10/16,
   running = 8 + 7/16,
   climbing = 3 + 12/16,
   falling = 15
}

--[[
   onFoot = 470,
   onFootTurning = 600,
   inAir = 410,
   inAirTurning = 500
]]

player.accelerations = {
   onFoot = 29 + 6/16,
   onFootTurning = 37 + 8/16,
   inAir = 25 + 10/16,
   inAirTurning = 31 + 4/16
}

player.deaccelerations = {
   onFoot = 31 + 4/16
}

function player.updateCollider(resetPosition)
   local velocity = VECTOR.new(0, 0)

   if player.collider then
      local position = VECTOR.new(player.collider:getPosition())
      player.x = position.x
      player.y = position.y
      velocity = VECTOR.new(player.collider:getLinearVelocity())
      
      player.collider:destroy()
      player.collider = nil
   end

   player.collider = WORLD:newRectangleCollider(
      player.x - player.colliderSize.width  / 2,
      player.y - player.colliderSize.height / 2,
      player.colliderSize.width,
      player.colliderSize.height
   )
   player.collider:setFixedRotation(true)
   player.collider:setCollisionClass("Player")
   player.collider:setFriction(0)
   player.collider:setMass(1)
   player.collider:setLinearVelocity(velocity.x, velocity.y)

   if resetPosition and GAME_MAP and GAME_MAP.layers["Spawn"] and #GAME_MAP.layers["Spawn"].objects > 0 then
      local object = GAME_MAP.layers["Spawn"].objects[1]
      player.collider:setPosition(
         object.x + object.width  / 2,
         object.y + object.height / 2
      )
   end

   player.collider:setPreSolve(function(collider_1, collider_2, contact)
      if collider_1.collision_class == 'Player' and collider_2.collision_class == 'SemiSolid' then
         if player.state == "climb" then
            --contact:setEnabled(false)
         end
         local px, py = collider_1:getPosition()
         local ph = player.colliderSize.height
         local tx, ty = collider_2:getPosition() 
         local th = 1
         if py + ph/2 > ty - th/2 then contact:setEnabled(false) end
         return
      end

      local cantCollide = (collider_2.parentItem and collider_2.parentItem.pickedUp) or (collider_2.body:getType() == "dynamic")

      if cantCollide and collider_1.collision_class == 'Player' and collider_2.collision_class == 'Item' then
         contact:setEnabled(false)
         return
      end
  end)
end


function player.createAnimationGrid()
   local sheetWidth  = player.sprite:getWidth()
   local sheetHeight = player.sprite:getHeight()

   player.grid = anim8.newGrid(player.spriteSize.width, player.spriteSize.height, sheetWidth, sheetHeight)
   player.animationState = "idle"
   player.animations = {
      idle = {
         small = anim8.newAnimation(player.grid('1-1',1), 1),
         big   = anim8.newAnimation(player.grid('1-1',2), 1)
      },

      idlepickup = {
         small = anim8.newAnimation(player.grid('3-3', 1), 1),
         big   = anim8.newAnimation(player.grid('3-3', 2), 1)
      },

      walk = {
         small = anim8.newAnimation(player.grid('1-2', 1), 0.05),
         big   = anim8.newAnimation(player.grid('1-2', 2), 0.05)
      },

      walkpickup = {
         small = anim8.newAnimation(player.grid('3-4', 1), 0.05),
         big   = anim8.newAnimation(player.grid('3-4', 2), 0.05)
      },
      
      fall = {
         small = anim8.newAnimation(player.grid('2-2', 1), 1),
         big   = anim8.newAnimation(player.grid('2-2', 2), 1)
      },

      fallpickup = {
         small = anim8.newAnimation(player.grid('4-4', 1), 1),
         big   = anim8.newAnimation(player.grid('4-4', 2), 1)
      },
      
      jump = {
         small = anim8.newAnimation(player.grid('5-6', 1), 0.05),
         big   = anim8.newAnimation(player.grid('5-6', 2), 0.05)
      },

      climb = {
         small = anim8.newAnimation(player.grid('7-7', 1), 0.2),
         big   = anim8.newAnimation(player.grid('7-7', 2), 0.2)
      },

      crouch = {
         small = anim8.newAnimation(player.grid('8-8', 1), 1),
         big   = anim8.newAnimation(player.grid('8-8', 2), 1)
      },

      crouchpickup = {
         small = anim8.newAnimation(player.grid('9-9', 1), 1),
         big   = anim8.newAnimation(player.grid('9-9', 2), 1)
      },

      pickup = {
         small = anim8.newAnimation(player.grid('10-10', 1), 1),
         big   = anim8.newAnimation(player.grid('10-10', 2), 1)
      },

      throw = {
         small = anim8.newAnimation(player.grid('11-11', 1), 1),
         big   = anim8.newAnimation(player.grid('11-11', 2), 1)
      },

      die = {
         small = anim8.newAnimation(player.grid('13-13', 1), 1),
         big   = anim8.newAnimation(player.grid('13-13', 1), 1)
      }
   }
end


function player.setCharacter(characterName, reset)
   player.character = characterName
   player.sprite = love.graphics.newImage("sprites/characters/" .. player.character .. ".png")

   if GAME_MAP then
      local variant = GAME_MAP.layers["Palette"].properties.character
      local paletteName = player.character .. "_" .. variant
      player.palette = love.graphics.newImage("sprites/palettes/character/" .. paletteName .. ".png")
   else
      player.palette = nil
   end

   player.updateCollider(reset)
   player.createAnimationGrid()
end


function decideAnimationState()
   if player.state == "climb" then
      return "climb"
   end

   if player.pickupTimer > 0 then
      if player.pickupTimer < 0.174 then
         return "crouchpickup"
      end
      return "pickup"
   end

   local pickup = (not player.heldItem) and "" or "pickup"

   if player.crouching > 0 then
      return "crouch" .. pickup
   end

   if player.throwing > 0 then
      return "throw"
   end

   if player.jumping > 0 then
      return "jump"
   end

   if player.onGround then
      local velocity = VECTOR.new(player.collider:getLinearVelocity())

      if math.abs(velocity.x) > 0 then
         return "walk" .. pickup
      else
         return "idle" .. pickup
      end
   end
   
   return "fall" .. pickup
end


function updateAcceleration(axis, joystick, velocity, dt)
   local direction = (axis == "x") and player.horizontal or player.vertical

   if math.abs(joystick[axis]) > 0 and not (player.crouching ~= 0 and player.onGround) and player.pickupTimer == 0 then
      local turning = (math.sign(velocity[axis]) ~= math.sign(joystick[axis])) and "Turning" or ""

      if player.onGround then
         player.acceleration[axis] = player.accelerations["onFoot" .. turning] * 16
      else
         player.acceleration[axis] = player.accelerations["inAir" .. turning] * 16
      end

      player.acceleration[axis] = player.acceleration[axis] * direction
      return
   end

   if not player.onGround or math.abs(velocity[axis]) == 0 then
      player.acceleration[axis] = 0
      return
   end

   --> Account for friction
   player.acceleration[axis] = player.deaccelerations.onFoot * 16 * -math.sign(velocity[axis])

   local timeToStop = velocity[axis] / -player.acceleration[axis]
   if timeToStop < dt then
      player.acceleration[axis] = -velocity[axis] / dt
   end
end


function player.update(dt)
   --> Handling movement
   local joystick = CONTROLS.getJoystick()
   local velocity = VECTOR.new(player.collider:getLinearVelocity())
   
   if player.pickupTimer <= 0 and player.state ~= "climb" then
      player.horizontal = math.sign(joystick.x, player.horizontal)
      player.vertical = math.sign(joystick.y, player.vertical)

      updateAcceleration("x", joystick, velocity, dt)

      local atx = player.acceleration.x * dt

      local maxSpeedX = CONTROLS.isDown("run") and player.maxSpeeds.running or player.maxSpeeds.walking
      maxSpeedX = maxSpeedX * 16
      local newVelocityX = math.clamp(velocity.x + atx, -maxSpeedX, maxSpeedX)
   
      player.collider:applyLinearImpulse(newVelocityX - velocity.x, 0)
   else
      player.collider:setLinearVelocity(0, 0)
      player.collider:applyForce(0, -GRAVITY)
   end

   --> Detecting colliders
   player.onGround = false
   player.targetItem = nil

   if velocity.y <= 0 then
      local colliderWidth = 10
      local colliderHeight = 2

      local colliders = WORLD:queryRectangleArea(
         player.x - colliderWidth / 2,
         player.y + (player.colliderSize.height - colliderHeight) / 2,
         colliderWidth,
         colliderHeight,
         {"Solid", "SemiSolid", "Item"}
      )
      player.onGround = (#colliders > 0) and (velocity.y >= 0)

      for _, collider in pairs(colliders) do
         if collider.collision_class == "Item" and collider.parentItem and not collider.parentItem.pickedUp then
            player.targetItem = collider.parentItem
            break
         end
      end
   end

   player.canClimb = false
   if not player.heldItem then
      local colliders = WORLD:queryRectangleArea(
         player.x - player.colliderSize.width  / 2,
         player.y - player.colliderSize.height / 2,
         player.colliderSize.width,
         player.colliderSize.height / 2,
         {"Climbable"}
      )

      player.canClimb = (#colliders > 0)
   end

   local canEnterDoor = false
   if player.onGround then
      local colliders = WORLD:queryRectangleArea(
         player.x - player.colliderSize.width  / 2,
         player.y - player.colliderSize.height / 2,
         player.colliderSize.width,
         player.colliderSize.height,
         {"Door"}
      )
      canEnterDoor = (#colliders > 0)

      if CONTROLS.isDown("up", dt) and canEnterDoor then
         local door = colliders[1].parentDoor
         SETTINGS.map = door.map
         SETTINGS.exit = door.exit
         SETTINGS.loadMap()
      end

      --> Crouching is not a state
      if CONTROLS.isDown("down") and player.state ~= "climb" then
         player.crouching = player.crouching + dt
      else
         player.crouching = 0
      end
   else
      --> Prevent the player from charging in the air
      player.crouching = math.clamp(player.crouching, 0, dt)

      --> Limiting falling velocity
      velocity = VECTOR.new(player.collider:getLinearVelocity())

      if velocity.y > player.maxSpeeds.falling * 16 then
         player.collider:setLinearVelocity(velocity.x, player.maxSpeeds.falling * 16)
      end
   end

   --> Handling throwing items
   player.throwing = math.max(0, player.throwing - dt)
   if player.heldItem and CONTROLS.isDown("run", 0.1) then
      player.heldItem.collider:setType("dynamic")
      player.heldItem.collider:setLinearVelocity(0, 0)

      local throwImpulse = 304
      player.heldItem.collider:applyLinearImpulse(throwImpulse * player.horizontal + velocity.x, 0) --> TODO: calculate impulse for throwing
      
      player.heldItem.pickedUp = false
      player.heldItem.bounces = 0
      player.heldItem:thrown()
      player.heldItem = nil
      player.throwing = 0.167

      AUDIO.throw:play()
   end

   --> TODO: coyote time
   local newState = states[player.state].update(player, dt)
   if newState and newState ~= player.state then
      player.state = newState
      states[player.state].enter(player, dt)
   end

   player.animationState = decideAnimationState()
end


function player.draw()
   --love.graphics.setColor(0,0.5,1,1)
   
   local position = VECTOR.new(player.collider:getPosition())
   local velocity = VECTOR.new(player.collider:getLinearVelocity())

   --[[
   if math.abs(velocity.x) <= 0.1 then
      position.x = math.floor(position.x + 0.5)
   end
   --]]
   --[
   if math.abs(velocity.y) <= 0.1 then
      position.y = math.round(position.y)
   end
   --]]
   if SETTINGS.snapping then
      position.x = math.round(position.x)
      position.y = math.round(position.y)
   end
   

   local palette = player.palette or PALETTES.charge
   if player.crouching > player.chargeTime and (30 * player.crouching) % 1 <= 0.5 then
      palette = PALETTES.charge
   end

   SHADERS.pixelate:send("palette", palette)
   player.animations[player.animationState][player.powerup]:draw(
      player.sprite,
      position.x, position.y,
      nil,
      player.horizontal, 1,
      player.spriteSize.width / 2, player.spriteSize.height / 2
   )
   
   --> Debugging
   --love.graphics.rectangle("fill", player.x - player.size.width / 2, player.y - player.size.height / 2, player.size.width, player.size.height)
   --[[
   if player.jumpDone then
      love.graphics.setColor(1,0,0,1)
      love.graphics.circle("fill", player.x, player.y - 20, 5)
      love.graphics.setColor(1,1,1,1)
   end
   --]]
   --[[
   local red = player.onGround and 1 or 0
   love.graphics.setColor(red, 0, 0)
   love.graphics.rectangle(
      "fill",
      player.x, player.y,
      8, 8
   )
   love.graphics.setColor(1, 1, 1)
   --]]
   --love.graphics.print(player.animationState,player.x,player.y,0,1,1,player.colliderSize.width/2,player.colliderSize.height)
end


return player