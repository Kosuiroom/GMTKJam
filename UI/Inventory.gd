extends GridContainer

onready var slot1 = $Slot1/Sprite
onready var slot2 = $Slot2/Sprite
onready var slot3 = $Slot3/Sprite

var array = []

func ready():
	array.empty()



func _on_Pickup_pickedup(pickedup):
	slot1.set_texture(pickedup)
	array.append(pickedup)
	print("Array: ", array)
	
