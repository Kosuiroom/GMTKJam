extends Node2D
class_name GameWorld

signal started
signal finished

enum Cell {OBSTACLE, GROUND, OUTER, ENEMY}

export var inner_size := Vector2(10, 8)
export var perimeter_size := Vector2(1, 1)
export(float, 0 , 1) var ground_probability := 0.1
export(float, 0 , 1) var enemy_probability := 0.1

# Public variables
onready var size := inner_size + 2 * perimeter_size

# Private variables
onready var _tile_map : TileMap = $TileMap
onready var player = $Player
var enemies = preload("res://../Actors/Enemies/Enemy.tscn")
onready var platform = $StaticPlatform
onready var inv = $CanvasLayer/Inventory
var _rng := RandomNumberGenerator.new()
var usedTiles
var selectedTile

func setup() -> void:
	var map_size_px := size * _tile_map.cell_size
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D, 
	SceneTree.STRETCH_ASPECT_KEEP, map_size_px)
	OS.set_window_size(2 * map_size_px)

func generate() -> void:
	emit_signal("started")
	generate_perimeter()
	generate_inner()
	emit_signal("finished")

func generate_perimeter() -> void:
	for x in [0, size.x - 1]:
		for y in range(0, 1500):
			_tile_map.set_cell(x, y, _pick_random_texture(Cell.OUTER))

func generate_inner() -> void:
	for x in range(1, size.x - 1):
		for y in range(1, 1500 - 1):
			var cell := get_random_tile(ground_probability)
			_tile_map.set_cell(x, y, cell)

func get_random_tile(probability: float) -> int:
	if _rng.randf() < probability && _rng.randf() > enemy_probability:
		return _pick_random_texture(Cell.GROUND)
	elif _rng.randf() < probability && _rng.randf() < enemy_probability:  
		return _pick_random_texture(Cell.ENEMY)
	else:
		return _pick_random_texture(Cell.OBSTACLE)

func _pick_random_texture(cell_type: int) -> int:
	var interval := Vector2()
	if cell_type == Cell.OUTER:
		interval = Vector2(0, 0)
	elif cell_type == Cell.GROUND:
		interval = Vector2(1, 1)
	elif cell_type == Cell.OBSTACLE:
		interval = Vector2(2, 5)
	return _rng.randi_range(interval.x, interval.y)

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

func SpawnEnemies() -> void:
	select_tiles()
	get_ground_tiles()
	
	for i in range(0, Global.GroundTiles.size()):
		if Vector2(5,300) < Global.GroundTiles[i]:
			var s = enemies.instance()
			add_child(s)
			s.position = Vector2(Global.GroundTiles[i])
	
func select_tiles():
	usedTiles = _tile_map.get_used_cells()

func get_ground_tiles():
	var n = 0
	while n < usedTiles.size():
		selectedTile = usedTiles[n]
		usedTiles.erase(n)
		n += 1
	Global.GroundTiles = usedTiles

func is_ground_above(x,y):
	if _tile_map.get_cell(x,y-1) == -1:
		return true
	else:
		return false	

func _ready() -> void:
	_rng.randomize()
	setup()
	generate()
	SpawnEnemies()
	SpawnPlayer()
	


