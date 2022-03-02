extends AudioStreamPlayer

func _on_music_finished():
	play()

func gameOver():
	stop()
