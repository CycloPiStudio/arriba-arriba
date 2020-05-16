
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
#	velocity.x = analog_velocity.x* move_speed
	if Input.is_action_just_pressed("ui_up") and snap and not Input.is_action_pressed("ui_down"):
		velocity.y = -jump_force
		snap = false
#		audio_player.play()

	velocity.y += gravity * delta

	var snap_vector = Vector2(0,32) if snap else Vector2()
	velocity = move_and_slide_with_snap(velocity,snap_vector, Vector2.UP, slope_slide_threshold)

	if is_on_floor() and (Input.is_action_just_released("move_right") or Input.is_action_just_released("move_left")):
		velocity.y = 0

	var just_landed := is_on_floor() and not snap
	if just_landed:
		snap = true
#	if Input.is_action_pressed("ui_down") and Input.is_action_just_pressed("ui_up"):
#	print(analog_velocity.y)
#	if analog_velocity.y < 0 and Input.is_action_just_pressed("jump"):
#		and Input.is_action_just_pressed("jump")
#		activar_desactivar_colision()
	
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
	var lado = 32
	if get_node("AnimatedSprite").flip_h:
		lado = -32
	else:
		lado = 32
		
#	Poner bloques
	if Input.is_action_just_pressed("ui_select") or event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
#		var mouse_pos = get_viewport().get_mouse_position()
		var personaje_pos = Vector2(get_position().x + lado, get_position().y)
		var tile_pos = tilemap.world_to_map(personaje_pos)
		tilemap.set_cell(tile_pos.x,tile_pos.y, 1)
		#print(tile_pos)
	if Input.is_action_just_pressed("ui_accept") or event is InputEventMouseButton and event.button_index == BUTTON_RIGHT:
#		var mouse_pos = get_viewport().get_mouse_position()
		var personaje_pos = Vector2(get_position().x + lado , get_position().y)
		var tile_pos = tilemap.world_to_map(personaje_pos)
		tilemap.set_cell(tile_pos.x,tile_pos.y, -1)
#		print(tile_pos)