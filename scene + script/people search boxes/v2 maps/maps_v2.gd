extends Area2D

signal mouseStart(inside:bool)
signal mouseEnd(inside:bool)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_mouse_entered() -> void:
	mouseStart.emit(true)


func _on_start_mouse_exited() -> void:
	mouseStart.emit(false)


func _on_end_mouse_entered() -> void:
	mouseEnd.emit(true)


func _on_end_mouse_exited() -> void:
	mouseEnd.emit(false)


func _on_mouse_entered() -> void:
	print("GOOD")
