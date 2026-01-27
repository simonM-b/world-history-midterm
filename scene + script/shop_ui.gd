extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_c_button_pressed() -> void:
	if GLOBAL.money >= GLOBAL.shopCostItem.cotton:
		GLOBAL.money -= GLOBAL.shopCostItem.cotton
		GLOBAL.cotton = true
		$"ColorRect/MarginContainer/VBoxContainer/cotton plant".hide()


func _on_m_button_pressed() -> void:
	if GLOBAL.money >= GLOBAL.shopCostItem.machines:
		GLOBAL.money -= GLOBAL.shopCostItem.machines
		GLOBAL.machBought = true
		$ColorRect/MarginContainer/VBoxContainer/Machines.hide()


func _on_b_b_button_pressed() -> void:
	if GLOBAL.money >= GLOBAL.shopCostItem.boxes:
		GLOBAL.money -= GLOBAL.shopCostItem.boxes
		GLOBAL.boxes = true
		$ColorRect/MarginContainer/VBoxContainer/boxes.hide()



func _on_wsp_button_pressed() -> void:
	if GLOBAL.money >= GLOBAL.shopCostItem.speed:
		GLOBAL.money -= GLOBAL.shopCostItem.speed
		GLOBAL.allowMoreSpeed = true
		$"ColorRect/MarginContainer/VBoxContainer/walking speed".hide()
