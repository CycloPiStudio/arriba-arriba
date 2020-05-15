extends Node2D

onready var tilemap : TileMap 
onready var tileset : TileSet = preload("res://recursos/TileSet/tileset-escenario.tres")
onready var personaje : KinematicBody2D = preload("res://Juego/Caracteres/Player/Player_01/Player_01.tscn").instance()
onready var enemigo_02 = preload("res://Juego/Caracteres/Enemigos/Enemigo_02/Enemigo_02.tscn").instance()
onready var banderaAltura = preload("res://Juego/HUD/bandera de altura/bandera de altura.tscn").instance()

func _ready():
	get_node("/root/Level").add_child(enemigo_02)
	get_node("/root/Level").add_child(banderaAltura)

	personaje = $Player
	get_node("/root/Level").add_child(personaje)
	get_node("/root/Level/Player").set_position(Vector2(get_viewport().size.x/2, 150))
	tilemap = $TileMap
	tilemap = TileMap.new ()
#	tilemap.MODE_SQUARE # esto estaba comentado
#	tilemap.cell_size # esto estaba comentado
	tilemap.set_cell_size(Vector2(32,32)) 
	
#	tileset = TileSet.new()
	tilemap.set_tileset(tileset) 
	get_node("/root/Level").add_child(tilemap)
#	var tileMapName = get_node("/root/Level").get_child(1).name
#	get_node("/root/Level/" + str(tileMapName)).set_name("escenario")
	for i in 200:
		tilemap.set_cell(i, 7, 10)
	



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