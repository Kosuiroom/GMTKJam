extends Area2D

signal pickedup(pickedup)


var list = ["res://Assets/Icons/Ghost_Icon.png",
"res://Assets/Icons/Health_Icon.png",
"res://Assets/Icons/Jump_Icon.png",
"res://Assets/Icons/Shrink_Icon.png",
"res://Assets/Icons/SlowDown_Icon.png",
"res://Assets/Icons/Speedup_Icon.png"]



func _on_Powerup_body_entered(body):
	if "Player" in body.name:
		randomize()
		Global.item = list[randi() % list.size()]
		var loading = load(Global.item)
		print(Global.item)
		emit_signal("pickedup",loading)
		queue_free()
