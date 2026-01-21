extends Control

var block = preload("res://scene + script/block.tscn")

var stopSpawning = 0
var stopSpawningMax = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn():
	var rand = randi_range(0,2)
	var cloned_node = block.instantiate()
	cloned_node.position = Vector2(112.0,70.0)
	$blocks.add_child(cloned_node)


func _on_timer_timeout() -> void:
	stopSpawning += 1
	if stopSpawning <= stopSpawningMax:
		spawn()
		$Timer.start()
