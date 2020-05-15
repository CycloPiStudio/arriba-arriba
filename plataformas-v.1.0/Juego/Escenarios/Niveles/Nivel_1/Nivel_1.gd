extends Node2D

onready var tilemap 
onready var personaje 
onready var enemigo_02 = preload("res://Juego/Caracteres/Enemigos/Enemigo_02/Enemigo_02.tscn").instance()
onready var banderaAltura = preload("res://Juego/HUD/bandera de altura/bandera de altura.tscn").instance()

func _process(_delta):

	set_camera_limits()



func set_camera_limits():
    var map_limits = $TileMap.get_used_rect()
    var map_cellsize = $TileMap.cell_size
    $Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
    $Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
    $Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
    $Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y



#= $TileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Level").add_child(enemigo_02)
	get_node("/root/Level").add_child(banderaAltura)
#	get_node("/root/Principal").add_child(personaje)
#	get_node("/root/Principal/Player").set_position(Vector2(get_viewport().size.x/2, 150))
	tilemap = $TileMap
	personaje = $Player


func _input(event):
	var lado = 32
	if personaje.get_node("AnimatedSprite").flip_h:
		lado = -32
	else:
		lado = 32
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
#		var mouse_pos = get_viewport().get_mouse_position()
		var personaje_pos = Vector2(personaje.get_position().x + lado, personaje.get_position().y)
		
		var tile_pos = tilemap.world_to_map(personaje_pos)
		tilemap.set_cell(tile_pos.x,tile_pos.y, 1)
		#print(tile_pos)
	if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT:
#		var mouse_pos = get_viewport().get_mouse_position()
		var personaje_pos = Vector2(personaje.get_position().x + lado ,personaje.get_position().y)
		var tile_pos = tilemap.world_to_map(personaje_pos)
		tilemap.set_cell(tile_pos.x,tile_pos.y, -1)
#		print(tile_pos)