extends Label

func _on_Timer_timeout():
	randomize()
	Global.speedtimer = 0
	if randi() % 2:
		Global.speed = 5000
		print(Global.speed)
	else:
		Global.speed = -5000
		print(Global.speed)
