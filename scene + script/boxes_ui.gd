extends Control

var block = preload("res://scene + script/block rigid.tscn")

var stopSpawning = 0
var stopSpawningMax = 5

var held_object = null



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn():
	var rand = randi_range(0,2)
	var cloned_node = block.instantiate()
	cloned_node.position = Vector2(112.0,70.0)
	$blocks.add_child(cloned_node)


func _on_timer_timeout() -> void:
	stopSpawning += 1
	if stopSpawning <= stopSpawningMax:
		spawn()
		$Timer.start()
	else:
		connectSignal()

func connectSignal():
	for node in get_tree().get_nodes_in_group("pickable"):
		node.clicked.connect(_on_pickable_clicked)
		
func _on_pickable_clicked(object):
	if !held_object:
		object.pickup()
		held_object = object
		
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if held_object and !event.pressed:
			print(Input.get_last_mouse_velocity())
			held_object.drop(clamp(Input.get_last_mouse_velocity(),Vector2(-100,-100),Vector2(100,100)))
			held_object = null
