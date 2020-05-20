extends Node2D

onready var tilemap : TileMap 
onready var personaje : KinematicBody2D = preload("res://Juego/Caracteres/Player/Player_01/Player_01.tscn").instance()
onready var enemigo_02 = preload("res://Juego/Caracteres/Enemigos/Enemigo_02/Enemigo_02.tscn").instance()
onready var banderaAltura = preload("res://Juego/HUD/bandera de altura/bandera de altura.tscn").instance()

func _ready():

	tilemap = get_node("TileMap")
	tilemap.set_cell_size(Vector2(32,32)) 
	for i in 200:
		tilemap.set_cell(i, 7, 10)
	personaje = $Player
	get_node("/root/Level/Player").set_position(Vector2(get_viewport().size.x/2, 150))



