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
	
