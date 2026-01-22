extends Control

var block = preload("res://scene + script/block rigid.tscn")

var stopSpawning = 0
var stopSpawningMax = 5

var held_object = null
var randSlect = []




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	restart()
	$ColorRect2.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("debugrestrat"):
		restart()
	if GLOBAL.boxes:
		$ColorRect2.hide()
	
func randNoRepets(max,min):
	while true:
		var num = randi_range(min, max)
		if num not in randSlect:
			randSlect.append(num)
			return num

func spawn(): 
	var rand = randNoRepets(0,7)
	#print(randSlect)

	var cloned_node = block.instantiate()
	cloned_node.position = Vector2(112.0,70.0)
	cloned_node.yMultipyer = rand
	$blocks.add_child(cloned_node)


func _on_timer_timeout() -> void:
	stopSpawning += 1
	if stopSpawning <= stopSpawningMax:
		spawn()
		$Timer.start()
	else:
		connectSignal()
		$"loading time".start()

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
			#print(Input.get_last_mouse_velocity())
			held_object.drop(clamp(Input.get_last_mouse_velocity(),Vector2(-50,-50),Vector2(50,50)))
			held_object = null

func restart():
	$loading.show()
	$blocks.hide()
	randSlect = []
	stopSpawning = 0
	stopSpawningMax = 5
	$Timer.start()
	for i in $blocks.get_children():
		i.queue_free()


func _on_loading_time_timeout() -> void:
	$blocks.show()
	$loading.hide()
