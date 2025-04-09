extends Node

@export var start_screen: TextureRect

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	# выход из игры		
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

	# выключаем стартовый экран
	if event.is_pressed() and (event is InputEventKey or event is InputEventMouseButton):
		start_screen.hide()
		
	# перезапуск по R
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
