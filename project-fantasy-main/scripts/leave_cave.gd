extends Area3D



func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		SceneManager.change_scene_arg(body, 5.6, -13.6, "res://scenes/Overworld.tscn")
