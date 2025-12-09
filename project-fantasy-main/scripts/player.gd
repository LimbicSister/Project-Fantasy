extends CharacterBody3D

@onready var sprite_1: AnimatedSprite2D = $Sprite/Sprite1
@onready var sprite_2: AnimatedSprite2D = $Sprite/Sprite2
@onready var sprite_3: AnimatedSprite2D = $Sprite/Sprite3
@onready var sprite_4: AnimatedSprite2D = $Sprite/Sprite4
@onready var sprite_5: AnimatedSprite2D = $Sprite/Sprite5

var ava_player = {sprite_1 : false, sprite_2 : false, sprite_3 : false, sprite_4 : false, sprite_5 : false}
const SPRINT_SPEED = 10.0
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var sprinting = false
var can_interact = false
var chest: Node = null
var inventory = {}

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("sprint"):
		sprinting = true
	if event.is_action_released("sprint"):
		sprinting = false
	if event.is_action_pressed("next_char"):
		if ava_player[sprite_5]:
			ava_player[sprite_5] = false
			ava_player[sprite_1] = true
		elif ava_player[sprite_4]:
			ava_player[sprite_4] = false
			ava_player[sprite_5] = true
		elif ava_player[sprite_3]:
			ava_player[sprite_3] = false
			ava_player[sprite_4] = true
		elif ava_player[sprite_2]:
			ava_player[sprite_2] = false
			ava_player[sprite_3] = true
		else:
			ava_player[sprite_1] = false
			ava_player[sprite_2] = true
		find_active_player()
	if event.is_action_pressed("interact"):
		if can_interact:
			interact()

func _ready() -> void:
	add_to_group("Player")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if sprinting:
			velocity.x = direction.x * SPRINT_SPEED
			velocity.z = direction.y * SPRINT_SPEED
		else:
			velocity.x = direction.x * SPEED
			velocity.z = direction.y * SPEED
	else:
		if sprinting:
			velocity.x = move_toward(velocity.x, 0, SPRINT_SPEED)
			velocity.z = move_toward(velocity.z, 0, SPRINT_SPEED)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()

func find_active_player():
	for player in ava_player:
		if not player:
			player.visible = false
		else:
			player.visible = true

func interact():
	if chest != null:
		if chest.has_method("interact"):
			var item = chest.interact()
			if item == null:
				return
			if item in inventory:
				inventory[item] += 1
			else:
				inventory[item] = 1
			print("You got ", item)
			print(inventory)


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Chests"):
		chest = body


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("Chests"):
		chest = null
