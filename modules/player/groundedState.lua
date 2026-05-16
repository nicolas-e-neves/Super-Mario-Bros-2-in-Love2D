local GROUNDED = {}

function GROUNDED.enter(player, dt)
	
end

function GROUNDED.update(player, dt)
	if player.openDoorTimer > 0 then return end
	
	local position = VECTOR.new(player.collider:getPosition())
	local velocity = VECTOR.new(player.collider:getLinearVelocity())
	
	local animationDT = dt
	if player.animationState == "walk" then
		animationDT = animationDT * velocity.x
	end
	player.animations[player.animationState][player.powerup]:update(animationDT)
	
	--> Checking for doors
	if CONTROLS.isDown("up", dt) then
		local colliders = WORLD:queryRectangleArea(
			position.x - player.colliderSize.width  / 2,
			position.y - player.getColliderHeight() / 2,
			player.colliderSize.width,
			player.getColliderHeight() * 0.5,
			{"Door"}
		)
		
		local canEnterDoor = (#colliders > 0) and (player.crouching <= 0)
		if canEnterDoor then
			local door = colliders[1].parentDoor
			local doorPosition = VECTOR.new(door.collider:getPosition())
			
			if doorPosition.y - player.getColliderHeight() / 2 > position.y then
				--> Door is too high to enter
				return
			end
			
			player.collider:setPosition(doorPosition.x, position.y)
			player.collider:setLinearVelocity(0, 0)
			if door.type ~= 1 then
				SETTINGS.map = tonumber(door.map)
				SETTINGS.exit = tonumber(door.exit)
				SETTINGS.loadMap()
				return
			end

			AUDIO.door:play()

			player.targetDoor = door
			player.openDoorTimer = player.openDoorDuration
			return
		end
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
	
	if not player.onGround then
		return "falling"
	end
end


return GROUNDED