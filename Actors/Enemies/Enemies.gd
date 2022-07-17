extends KinematicBody2D
class_name Enemy
onready var jumparea = $jumparea/jump
onready var hurt = $hurt
signal powerup()

func _on_jumparea_body_entered(body):
	if "Player" in body.name:
		set_collision_layer_bit(1,false)
		set_collision_mask_bit(1,false)
		$jumparea.set_collision_layer_bit(1,false)
		$jumparea.set_collision_mask_bit(1,false)
		Give_Powerup()
		queue_free()


func Give_Powerup():
	emit_signal("powerup")
