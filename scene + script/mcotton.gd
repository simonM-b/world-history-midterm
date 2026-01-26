extends Sprite2D

var speed = 2
var killHeight = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(dFelta: float) -> void:
	if position.y != 1207.0:
		position.y += speed
		if position.y >= killHeight:
			queue_free()
