extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		SceneManager.change_scene("res://scenes/Overworld.tscn")
