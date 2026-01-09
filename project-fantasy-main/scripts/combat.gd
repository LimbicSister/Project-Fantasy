extends Node3D

var players = [Paul, Ryka, Jehn, Jyra, Hendra]
@onready var got_away: Label = $"Combat Menu/Got Away"
@onready var name_1: Label = $Labels/Name1
@onready var name_2: Label = $Labels/Name2
@onready var name_3: Label = $Labels/Name3
@onready var name_4: Label = $Labels/Name4
@onready var name_5: Label = $Labels/Name5
@onready var enemies_label: Label = $Labels/Enemies
@onready var health_1: Label = $Labels/Health1
@onready var health_2: Label = $Labels/Health2
@onready var health_3: Label = $Labels/Health3
@onready var health_4: Label = $Labels/Health4
@onready var health_5: Label = $Labels/Health5
@onready var enemy_1: Node3D = $Enemies/Enemy1
@onready var enemy_2: Node3D = $Enemies/Enemy2
@onready var enemy_3: Node3D = $Enemies/Enemy3
@onready var enemy_4: Node3D = $Enemies/Enemy4
@onready var enemy_5: Node3D = $Enemies/Enemy5
@onready var active_label: Label = $"Labels/Active player"
@onready var goblin1: CharacterBody3D = $Enemies/Enemy1/Goblin
@onready var goblin2: CharacterBody3D = $Enemies/Enemy2/Goblin
@onready var goblin3: CharacterBody3D = $Enemies/Enemy3/Goblin
@onready var goblin4: CharacterBody3D = $Enemies/Enemy4/Goblin
@onready var goblin5: CharacterBody3D = $Enemies/Enemy5/Goblin
@onready var arrow: Sprite2D = $Arrows/PlaceholderArrow
@onready var arrow_2: Sprite2D = $Arrows/PlaceholderArrow2
@onready var arrow_3: Sprite2D = $Arrows/PlaceholderArrow3
@onready var arrow_4: Sprite2D = $Arrows/PlaceholderArrow4
@onready var arrow_5: Sprite2D = $Arrows/PlaceholderArrow5
var defeated = []
var active_enemies = []
var active_player = null
var active_enemy = null
var enemy1_health
var enemy2_health
var enemy3_health
var enemy4_health
var enemy5_health
var active = false
var ava_enemy_types = []
var enemy1types = []
var enemy2types = []
var enemy3types = []
var enemy4types = []
var enemy5types = []
var targeting
var current_arrow
var target
var enemytimers = []

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("move_down"):
		if targeting:
			if current_arrow == 1:
				arrow.visible = false
				if goblin2 in active_enemies:
					arrow_2.visible = true
					current_arrow = 2
				elif goblin3 in active_enemies:
					arrow_3.visible = true
					current_arrow = 3
				elif goblin4 in active_enemies:
					arrow_4.visible = true
					current_arrow = 4
				elif goblin5 in active_enemies:
					arrow_5.visible = true
					current_arrow = 5
				elif goblin1 in active_enemies:
					arrow.visible = true
					current_arrow = 1
			elif current_arrow == 2:
				arrow_2.visible = false
				if goblin3 in active_enemies:
					arrow_3.visible = true
					current_arrow = 3
				elif goblin4 in active_enemies:
					arrow_4.visible = true
					current_arrow = 4
				elif goblin5 in active_enemies:
					arrow_5.visible = true
					current_arrow = 5
				elif goblin1 in active_enemies:
					arrow.visible = true
					current_arrow = 1
				elif goblin2 in active_enemies:
					arrow_2.visible = true
					current_arrow = 2
			elif current_arrow == 3:
				arrow_3.visible = false
				if goblin4 in active_enemies:
					arrow_4.visible = true
					current_arrow = 4
				elif goblin5 in active_enemies:
					arrow_5.visible = true
					current_arrow = 5
				elif goblin1 in active_enemies:
					arrow.visible = true
					current_arrow = 1
				elif goblin2 in active_enemies:
					arrow_2.visible = true
					current_arrow = 2
				elif goblin3 in active_enemies:
					arrow_3.visible = true
					current_arrow = 3
			elif current_arrow == 4:
				arrow_4.visible = false
				if goblin5 in active_enemies:
					arrow_5.visible = true
					current_arrow = 5
				elif goblin1 in active_enemies:
					arrow.visible = true
					current_arrow = 1
				elif goblin2 in active_enemies:
					arrow_2.visible = true
					current_arrow = 2
				elif goblin3 in active_enemies:
					arrow_3.visible = true
					current_arrow = 3
				elif goblin4 in active_enemies:
					arrow_4.visible = true
					current_arrow = 4
			elif current_arrow == 5:
				arrow_5.visible = false
				if goblin1 in active_enemies:
					arrow.visible = true
					current_arrow = 1
				elif goblin2 in active_enemies:
					arrow_2.visible = true
					current_arrow = 2
				elif goblin3 in active_enemies:
					arrow_3.visible = true
					current_arrow = 3
				elif goblin4 in active_enemies:
					arrow_4.visible = true
					current_arrow = 4
				elif goblin5 in active_enemies:
					arrow_5.visible = true
					current_arrow = 5
	if event.is_action_pressed("move_up"):
		if targeting:
			if current_arrow == 1:
				arrow.visible = false
				if goblin5 in active_enemies:
					arrow_5.visible = true
					current_arrow = 5
				elif goblin4 in active_enemies:
					arrow_4.visible = true
					current_arrow = 4
				elif goblin3 in active_enemies:
					arrow_3.visible = true
					current_arrow = 3
				elif goblin2 in active_enemies:
					arrow_2.visible = true
					current_arrow = 2
				elif goblin1 in active_enemies:
					arrow.visible = true
					current_arrow = 1
			elif current_arrow == 2:
				arrow_2.visible = false
				if goblin1 in active_enemies:
					arrow.visible = true
					current_arrow = 1
				elif goblin5 in active_enemies:
					arrow_5.visible = true
					current_arrow = 5
				elif goblin4 in active_enemies:
					arrow_4.visible = true
					current_arrow = 4
				elif goblin3 in active_enemies:
					arrow_3.visible = true
					current_arrow = 3
				elif goblin2 in active_enemies:
					arrow_2.visible = true
					current_arrow = 2
			elif current_arrow == 3:
				arrow_3.visible = false
				if goblin2 in active_enemies:
					arrow_2.visible = true
					current_arrow = 2
				elif goblin1 in active_enemies:
					arrow.visible = true
					current_arrow = 1
				elif goblin5 in active_enemies:
					arrow_5.visible = true
					current_arrow = 5
				elif goblin4 in active_enemies:
					arrow_4.visible = true
					current_arrow = 4
				elif goblin3 in active_enemies:
					arrow_3.visible = true
					current_arrow = 3
			elif current_arrow == 4:
				arrow_4.visible = false
				if goblin3 in active_enemies:
					arrow_3.visible = true
					current_arrow = 3
				elif goblin2 in active_enemies:
					arrow_2.visible = true
					current_arrow = 2
				elif goblin1 in active_enemies:
					arrow.visible = true
					current_arrow = 1
				elif goblin5 in active_enemies:
					arrow_5.visible = true
					current_arrow = 5
				elif goblin4 in active_enemies:
					arrow_4.visible = true
					current_arrow = 4
			elif current_arrow == 5:
				arrow_5.visible = false
				if goblin4 in active_enemies:
					arrow_4.visible = true
					current_arrow = 4
				elif goblin3 in active_enemies:
					arrow_3.visible = true
					current_arrow = 3
				elif goblin2 in active_enemies:
					arrow_2.visible = true
					current_arrow = 2
				elif goblin1 in active_enemies:
					arrow.visible = true
					current_arrow = 1
				elif goblin5 in active_enemies:
					arrow_5.visible = true
					current_arrow = 5

