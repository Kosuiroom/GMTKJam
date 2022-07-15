class_name Player
extends KinematicBody2D

onready var fsm := $StateMachine
onready var sprite = $Sprite

var velocity := Vector2.ZERO
export var playerspeed = 200.0

export var jump_height : float
export var jump_time_to_peak : float
export var jump_time_to_descent : float

onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0

func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity
