extends CharacterBody2D

@export var speed = 1200
@export var jumpSpeed = -1800
@export var gravity = 8000
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0 , 1.0) var acceleration = 0.25

@onready var jumpray = $jumpray

var canJump = false


func _physics_process(delta):
	GLOBAL.playerPos = position
	velocity.y += gravity * delta
	var dir = Input.get_axis("left", "right")
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0.0, friction)

	move_and_slide()
	if Input.is_action_just_pressed("jump") and jumpray.is_colliding() and velocity.y >= 0:
		canJump = true
	
	if is_on_floor() and canJump:
		canJump = false
		velocity.y = jumpSpeed


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("button"):
		print("money: ",GLOBAL.money)
		GLOBAL.money += 1
