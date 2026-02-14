extends Control

var randomMapNumb
var maps = [
preload("res://scene + script/people search boxes/v2 maps/map_01_v_2.tscn")
]
var currentMap
var winScene = preload("res://scene + script/people search boxes/people_win_screen.tscn")

var isInsideCorrectBorder = false
var isInStart = false
var isInEnd = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	restart()

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if isInsideCorrectBorder:
		$ColorRect2.hide()
	else:
		$ColorRect2.show()
	$"mosue follow".global_position = get_global_mouse_position()
	
func connectNewMapSignals(map):
	map.mouseStart.connect(mouseStartC)
	map.mouseEnd.connect(mouseEndC)

func restart():
	for i in $"the maps".get_children():
		i.queue_free()
		print("chiled killed people")
		
	randomMapNumb = randi_range(0,len(maps)-1)
	currentMap = maps[randomMapNumb]
	var newMap = currentMap.instantiate()
	newMap.position = Vector2(9,48)
	newMap.scale = Vector2(0.65,0.65)
	$"the maps".add_child(newMap)
	print("PEOPLE StARTED")
	connectNewMapSignals(newMap)

func win():
	var x = winScene.instantiate()
	x.position = Vector2(0,52)
	x.scale = Vector2(0.612,0.612)
	$"the maps".add_child(x)
	$"when win tie to restart".start()
	

#these are signals from the map

func mouseStartC(inside):
	isInStart = inside
	print("START", inside)
	
func mouseEndC(inside):
	isInEnd = inside
	if isInsideCorrectBorder:
		$"wait untill call win".start()
	print("END", inside)
	

func _on_mosue_follow_area_entered(area: Area2D) -> void:
	if area.is_in_group("correct area"):
		if isInStart:
			isInsideCorrectBorder = true
			print("IN CORRECT AREA AND START")


func _on_mosue_follow_area_exited(area: Area2D) -> void:
	if area.is_in_group("correct area"):
		isInsideCorrectBorder = false
		print("EXITED CORRECT AREA")


func _on_when_get_to_end_wait_untill_call_win_timeout() -> void:
	win()


func _on_when_win_tie_to_restart_timeout() -> void:
	restart()
