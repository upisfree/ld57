extends MeshInstance3D

@export var is_end: bool
@export var end_screen: ColorRect

@onready var static_body: StaticBody3D = get_node(NodePath("StaticBody3D"))
@onready var hit_sound_1: AudioStreamPlayer3D = get_node(NodePath("HitSound1"))
@onready var hit_sound_2: AudioStreamPlayer3D = get_node(NodePath("HitSound2"))
@onready var hit_sound_3: AudioStreamPlayer3D = get_node(NodePath("HitSound3"))

var hit_counter = 0

func _input(event: InputEvent):
	if Input.is_action_just_pressed("left_click"):
		var hit = RaycastSystem.get_raycast_hit_object()
		
		if hit == static_body:
			hit_counter += 1
			
			if hit_counter == 1:
				hit_sound_1.play()
			
			if hit_counter == 2:
				hit_sound_2.play()
				
			if hit_counter == 3:
				hit_sound_3.play()
				
				hide()
				static_body.queue_free()
				
				if is_end == true:
					end_screen.show()

					await get_tree().create_timer(7.5).timeout
					get_tree().reload_current_scene()
