extends Area2D

var list = ["res://Assets/Icons/Dice_Game_Ghost.png",
"res://Assets/Icons/Dice_Game_Heartup.png",
"res://Assets/Icons/Dice_Game_Jump.png",
"res://Assets/Icons/Dice_Game_Slowdown.png",
"res://Assets/Icons/Dice_Game_SmallSize.png",
"res://Assets/Icons/Dice_Game_Speedup.png"]



func _on_Powerup_body_entered(body):
	var item
	item = list[randi() % list.size()]
	print(list)
	print(item)
	queue_free()
