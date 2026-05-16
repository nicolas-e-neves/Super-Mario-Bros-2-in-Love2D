local CLIMB = {}

local FRAME_DURATION = 8/60
local DOWN_VELOCITY_MULTIPLIER = 2
local SEARCH_HEIGHT = 4
local DROP_MAX_TIMER = 0.4
local DROP_TIMER = 0 --> Used to prevent falling off immediately after starting to climb

local lastDirection = 0
local t = 0

function CLIMB.enter(player, dt)
	lastDirection = player.horizontal
	DROP_TIMER = 0
	
	player.jumping = 0
	
	if player.crouching > 0 then
		player.crouching = 0
		player.updateCollider()
	end
end

function CLIMB.update(player, dt)
	local joystick = CONTROLS.getJoystick()
	local position = VECTOR.new(player.collider:getPosition())
	lastDirection = math.sign(joystick.x, lastDirection)
	
	if not player.canClimb then
		player.horizontal = math.sign(lastDirection, player.horizontal)
		return "falling"
	end

	--> Checking for exits
	local colliders = {}
	if joystick.y ~= 0 then
		colliders = WORLD:queryRectangleArea(
			position.x - player.colliderSize.width  / 2,
			position.y + player.getColliderHeight() * ((joystick.y > 0) and -0.75 or 0),
			player.colliderSize.width,
			player.getColliderHeight() * 0.75,
			{"ClimbableExit"}
		)
	end
	if #colliders > 0 then
		local exit
		for _, collider in pairs(colliders) do
			local colliderPosition = VECTOR.new(collider:getPosition())
			local exitDirection = (colliderPosition.y > 0) and 1 or -1
			if exitDirection == math.sign(joystick.y) then
				exit = collider
				break
			end
		end
		if exit then
			SETTINGS.map = tonumber(exit.map)
			SETTINGS.exit = tonumber(exit.exit)
			SETTINGS.loadMap()
			return
		end
	end
	
	if joystick.y > 0 then
		--> Going down is faster
		joystick.y = joystick.y * DOWN_VELOCITY_MULTIPLIER
		
	elseif joystick.y < 0 then
		--> Stop if there's nothing to climb above
		local colliders = WORLD:queryRectangleArea(
			position.x - player.colliderSize.width  / 2,
			position.y - player.getColliderHeight() / 2 - SEARCH_HEIGHT,
			player.colliderSize.width,
			SEARCH_HEIGHT,
			{"Climbable"}
		)
		
		if #colliders <= 0 then
			joystick.y = 0
		end
	end
	
	DROP_TIMER = DROP_TIMER + dt
	if DROP_TIMER < DROP_MAX_TIMER and math.abs(joystick.x) > 0 then
		--> Stop if there's nothing to climb to the sides
		local colliders = WORLD:queryRectangleArea(
			position.x - player.colliderSize.width  / 2 + SEARCH_HEIGHT * joystick.x,
			position.y - player.getColliderHeight() / 2,
			player.colliderSize.width,
			SEARCH_HEIGHT,
			{"Climbable"}
		)
		
		if #colliders <= 0 then
			joystick.x = 0
		end
	end
	
	local newVelocity = joystick * player.maxSpeeds.climbing * 16
	player.collider:setLinearVelocity(newVelocity.x, newVelocity.y)
	
	if not ((joystick.y == 0 and joystick.x == 0) or (joystick.y > 0 and joystick.x == 0)) then -- Going down should not animate
		t = t - dt

		if t <= 0 then
			--> Flip character direction for the climb animation
			t = FRAME_DURATION
			player.horizontal = -player.horizontal
			
			AUDIO.climb:play()
		end
	else
		t = 0
	end

	--> Handling jumping
	if CONTROLS.isDown("jump", 0.1) and joystick.y == 0 then
		player.horizontal = math.sign(lastDirection, player.horizontal)
		return "jump"
	end

	if joystick.x == 0 and joystick.y == 0 and player.onGround then
		player.horizontal = math.sign(lastDirection, player.horizontal)
		return "grounded"
	end
end

return CLIMB