extends KinematicBody2D
class_name Enemy

func kill() -> void:
	queue_free()
	
