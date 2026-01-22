extends Control

var cotton = preload("res://scene + script/cotton_ball_mohc.tscn")

var listOfPosX = [182.0,361.0,540.0]
var poslist = 1

var topY = 75.0
var held_object = null

@onready var cottonSPRITE = $cotton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect2.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$mc.position.x = listOfPosX[poslist]
	if GLOBAL.machBought:
		$ColorRect2.hide()


func _on_left_pressed() -> void:
	if poslist >= 1:
		poslist -= 1
	else:
		poslist = 2


func _on_right_pressed() -> void:
	if poslist <= 1:
		poslist += 1
	else:
		poslist = 0
		
		
func spawnInCotton():
	var rand = randi_range(0,2)
	var cloned_node = cotton.instantiate()
	cloned_node.position = Vector2(listOfPosX[rand],topY)
	add_child(cloned_node)
	


func _on_timer_timeout() -> void:
	if GLOBAL.machBought and GLOBAL.machon:
		spawnInCotton()
