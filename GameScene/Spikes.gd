extends Area2D

signal killplayer()


func _on_Spikes_body_entered(body):
	if body is Player:
		Global.playerhealth -=1
		emit_signal("killplayer")
