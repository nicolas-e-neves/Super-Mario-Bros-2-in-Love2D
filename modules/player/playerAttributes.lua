local ATTRIBUTES = {}

ATTRIBUTES.mario = {
   minJumpHeight = 1 + 8/16,
   maxJumpHeight = 3 + 4/16,
   runningJumpHeight = 4,
   chargedJumpHeight = 5 + 6/16,
   chargeTime = 1,

   gravityMultiplier = 1,

   itemHeightStanding = -30,
   itemHeightCrouching = -20,

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


ATTRIBUTES.luigi = {
   minJumpHeight = 1 + 8/16, -- DONE
   maxJumpHeight = 3 + 8/16, -- DONE
   runningJumpHeight = 4 + 9/16, -- DONE
   chargedJumpHeight = 6, -- DONE
   chargeTime = 1,

   gravityMultiplier = 0.2560585, -- DONE

   itemHeightStanding = -33, -- DONE
   itemHeightCrouching = -20,

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


ATTRIBUTES.toad = {
   minJumpHeight = 1 + 8/16,
   maxJumpHeight = 3 + 2/16, -- DONE
   runningJumpHeight = 3 + 8/16, -- DONE
   chargedJumpHeight = 5 + 4/16, -- DONE
   chargeTime = 1,

   gravityMultiplier = 1,

   itemHeightStanding = -28, -- DONE
   itemHeightCrouching = -18,

   maxSpeeds = {
      walking = 5 + 10/16,
      running = 8 + 8/16, -- DONE
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


ATTRIBUTES.peach = {
   minJumpHeight = 1 + 8/16,
   maxJumpHeight = 3 + 4/16, -- DONE
   runningJumpHeight = 3 + 8/16, -- DONE
   chargedJumpHeight = 5 + 9/16, -- DONE
   chargeTime = 1,

   gravityMultiplier = 1,
   floatTime = 1, -- DONE

   itemHeightStanding = -34, -- DONE
   itemHeightCrouching = -20,

   maxSpeeds = {
      walking = 5 + 8/16, -- DONE
      running = 8 + 7/16, -- DONE
      climbing = 3 + 12/16,
      falling = 15
   },

   accelerations = {
      onFoot = 16 + 6/16, -- DONE
      onFootTurning = 37 + 8/16,
      inAir = 25 + 10/16,
      inAirTurning = 31 + 4/16
   },

   deaccelerations = {
      onFoot = 31 + 4/16
   }
}


return ATTRIBUTES