extends RigidBody2D

signal clicked
signal onFloor

var speed = 20

var held = false
var inWall = false

var holding = false

var offset = 0

var yMultipyer = 1
var yML = [0.2,0.5,1,1.2,1.5,1.7,2,2.5]

var canBeExamined = false

@export var attraction_force_magnitude: float = 10000.0


func _ready() -> void:
	GLOBAL.mouseIsBack.connect(setFalse)
	var ym = yML[yMultipyer]
	$ColorRect.size.y *= ym
	$ColorRect.position.x *= ym
	$CollisionShape2D.scale.x *= ym
	$Area2D/CollisionShape2D.scale.x *= ym
	$Button.size.x *=ym
	$Button.position.x *= ym



func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			print("clicked")
			offset = global_position - get_global_mouse_position()
			clicked.emit(self)

# Attach this to your RigidBody2D or RigidBody3D
func _integrate_forces(state):
	if holding:
		var target_pos = get_global_mouse_position()
		var direction = (target_pos - global_position)
		state.apply_central_force(direction * 500)
		state.linear_velocity *= 0.1
		rotation = 0


func _physics_process(delta):
	
	 # Get mouse position

	#if held:
	#	rotation = 0
	#	if !inWall:
	#		#global_transform.origin = get_global_mouse_position() + offset
	#		move_and_collide(get_global_mouse_position() - global_position)
	#	else:
	#		move_and_collide(get_global_mouse_position() - global_position)
		
	if held == false and $RayCast2D.is_colliding():
		canBeExamined = true
		#print("can be examined")
	else:
		canBeExamined = false
		
func pickup():
	if held:
		return
	#freeze = true
	held = true

func drop(impulse=Vector2.ZERO):
	if held:
		#freeze = false
		apply_central_impulse(impulse)
		held = false
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	#print("abcd")
	if body.is_in_group("stop wals"):
		inWall = true
	#if body.is_in_group("pickable"):
	#	inWall = false


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("stop wals"):
		if !held:
			inWall = false
		
		
func setFalse():
	if held:
		inWall = false
		print("SUCCESFULL")
	
func _on_button_button_down() -> void:
	holding = true


func _on_button_button_up() -> void:
	holding = false
