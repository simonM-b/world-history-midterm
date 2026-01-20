extends Control

@onready var cottonSPRITE = $Node2D/cotton
var cottonDeath = 0
var cottonMaxDeath = 1000000000000
var a = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if a == true and GLOBAL.cotton == true:
		$ColorRect2.queue_free()
		cottonMaxDeath = 0
		a = false
		
	if cottonDeath >= cottonMaxDeath:
		cottonMaxDeath = 1000000000000
		$cottonresettimer.start()
	
func placeAllCottons():
	#print(cottonSPRITE.get_rect().size.x)
	cottonDeath = 0
	cottonMaxDeath = 0
	var numbX = 7
	var numbY = 3
	var prevX = -35
	var saveX = prevX
	var prevY = 100
	var separation = 100
	var co = cottonSPRITE
	for o in range(numbY):
		for i in range(numbX):
			var cloned_node = cottonSPRITE.duplicate(15)
			cloned_node.position = Vector2(prevX + separation,prevY)
			prevX = cloned_node.position.x
			add_child(cloned_node)
			cottonMaxDeath += 1
		prevY += separation
		prevX = saveX
	print(cottonMaxDeath)
			

func _on_cotton_killed() -> void:
	cottonDeath += 1
	print(cottonDeath)


func _on_cottonresettimer_timeout() -> void:
	placeAllCottons()
	print("reseting cottons")
