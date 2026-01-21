extends CharacterBody2D

var pressing = false
var offset

var a = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pressing:
		global_position = get_global_mouse_position() + offset
	elif not is_on_floor():
		a += 1
		print("abcd",a)
		velocity += get_gravity() * delta
	move_and_slide()



func _on_block_button_down() -> void:
	print("sadasd")
	pressing = true
	offset = global_position - get_global_mouse_position()


func _on_block_button_up() -> void:
	pressing = false
