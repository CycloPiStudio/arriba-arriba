extends Node2D

var incrementoAltura 
var playerPosX
var playerPosY 

func _process(_delta):
	ponerBandera()
	
	pass

func ponerBandera():
	playerPosY = get_node("/root/Level/Player").get_position().y
	var alturaPlayer = get_viewport().size.y - playerPosY
	var separacionEntreBanderas = 500
	for i in range (1000):
		if alturaPlayer >= separacionEntreBanderas*i:
			incrementoAltura = separacionEntreBanderas*i
			marcarAlturaPlayer(int (get_viewport().size.y) - incrementoAltura)
			#			print ("incremento altura " + str(separacionEntreBanderas*i))
		pass

func marcarAlturaPlayer(posBandera):
	playerPosX = get_node("/root/Level/Player").get_position().x
#Posiciona la altura de la bandera
	get_node(".").set_position(Vector2(playerPosX , posBandera))
#Coloca los dos puntos de la linea de la bandera posicion ancho y alto
	get_node("Line2D").set_point_position(0, Vector2(-get_viewport().size.x, 0))
	get_node("Line2D").set_point_position(1, Vector2(get_viewport().size.x, 0))
#Pone texto de la altura a la que esta la bandera
	get_node("Label altura").set_text(str(get_viewport().size.y - posBandera))
	
	
#	print("resto: " + str((int (get_viewport().size.y - get_node("/root/Principal/Player").get_position().y) % 100)))
#	print(int (get_viewport().size.y - get_node("/root/Principal/Player").get_position().y) % 100 )
#	print (get_viewport().size.y - get_node("/root/Principal/Player").get_position().y )
#	print ("texto que poner en la bandera: " + str(posGlobal.y + posBandera - 100))
#	print ("altura a la que poner la bandera: " + str(int (get_viewport().size.y) - alturaSinViewport))

