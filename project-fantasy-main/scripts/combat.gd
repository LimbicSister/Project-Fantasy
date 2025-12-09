extends Node3D

var players = [Paul, Ryka, Jehn, Jyra, Hendra]
var enemies = []
var ava_abilities = []
var running = false
@onready var got_away: Label = $"Combat Menu/Got Away"
var active_player = players[0]
var damage = 0

func _ready() -> void:
	choose_environment()
	choose_enemy()

func _physics_process(_delta: float) -> void:
	if running:
		got_away.visible = true
		await get_tree().create_timer(3).timeout
		got_away.visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("run"): 
		if randi_range(1, 3) == 1: 
			running = true

func attack():
	pass

func job_abilities():
	for job in Jobs.players_jobs:
		match job:
			"Onion Knight":
				pass
			"Knight":
				ava_abilities.append(Jobs.Kn_IAb)
			"Warrior":
				ava_abilities.append(Jobs.War_IAb)
			"White Mage":
				ava_abilities.append(Jobs.WM_IAb)
			"Support Wizard":
				ava_abilities.append(Jobs.SW_IAb)
			"Black Mage":
				ava_abilities.append(Jobs.BM_IAb)
			"Blast Wizard":
				ava_abilities.append(Jobs.BW_IAb)
			"Ninja":
				ava_abilities.append(Jobs.Nin_IAb)
			"Samurai":
				ava_abilities.append(Jobs.Sam_IAb)
			"Monk":
				ava_abilities.append(Jobs.Mon_IAb)
			"Berserker":
				ava_abilities.append(Jobs.Ber_IAb)

func magic():
	pass

func enemy_attack():
	pass

func choose_enemy():
	pass

func choose_environment():
	pass

func defend():
	pass

func end_turn():
	pass

func calc_damage():
	damage = randi_range(5, 10) * active_player.strength
