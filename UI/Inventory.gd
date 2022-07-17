extends GridContainer

onready var slot1 = $Slot1/Sprite
onready var slot2 = $Slot2/Sprite
onready var slot3 = $Slot3/Sprite

func _on_Pickup_pickedup(pickedup):
	if Global.PowerUpArray.size() != 3:
		Global.PowerUpArray.append(pickedup)
		print("Size", Global.PowerUpArray.size())
	else:
		print("full")
	
	print("Size", Global.PowerUpArray.size())
	
	if Global.PowerUpArray.size() <= 1:
		slot1.set_texture(pickedup)
	elif Global.PowerUpArray.size() == 2:
		slot2.set_texture(pickedup)
	elif Global.PowerUpArray.size() == 3:
		slot3.set_texture(pickedup)
	