func _ready() -> void:
	choose_enemy()
	update_labels()
	for enemy in active_enemies:
		match enemy:
			goblin1:
				enemy1_health = 20
				enemytimers.append(Goblin)
			goblin2:
				enemy2_health = 20
				enemytimers.append(Goblin2)
			goblin3:
				enemy3_health = 20
				enemytimers.append(Goblin3)
			goblin4:
				enemy4_health = 20
				enemytimers.append(Goblin4)
			goblin5:
				enemy5_health = 20
				enemytimers.append(Goblin5)

func _physics_process(delta: float) -> void:
	if active_enemy != null:
		active_enemy.timer = active_enemy.max_timer
	if active_player != null:
		active_player.speed = active_player.max_speed
	elif not active:
		for enemy in enemytimers:
			enemy.timer -= 1.0 * delta
			if enemy.timer <= 0:
				active_enemy = enemy
				active = true
				print(str(active_enemy) + " attacks!")
				enemy_attack()
		for player in players:
			if not player.dead:
				player.speed -= 1 * delta
				if player.speed <= 0:
					active_player = player
					active = true
					active_label.visible = true
					active_label.text = (active_player.name + " IS ACTIVE!")
					await get_tree().create_timer(1).timeout
					active_label.visible = false
			else:
				player.speed = player.max_speed
	update_labels()

