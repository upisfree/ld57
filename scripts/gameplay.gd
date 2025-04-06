extends Node

#func _process(_delta: float) -> void:
	# рестарт по R или если мы упали вниз
#	if Input.is_action_pressed("restart"): #|| global_position.y < -100:
#		get_tree().reload_current_scene()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	# выход из игры		
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
	# перезапуск по R
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
