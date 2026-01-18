extends CharacterBody2D


@export var speed = 1200
@export var jumpSpeed = -2000
@export var gravity = 8000
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0 , 1.0) var acceleration = 0.25

@onready var jumpRay = $jumpray

var shouldJump = false


func _physics_process(delta: float) -> void:
	GLOBAL.playerPos = position
	GLOBAL.playerVel = velocity
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	if Input.is_action_just_pressed("jump") and jumpRay.is_colliding():
		shouldJump = true
	
	if shouldJump and is_on_floor():
		velocity.y = jumpSpeed
		shouldJump = false

#https://kidscancode.org/godot_recipes/4.x/2d/platform_character/
