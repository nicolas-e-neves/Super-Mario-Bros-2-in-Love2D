local SETTINGS = {}

--> NES screen resolution (PAL): 256x224
GAME_X, GAME_Y = 256, 224

SETTINGS.scale = 3
WINDOW_X, WINDOW_Y = GAME_X * SETTINGS.scale, GAME_Y * SETTINGS.scale

SETTINGS.fullscreen = false
SETTINGS.snapping = false


function math.sign(x, default)
   if x > 0 then
      return 1
   end
   if x < 0 then
      return -1
   end
   if x == 0 or not x then
      return default or 0
   end
end

function math.round(x)
   return math.floor(x + 0.5)
end

function math.clamp(n, min, max)
   return math.min(math.max(n, min), max)
end

function math.lerp(a, b, t)
   return a + (b - a) * t
end


function impulseForHeight(height) --> in tiles
   return math.sqrt(2 * math.abs(GRAVITY * height * 16))
end


function SETTINGS.loadMap(map)
   GAME_MAP = STI(map)

   local mapPaletteName = GAME_MAP.layers["Palette"].properties.map
   local characterPaletteVariant = GAME_MAP.layers["Palette"].properties.character
   local characterPaletteName = player.character .. "_" .. characterPaletteVariant

   PALETTES.map = love.graphics.newImage("sprites/palettes/map/" .. mapPaletteName .. ".png") or PALETTES.map
   PALETTES.character = love.graphics.newImage("sprites/palettes/character/" .. characterPaletteName .. ".png") or PALETTES.character

   ITEMS = {}
   for _, object in pairs(GAME_MAP.layers["Mushrooms"].objects) do
      local item = ITEM.new("mushroomblock1", object.x, object.y)
      table.insert(ITEMS, item)
   end

   WALLS = {}
   WALLS.solid = {}
   WALLS.semisolid = {}

   --> Add walls around the map
   local wall = WORLD:newRectangleCollider(
      -50,
      -50,
      50,
      GAME_MAP.height * GAME_MAP.tilewidth + 100
   )
   wall:setType("static")
   table.insert(WALLS.solid, wall)

   wall = WORLD:newRectangleCollider(
      GAME_MAP.width * GAME_MAP.tilewidth,
      -50,
      50,
      GAME_MAP.height * GAME_MAP.tilewidth + 100
   )
   wall:setType("static")
   table.insert(WALLS.solid, wall)

   --[[
   --> Ceiling
   wall = WORLD:newRectangleCollider(
      -50,
      -50,
      GAME_MAP.width * GAME_MAP.tilewidth + 100,
      50
   )
   wall:setType("static")
   table.insert(WALLS.solid, wall)
   --]]

   if GAME_MAP.layers["SolidCollision"] then
      for _, object in pairs(GAME_MAP.layers["SolidCollision"].objects) do
         wall = WORLD:newRectangleCollider(
            object.x,
            object.y,
            object.width,
            object.height
         )
         wall:setType("static")
         wall:setCollisionClass("Solid")
         table.insert(WALLS.solid, wall)
      end
   end

   if GAME_MAP.layers["SemiSolidCollision"] then
      for _, object in pairs(GAME_MAP.layers["SemiSolidCollision"].objects) do
         wall = WORLD:newRectangleCollider(
            object.x,
            object.y,
            object.width,
            1
         )
         wall:setType("static")
         wall:setCollisionClass("SemiSolid")
         table.insert(WALLS.semisolid, wall)
      end
   end

   if GAME_MAP.layers["Spawn"] then
      if #GAME_MAP.layers["Spawn"].objects > 0 then
         local object = GAME_MAP.layers["Spawn"].objects[1]
         player.collider:setPosition(
            object.x + object.width  / 2,
            object.y + object.height / 2
         )
      end
   end
end

function SETTINGS.clampCamera()
   local mapWidth = GAME_MAP.width * GAME_MAP.tilewidth
   local mapHeight = GAME_MAP.height * GAME_MAP.tileheight
   
   local minX, minY = GAME_X / 2, GAME_Y / 2
   local maxX, maxY = mapWidth - GAME_X / 2, mapHeight - GAME_Y / 2

   if minX > maxX then
      CAMERA.x = math.floor(mapWidth / 2 + 0.5)
   else
      CAMERA.x = math.clamp(CAMERA.x, minX, maxX)
   end

   if minY > maxY then
      CAMERA.y = maxY
      --CAMERA.y = math.floor(mapHeight / 2 + 0.5)
   else
      CAMERA.y = math.clamp(CAMERA.y, minY, maxY)
   end

   if SETTINGS.snapping then
      CAMERA.x = math.round(CAMERA.x)
      CAMERA.y = math.round(CAMERA.y)
   end
end

return SETTINGS