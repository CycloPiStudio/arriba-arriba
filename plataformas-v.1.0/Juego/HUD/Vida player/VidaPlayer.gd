extends Node2D


var graf_vida
var bar_vida
var Player


func _ready():

	
	bar_vida =$TextureProgress
	Player = get_parent()
	graf_vida = get_node("Label")

	graf_vida.set_position(Vector2(Player.global_position.x-20 , Player.global_position.y-70))
	bar_vida.set_position(Vector2(-30,-50))#Player.global_position.x-50 , Player.global_position.y-100))
	
	set_bar_vida()
	print (Player.vida)

	pass

func _process(_delta):
	graf_vida.set_text(str(Player.vida))
	
#	print ("angulo : " + str((get_parent().motionM.angle())*180/3.14))
#	bar_vida.rect_rotation = get_parent().motionM.angle()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	graf_vida.set_text("La vida: "+ str(Player.vida) + " con nodos")
#	if Player.vidaMalo < 3
	bar_vida.value = Player.vida
#	pass


func set_bar_vida():
	bar_vida.max_value = Player.vida
	bar_vida.min_value = 0
	bar_vida.value = Player.vida

