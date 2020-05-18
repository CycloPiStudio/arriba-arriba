
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

func _ready():

	pass
	

func _physics_process(delta: float) -> void:
	
	var direction_x := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction_x * move_speed
	velocity.y += gravity * delta
	var snap_vector = Vector2(0,32) if snap else Vector2()
	velocity = move_and_slide_with_snap(velocity,snap_vector, Vector2.UP, slope_slide_threshold)
	var just_landed := is_on_floor() and not snap
	if just_landed:
		snap = true

	update_animation(velocity)

func quitarVida():
	var menosVida = 10
	vida = vida - menosVida
	print(vida)
	if vida <= 0:
		vidas_personaje -= 1
		print("una vida menos")
		get_parent().queue_free()

		if vidas_personaje <= 0:
			print("se acabo la partida")
	
func update_animation(velocity: Vector2) -> void:
#	var animation := "idle"
	
	if abs(velocity.x) > 10.0:
#		var estaflip = $Sprite.is_flipped_h()
		sprite.flip_h = velocity.x < 0
		
func _input(event):

#	Saltar
	if Input.is_action_just_pressed("ui_up") and snap and not Input.is_action_pressed("ui_down"):
		velocity.y = -jump_force
		snap = false
#		audio_player.play()
#	Mover izquierda derecha
	if is_on_floor() and (Input.is_action_just_released("move_right") or Input.is_action_just_released("move_left")):
		velocity.y = 0
#	Poner bloques
	if Input.is_action_just_pressed("ui_select") or event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		ponerQuitarBloque(1,1,1)
#	Quitar bloques
	if Input.is_action_just_pressed("ui_accept") or event is InputEventMouseButton and event.button_index == BUTTON_RIGHT:
		ponerQuitarBloque(1,1,-1)
		
func ponerQuitarBloque(desplazaBloqueX, deplazaBloqueY, poner):	
#	poner = 1 ; quitar = -1	
#	desplazaBolqueX o Y multiplicador  para ubicar el bloque
	var tamanoBloque 
	if get_node("AnimatedSprite").flip_h:
		tamanoBloque = -32
	else:
		tamanoBloque = 32
		
	var personaje_pos = Vector2(get_position().x + tamanoBloque * desplazaBloqueX, get_position().y + tamanoBloque * deplazaBloqueY)
	var tile_pos = tilemap.world_to_map(personaje_pos)
	tilemap.set_cell(tile_pos.x,tile_pos.y, 1)


