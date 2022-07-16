extends Control

onready var startbtn = $MenuItems/Start

func _ready():
	startbtn.grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _on_Start_pressed():
	get_tree().change_scene("res://GameScene/GameWorld.tscn")


func _on_Exit_pressed():
	get_tree().quit()
