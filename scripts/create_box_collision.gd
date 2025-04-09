extends MeshInstance3D

var static_body: StaticBody3D

func _ready():
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
