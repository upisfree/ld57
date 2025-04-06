extends Node3D

@onready var animation_player: AnimationPlayer = get_node(NodePath("AnimationPlayer"))

func _input(event: InputEvent):
	if Input.is_action_just_pressed("left_click"):
		animation_player.play("Object_32Action")
