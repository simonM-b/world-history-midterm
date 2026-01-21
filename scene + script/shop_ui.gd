extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_c_button_pressed() -> void:
	GLOBAL.cotton = true
	$"ColorRect/MarginContainer/VBoxContainer/cotton plant".hide()


func _on_m_button_pressed() -> void:
	GLOBAL.machBought = true
	$ColorRect/MarginContainer/VBoxContainer/Machines.hide()
