extends Camera2D

const SMALLER_X_LIMIT = -500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	limit_left = SMALLER_X_LIMIT


# Called every frame. 'delta' is the elapsed time since the previous frame.
