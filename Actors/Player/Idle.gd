extends PlayerState

func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO
	player.animation.play("Player_Idle")

func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Run")
		return

#	if Input.is_action_just_pressed("Jump"):
#		state_machine.transition_to("Jump", {do_jump = true})
	if Input.is_action_pressed("mvLeft") or Input.is_action_pressed("mvRight"):
		state_machine.transition_to("Run")
