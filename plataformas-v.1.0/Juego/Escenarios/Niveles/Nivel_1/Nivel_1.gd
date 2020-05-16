extends Node2D

onready var tilemap : TileMap 
onready var tileset : TileSet = preload("res://recursos/TileSet/tileset-escenario.tres")
onready var personaje : KinematicBody2D = preload("res://Juego/Caracteres/Player/Player_01/Player_01.tscn").instance()
onready var enemigo_02 = preload("res://Juego/Caracteres/Enemigos/Enemigo_02/Enemigo_02.tscn").instance()
onready var banderaAltura = preload("res://Juego/HUD/bandera de altura/bandera de altura.tscn").instance()

func _ready():
	
	tilemap = TileMap.new ()
	tilemap.set_name("tilemap")
	tilemap.set_cell_size(Vector2(32,32)) 
	tilemap.set_tileset(tileset) 
	get_node("/root/Level").add_child(tilemap)
	get_node("/root/Level").add_child(enemigo_02)
	get_node("/root/Level").add_child(banderaAltura)

	get_node("/root/Level").add_child(personaje)
	get_node("/root/Level/Player").set_position(Vector2(get_viewport().size.x/2, 150))

	for i in 200:
		tilemap.set_cell(i, 7, 1)
	



