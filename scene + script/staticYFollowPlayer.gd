extends Camera2D

const SMALLER_X_LIMIT = -500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	limit_left = SMALLER_X_LIMIT


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
<<<<<<< HEAD
<<<<<<< HEAD
	#print(pressing)
=======
>>>>>>> parent of 92a5874 (basic movement and camera controlls)
=======
>>>>>>> parent of 92a5874 (basic movement and camera controlls)
	position.y = GLOBAL.CAMERA_Y
	position.x = GLOBAL.playerPos.x + GLOBAL.CAMERA_X_OFFSET*sign(GLOBAL.playerVel.x)#depending on what direction the player is it offsets the camera infront of the player #sign is -1 if input is below zero. 1 if above zero and 0 is is zero
