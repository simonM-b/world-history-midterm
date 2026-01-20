extends Node2D

var shopButton = 0

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
