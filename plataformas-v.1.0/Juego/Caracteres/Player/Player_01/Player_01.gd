
##############
extends KinematicBody2D

onready var sprite : AnimatedSprite = $AnimatedSprite
#onready var animation_player : AnimationPlayer = $AnimationPlayer
#onready var audio_player : AudioStreamPlayer = $AudioStreamPlayer2D
export var snap := false
export var move_speed := 240
export var jump_force := 200
export var gravity := 300
export var slope_slide_threshold := 50.0
#var vidas_personaje = 3
var velocity := Vector2()
#var conesion_anima_fin
#onready var tilemap = get_node("/root/Level/TileMap")
var left = -0.5
var right = 0.5
var direction

#Cyclo Pi variables
var bandera_boton_pulsao = false
onready var gameover = load("res://Menus/GameOver/GameOver.tscn").instance()
var bandera_muerto = false
var bandera_sonido_pasos = true



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
	if is_on_wall():
		print("is on wall", is_on_wall())
		if direction_x == left:
			print("hola")
			direction_x = right
			if Input.is_action_pressed("ui_up") or bandera_boton_pulsao:
				salto()

		elif direction_x == right:
			direction_x = left

	var just_landed := is_on_floor() and not snap
	if just_landed:
		snap = true
#	if Input.is_action_pressed("ui_down") and Input.is_action_just_pressed("ui_up"):
#	print(analog_velocity.y)
#	if analog_velocity.y < 0 and Input.is_action_just_pressed("jump"):
#		and Input.is_action_just_pressed("jump")
#		activar_desactivar_colision()
	
	update_animation(velocity)

func update_animation(velocity: Vector2) -> void:
	var animation := "caminar"
	
	if abs(velocity.x) > 10.0:
#		
		sprite.flip_h = velocity.x < 0
		animation = "caminar"
		if bandera_sonido_pasos:
			bandera_sonido_pasos = false
			get_node("AudioPasos").play()
			

	if not is_on_floor():
		animation = "saltar" if velocity.y < 0 else "caer"
		
	if sprite.animation != animation:
		sprite.play(animation)


func _on_TextureButton_pressed():
	bandera_boton_pulsao = false
	
func _on_TextureButton_button_down():
	bandera_boton_pulsao = true
	if snap :
		salto()
	
func salto():
	snap = false
	velocity.y = -jump_force
	get_node("AudioSalto").play()


func _on_AudioPasos_finished():
	if snap :
		bandera_sonido_pasos = true
	pass # Replace with function body.
	
func morir():
	bandera_muerto = true
	Global.puntuacion = 0
	Global.monedas = 0
	
	quitar_vida()
#	print("game over por límite inferior, esto hay que cambiarlo por game over por areas")

#	gameover.set_position(get_position())
#	Global_cambiar_nivel.goto_scene("res://Menus/GameOver/GameOver.tscn")
	pass
	
func quitar_vida():
	if Global.vidas > 1:
		Global.vidas -= 1
#		Global_cambiar_nivel.wait_frames = 20
		Global_cambiar_nivel.goto_scene(get_parent().filename)
	elif Global.vidas <= 1 :
		Global.vidas -= 1
#		Global_cambiar_nivel.wait_frames = 0
#		Global_cambiar_nivel.goto_scene("res://Menus/GameOver/GameOver.tscn")
		get_parent().add_child(gameover)
#		add_child(gameover)
