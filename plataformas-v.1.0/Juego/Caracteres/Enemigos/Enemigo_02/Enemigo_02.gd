extends Node2D

onready var altura = (get_viewport().size.y)
onready var nuevaAltura
export var velocidadSubida = 50
var herida = 10

var playerPosX
var playerPosY
var player

func _ready():

	pass 


func _process(_delta):
	aumentarAltura()
	posicionEnemigo()
	cartelAltura()
#	quitarVida()
	
	pass
	

func posicionEnemigo():
	playerPosX = get_parent().get_node("Player").get_position().x
	playerPosY = get_parent().get_node("Player").get_position().y
	get_node(".").set_position(Vector2(playerPosX, nuevaAltura))
	get_node("AnimatedSprite").set_offset(Vector2(0,1980))


func quitarVida():
	player = get_parent().get_node("Player")
	
	if playerPosY > nuevaAltura:
#		get_node("Timer").start()	
#		if 
		player.quitarVida(herida)
		print ("muere" +str(nuevaAltura))
#		print ("altura player: " + str(playerPosY))
#		print ("altura enemigo: " + str(nuevaAltura ))
		pass


func aumentarAltura():
	var tiempo = int(OS.get_ticks_msec())/velocidadSubida
	nuevaAltura = altura - tiempo
	
#	altura = altura - (int(OS.get_ticks_msec())/1000)
#	print("tiempo: " + str(tiempo))
#	print ("altura: " + str(altura))
#	print ("nueva altura: " + str(nuevaAltura))

	cartelAltura()

	
	

func cartelAltura():
	get_node("Line2D").set_point_position(0, Vector2(-get_viewport().size.x, 0))
	get_node("Line2D").set_point_position(1, Vector2(get_viewport().size.x, 0))
	get_node("Line2D/Label").set_text(str(get_viewport().size.y - nuevaAltura))


