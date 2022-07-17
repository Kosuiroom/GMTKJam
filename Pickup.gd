extends Area2D

signal pickedup(pickedup)

func _on_Powerup_body_entered(body):
	if "Player" in body.name:
		randomize()
		Global.item = Global.list[randi() % Global.list.size()]
		var loading = load(Global.item)
		print(Global.item)
		emit_signal("pickedup",loading)
		queue_free()
