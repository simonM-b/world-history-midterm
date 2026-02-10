extends Node

const CAMERA_Y = -450.0
var lastMovePress

var playerPos
var playerVel
var pSpeed = 1200
var xPSpeed = 2400
var allowMoreSpeed = false

signal mouseIsBack

var money = 0

var mapProgress = 0

var cotton = false
var machon = false
var machBought = false
var boxes = false

var minigameMoney = { #The amount of money that you get if you win each minigame
	button = 1,
	cotton = 5,
	machines = 50,
	people = 500,
	boxes = 5000
}

var shopCostItem = {
	speed = 100,
	cotton = 25,
	machines = 1000,
	people = 9000,
	boxes = 20000,
	end = 291100
}

var listOfMapPeopleMaps = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		lastMovePress = "left"
	elif Input.is_action_pressed("right"):
		lastMovePress = "right"
