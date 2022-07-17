extends Node2D
class_name GameWorld

func SpawnPlayer() -> void:
	player.position = Vector2(200,55)
	platform.position = Vector2(200,90)
	set_camera_limits()

func set_camera_limits():
	var map_limits = _tile_map.get_used_rect()
	var map_cellsize = _tile_map.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
