extends RigidBody2D

signal clicked

var held = false

var offset = 0

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			print("clicked")
			offset = global_position - get_global_mouse_position()
			clicked.emit(self)

func _physics_process(delta):
	if held:
		rotation = 0
		global_transform.origin = get_global_mouse_position() + offset
		
func pickup():
	if held:
		return
	freeze = true
	held = true

func drop(impulse=Vector2.ZERO):
	if held:
		freeze = false
		apply_central_impulse(impulse)
		held = false
