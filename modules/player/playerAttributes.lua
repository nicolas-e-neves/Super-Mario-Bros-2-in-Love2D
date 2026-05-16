local ATTRIBUTES = {}

ATTRIBUTES.mario = {
	minJumpHeight = 1 + 8/16,
	maxJumpHeight = 3 + 4/16,
	runningJumpHeight = 4,
	chargedJumpHeight = 5 + 6/16,
	chargeTime = 1,
	
	gravityMultiplier = 1,
	
	itemHeights = {
		standing = {big = -30, small = -22},
		crouching = {big = -20, small = -17}
	},
	
	colliderHeights = {
		standing = {big = 24, small = 14},
		crouching = {big = 12, small = 10},
	},
	
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
	
	itemHeights = { -- DONE
		standing = {big = -33, small = -25},
		crouching = {big = -20, small = -18}
	},
	
	colliderHeights = {
		standing = {big = 28, small = 15},
		crouching = {big = 12, small = 10},
	},
	
	maxSpeeds = {
		walking = 5 + 10/16,
		running = 8 + 4/16, -- DONE
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
	
	itemHeights = { -- DONE
		standing = {big = -28, small = -20},
		crouching = {big = -18, small = -15}
	},
	
	colliderHeights = {
		standing = {big = 24, small = 15},
		crouching = {big = 12, small = 10},
	},
	
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
	
	itemHeights = { -- DONE
		standing = {big = -34, small = -26},
		crouching = {big = -20, small = -18}
	},
	
	colliderHeights = {
		standing = {big = 26, small = 15},
		crouching = {big = 12, small = 10},
	},
	
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