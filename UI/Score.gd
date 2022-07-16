extends Label

onready var timer = $Timer

func _process(delta):
	text = "Score: "+String(Global.score)

	
func TimerTimeout():
	Global.score = 10


func _on_Timer_timeout():
	pass # Replace with function body.
