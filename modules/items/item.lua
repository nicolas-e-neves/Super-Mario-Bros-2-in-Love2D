local item = {}
item.__index = item

local ROTATION_PERIOD = 0.5
local MAX_BOUNCES = 1
local LIMIT_FALLING_SPEED = true
local GRAVITY_MULTIPLIER = 0.75

item.TYPES = {
	grass = require("modules/items/grass"),
	mushroomblock = require("modules/items/mushroomblock")
}


function item.new(type, x, y, params)
	params = params or {}
	params.pickedUp = false
	params.bounces = 0
	params.onGround = true
	params.setStatic = false
	params.bounce = false
	params.rotation = 0

	--[[
	params = {
		disposable = true --> The item will go offscreen after thrown
	}
	]]
	
	local self = setmetatable(params, item)
	self.type = type
	self.collider = WORLD:newRectangleCollider(x + 0.5, y, 15, 16)
	self.collider:setFixedRotation(true)
	self.collider:setCollisionClass("Item")
	self.collider:setFriction(0)
	self.collider:setMass(1)
	self.collider:setType("static")
	self.collider.parentItem = self
	
	local typeModule = item.TYPES[type]
	if typeModule then
		--[[
		if typeModule.draw then
			self.draw = typeModule.draw
		end
		--]]
		if typeModule.postNew then
			typeModule.postNew(self)
		end
	end

	--[[
	self.collider:setPreSolve(function(collider_1, collider_2, contact)
		if collider_1.collision_class == "Item" and collider_2.collision_class == "Player" then
			error(self.collider.body:getType())
			if self.collider:getType() == "static" then
				self.collider:applyLinearImpulse(0, -10)
			end
			contact:setEnabled(false)
		end
	end)
	--]]
	return self
end


function item:pickingUp()
	local typeModule = self.TYPES[self.type]
	if typeModule and typeModule.pickingUp then
		typeModule.pickingUp(self)
	end
end


function item:thrown()
	local typeModule = self.TYPES[self.type]
	if typeModule and typeModule.thrown then
		typeModule.thrown(self)
	end
end


function item:groundTouched()
	if self.collider.body:getType() == "static" then return end

	local velocity = VECTOR.new(self.collider:getLinearVelocity())
	if velocity.y < 0 or velocity.y > 8 then return end

	local position = VECTOR.new(self.collider:getPosition())
	local colliderWidth = 15
	local colliderHeight = 5

	local colliders = WORLD:queryRectangleArea(
		position.x - colliderWidth / 2,
		position.y + (16 - colliderHeight) / 2,
		colliderWidth,
		colliderHeight,
		{"Solid", "SemiSolid", "Item"}
	)
	
	--> Filter colliders
	local numOfDisabledColliders = 0
	for _, collider in pairs(colliders) do
		if collider.collision_class ~= "Item" then goto continue end

		if collider.collisionOff or collider == self.collider then 
			numOfDisabledColliders = numOfDisabledColliders + 1
		end
		::continue::
	end
	
	self.onGround = (#colliders > numOfDisabledColliders)

	if not self.onGround then return end

	if self.bounces < MAX_BOUNCES then
		self.bounce = true
		self.setStatic = false
	else
		self.bounce = false
		self.setStatic = true
	end
end


function item:update(dt)
	if not self.collider then return end
	
	local position = VECTOR.new(self.collider:getPosition())
	local mapHeight = GAME_MAP.height * GAME_MAP.tileheight
	
	if position.y > mapHeight then
		--self:destroy()
		return true
	end
	
	local velocity = VECTOR.new(self.collider:getLinearVelocity())
	--> Limiting falling speed
	if LIMIT_FALLING_SPEED and velocity.y > player.maxSpeeds.falling * 16 then
		self.collider:setLinearVelocity(velocity.x, player.maxSpeeds.falling * 16)
	end
	
	if math.abs(self.rotation) > 0 then
		self.rotation = self.rotation + dt * math.sign(self.rotation) * 2 * math.pi / ROTATION_PERIOD
	end
	
	if self.animation then
		self.animation:update(dt)
	end
	
	if math.abs(velocity.x) <= 1 then
		self.collider:setPosition(math.round(position.x), position.y)
	end
	
	if self.setStatic then
		self.setStatic = false
		self.bounces = 0
		
		position.x = math.round(position.x)
		position.y = math.round(position.y)
		
		self.collider:setType("static")
		self.collider:setPosition(position.x, position.y)
	end
	
	if self.bounce then
		self.bounce = false
		self.bounces = self.bounces + 1
		
		self.collider:applyForce(0, -GRAVITY)
		self.collider:setLinearVelocity(velocity.x * 0.75, -impulseForHeight(0.25))
	else
		self.collider:applyForce(0, GRAVITY * (GRAVITY_MULTIPLIER - 1))
	end
end


function item:draw()
	if not self.collider then return end
	
	local position = VECTOR.new(self.collider:getPosition())
	local sprite = self.sprite or love.graphics.newImage("sprites/tiles/items/" .. self.type .. ".png")
	
	if SETTINGS.snapping then
		position.x = math.round(position.x)
		position.y = math.round(position.y)
	end
	
	if self.animation then
		self.animation:draw(
			sprite,
			position.x, position.y,
			self.rotation or 0,
			1, 1,
			8, 8
		)
	else
		love.graphics.draw(
			sprite,
			position.x, position.y,
			self.rotation or 0,
			1, 1,
			8, 8
		)
	end
end


function item:destroy()
	if not self.collider then return end
	
	self.collider:destroy()
	self.collider = nil
	ITEMS[self] = nil
end


return item