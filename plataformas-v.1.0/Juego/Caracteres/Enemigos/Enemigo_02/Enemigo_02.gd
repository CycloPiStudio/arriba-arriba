extends Node2D

onready var altura = (get_viewport().size.y)
onready var nuevaAltura
export var velocidadSubida = 50

var playerPosX
var playerPosY
var player
var h = 10

func _ready():
	get_node("tiempoJuego").stop()
	get_node("tiempoJuego").start()
	pass 


func _process(_delta):
#	print ("tiempo Juego: " + str(1000 - get_node("tiempoJuego") .time_left))
#	print ( "ticks: " + str(OS.get_system_time_secs()))
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
		player.quitarVida(h)
#		print ("muere a: " +str(playerPosY) + " m")
#		print ("altura enemigo: " + str(nuevaAltura ))
		pass


func aumentarAltura():
	var tiempo = (1000 - get_node("tiempoJuego").time_left)
	nuevaAltura = altura - tiempo * velocidadSubida
#	if int(nuevaAltura) % 100 == 0:
#		print("dividible entre 100")
#		velocidadSubida += 10
#		print ("velocidadSubida " + str(velocidadSubida))
#	altura = altura - (int(OS.get_ticks_msec())/1000)
#	print("tiempo: " + str(tiempo))
#	print ("altura: " + str(altura))
#	print ("nueva altura: " + str(nuevaAltura))
#	print("posPlayerY: " + str(playerPosY))

	cartelAltura()

	
	

func cartelAltura():
	get_node("Line2D").set_point_position(0, Vector2(-get_viewport().size.x, 0))
	get_node("Line2D").set_point_position(1, Vector2(get_viewport().size.x, 0))
	get_node("Line2D/Label").set_text(str(get_viewport().size.y - nuevaAltura))






