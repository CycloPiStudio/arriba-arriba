extends Node2D

onready var player = get_node("/root/Level/Player")

func _on_botonizq_button_down():

	pass # Replace with function body.
	
func _on_botondere_button_down():

	pass # Replace with function body.
	
func _on_botonarriba_button_down():
	if player.snap == true:
		player.saltar()
	pass # Replace with function body.

func _on_botonA_button_down():
	Input.is_action_just_pressed("ui_select")
	pass # Replace with function body.

func _on_botonB_button_down():
	Input.is_action_just_pressed("ui_accept")
	pass # Replace with function body.
