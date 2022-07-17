extends Node2D
class_name GameWorld

onready var _tile_map = $TileMap

func set_camera_limits():
	var map_limits = _tile_map.get_used_rect()
	var map_cellsize = _tile_map.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y

func ready():
	set_camera_limits()
