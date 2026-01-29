extends Control

var block = preload("res://scene + script/block rigid.tscn")

var stopSpawning = 0
var stopSpawningMax = 5

var held_object = null
var randSlect = []

var otime = true

var sizeList = [100,100,100,100,100]


@onready var ray0 = $"stack checker/ray0"
@onready var ray1 = $"stack checker/ray1"
@onready var ray2 = $"stack checker/ray2"
@onready var ray3 = $"stack checker/ray3"
@onready var ray4 = $"stack checker/ray4"


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
	getStackPos()
	
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
	otime = true
	$loading.show()
	$blocks.hide()
	randSlect = []
	stopSpawning = 0
	stopSpawningMax = 5
	$Timer.start()
	sizeList = [100,100,100,100,100]
	for i in $blocks.get_children():
		i.queue_free()
		
func getStackPos():
	if ray0.is_colliding():
		var rayCol = ray0.get_collider()
		if rayCol.is_in_group("pickable"):
			if rayCol.canBeExamined:
				sizeList[0] = rayCol.yMultipyer
	else:
		sizeList[0] = 100
			
	if ray1.is_colliding():
		var rayCol = ray1.get_collider()
		if rayCol.is_in_group("pickable"):
			if rayCol.canBeExamined:
				sizeList[1] = rayCol.yMultipyer
	else:
		sizeList[1] = 100
			
	if ray2.is_colliding():
		var rayCol = ray2.get_collider()
		if rayCol.is_in_group("pickable"):
			if rayCol.canBeExamined:
				sizeList[2] = rayCol.yMultipyer
	else:
		sizeList[2] = 100
			
	if ray3.is_colliding():
		var rayCol = ray3.get_collider()
		if rayCol.is_in_group("pickable"):
			if rayCol.canBeExamined:
				sizeList[3] = rayCol.yMultipyer
	else:
		sizeList[3] = 100
			
	if ray4.is_colliding():
		var rayCol = ray4.get_collider()
		if rayCol.is_in_group("pickable"):
			if rayCol.canBeExamined:
				sizeList[4] = rayCol.yMultipyer
	else:
		sizeList[4] = 100
	checkBlockCorrectOrder()


func _on_loading_time_timeout() -> void:
	$blocks.show()
	$loading.hide()


func _on_overide_pressed() -> void:
	GLOBAL.boxes = true
	restart()
	
func checkBlockCorrectOrder():
	if otime:
		#print(sizeList)
		var arr = sizeList
		for i in range(arr.size() - 1):
			
			if arr[i] >= arr[i + 1] or arr[i] == 100:
				#print("wrong")
				return null
				
		$"after correct reset timer".start()
		#print("correct")
		otime = false


func _on_after_correct_reset_timer_timeout() -> void:
	restart()


func _on_mouse_detector_mouse_entered() -> void:
	pass


func _on_mouse_detector_mouse_shape_entered(shape_idx: int) -> void:
	#print("AAAASDD")
	GLOBAL.mouseIsBack.emit()
