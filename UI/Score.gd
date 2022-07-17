extends Label

#onready var timer = $Timer

func _process(delta):
	text = "TIME: "+String(Global.timer)


func _on_Timer_timeout():
	Global.timer += 0.01

