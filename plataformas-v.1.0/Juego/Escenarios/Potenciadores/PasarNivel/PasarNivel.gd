extends Node2D


#onready var win = load("res://Menus/Win/Win.tscn").instance()



func _on_Area2D_body_entered(body):
	Global_cambiar_nivel.wait_frames = 20
	if body.get_name() == "Player":
		Global.nivel+=1
		if Global.nivel <= Global.numero_max_niveles:		
			Global_cambiar_nivel.goto_scene("res://Juego/Escenarios/Niveles/Nivel_"+str(Global.nivel)+"/Nivel_"+str(Global.nivel)+".tscn")
		if Global.nivel > Global.numero_max_niveles:
			Global_cambiar_nivel.goto_scene("res://Menus/Creditos/Creditos.tscn")
#		print("pbody," , body.bandera_muerto)
#		body.bandera_muerto = true
#		add_child(win)
#		win.set_position(Vector2(-96,-50))
		
#	pass 
