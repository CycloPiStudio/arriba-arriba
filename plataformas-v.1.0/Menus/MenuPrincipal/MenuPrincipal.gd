extends Node2D

 
func _ready():
	get_node("titulo").set_position(Vector2(get_viewport().size.x/2, get_viewport().size.y/2))
	pass # Replace with function body.

func _on_TextureButton_button_down():
	Global.nivel = 0
#	get_node("/root").add_child(nivel1)
#	queue_free()
	Global_cambiar_nivel.goto_scene("res://Juego/Escenarios/Niveles/Nivel_1/Nivel_1.tscn")
	pass # Replace with function body.
