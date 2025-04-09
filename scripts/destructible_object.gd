extends MeshInstance3D

@export var is_end: bool
@export var end_screen: ColorRect

@onready var hit_sound_1: AudioStreamPlayer3D = get_node(NodePath("HitSound1"))
@onready var hit_sound_2: AudioStreamPlayer3D = get_node(NodePath("HitSound2"))
@onready var hit_sound_3: AudioStreamPlayer3D = get_node(NodePath("HitSound3"))

var hit_counter = 0
var static_body: StaticBody3D

var breaking_material_1: BaseMaterial3D = load("res://materials/breaking_1.tres")
var breaking_material_2: BaseMaterial3D = load("res://materials/breaking_2.tres")

func _ready():
	var static_body_node: StaticBody3D = get_node(NodePath("StaticBody3D"))
	
	if static_body_node:
		static_body = static_body_node
	else:
		create_box_collision()

func create_box_collision():
	static_body = StaticBody3D.new()
	
	var box_collider = CollisionShape3D.new()
	box_collider.shape = BoxShape3D.new()
		
	var aabb = get_aabb()
	box_collider.shape.size = aabb.size
	box_collider.position = aabb.position + aabb.size / 2
	
	add_child(static_body)
	static_body.add_child(box_collider)

func _input(event: InputEvent):
	if Input.is_action_just_pressed("left_click"):
		var hit = RaycastSystem.get_raycast_hit_object()
		
		if hit == static_body:
			hit_counter += 1
			
			if hit_counter == 1:
				hit_sound_1.play()
				
				material_overlay = breaking_material_1
			
			if hit_counter == 2:
				hit_sound_2.play()
				
				material_overlay = breaking_material_2
				
			if hit_counter == 3:
				hit_sound_3.play()
				
				# скрываем объект, удаляем коллизию и выключаем все аудио внутри
				hide()
				static_body.queue_free()
				for child in get_children():
					# если не звук удара, то удаляем
					if !child.name.begins_with("HitSound"):
						child.queue_free()
				
				if is_end == true:
					end_screen.show()

					await get_tree().create_timer(8).timeout
					get_tree().reload_current_scene()
