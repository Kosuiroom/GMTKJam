extends Label

onready var timer = $Timer

func _process(delta):
	text = "Score: "+String(Global.score)


func _on_Timer_timeout():
	Global.score += 14