func enemy_attack():
	var targetplayer = randi_range(1, players.size())
	var damage = randi_range(active_enemy.min_dam, active_enemy.max_dam)
	print(str(active_enemy) + " is attacking " + str(targetplayer) + " For " + str(damage))
	if targetplayer == 1:
		if not players[0].dead:
			players[0].health -= damage
		else:
			targetplayer = 2
	if targetplayer == 2:
		if not players[1].dead:
			players[1].health -= damage
		else:
			targetplayer = 3
	if targetplayer == 3:
		if not players[2].dead:
			players[2].health -= damage
		else:
			targetplayer = 4
	if targetplayer == 4:
		if not players[4].dead:
			players[4].health -= damage
		else:
			targetplayer = 5
	if targetplayer == 5:
		if not players[5].dead:
			players[5].health -= damage
		else:
			targetplayer = 1
	if targetplayer == 1:
		if not players[0].dead:
			players[0].health -= damage
		else:
			targetplayer = 2
	if targetplayer == 2:
		if not players[1].dead:
			players[1].health -= damage
		else:
			targetplayer = 3
	if targetplayer == 3:
		if not players[2].dead:
			players[2].health -= damage
		else:
			targetplayer = 4
	if targetplayer == 4:
		if not players[4].dead:
			players[4].health -= damage

func choose_enemy():
	choose_ava_types()
	var enemycount
	var enemynum = randi_range(1, 15)
	if enemynum == 15:
		enemycount = 6
	elif enemynum >= 13:
		enemycount = 5
	elif enemynum >= 10:
		enemycount = 4
	elif enemynum >= 6:
		enemycount = 3
	else:
		enemycount = 2
	for enemy in enemycount:
		if enemy >= 1:
			choose_enemy_type(enemy)

func choose_ava_types():
	if AreaManager.current_area == "Opening Area":
		ava_enemy_types.append("Goblin")
	for enemytype in ava_enemy_types:
		if enemytype == "Goblin":
			enemy1types.append(goblin1)
			enemy2types.append(goblin2)
			enemy3types.append(goblin3)
			enemy4types.append(goblin4)
			enemy5types.append(goblin5)

func choose_enemy_type(enemy):
	var enemytype
	match enemy:
		1:
			enemytype = enemy1types.pick_random()
		2:
			enemytype = enemy2types.pick_random()
		3:
			enemytype = enemy3types.pick_random()
		4:
			enemytype = enemy4types.pick_random()
		5:
			enemytype = enemy5types.pick_random()
	if enemytype != null:
		active_enemies.append(enemytype)
		enemytype.visible = true

