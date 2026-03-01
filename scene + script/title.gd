extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalAudio.playMainMusic()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	$CenterContainer/VBoxContainer/VBoxContainer/play/pTimer.start()


func _on_settings_pressed() -> void:
	pass # Replace with function body.


func _on_credits_pressed() -> void:
	$CenterContainer/VBoxContainer/VBoxContainer/credits/cTimer.start()


func _on_p_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scene + script/main.tscn")


func _on_s_timer_timeout() -> void:
	pass # Replace with function body.


func _on_c_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scene + script/credits.tscn")
