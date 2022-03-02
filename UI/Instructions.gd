extends Control

var countdown = 5

func _ready():
	update_label()

func _on_CountdownTimer_timeout():
	countdown -= 1
	update_label()

func update_label():
	$Countdown.text = "Starting in: " + str(countdown)
	if countdown <= 0:
		hide()
		$CountdownTimer.stop()
		get_tree().paused = false
