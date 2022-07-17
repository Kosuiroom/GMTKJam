extends Node2D


func _on_Endgame_body_entered(body):
	print("penis",body.name)
	if "Player" in body.name:
		print("walla")
		get_tree().change_scene("res://GameScene/Endgame.tscn") 
