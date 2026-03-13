extends Control
@onready var cotton = $"ColorRect/MarginContainer/VBoxContainer/the stuff/MarginContainer/VBoxContainer/cotton"
@onready var mach = $"ColorRect/MarginContainer/VBoxContainer/the stuff/MarginContainer/VBoxContainer/cotton2"
@onready var ppl = $"ColorRect/MarginContainer/VBoxContainer/the stuff/MarginContainer/VBoxContainer/ppl"
@onready var boxes = $"ColorRect/MarginContainer/VBoxContainer/the stuff/MarginContainer/VBoxContainer/boxes"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func writeTextForCheck():
	cotton.text = ""
	mach.text = ""
	ppl.text = ""
	boxes.text = ""
