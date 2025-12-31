local STATS = {}

STATS.mario = {
   minJumpHeight = 1 + 8/16,
   maxJumpHeight = 3 + 4/16,
   chargedJumpHeight = 5 + 6/16,
   chargeTime = 1,

   openDoorDuration = 48/60,

   maxSpeeds = {
      walking = 5 + 10/16,
      running = 8 + 7/16,
      climbing = 3 + 12/16,
      falling = 15
   },

   accelerations = {
      onFoot = 29 + 6/16,
      onFootTurning = 37 + 8/16,
      inAir = 25 + 10/16,
      inAirTurning = 31 + 4/16
   },

   deaccelerations = {
      onFoot = 31 + 4/16
   }
}


STATS.peach = {
   minJumpHeight = 1 + 8/16,
   maxJumpHeight = 3 + 8/16, -- DONE
   chargedJumpHeight = 5 + 6/16,
   chargeTime = 1,

   openDoorDuration = 48/60,

   maxSpeeds = {
      walking = 5 + 10/16,
      running = 8 + 7/16,
      climbing = 3 + 12/16,
      falling = 15
   },

   accelerations = {
      onFoot = 29 + 6/16,
      onFootTurning = 37 + 8/16,
      inAir = 25 + 10/16,
      inAirTurning = 31 + 4/16
   },

   deaccelerations = {
      onFoot = 31 + 4/16
   }
}


return STATS