extends Node2D

onready var tilemap : TileMap 
#onready var tileset : TileSet = preload("res://recursos/TileSet/tileset-escenario.tres")
onready var personaje : KinematicBody2D = preload("res://Juego/Caracteres/Player/Player_01/Player_01.tscn").instance()
onready var enemigo_02 = preload("res://Juego/Caracteres/Enemigos/Enemigo_02/Enemigo_02.tscn").instance()
onready var banderaAltura = preload("res://Juego/HUD/bandera de altura/bandera de altura.tscn").instance()

func _ready():
#	Se pone el tile map y los bloques iniciales
#	tilemap = $TileMap
#	tilemap = TileMap.new()
	tilemap = get_node("TileMap")
	tilemap.set_cell_size(Vector2(32,32)) 
#	tilemap.set_tileset(tileset) 
#	get_node("/root/Level").add_child(tilemap)
#	var tileMapName = get_node("/root/Level").get_child(5).name
#	get_node("/root/Level/" + str(tileMapName)).set_name("escenario")
	for i in 200:
		tilemap.set_cell(i, 7, 10)
#	Se añade el agua
	get_node("/root/Level").add_child(enemigo_02)
#	Se añade la bandera de altura
	get_node("/root/Level").add_child(banderaAltura)
#	Se añade el player
	personaje = $Player
#	get_node("/root/Level").add_child(personaje)
	get_node("/root/Level/Player").set_position(Vector2(get_viewport().size.x/2, 150))
	



#func _input(event):
#	var lado = 32
#	if personaje.get_node("AnimatedSprite").flip_h:
#		lado = -32
#	else:
#		lado = 32
#	if Input.is_action_just_pressed("ui_select") or event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
##		var mouse_pos = get_viewport().get_mouse_position()
#		var personaje_pos = Vector2(personaje.get_position().x + lado, personaje.get_position().y)
#
#		var tile_pos = tilemap.world_to_map(personaje_pos)
#		tilemap.set_cell(tile_pos.x,tile_pos.y, 1)
#		#print(tile_pos)
#	if Input.is_action_just_pressed("ui_accept") or event is InputEventMouseButton and event.button_index == BUTTON_RIGHT:
##		var mouse_pos = get_viewport().get_mouse_position()
#		var personaje_pos = Vector2(personaje.get_position().x + lado ,personaje.get_position().y)
#		var tile_pos = tilemap.world_to_map(personaje_pos)
#		tilemap.set_cell(tile_pos.x,tile_pos.y, -1)
##		print(tile_pos)
