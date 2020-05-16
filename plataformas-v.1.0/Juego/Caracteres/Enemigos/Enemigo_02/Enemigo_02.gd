extends Node2D

onready var altura = (get_viewport().size.y)
onready var nuevaAltura
export var velocidadSubida = 50

var playerPosX


func _ready():

	pass 


func _process(_delta):
	playerPosX = get_node("/root/Level/Player").get_position().x

	get_node("AnimatedSprite").set_offset(Vector2(0,1980)) # 1980 es la mitad de la img
	aumentarNivel()
	get_node(".").set_position(Vector2(playerPosX, nuevaAltura))
	cartelAltura()

	
	
	pass
func cartelAltura():
	get_node("Line2D").set_point_position(0, Vector2(-get_viewport().size.x, 0))
	get_node("Line2D").set_point_position(1, Vector2(get_viewport().size.x, 0))
	get_node("Line2D/Label").set_text(str(get_viewport().size.y - nuevaAltura))

func aumentarNivel():
	
	var tiempo = int(OS.get_ticks_msec())/velocidadSubida
	nuevaAltura = altura - tiempo
	
#	altura = altura - (int(OS.get_ticks_msec())/1000)
#	print("tiempo: " + str(tiempo))
#	print ("altura: " + str(altura))
#	print ("nueva altura: " + str(nuevaAltura))
#	print (get_node("/root/Principal/Player").get_position().y)



