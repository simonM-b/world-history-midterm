extends Camera2D

const SMALLER_X_LIMIT = -500
const CAMERA_X_OFFSET = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	limit_left = SMALLER_X_LIMIT


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y = GLOBAL.CAMERA_Y
	if GLOBAL.lastMovePress == "left":
		position.x = GLOBAL.playerPos.x - CAMERA_X_OFFSET
	elif GLOBAL.lastMovePress == "right":
		position.x = GLOBAL.playerPos.x + CAMERA_X_OFFSET

		
		
		
		
		
	#position.x = GLOBAL.playerPos.x + GLOBAL.CAMERA_X_OFFSET*sign(GLOBAL.playerVel.x)#depending on what direction the player is it offsets the camera infront of the player #sign is -1 if input is below zero. 1 if above zero and 0 is is zero
	#if GLOBAL.playerVel.x < 0:
	#	if GLOBAL.playerVel.x > -1000:
	#		position.x = GLOBAL.playerPos.x
	#	else:
	#		position.x = GLOBAL.playerPos.x + -GLOBAL.CAMERA_X_OFFSET
	#		
	#elif GLOBAL.playerVel.x > 0:
	#	if GLOBAL.playerVel.x < 1000:
	#		position.x = GLOBAL.playerPos.x
	#	else:
	#		position.x = GLOBAL.playerPos.x + GLOBAL.CAMERA_X_OFFSET
