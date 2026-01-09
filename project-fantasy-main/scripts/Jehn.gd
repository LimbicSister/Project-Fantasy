extends Node

var level = 1
var strength = 1.0
var max_health = 30
var health = 30
var MP = 5
var max_speed = 6.0
var speed = 9.0
var title = "Jehn"
var XP = 0
var dead = false

func level_up_check():
	if XP <= 100:
		level = 1
	elif XP <= 200:
		level = 2
	elif XP <= 350:
		level = 3
	elif XP <= 500:
		level = 4
	elif XP <= 700:
		level = 5
	elif XP <= 1000:
		level = 6
	elif XP <= 1500:
		level = 7
	elif XP <= 2500:
		level = 8
	elif XP <= 3600:
		level = 9
	elif XP <= 5000:
		level = 10
	level_up()

func level_up():
	match level:
		1:
			strength = 1.0
			max_health = 30
			MP = 5
		2:
			strength = 1.2
			max_health = 40
			MP = 7
		3:
			strength = 1.4
			max_health = 55
			MP = 10
		4:
			strength = 1.6
			max_health = 70
			MP = 14
		5:
			strength = 1.8
			max_health = 83
			MP = 18
		6:
			strength = 2.0
			max_health = 100
			MP = 23
		7:
			strength = 2.3
			max_health = 120
			MP = 28
		8:
			strength = 2.6
			max_health = 150
			MP = 34
		9:
			strength = 3.0
			max_health = 175
			MP = 40
		10:
			strength = 3.5
			max_health = 230
			MP = 45
