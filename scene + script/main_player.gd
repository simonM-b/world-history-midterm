extends CharacterBody2D

@export var speed = 1200
@export var jumpSpeed = -2000
@export var gravity = 8000
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0 , 1.0) var acceleration = 0.25

@onready var jumpRay = $jumpray

var shouldJump = false


func _physics_process(delta):
	GLOBAL.playerPos = position
	GLOBAL.playerVel = velocity
	
	velocity.y += gravity * delta
	var dir = Input.get_axis("left", "right")
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0.0, friction)

	move_and_slide()
	if Input.is_action_just_pressed("jump") and jumpRay.is_colliding():
		shouldJump = true
	
	if shouldJump and is_on_floor():
		velocity.y = jumpSpeed
		shouldJump = false

#https://kidscancode.org/godot_recipes/4.x/2d/platform_character/
