extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"HBoxContainer/money label".text = "money: " + str(GLOBAL.money)
	$HBoxContainer/MarginContainer/VBoxContainer/HSlider.value = GLOBAL.mapProgress


func _on_moneyii_pressed() -> void:
	GLOBAL.money += 1000


func _on_money_pressed() -> void:
	GLOBAL.money += 100


func _on_moneym_pressed() -> void:
	GLOBAL.money -= 100
