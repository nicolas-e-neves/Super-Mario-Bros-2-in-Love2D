function love.load()
   windfield = require("libraries/windfield")
   anim8 = require("libraries/anim8")
   CONTROLS = require("modules/player/controls")
   STI = require("libraries/sti")
   SETTINGS = require("modules/settings")
   CAMERA = require("libraries/camera")(0, 0, SETTINGS.scale)
   VECTOR = require("libraries/vector")
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

   love.window.setTitle("Platformer")
   love.window.setMode(WINDOW_X, WINDOW_Y, {fullscreen = SETTINGS.fullscreen, resizable = true})
   love.graphics.setDefaultFilter("nearest")
   love.window.setIcon(love.image.newImageData("sprites/Mini DRENICO novo 40x40.png"))
   
   PALETTES = {}
   PALETTES.charge = love.graphics.newImage("sprites/palettes/character/charge.png")

   player = require("modules/player/player")
   SETTINGS.loadMap()
   player.setCharacter("mario", true)

   SPRITES = {}
   SPRITES.sky = love.graphics.newImage("sprites/tiles/sky.png")
   SPRITES.door = love.graphics.newImage("sprites/tiles/door1.png")

   SHADERS = {}
   SHADERS.palette = love.graphics.newShader(require("shaders/palette"))
   SHADERS.pixelate = love.graphics.newShader(require("shaders/pixelate"))
end


function love.update(dt)
   --dt = dt * 0.25 --> Slow down the game

   WINDOW_X, WINDOW_Y = love.window.getMode()
   GAME_X, GAME_Y = WINDOW_X / SETTINGS.scale, WINDOW_Y / SETTINGS.scale

   CONTROLS.updateKeys(dt)

   --> Update world and player
   for _, item in pairs(ITEMS) do
      item:update(dt)
   end

   GAME_MAP:update(dt)
   player.update(dt)
   WORLD:update(dt)
   player.x, player.y = player.collider:getPosition()
   player.y = player.y + player.colliderSize.height / 2
   
   --> TEMPORARY
   if player.heldItem and player.heldItem.collider then
      local offset = (player.crouching <= 0) and 29 or 20
      player.heldItem.collider:setPosition(player.x, player.y - offset)
   end

   CAMERA:lookAt(player.x, player.y - player.colliderSize.height)
   SETTINGS.clampCamera()
end


function love.draw()
   love.graphics.setLineWidth(0.5)
   love.graphics.setShader(SHADERS.pixelate)
   SHADERS.pixelate:send("palette", PALETTES.map)

   love.graphics.draw(
      SPRITES.sky,
      0, 0,
      0,
      WINDOW_X, WINDOW_Y
      --[[
      GAME_MAP.width  * GAME_MAP.tilewidth,
      GAME_MAP.height * GAME_MAP.tilewidth
      --]]
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

      --WORLD:draw()
   CAMERA:detach()
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
   if key == "0" then
      SETTINGS.loadMap("maps/1-1/map1.lua")
   end
end