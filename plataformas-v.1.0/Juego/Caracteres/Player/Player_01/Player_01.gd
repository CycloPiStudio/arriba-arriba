
extends KinematicBody2D


onready var tilemap = get_parent().get_node("TileMap")
onready var sprite : AnimatedSprite = $AnimatedSprite
#onready var animation_player : AnimationPlayer = $AnimationPlayer
#onready var audio_player : AudioStreamPlayer = $AudioStreamPlayer2D
#var analog_velocity = Vector2(0,0)
export var snap := false
export var move_speed := 250
export var jump_force := 500
export var gravity := 900
export var slope_slide_threshold := 50.0
var vidas_personaje = 3
var vida = 100
var velocity := Vector2()
var direction_x


func _ready():

	pass
	

func _physics_process(delta: float) -> void:
	

	velocity.y += gravity * delta
	var snap_vector = Vector2(0,32) if snap else Vector2()
	velocity = move_and_slide_with_snap(velocity,snap_vector, Vector2.UP, slope_slide_threshold)
	var just_landed := is_on_floor() and not snap
	if just_landed:
		snap = true

	update_animation(velocity)


func quitarVida(menosVida):
#	menosVida Cantidad de vida que se quita o se pone
	vida = vida - menosVida
#	print("vida: " + str(vida))
	if vida <= 0:
		vidas_personaje -= 1
#		print("una vida menos")
		get_parent().queue_free()

		if vidas_personaje <= 0:
			print("se acabo la partida")
	
func update_animation(velocity: Vector2) -> void:
#	var animation := "idle"
	
	if abs(velocity.x) > 10.0:
#		var estaflip = $Sprite.is_flipped_h()
		sprite.flip_h = velocity.x < 0
		
func _input(event):
	if Input.is_action_just_pressed("ui_up") and snap and not Input.is_action_pressed("ui_down"):
		saltar()
#	Parar la caida
	if is_on_floor() and (Input.is_action_just_released("move_right") or Input.is_action_just_released("move_left")):
		velocity.y = 0
		
#	Poner bloques
	if Input.is_action_just_pressed("ui_select") or event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		ponerQuitarBloque(1,1,1)
#	Quitar bloques
	if Input.is_action_just_pressed("ui_accept") or event is InputEventMouseButton and event.button_index == BUTTON_RIGHT:
		ponerQuitarBloque(1,1,-1)

#	Mover izquierda derecha
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		direction_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		movimiento()
#	Parar movimiento
	if Input.is_action_pressed("ui_right") == false and Input.is_action_pressed("ui_left") == false:
		velocity.x = 0
	


func movimiento():
	velocity.x = direction_x * move_speed

	
func saltar():
	velocity.y = -jump_force
	snap = false
#		audio_player.play()
		

var numBolque = 0		
func ponerQuitarBloque(desplazaBloqueX, deplazaBloqueY, poner):	
#	poner = 1 pone bloque ; poner = -1 quita bloque
#	desplazaBolqueX o Y multiplicador  para ubicar el bloque
	var tamanoBloque 
	 
	if get_node("AnimatedSprite").flip_h:
		tamanoBloque = -32
	else:
		tamanoBloque = 32
		
	var personaje_pos = Vector2(get_position().x + tamanoBloque * desplazaBloqueX, get_position().y + tamanoBloque * deplazaBloqueY)
	var tile_pos = tilemap.world_to_map(personaje_pos)
	tilemap.set_cell(tile_pos.x,tile_pos.y, poner)
	if poner == 1:
		numBolque += 1
	elif poner == -1:
		numBolque -= 1
	print ("Nº de bloques: " + str(numBolque))
		

