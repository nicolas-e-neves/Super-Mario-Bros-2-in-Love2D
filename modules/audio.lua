local AUDIO = {}

for _, audioName in ipairs(love.filesystem.getDirectoryItems("audio/static")) do
   local audioName = audioName:sub(1, -5) --> Remove ".png" from audioName

   AUDIO[audioName] = love.audio.newSource("audio/static/" .. audioName .. ".wav", "static")
end

for _, audioName in ipairs(love.filesystem.getDirectoryItems("audio/stream")) do
   local audioName = audioName:sub(1, -5) --> Remove ".png" from audioName

   AUDIO[audioName] = love.audio.newSource("audio/stream/" .. audioName .. ".wav", "stream")
end



return AUDIO