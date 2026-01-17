extends CharacterBody2D

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
