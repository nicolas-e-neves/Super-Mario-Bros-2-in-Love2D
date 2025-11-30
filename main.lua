function love.load()
   windfield = require("libraries/windfield")
   anim8 = require("libraries/anim8")
   CONTROLS = require("modules/player/controls")
   STI = require("libraries/sti")
   SETTINGS = require("modules/settings")
   CAMERA = require("libraries/camera")(0, 0, SETTINGS.scale)
   VECTOR = require("libraries/vector")

   ITEM = require("modules/items/item")
   
   love.physics.setMeter(16)
   GRAVITY = 60 * 16
   WORLD = windfield.newWorld(0, GRAVITY)
   WORLD:addCollisionClass("Player")
   WORLD:addCollisionClass("Solid")
   WORLD:addCollisionClass("SemiSolid")
   WORLD:addCollisionClass("Item")

   love.window.setTitle("Platformer")
   love.window.setMode(WINDOW_X, WINDOW_Y, {fullscreen = SETTINGS.fullscreen, resizable = true})
   love.graphics.setDefaultFilter("nearest")
   love.window.setIcon(love.image.newImageData("sprites/Mini DRENICO novo 40x40.png"))
   
   PALETTES = {}
   PALETTES.charge = love.graphics.newImage("sprites/palettes/character/charge.png")

   player = require("modules/player/player")
   player.setCharacter("mario")

   SPRITES = {}
   SPRITES.sky = love.graphics.newImage("sprites/tiles/sky.png")
   SPRITES.door = love.graphics.newImage("sprites/tiles/door.png")

   SETTINGS.loadMap("maps/1-1/map2.lua")

   SHADERS = {}
   SHADERS.palette = love.graphics.newShader(require("shaders/palette"))
   SHADERS.pixelate = love.graphics.newShader(require("shaders/pixelate"))
end


function love.update(dt)
   --dt = dt * 0.1 --> Slow down the game

   WINDOW_X, WINDOW_Y = love.window.getMode()
   GAME_X, GAME_Y = WINDOW_X / SETTINGS.scale, WINDOW_Y / SETTINGS.scale

   CONTROLS.updateKeys(dt)
   GAME_MAP:update(dt)
   player.update(dt)
   WORLD:update(dt)
   player.x, player.y = player.collider:getPosition()
   
   for _, item in pairs(ITEMS) do
      item:update(dt)
   end

   --> TEMPORARY
   if player.heldItem then
      local offset = (player.crouching <= 0) and -14 or -4
      player.heldItem.collider:setPosition(player.x, player.y + offset)
   end

   CAMERA:lookAt(player.x, player.y)
   SETTINGS.clampCamera()
end


function love.draw()
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
      
      for _, object in pairs(GAME_MAP.layers["Doors"].objects) do
         love.graphics.draw(
            SPRITES.door,
            object.x, object.y
         )
      end

      player.draw()
      SHADERS.pixelate:send("palette", PALETTES.map)

      for _, item in pairs(ITEMS) do
         item:draw()
      end

      --WORLD:draw()
   CAMERA:detach()
end


function love.keypressed(key)
   if key == "f11" then
      SETTINGS.fullscreen = not SETTINGS.fullscreen
      love.window.setFullscreen(SETTINGS.fullscreen)
   end
   --CONTROLS.updateKey(key)
end