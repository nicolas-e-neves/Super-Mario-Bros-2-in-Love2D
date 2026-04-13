local FALLING = {}
local counterGravity = 0 --> Force used for characters that fall slower than normal, like Luigi

local falling = 0
local floating = 0
local totalFloating = 0
local applyingForce = false

local COYOTE_TIME = 0.125 --> in seconds
local FLOAT_HEIGHT = 2    --> in pixels
local FLOAT_PERIOD = 0.5  --> in seconds

--> Used for calculating the velocity and acceleration needed to float up to FLOAT_HEIGHT in FLOAT_PERIOD seconds
local VEL_SCALE = 8 * FLOAT_HEIGHT / FLOAT_PERIOD
local ACC_SCALE = 4 * VEL_SCALE / FLOAT_PERIOD


function FALLING.enter(player, dt)
	counterGravity = GRAVITY * (player.gravityMultiplier - 1)
	falling = 0
	floating = 0
	totalFloating = 0
	applyingForce = false
end

local function getFloatForce(player, dt)
	local velocity = VECTOR.new(player.collider:getLinearVelocity())
	
	if velocity.y >= VEL_SCALE then --> Start going up
		floating = floating + dt
		
		if totalFloating <= player.floatTime then
			applyingForce = true
			return -ACC_SCALE - GRAVITY
		end
	end
	
	if velocity.y > -VEL_SCALE and applyingForce then --> Keep going up
		floating = floating + dt
		return -ACC_SCALE - GRAVITY
	end
	
	applyingForce = false
	
	if totalFloating > player.floatTime then return end
	return ACC_SCALE - GRAVITY
end

function FALLING.update(player, dt)
	falling = falling + dt
	
	--> Handling climbing
	if player.canClimb and (CONTROLS.isDown("up") or CONTROLS.isDown("down")) then
		return "climb"
	end
	
	if player.onGround then
		player.jumping = 0
		player.jumpDone = false
		return "grounded"
	end
	
	if player.jumping <= 0 and falling <= COYOTE_TIME and CONTROLS.isDown("jump") then
		local velocity = VECTOR.new(player.collider:getLinearVelocity())
		player.collider:applyLinearImpulse(0, math.min(0, -velocity.y))
		
		return "jump"
	end
	
	player.animations[player.animationState][player.powerup]:update(dt)
	
	counterGravity = GRAVITY * (player.gravityMultiplier - 1)
	local counterForce = counterGravity
	if player.floatTime <= 0 then
		player.collider:applyForce(0, counterForce)
		return
	end
	
	if CONTROLS.isDown("jump") then
		totalFloating = totalFloating + dt
		counterForce = getFloatForce(player, dt) or counterGravity
	else
		floating = 0
		applyingForce = false
	end
	
	player.collider:applyForce(0, counterForce)
end





return FALLING