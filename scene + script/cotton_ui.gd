extends Control

@onready var cottonSPRITE = $Node2D/cotton
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	placeAllCottons()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func placeAllCottons():
	var numbX = 6
	var numbY = 1
	var prevX = 53.0
	var prevY = 93.0
	var co = cottonSPRITE
	for o in range(numbY):
		for i in range(numbX):
			var cloned_node = cottonSPRITE.duplicate(15)
			cloned_node.position = Vector2(prevX + cloned_node.get_rect().size.x,prevY)
			prevX = cloned_node.position.x
			add_child(cloned_node)
