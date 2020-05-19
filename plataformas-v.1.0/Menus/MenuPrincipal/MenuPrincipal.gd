extends Node2D

 
func _ready():
	get_node("titulo").set_position(Vector2(get_viewport().size.x/2, get_viewport().size.y/2))
	pass # Replace with function body.




func _input(_event):
	if Input.is_action_just_pressed("ui_select"):
		comenzarJuego()
		
func comenzarJuego():
		Global.nivel = 0
		Global_cambiar_nivel.goto_scene("res://Juego/Escenarios/Niveles/Nivel_1/Nivel_1.tscn")

func _on_TextureButtonPlay_button_down():
	comenzarJuego()
	pass # Replace with function body.


func _on_TextureButtonOption_button_down():
	Global_cambiar_nivel.goto_scene("res://Menus/Controles/controles.tscn")
	pass # Replace with function body.
