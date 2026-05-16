local PICKUP = {}

PICKUP.startY = 0
PICKUP.item = nil

-- 28 frames w/ mario

function PICKUP.enter(player, dt)
	player.pickupTimer = 0.467
	
	PICKUP.item = player.targetItem
	PICKUP.item:pickingUp()
	PICKUP.item.collider:setType("dynamic")
	PICKUP.item.pickedUp = true
	
	PICKUP.startY = player.y + 8
	PICKUP.item.collider:setPosition(player.x, PICKUP.startY - 6)
	
	AUDIO.pickup:play()
end

function PICKUP.update(player, dt)
	player.pickupTimer = math.max(player.pickupTimer - dt, 0)
	player.crouching = player.crouching + dt
	if player.crouching == dt then
		player.updateCollider()
	end

	local a = 27
	local t = (0.467 - player.pickupTimer) / 0.467
	local dy = math.clamp(a * t^2 + 6, 0, 27)
	
	PICKUP.item.collider:setPosition(player.x, PICKUP.startY - dy)
	PICKUP.item.collider:setLinearVelocity(0, 0)

	if player.pickupTimer <= 0 then
		player.heldItem = PICKUP.item
		--player.heldItem.pickedUp = true
		player.targetItem = nil
		PICKUP.item = nil
		
		if player.onGround then
			return "grounded"
		else
			player.jumping = 1 --> Prevents coyote time from triggering when picking up while falling
			return "falling"
		end
	end
end

return PICKUP