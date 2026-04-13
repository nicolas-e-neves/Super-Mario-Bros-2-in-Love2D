local player = {}
player.x = 0
player.y = 0
player.spriteSize = {width = 16, height = 32}
player.colliderSize = {width = 10, height = 24}
player.horizontal = 1
player.vertical = -1
player.palette = nil

player.state = "grounded"
local states = {
	jump = require("modules/player/jumpState"), 
	grounded = require("modules/player/groundedState"),
	pickup = require("modules/player/pickupState"),
	climb = require("modules/player/climbState"),
	falling = require("modules/player/fallingState")
}
local playerAttributes = require("modules/player/playerAttributes")

player.extraLives = 2
player.maxHealth = 2
player.health = player.maxHealth
player.powerup = "big"

player.jumpDone = false
player.jumping = 0
player.onGround = true
player.canClimb = false
player.crouching = 0

player.heldItem = nil
player.targetItem = nil
player.pickupTimer = 0
player.deadTimer = 0
player.throwing = 0
player.openDoorTimer = 0
player.openDoorDuration = 48/60
player.targetDoor = nil

player.acceleration = VECTOR.new(0,0)



function player.updateCollider(resetPosition)
	local velocity = VECTOR.new(0, 0)

	if player.collider then
		local position = VECTOR.new(player.collider:getPosition())
		player.x = position.x
		player.y = position.y + player.colliderSize.height / 2
		velocity = VECTOR.new(player.collider:getLinearVelocity())
		
		player.collider:destroy()
		player.collider = nil
	end

	player.collider = WORLD:newRectangleCollider(
		player.x - player.colliderSize.width / 2,
		player.y - player.colliderSize.height,
		player.colliderSize.width,
		player.colliderSize.height
	)
	player.collider:setFixedRotation(true)
	player.collider:setCollisionClass("Player")
	player.collider:setFriction(0)
	player.collider:setMass(1)
	player.collider:setLinearVelocity(velocity.x, velocity.y)

	if resetPosition and GAME_MAP and GAME_MAP.layers["Spawn"] and #GAME_MAP.layers["Spawn"].objects > 0 then
		SETTINGS.findSpawn()
	end

	player.collider:setPreSolve(function(collider_1, collider_2, contact)
		if player.state == "dead" then
			contact:setEnabled(false)
			return
		end
		
		if collider_1.collision_class == 'Player' and collider_2.collision_class == 'SemiSolid' then
			local velocity = VECTOR.new(player.collider:getLinearVelocity())
			if velocity.y < 0 then --> The player shouldn't collide when going up
				contact:setEnabled(false)
				return
			end
			
			if player.state == "climb" then
				--contact:setEnabled(false)
			end
			local px, py = collider_1:getPosition()
			local ph = player.colliderSize.height
			local tx, ty = collider_2:getPosition() 
			local th = 1
			local bias = 2

			if py + ph/2 - bias > ty - th/2 then contact:setEnabled(false) end
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
			small = anim8.newAnimation(player.grid('5-6', 1), 0.03),
			big   = anim8.newAnimation(player.grid('5-6', 2), 0.03)
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

		dead = {
			small = anim8.newAnimation(player.grid('12-12', 1), 1),
			big   = anim8.newAnimation(player.grid('12-12', 1), 1)
		}
	}
end


function player.updateAttributes()
	local currentAttributes = playerAttributes[player.character]
	if not currentAttributes then
		currentAttributes = playerAttributes["mario"]
	end

	player.minJumpHeight = currentAttributes.minJumpHeight
	player.maxJumpHeight = currentAttributes.maxJumpHeight
	player.runningJumpHeight = currentAttributes.runningJumpHeight
	player.chargedJumpHeight = currentAttributes.chargedJumpHeight
	player.chargeTime = currentAttributes.chargeTime

	player.gravityMultiplier = currentAttributes.gravityMultiplier or 1
	player.floatTime = currentAttributes.floatTime or 0

	player.itemHeightStanding = currentAttributes.itemHeightStanding
	player.itemHeightCrouching = currentAttributes.itemHeightCrouching

	player.maxSpeeds = currentAttributes.maxSpeeds
	player.accelerations = currentAttributes.accelerations
	player.deaccelerations = currentAttributes.deaccelerations
end


function player.setCharacter(characterName, reset)
	player.character = characterName
	player.sprite = love.graphics.newImage("sprites/characters/" .. player.character .. ".png")
	
	if reset then
		player.health = player.maxHealth
		player.powerup = "big" --> CHANGE THIS LATER
		player.state = "grounded"
	end

	if GAME_MAP then
		local variant = GAME_MAP.layers["Palette"].properties.character
		local paletteName = player.character .. "_" .. variant
		player.palette = love.graphics.newImage("sprites/palettes/character/" .. paletteName .. ".png")
	else
		player.palette = nil
	end

	player.updateCollider(reset)
	player.updateAttributes()
	player.createAnimationGrid()
