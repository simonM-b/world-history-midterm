extends CharacterBody2D

@export var jumpSpeed = -2000
@export var gravity = 8000
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0 , 1.0) var acceleration = 0.25

@onready var jumpray = $jumpray
@onready var sprite = $AnimatedSprite2D

var canJump = false
var speed = GLOBAL.pSpeed



func _physics_process(delta):
	if GLOBAL.allowMoreSpeed:
		$Label.show()
	else:
		$Label.hide()
	
	if Input.is_action_pressed("2x speed") and GLOBAL.allowMoreSpeed:
		speed = GLOBAL.xPSpeed
	else:
		speed = GLOBAL.pSpeed
	
	GLOBAL.mapProgress = ((900 - position.x)/2000 )*-1
	#print(GLOBAL.mapProgress)
	
	handleSpriteFlip()
	GLOBAL.playerPos = position
	velocity.y += gravity * delta
	var dir = Input.get_axis("left", "right")
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0.0, friction)

	move_and_slide()
	handleJump()
	handleSpriteJump()
		
func handleJump():
	if Input.is_action_just_pressed("jump") and jumpray.is_colliding() and velocity.y >= 0:
		canJump = true
	
	if is_on_floor() and canJump:
		canJump = false
		velocity.y = jumpSpeed
	
func handleSpriteJump():
	if is_on_floor():
		sprite.frame = 1
	elif !is_on_floor():
		sprite.frame = 0

func handleSpriteFlip():
	if Input.is_action_pressed("left"):
		sprite.flip_h = true
	elif Input.is_action_pressed("right"):
		sprite.flip_h = false
		


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("button"):
		print("money: ",GLOBAL.money)
		GLOBAL.money += GLOBAL.minigameMoney.button
	#if area.is_in_group("shop area"):
	#	GLOBAL.mapProgress = 0
	#elif  area.is_in_group("button area"):
	#	GLOBAL.mapProgress = 1
	#elif area.is_in_group("cotton area"):
	#	GLOBAL.mapProgress = 2
