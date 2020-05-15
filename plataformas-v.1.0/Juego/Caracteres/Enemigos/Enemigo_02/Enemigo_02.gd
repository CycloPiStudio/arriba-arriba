extends Node2D

onready var altura = (get_viewport().size.y)
onready var nuevaAltura
export var velocidadSubida = 50

var playerPosX


func _ready():
#	altura = (get_viewport().size.y)
	pass 


func _process(_delta):
	playerPosX = get_node("/root/Level/Player").get_position().x
	aumentarNivel()
	get_node(".").set_position(Vector2(playerPosX, nuevaAltura))
	get_node("Area2D/CollisionShape2D").shape.extents = Vector2((get_viewport().size.x/2)+50,10)
	cartelAltura()
#	if get_viewport().size.y - nuevaAltura == 100:
#		cartelAltura()
#	if get_viewport().size.y - nuevaAltura == 200:
#		cartelAltura()
	
	
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


func _on_Area2D_body_entered(body):
	print ("entra el " + str(body.name))
	if body.get_name() == "Player":
		pass
	pass # Replace with function body.

func _on_Area2D_body_exited(body):
	print ("sale el " + str(body.name))
	pass # Replace with function body.


