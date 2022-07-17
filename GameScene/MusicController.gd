extends Node

var game = load("res://Assets/Sound/Dice_game_bit_1_loop.ogg")

func _ready():
	pass
	
func playgame():
	$Music.stream = game
	$Music.play()

func stopplay():
	$Music.stop()
