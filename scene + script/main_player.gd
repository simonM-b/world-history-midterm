extends CharacterBody2D

<<<<<<< HEAD
<<<<<<< HEAD
@export var speed = 1200
@export var jumpSpeed = -1500
@export var gravity = 8000
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0 , 1.0) var acceleration = 0.25

@onready var jumpRay = $jumpray

var shouldJump = false
var jumpHoldTime = 0
var canJump = false
var jumpTimes = 0
=======

const SPEED = 500.0
const JUMP_VELOCITY = -400.0
>>>>>>> parent of 92a5874 (basic movement and camera controlls)
=======

const SPEED = 500.0
const JUMP_VELOCITY = -400.0
>>>>>>> parent of 92a5874 (basic movement and camera controlls)


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
<<<<<<< HEAD
<<<<<<< HEAD
	if Input.is_action_pressed("jump") and jumpRay.is_colliding():
		jumpHoldTime += 0.1
		print(jumpHoldTime," hold time")
	else:
		jumpHoldTime = 0
		canJump = false
	
	if !Input.is_action_just_pressed("jump"):
		canJump = false
		
		
	if Input.is_action_just_pressed("jump") and jumpRay.is_colliding():
		shouldJump = true
		
	if is_on_floor():
		canJump = true
	
	if shouldJump and jumpHoldTime >0 and canJump:
		velocity.y = jumpSpeed + (jumpHoldTime*200)

#https://kidscancode.org/godot_recipes/4.x/2d/platform_character/
func _on_area_colidesr_area_entered(area: Area2D) -> void:
	if area.is_in_group("jump button"):
		GLOBAL.money += 1
		print(GLOBAL.money)
=======
>>>>>>> parent of 92a5874 (basic movement and camera controlls)
=======
>>>>>>> parent of 92a5874 (basic movement and camera controlls)
