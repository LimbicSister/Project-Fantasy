extends Area3D



func _on_body_entered(_body: Node3D) -> void:
	AreaManager.current_area = "Starting Area"