end


local function limitFallingVelocity()
	velocity = VECTOR.new(player.collider:getLinearVelocity())
	
	if velocity.y > player.maxSpeeds.falling * 16 then
		player.collider:setLinearVelocity(velocity.x, player.maxSpeeds.falling * 16)
	end
end


local function decideAnimationState()
	if player.state == "dead" then
		return "dead"
	end
	
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
			if player.animationState == "idle" then
				player.animations["walk" .. pickup][player.powerup]:gotoFrame(2)
			end
			return "walk" .. pickup
		else
			return "idle" .. pickup
		end
	end
	
	return "fall" .. pickup
end


local function updateAcceleration(axis, joystick, velocity, dt)
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


local function doorEnterLogic(dt)
	player.collider:setLinearVelocity(0, 0)
	player.collider:applyForce(0, -GRAVITY)
	player.animationState = "idle" .. ((not player.heldItem) and "" or "pickup")
	
	--> Door entering animation
	if player.openDoorTimer > 0 then
		player.openDoorTimer = math.max(0, player.openDoorTimer - dt)
		player.targetDoor:update(dt, player.openDoorDuration)

		if player.openDoorTimer <= 0 then
			SETTINGS.map = tonumber(player.targetDoor.map)
			SETTINGS.exit = tonumber(player.targetDoor.exit)

			player.openDoorTimer = 0
			player.targetDoor = nil

			SETTINGS.loadMap()
		end return
	end
end


