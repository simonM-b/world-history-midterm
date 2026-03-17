extends AudioStreamPlayer

const mainMusic = preload("res://audio/main_song_lunar_echo.wav")

func _playMusic(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()

func playMainMusic():
	_playMusic(mainMusic)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("debug_mute_sound"):
		volume_db = -60
	
