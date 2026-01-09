extends Node3D
class_name Chest

@onready var sprite_3d: Sprite3D = $Sprite3D
var contents = "Potion"
var player_in_range = false
var opened = false

func _ready() -> void:
	add_to_group("Chests")

func interact():
	if not opened:
		opened = true
		return contents 

func _physics_process(_delta: float) -> void:
	if player_in_range and not opened:
		sprite_3d.visible = true
	else:
		sprite_3d.visible = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_in_range = true
		body.can_interact = true

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_in_range = false
		body.can_interact = false
