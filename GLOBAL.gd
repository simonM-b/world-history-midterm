extends Node

const CAMERA_Y = -450.0
var lastMovePress

var playerPos
var playerVel

var money = 0

var mapProgress = 0

var cotton = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		lastMovePress = "left"
	elif Input.is_action_pressed("right"):
		lastMovePress = "right"
