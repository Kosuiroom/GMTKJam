extends Area2D



func _on_Spikes_body_entered(body):
	if body is Player:
		Global.playerhealth -=1
