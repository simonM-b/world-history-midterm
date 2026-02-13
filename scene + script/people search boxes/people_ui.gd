extends Control

var randomMapNumb
var maps = [
preload("res://scene + script/people search boxes/map_01.tscn"),
preload("res://scene + script/people search boxes/map_02.tscn"),
preload("res://scene + script/people search boxes/map_03.tscn")
]
var currentMap

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	restart()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func restart():
	randomMapNumb = randi_range(0,len(maps)-1)
	currentMap = maps[randomMapNumb]
	var newMap = currentMap.instantiate()
	#add_child(newMap)
	print("PEOPLE StARTED")
	
