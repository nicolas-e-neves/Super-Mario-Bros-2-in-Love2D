function love.load()
	FONT = love.graphics.newFont("Font.ttf", 8)
	FONT:setFilter("nearest", "nearest")
	love.graphics.setFont(FONT)
	love.graphics.setDefaultFilter("nearest")
	
	windfield = require("libraries/windfield")
	anim8 = require("libraries/anim8")
	VECTOR = require("libraries/vector")
	CONTROLS = require("modules/player/controls")
	STI = require("libraries/sti")
	SETTINGS = require("modules/settings")
	CAMERA = require("libraries/camera")(0, 0, SETTINGS.scale)
	AUDIO = require("modules/audio")
	DOOR = require("modules/door")
	ITEM = require("modules/items/item")
	
	love.physics.setMeter(16)
	GRAVITY = 60 * 16
	WORLD = windfield.newWorld(0, GRAVITY)
	WORLD:setQueryDebugDrawing(true)
	WORLD:addCollisionClass("Player")
	WORLD:addCollisionClass("Solid")
	WORLD:addCollisionClass("SemiSolid")
	WORLD:addCollisionClass("Item")
	WORLD:addCollisionClass("Climbable")
	WORLD:addCollisionClass("Door")
	WORLD:addCollisionClass("ClimbableExit")
	
	love.window.setMode(WINDOW_X, WINDOW_Y, {fullscreen = SETTINGS.fullscreen, resizable = true, minwidth = WINDOW_X, minheight = WINDOW_Y})
	love.window.setTitle("Super Mario Bros. 2 in Love2D")
	love.window.setIcon(love.image.newImageData("sprites/tiles/items/veggie2.png"))
	
	PALETTES = {}
	PALETTES.charge = love.graphics.newImage("sprites/palettes/character/charge.png")
	PALETTES.flicker = {
		love.graphics.newImage("sprites/palettes/character/flicker1.png"),
		love.graphics.newImage("sprites/palettes/character/flicker2.png"),
		love.graphics.newImage("sprites/palettes/character/flicker3.png"),
	}
	
	player = require("modules/player/player")
	SETTINGS.loadMap()
	player.setCharacter("mario", true)
	
	GAME_STATE = "playing"
	STATE_CHANGE_timer = 0
	STATE_CHANGE_MAX_TIME = 0.05
	
	SPRITES = {}
	SPRITES.sky = love.graphics.newImage("sprites/tiles/sky.png")
	SPRITES.door = love.graphics.newImage("sprites/tiles/door1.png")
	
	SPRITES.ui = {}
	SPRITES.ui.frame = love.graphics.newImage("sprites/ui/frame.png")
	SPRITES.ui.health_full = love.graphics.newImage("sprites/ui/health_full.png")
	SPRITES.ui.health_empty = love.graphics.newImage("sprites/ui/health_empty.png")
	SPRITES.ui.cursor = love.graphics.newImage("sprites/ui/cursor.png")
	  
	SHADERS = {}
	SHADERS.palette = love.graphics.newShader(require("shaders/palette"))
	SHADERS.pixelate = love.graphics.newShader(require("shaders/pixelate"))
end


function love.update(dt)
	if SETTINGS.timeScale == 0 then
		CONTROLS.updateKeys(dt)
		if CONTROLS.isDown("pause", 0.2) then
			dt = 1/60
		else
			dt = dt * SETTINGS.timeScale
		end
	else
		dt = dt * SETTINGS.timeScale --> Slow down / speed up the game
		CONTROLS.updateKeys(dt)
	end
	
	WINDOW_X, WINDOW_Y = love.window.getMode()
	GAME_X, GAME_Y = WINDOW_X / SETTINGS.scale, WINDOW_Y / SETTINGS.scale
	
	
	if GAME_STATE == "playing" then
		
		if player.transformationTimer <= 0 then
			--> Update world and player
			for _, item in pairs(ITEMS) do
				item:update(dt)
			end
			
			GAME_MAP:update(dt)
			player.update(dt)
			WORLD:update(dt)
			player.x, player.y = player.collider:getPosition()
			player.y = player.y + player.getColliderHeight() / 2
			
			if player.heldItem and player.heldItem.collider then
				local offset = (player.crouching <= 0) and player.itemHeights.standing[player.powerup] or player.itemHeights.crouching[player.powerup]
				player.heldItem.collider:setPosition(player.x, player.y + offset)
			end
			
			SETTINGS.moveCameraToPlayer(dt)
			
			if player.state ~= "dead" and player.y > GAME_MAP.height * GAME_MAP.tileheight + SETTINGS.deathZone then
				player.die()
			end
		else
			player.transform(dt)
		end
		
		--> Handle game state changes
		if SETTINGS.timeScale > 0 and STATE_CHANGE_timer <= 0 and CONTROLS.isDown("pause", dt) then
			AUDIO.pause:stop()
			AUDIO.pause:play()
			
			GAME_STATE = "pause"
			STATE_CHANGE_timer = STATE_CHANGE_MAX_TIME
			love.mouse.setPosition(WINDOW_X / 2, WINDOW_Y / 2)
			return
		end
		STATE_CHANGE_timer = math.max(0, STATE_CHANGE_timer - dt)


	elseif GAME_STATE == "pause" then
		if SETTINGS.timeScale > 0 and STATE_CHANGE_timer <= 0 and CONTROLS.isDown("pause", dt) then
			AUDIO.pause:stop()
			AUDIO.pause:play()
			
			GAME_STATE = "playing"
			STATE_CHANGE_timer = STATE_CHANGE_MAX_TIME
			return
		end
		STATE_CHANGE_timer = math.max(0, STATE_CHANGE_timer - dt)
	end
	
	SETTINGS.clampCamera()
