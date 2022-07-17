# Air.gd
extends PlayerState

var stomp_impulse = 600.0

# If we get a message asking us to jump, we jump.
func enter(msg := {}) -> void:
	if msg.has("do_jump"):
		player.velocity.y += player.get_gravity()
		player.animation.play("Player_Jump")

func physics_update(delta: float) -> void:
	# Horizontal movement.
	
	var input_direction_x: float = (
		Input.get_action_strength("mvRight")
		- Input.get_action_strength("mvLeft")
	)
	for i in player.get_slide_count():
		var collision = player.get_slide_collision(i)
		var collider = collision.collider
		var is_stomp = (
			collider is Enemy 
			and player.is_on_floor()
			and collision.normal.is_equal_approx(Vector2.UP)
		)
		
		if is_stomp:
			player.velocity.y = -stomp_impulse
			(collider as Enemy).kill()
	
	player.velocity.x = player.playerspeed * input_direction_x
	# Vertical movement.
	player.velocity.y = player.get_gravity() * delta
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)

	if !player.velocity.y < 0:
		player.animation.play("Player_Fall")
	# Landing.
	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Run")
