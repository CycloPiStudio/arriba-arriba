extends Node2D

var Player
var Salida
var SalidaPos

func _ready():
	Player = get_parent().get_parent().get_node("Player")
	Salida = get_parent()
	SalidaPos = Salida.get_position()
	
	
func _process(_delta):

	var PlayerPos = Player.get_global_position()
	get_node(".").set_position(Vector2(PlayerPos.x-SalidaPos.x , PlayerPos.y-SalidaPos.y-80))
	look_at(Salida.position + Vector2(PI/2,0))
#	print(get_node(".").name)
#	print(Player.position)
#	print(Player.name)
