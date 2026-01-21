extends Sprite2D

var health = randi_range(2,3)
var healthDamage = 1
var minimumHealth = 0

signal killed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if health <= minimumHealth:
		killed.emit()
		GLOBAL.money += 5
		queue_free()


func _on_button_pressed() -> void:
	health -= healthDamage
	self.self_modulate = Color("#ff0000")
	$damageshow.start()
	
	#print("abcd")


func _on_damageshow_timeout() -> void:
	self.self_modulate = Color("ffffffff")
	
