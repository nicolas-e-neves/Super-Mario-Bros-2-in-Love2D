local SETTINGS = {}

--> NES screen resolution (PAL): 256x224
GAME_X, GAME_Y = 256, 224

SETTINGS.scale = 4
WINDOW_X, WINDOW_Y = GAME_X * SETTINGS.scale, GAME_Y * SETTINGS.scale

SETTINGS.fullscreen = true
SETTINGS.snapping = false

SETTINGS.world = 1
SETTINGS.stage = 1
SETTINGS.map   = 1
SETTINGS.exit  = 1


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


function SETTINGS.getMapString()
   return "maps/" .. SETTINGS.world .. "-" .. SETTINGS.stage .. "/map" .. SETTINGS.map .. ".lua"
end


function SETTINGS.findSpawn()
   local spawns = GAME_MAP.layers["Spawn"].objects
   local spawn = spawns[1]
   
   for _, object in ipairs(spawns) do
      if tonumber(object.properties.exit) == tonumber(SETTINGS.exit) then
         spawn = object
         break
      end
   end

   player.collider:setPosition(
      spawn.x + spawn.width / 2,
      spawn.y + (spawn.height + 32 - player.colliderSize.height) / 2
   )
end


function SETTINGS.loadMap(map)
   local map = map or SETTINGS.getMapString()

   if WALLS then
      for _, class in pairs(WALLS) do
         if not class then goto continue end
         for _, wall in pairs(class) do
            wall:destroy()
         end
         ::continue::
      end
   else
      WALLS = {}
   end
   WALLS.solid = {}
   WALLS.semisolid = {}
   WALLS.climbable = {}
   WALLS.exit = {}

   for _, item in pairs(ITEMS or {}) do
      if not item.pickedUp then
         item:destroy()
      end
   end
   for _, door in pairs(DOORS or {}) do
      door:destroy()
   end

   GAME_MAP = STI(map)

   local mapPaletteName = GAME_MAP.layers["Palette"].properties.map
   PALETTES.map = love.graphics.newImage("sprites/palettes/map/" .. mapPaletteName .. ".png") or PALETTES.map

   if not ITEMS then
      ITEMS = {}
   end
   for _, object in pairs(GAME_MAP.layers["Mushrooms"].objects) do
      local item = ITEM.new("mushroomblock", object.x, object.y)
      table.insert(ITEMS, item)
   end
   for _, object in pairs(GAME_MAP.layers["Grass"].objects) do
      local item = ITEM.new("grass", object.x, object.y, {content = object.properties.content})
      table.insert(ITEMS, item)
   end

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

   if GAME_MAP.layers["Climbable"] then
      for _, object in pairs(GAME_MAP.layers["Climbable"].objects) do
         local width = 1.5
         wall = WORLD:newRectangleCollider(
            object.x + (object.width - width) / 2,
            object.y,
            width,
            object.height
         )
         wall:setType("static")
         wall:setCollisionClass("Climbable")
         wall:setPreSolve(function(collider_1, collider_2, contact)
            contact:setEnabled(false)
         end)

         table.insert(WALLS.climbable, wall)
      end
   end

   if GAME_MAP.layers["ClimbableExit"] then
      for _, object in pairs(GAME_MAP.layers["ClimbableExit"].objects) do
         local width = 3
         wall = WORLD:newRectangleCollider(
            object.x + (object.width - width) / 2,
            object.y,
            width,
            object.height
         )

         wall.map = object.properties.map
         wall.exit = object.properties.exit
         
         wall:setType("static")
         wall:setCollisionClass("ClimbableExit")
         wall:setPreSolve(function(collider_1, collider_2, contact)
            contact:setEnabled(false)
         end)

         table.insert(WALLS.exit, wall)
      end
   end

   DOORS = {}
   for _, object in pairs(GAME_MAP.layers["Doors"].objects) do
      local door = DOOR.new(object.x, object.y, object.properties.map, object.properties.exit, object.properties.sprite or "1")
      table.insert(DOORS, door)
   end

   if player and player.collider and GAME_MAP.layers["Spawn"] and #GAME_MAP.layers["Spawn"].objects > 0 then
      SETTINGS.findSpawn()
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