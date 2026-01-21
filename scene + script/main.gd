extends Node2D

var shopButton = 0
var cottonButton = 0
var machButton = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	shopButton += 1
	if shopButton % 2 == 1:
		$shop/shop.show()
	else:
		$shop/shop.hide()


func _on_c_button_pressed() -> void:
	cottonButton += 1
	if cottonButton % 2 == 1:
		$"cotton/cotton ui".show()
	else:
		$"cotton/cotton ui".hide()


func _on_m_button_2_pressed() -> void:
	machButton += 1
	if machButton % 2 == 1:
		$"machines/machines ui".show()
		GLOBAL.machon = true
	else:
		$"machines/machines ui".hide()
		GLOBAL.machon = false
