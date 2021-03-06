extends Node2D

onready var tilemap : TileMap 
onready var personaje : KinematicBody2D = preload("res://Juego/Caracteres/Player/Player_01/Player_01.tscn").instance()


func _ready():
	Global.nivel = 1
	tilemap = get_node("TileMap")
	tilemap.set_cell_size(Vector2(32,32)) 
	for i in 200:
		tilemap.set_cell(i, 7, 10)
	personaje = $Player
	get_node("Player").set_position(Vector2(get_viewport().size.x/2, 150))



