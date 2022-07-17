extends KinematicBody2D
class_name Enemy
onready var jumparea = $jumparea/jump
onready var hurt = $hurt
export var slimeSpeed = 50
export var direction = 1
var slimvol = Vector2.ZERO

func _physics_process(delta):
	if is_on_wall():
		direction = direction * -1

	slimvol.x = slimeSpeed * direction
	
	move_and_slide(slimvol, Vector2.UP)
