extends Timer


func _ready():
	get_node(".").start()
	pass 


func _on_Timer_timeout():
	get_parent().quitarVida()
	pass 