end


function love.draw()
	love.mouse.setVisible(false)
	love.graphics.setLineWidth(0.5)
	love.graphics.setColor(1, 1, 1)
	love.graphics.setShader(SHADERS.pixelate)
	SHADERS.pixelate:send("palette", PALETTES.map)
	
	love.graphics.draw(
		SPRITES.sky,
		0, 0,
		0,
		WINDOW_X, WINDOW_Y
	)
	
	CAMERA:attach()
		GAME_MAP:drawLayer(GAME_MAP.layers["Background"])
		GAME_MAP:drawLayer(GAME_MAP.layers["Solid"])
	
		for _, door in pairs(DOORS) do
			if door.openTimer > 0 then goto continue end
			door:draw()
			::continue::
		end
		
		for _, item in pairs(ITEMS) do
			if item.pickedUp then goto continue end
			item:draw()
			::continue::
		end
		
		player.draw()

		if SETTINGS.showColliders then
			love.graphics.setShader()
			WORLD:draw()
			love.graphics.setShader(SHADERS.pixelate)
		end
	CAMERA:detach()

	love.graphics.scale(SETTINGS.scale, SETTINGS.scale)
	
	--SETTINGS.drawCameraDeadZone()
	
	for i = 1, player.maxHealth, 1 do
		love.graphics.draw(
			(i <= player.health) and SPRITES.ui.health_full or SPRITES.ui.health_empty,
			16,
			41 + (i - 1) * 16
		)
	end

	if GAME_STATE == "pause" then
		love.graphics.setColor(0, 0, 0, 0.5)
		love.graphics.rectangle(
			"fill",
			0, 0,
			GAME_X, GAME_Y
		)
		
		love.graphics.translate(0, GAME_Y / 2)
		love.graphics.setShader()
		
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.draw(
			SPRITES.ui.frame,
			GAME_X / 2, 0,
			0,
			1, 1,
			SPRITES.ui.frame:getWidth() / 2, SPRITES.ui.frame:getHeight() / 2
		)
		
		local text = "WORLD  " .. SETTINGS.world .. "-" .. SETTINGS.stage
		love.graphics.setColor(153/255, 78/255, 0/255)
		love.graphics.printf(text, 0, -73, GAME_X, "center")

		local flickTime = 0.25
		if math.floor(love.timer.getTime() / flickTime) % 2 == 0 then
			text = "PAUSE"
			love.graphics.printf(text, 0, -1, GAME_X, "center")
		end

		text = "EXTRA LIFE···  " .. player.extraLives
		love.graphics.printf(text, 0, 55, GAME_X, "center")

		if SETTINGS.stage == 1 then
			text = "■ □ □"
		elseif SETTINGS.stage == 2 then
			text = "□ ■ □"
		elseif SETTINGS.stage == 3 then
			text = "□ □ ■"
		else
			text = "□ □ □"
		end

		love.graphics.setColor(107/255, 109/255, 0/255)
		love.graphics.printf(text, 0, -57, GAME_X, "center")
		love.graphics.translate(0, -GAME_Y / 2)
		
		local mousePosition = VECTOR.new(love.mouse.getPosition()) / SETTINGS.scale
		
		love.graphics.setShader(SHADERS.pixelate)
		love.graphics.setColor(1, 1, 1)
		love.graphics.draw(
			SPRITES.ui.cursor,
			mousePosition.x, mousePosition.y
		)
	end
	
	if SETTINGS.timeScale ~= 1 then
		local text = SETTINGS.timeScale .. "x"
		love.graphics.printf(text, 1, GAME_Y - 9, GAME_X, "left")
	end
end


function love.keypressed(key)
	if key == "f11" then
		SETTINGS.fullscreen = not SETTINGS.fullscreen
		love.window.setFullscreen(SETTINGS.fullscreen)
	end

	--> Debugging keys
	if key == "1" then
		player.setCharacter("mario")
	end
	if key == "2" then
		player.setCharacter("luigi")
	end
	if key == "3" then
		player.setCharacter("toad")
	end
	if key == "4" then
		player.setCharacter("peach")
	end
	if key == "8" then
		player.changeHealth(-1)
	end
	if key == "9" then
		player.changeHealth(1)
	end
	if key == "0" then
		SETTINGS.showColliders = not SETTINGS.showColliders
	end
	if key == "-" then
		SETTINGS.timeScale = math.max(0, SETTINGS.timeScale - 0.25)
	end
	if key == "=" then
		SETTINGS.timeScale = math.min(4, SETTINGS.timeScale + 0.25)
	end
end