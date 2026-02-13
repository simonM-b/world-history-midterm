extends Node2D

var mouseIsInStartBox = false
var mouseReachedEnd = false
var mouseIsInCorrectLane = false

#connect the start detector mouse entered and mouse exited <- do the same fir the edn detector. Also do the same for thr allowed mouse area.


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("MAP STARTED")
	#$"start/start detect".mouse_entered.connect(_on_start_detect_mouse_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print("map running")
	if mouseIsInStartBox == true or mouseIsInCorrectLane == true:
		$"show where to put mousew".hide()
	else:
		$"show where to put mousew".show()

func winCondition():
	pass


func _on_start_detect_mouse_entered() -> void:
	mouseIsInStartBox = true


func _on_start_detect_mouse_exited() -> void:
	mouseIsInStartBox = false


func _on_end_detect_mouse_entered() -> void:
	if mouseIsInCorrectLane:
		mouseReachedEnd = true
		print("MOSUE CORRECTLY REACHED END")
		winCondition()
	else:
		print("MOUSE INCORRECTLY REACHED END")


func _on_end_detect_mouse_exited() -> void:
	mouseReachedEnd = false


func _on_allowed_mouse_area_mouse_entered() -> void:
	print("entered!!")
	if mouseIsInStartBox:
		mouseIsInCorrectLane = true


func _on_allowed_mouse_area_mouse_exited() -> void:
	mouseIsInCorrectLane = false



func _on_start_detection_button_area_mouse_entered() -> void:
	mouseIsInStartBox = true


func _on_start_detection_button_area_mouse_exited() -> void:
	mouseIsInStartBox = false


func _on_end_button_detection_mouse_entered() -> void:
	if mouseIsInCorrectLane:
		mouseReachedEnd = true
		print("MOSUE CORRECTLY REACHED END")
		winCondition()
	else:
		print("MOUSE INCORRECTLY REACHED END")


func _on_end_button_detection_mouse_exited() -> void:
	mouseReachedEnd = false