local function checkFeetCollision()
	local position = VECTOR.new(player.collider:getPosition())
	local colliderWidth = 10
	local colliderHeight = 2

	local colliders = WORLD:queryRectangleArea(
		position.x - colliderWidth / 2,
		position.y + (player.colliderSize.height - colliderHeight) / 2,
		colliderWidth,
		colliderHeight,
		{"Solid", "SemiSolid", "Item"}
	)
	
	local numOfDisabledColliders = 0
	player.targetItem = nil

	for _, collider in pairs(colliders) do
		if collider.collision_class ~= "Item" then goto continue end

		if collider.collisionOff then 
			numOfDisabledColliders = numOfDisabledColliders + 1
		end

		local itemPosition = VECTOR.new(collider:getPosition())
		local itemHeight = itemPosition.y + 8
		local feetHeight = position.y + player.colliderSize.height / 2
		local difference = math.abs(itemHeight - feetHeight)

		--[[
			COLLISION OFF: only pick up if the item is close enough (difference <= 8)
			COLLISION ON: pick up no matter the difference
		]]

		if collider.parentItem and (not collider.parentItem.pickedUp) and not (collider.collisionOff and difference > 8) then
			--> Found an item to pick up
			player.targetItem = collider.parentItem
			break
		end

		::continue::
	end

	player.onGround = (#colliders > numOfDisabledColliders)
end


function player.die()
	AUDIO.playerdown:play()
	
	player.health = 0
	player.state = "dead"
	player.deadTimer = 3.75
	player.collider:setLinearVelocity(0, 0)
	player.collider:applyForce(0, -GRAVITY)
	player.animationState = "dead"
	player.animations.dead[player.powerup]:gotoFrame(1)
end


function player.update(dt)
	if player.state ~= "dead" and player.health <= 0 then
		player.die()
	end
	
	if player.state == "dead" then
		if player.deadTimer >= 3.5 then
			player.collider:setLinearVelocity(0, 0)
			player.collider:applyForce(0, -GRAVITY)
			
			if player.y < GAME_MAP.height * GAME_MAP.tileheight + 48 and player.deadTimer - dt <= 3.5 then
				player.collider:setLinearVelocity(0, -impulseForHeight(4 + 2/16))
			end
		end
		
		player.deadTimer = math.max(0, player.deadTimer - dt)
		limitFallingVelocity()
		
		if player.deadTimer <= 0 then
			player.extraLives = math.max(0, player.extraLives - 1)
			player.setCharacter(player.character, true)
			SETTINGS.loadMap()
		end
		return
	end
	
	--> Handling movement
	local joystick = CONTROLS.getJoystick()
	local velocity = VECTOR.new(player.collider:getLinearVelocity())
	local position = VECTOR.new(player.collider:getPosition())

	--[[
	IMPORTANT NOTE: player.collider:getPosition() returns the CENTER of the collider.
	So, to get the player's y position (feet position), use player.y
	--]]
	
	if player.pickupTimer <= 0 and player.openDoorTimer <= 0 and player.state ~= "climb" then
		player.horizontal = math.sign(joystick.x, player.horizontal)
		player.vertical = math.sign(joystick.y, player.vertical)

		updateAcceleration("x", joystick, velocity, dt)

		local atx = player.acceleration.x * dt

		local maxSpeedX = CONTROLS.isDown("run") and player.maxSpeeds.running or player.maxSpeeds.walking
		maxSpeedX = maxSpeedX * 16
		local newVelocityX = math.clamp(velocity.x + atx, -maxSpeedX, maxSpeedX)
	
		player.collider:applyLinearImpulse(newVelocityX - velocity.x, 0)
	else
		doorEnterLogic(dt)
	end

	--> Detecting colliders
	player.onGround = false

	if velocity.y == 0 and player.pickupTimer <= 0 then
		checkFeetCollision()
	end

	player.canClimb = false
	if not player.heldItem then
		local colliders = WORLD:queryRectangleArea(
			position.x - player.colliderSize.width  / 2,
			position.y - player.colliderSize.height / 2,
			player.colliderSize.width,
			player.colliderSize.height / 2,
			{"Climbable"}
		)

		player.canClimb = (#colliders > 0)
	end

	if player.onGround then
		--> Crouching is not a state
		if CONTROLS.isDown("down") and player.state ~= "climb" then
			player.crouching = player.crouching + dt
		else
			player.crouching = 0
		end
	else
		--> Prevent the player from charging in the air
		player.crouching = math.clamp(player.crouching, 0, dt)

		limitFallingVelocity()
	end

	--> Handling throwing items
	player.throwing = math.max(0, player.throwing - dt)
	if player.heldItem and CONTROLS.isDown("run", 0.1) then
		player.heldItem.collider:setType("dynamic")
		player.heldItem.collider:setLinearVelocity(0, 0)

		if (not player.heldItem.droppable) or (math.abs(velocity.x) > 0 or math.abs(velocity.y) > 0) then
			local throwImpulse = 352 --> CHANGE THIS LATER
			player.heldItem.collider:applyLinearImpulse(throwImpulse * player.horizontal + velocity.x, velocity.y) --> TODO: calculate impulse for throwing
		else
			local itemPosition = VECTOR.new(player.heldItem.collider:getPosition())
			player.heldItem.collider:setPosition(itemPosition.x + 16 * player.horizontal, itemPosition.y)
		end
		
		player.heldItem.pickedUp = false
		player.heldItem.bounces = 0
		player.heldItem:thrown()
		player.heldItem = nil
		player.throwing = 0.167

		AUDIO.throw:play()
	end
	
	local newState = states[player.state].update(player, dt)
	if newState and newState ~= player.state then
		player.state = newState
		states[player.state].enter(player, dt)
	end

	player.animationState = decideAnimationState()
end


function player.draw()
	--local position = VECTOR.new(player.collider:getPosition())
	local velocity = VECTOR.new(player.collider:getLinearVelocity())
	
	if math.abs(velocity.y) <= 0.1 then
		player.y = math.round(player.y)
	end
	
	if SETTINGS.snapping then
		player.x = math.round(player.x)
		player.y = math.round(player.y)
	end


	local palette = player.palette or PALETTES.charge
	if player.crouching > player.chargeTime and (30 * player.crouching) % 1 <= 0.5 then
		palette = PALETTES.charge
	end

	--> Draw door shadow if the player is entering one so it appears below the player
	if player.targetDoor then
		player.targetDoor:drawShadow()
		if player.targetDoor.openTimer < DOOR.animation[3] then
			player.targetDoor:draw()
		end
	end

	SHADERS.pixelate:send("palette", palette)
	player.animations[player.animationState][player.powerup]:draw(
		player.sprite,
		player.x, player.y,
		nil,
		player.horizontal, 1,
		player.spriteSize.width / 2, player.spriteSize.height
	)
	SHADERS.pixelate:send("palette", PALETTES.map)
	
	--> Draw held item if there is one
	if player.heldItem then
		player.heldItem:draw()
	else
		--> Draw target item if there is one and it's being picked up
		if player.targetItem and player.targetItem.pickedUp then
			if player.targetItem.collider.collisionOff then --> Probably picking up grass
				love.graphics.setScissor(0, 0, WINDOW_X, (player.y + 1) * SETTINGS.scale)
			end
			
			player.targetItem:draw()
			love.graphics.setScissor()
		end
	end
	
	--> Draw door if the player is entering one and the door is fully open so it appears above the player
	if player.targetDoor and player.openDoorTimer < DOOR.animation[3] then
		player.targetDoor:draw()
	end
	
	
	
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
		player.x - 4, player.y,
		8, 8
	)
	love.graphics.setColor(1, 1, 1)
	--]]

	--> Show the value of something
	--[[
	love.graphics.printf(
		tostring(math.round(player.jumping, 2)),
		player.x - 32, player.y - player.colliderSize.height / 2 - 28,
		64, "center"
	)
	--]]

	--> Draw a circle where the heldItem is supposed to be
	--[[
	if player.heldItem then
		local offset = (player.crouching <= 0) and player.itemHeightStanding or player.itemHeightCrouching
		love.graphics.setColor(1, 1, 0, 0.5)
		love.graphics.circle(
			"fill",
			player.x,
			player.y + offset,
			6
		)
		love.graphics.setColor(1, 1, 1, 1)
	end
	--]]
end


return player