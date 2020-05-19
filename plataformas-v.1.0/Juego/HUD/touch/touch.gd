extends Node2D


onready var player = get_node("/root/Level/Player")
var dere = 0
var izq = 0

func _on_botonizq_button_down():
	izq = 1
	player.direction_x = dere - izq
	player.movimiento()
	pass
func _on_botonizq_button_up():
	izq = 0
	player.direction_x = dere - izq
	pass
	
func _on_botondere_button_down():
	dere = 1
	player.direction_x = dere - izq
	player.movimiento()
	pass
func _on_botondere_button_up():
	dere = 0
	player.direction_x = dere - izq
	pass
	
func _on_botonarriba_button_down():
	if player.snap == true:
		player.saltar()
	pass

func _on_botonA_button_down():
	player.ponerQuitarBloque(1,1,1)
	pass

func _on_botonB_button_down():
	player.ponerQuitarBloque(1,1,-1)
	pass





