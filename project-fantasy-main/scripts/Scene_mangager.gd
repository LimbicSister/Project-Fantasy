extends Node

var current_loc = Vector3()
var player = null

func change_scene_arg(player_node, locationX : float, locationZ : float, file):
	call_deferred("changing_scene", file)
	player_node.position = Vector3(locationX, 1.0, locationZ)

func change_scene(file):
	call_deferred("changing_scene", file)

func changing_scene(file):
	get_tree().change_scene_to_file(file)

func _ready() -> void:
	var players = []
	for node in get_tree().get_nodes_in_group("Player"):
		players.append(node)
	if players.size() > 0:
		player = players[0]

func _physics_process(_delta: float) -> void:
	if player != null:
		current_loc = player.position