func update_labels():
	name_1.text = players[0].title
	name_2.text = players[1].title
	name_3.text = players[2].title
	name_4.text = players[3].title
	name_5.text = players[4].title
	enemies_label.text = "Enemies:"
	for enemy in active_enemies:
		var current_text = enemies_label.text
		enemies_label.text = (current_text + "\n" + enemy.name)
	health_1.text = "Health: " + str(players[0].health) + "   MP: " + str(players[4].MP)
	health_2.text = "Health: " + str(players[1].health) + "   MP: " + str(players[4].MP)
	health_3.text = "Health: " + str(players[2].health) + "   MP: " + str(players[4].MP)
	health_4.text = "Health: " + str(players[3].health) + "   MP: " + str(players[4].MP)
	health_5.text = "Health: " + str(players[4].health) + "   MP: " + str(players[4].MP)

func run():
	if randi_range(1, 3) == 1:
		got_away.visible = true
		await get_tree().create_timer(3).timeout
		got_away.visible = false
		SceneManager.change_scene_arg(SceneManager.player, SceneManager.current_loc.x, SceneManager.current_loc.z, "res://scenes/testing_ground.tscn")

func _on_attack_button_down() -> void:
	if active:
		if not targeting:
			if goblin1 in active_enemies:
				arrow.visible = true
				target = 1
				current_arrow = 1
			elif goblin2 in active_enemies:
				arrow_2.visible = true
				target = 2
				current_arrow = 2
			elif goblin3 in active_enemies:
				arrow_3.visible = true
				target = 3
				current_arrow = 3
			elif goblin4 in active_enemies:
				arrow_4.visible = true
				target = 4
				current_arrow = 4
			elif goblin5 in active_enemies:
				arrow_5.visible = true
				target = 5
				current_arrow = 5
			targeting = true
		else:
			match current_arrow:
				1:
					target = 1
				2:
					target = 2
				3:
					target = 3
				4:
					target = 4
				5:
					target = 5
			current_arrow = 1
			targeting = false
			deal_damage()
			active = false
			arrow.visible = false
			arrow_2.visible = false
			arrow_3.visible = false
			arrow_4.visible = false
			arrow_5.visible = false
			active_player = null

func deal_damage():
	var damage
	if active_player == Paul:
		damage = randi_range(1, 10) * Paul.strength
	elif active_player == Hendra:
		damage = randi_range(1, 10) * Hendra.strength
	elif active_player == Ryka:
		damage = randi_range(1, 10) * Ryka.strength
	elif active_player == Jehn:
		damage = randi_range(1, 10) * Jehn.strength
	elif active_player == Jyra:
		damage = randi_range(1, 10) * Jyra.strength
	if targeting != null and damage != null:
		print(target)
		match target:
			1:
				enemy1_health -= damage
				if enemy1_health <= 0:
					enemy_die(goblin1)
			2:
				enemy2_health -= damage
				if enemy2_health <= 0:
					enemy_die(goblin2)
			3:
				enemy3_health -= damage
				if enemy3_health <= 0:
					enemy_die(goblin3)
			4:
				enemy4_health -= damage
				if enemy4_health <= 0:
					enemy_die(goblin4)
			5:
				enemy5_health -= damage
				if enemy5_health <= 0:
					enemy_die(goblin5)

func _on_run_button_down() -> void:
	if active:
		run()
		active = false
		active_player = null

func enemy_die(enemy):
	active_enemies.erase(enemy)
	enemy.visible = false
	defeated.append(enemy)
	if active_enemies.size() == 0:
		end_combat()

func end_combat():
	for enemy in defeated:
		match enemy:
			goblin1:
				giveXP(Goblin)
			goblin2:
				giveXP(Goblin2)
			goblin3:
				giveXP(Goblin3)
			goblin4:
				giveXP(Goblin4)
			goblin5:
				giveXP(Goblin5)
	SceneManager.change_scene_arg(SceneManager.player, SceneManager.current_loc.x, SceneManager.current_loc.z, "res://scenes/Overworld.tscn")

func giveXP(type):
	for player in players:
		var XP = randi_range(type.MinXP, type.MaxXP)
		player.XP += XP
		print(player.XP)

func player_die(player):
	player.dead = true
	print(str(player) + " died")
