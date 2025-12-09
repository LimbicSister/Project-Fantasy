extends Node

var jobs = ["Onion Knight", "Knight", "Warrior", "White Mage", "Support Wizard", "Black Mage", "Blast Wizard", "Ninja", "Samurai", "Monk", "Berserker"]
var ava_jobs = ["Onion Knight"]
var OnKn_Equ = ["Sword", "Staff", "Wand", "Katana", "Shield", "Nunchucks", "Gloves", "Knuckles", "Dagger"]
var Kn_Equ = ["Sword", "Shield", "Dagger"]
var War_Equ = ["Sword", "Shield", "Dagger", "Gloves"]
var WM_Equ = ["Staff", "Shield"]
var SW_Equ = ["Staff", "Shield", "Dagger"]
var BM_Equ = ["Wand", "Shield"]
var BW_Equ = ["Wand", "Shield", "Dagger"]
var Nin_Equ = ["Katana", "Dagger"]
var Sam_Equ = ["Katana", "Dagger", "Nunchucks"]
var Mon_Equ = ["Fists", "Gloves"]
var Ber_Equ = ["Fists", "Gloves", "Knuckles"] 
var Kn_Lvl = 1
var War_Lvl = 1
var WM_Lvl = 1
var SW_Lvl = 1
var BM_Lvl = 1
var BW_Lvl = 1
var Nin_Lvl = 1
var Sam_Lvl = 1
var Mon_Lvl = 1
var Ber_Lvl = 1 
var Kn_Ab = {"Guard" : false, "" : false,"Two-Handed" : false}
var War_Ab = {"Rage" : false, "" : false}
var WM_Ab = {"White Magic Lv. 1" : false, "White Magic Lv. 2" : false, "White Magic Lv. 3" : false, "White Magic Lv. 4" : false, "White Magic Lv. 5" : false, "White Magic Lv. 6" : false}
var SW_Ab = {"Support Magic Lv. 1" : false, "Support Magic Lv. 2" : false, "Support Magic Lv. 3" : false, "Support Magic Lv. 4" : false, "Support Magic Lv. 5" : false, "Support Magic Lv. 6" : false}
var BM_Ab = {"Black Magic Lv. 1" : false, "Black Magic Lv. 2" : false, "Black Magic Lv. 3" : false, "Black Magic Lv. 4" : false, "Black Magic Lv. 5" : false, "Black Magic Lv. 6" : false}
var BW_Ab = {"Blast Magic Lv. 1" : false, "Blast Magic Lv. 2" : false, "Blast Magic Lv. 3" : false, "Blast Magic Lv. 4" : false, "Blast Magic Lv. 5" : false, "Blast Magic Lv. 6" : false}
var Nin_Ab = {"Find Passages" : false, "Dodge" : false, "Shade" : false, "Hide" : false, "Throw" : false, "Weapon Mastery" : false}
var Sam_Ab = {"Standoff" : false, "Stand Strong" : false, "" : false}
var Mon_Ab = {"Prayer" : false, "Calm" : false, "+10% Health" : false, "+20% Health" : false, "+30% Health" : false}
var Ber_Ab = {"Berserk" : false, "Focus" : false}
var Kn_Mas = false
var War_Mas = false
var WM_Mas = false
var SW_Mas = false
var BM_Mas = false
var BW_Mas = false
var Nin_Mas = false
var Sam_Mas = false
var Mon_Mas = false
var Ber_Mas = false
var Ava_Ab = []
@export_enum("Onion Knight", "Knight", "Warrior", "White Mage", "Support Wizard", "Black Mage", "Blast Wizard", "Ninja", "Samurai", "Monk", "Berserker") var player1job := "Onion Knight"
@export_enum("Onion Knight", "Knight", "Warrior", "White Mage", "Support Wizard", "Black Mage", "Blast Wizard", "Ninja", "Samurai", "Monk", "Berserker") var player2job := "Onion Knight"
@export_enum("Onion Knight", "Knight", "Warrior", "White Mage", "Support Wizard", "Black Mage", "Blast Wizard", "Ninja", "Samurai", "Monk", "Berserker") var player3job := "Onion Knight"
@export_enum("Onion Knight", "Knight", "Warrior", "White Mage", "Support Wizard", "Black Mage", "Blast Wizard", "Ninja", "Samurai", "Monk", "Berserker") var player4job := "Onion Knight"
@export_enum("Onion Knight", "Knight", "Warrior", "White Mage", "Support Wizard", "Black Mage", "Blast Wizard", "Ninja", "Samurai", "Monk", "Berserker") var player5job := "Onion Knight"
var players_jobs = [player1job, player2job, player3job, player4job, player5job]
var Kn_IAb = []
var War_IAb = []
var WM_IAb = []
var SW_IAb = []
var BM_IAb = []
var BW_IAb = []
var Nin_IAb = []
var Sam_IAb = []
var Mon_IAb = []
var Ber_IAb = []

func load_Abilities():
	for ability in Kn_Ab:
		if ability:
			Ava_Ab.append(ability)
	for ability in War_Ab:
		if ability:
			Ava_Ab.append(ability)
	for ability in WM_Ab:
		if ability:
			Ava_Ab.append(ability)
	for ability in SW_Ab:
		if ability:
			Ava_Ab.append(ability)
	for ability in BM_Ab:
		if ability:
			Ava_Ab.append(ability)
	for ability in BW_Ab:
		if ability:
			Ava_Ab.append(ability)
	for ability in Nin_Ab:
		if ability:
			Ava_Ab.append(ability)
	for ability in Sam_Ab:
		if ability:
			Ava_Ab.append(ability)
	for ability in Mon_Ab:
		if ability:
			Ava_Ab.append(ability)
	for ability in Ber_Ab:
		if ability:
			Ava_Ab.append(ability)

func job_lvl_up(job):
	match job:
		"Onion Knight":
			pass
		"Knight":
			if not Kn_Mas:
				Kn_Ab[Kn_Lvl] = true
				Kn_Lvl += 1
		"Warrior":
			if not War_Mas:
				War_Ab[War_Lvl] = true
				War_Lvl += 1
		"White Mage":
			if not WM_Mas:
				WM_Ab[WM_Lvl] = true
				WM_Lvl += 1
				if WM_Lvl >= 6:
					WM_Mas = true
		"Support Wizard":
			if not SW_Mas:
				SW_Ab[SW_Lvl] = true
				SW_Lvl += 1
				if SW_Lvl >= 6:
					SW_Mas = true
		"Black Mage":
			if not BM_Mas:
				BM_Ab[BM_Lvl] = true
				BM_Lvl += 1
				if BM_Lvl >= 6:
					BM_Mas = true
		"Blast Wizard":
			if not BW_Mas:
				BW_Ab[BW_Lvl] = true
				BW_Lvl += 1
				if BM_Lvl >= 6:
					BM_Mas = true
		"Ninja":
			if not Nin_Mas:
				Nin_Ab[Nin_Lvl] = true
				Nin_Lvl += 1
				if Nin_Lvl >= 5:
					Nin_Mas = true
		"Samurai":
			if not Sam_Mas:
				Sam_Ab[Sam_Lvl] = true
				Sam_Lvl += 1
		"Monk":
			if not Mon_Mas:
				Mon_Ab[Mon_Lvl] = true
				Mon_Lvl += 1
				if Mon_Lvl >= 5:
					Mon_Mas = true
		"Berserker":
			if not Ber_Mas:
				Ber_Ab[Ber_Lvl] = true
				Ber_Lvl += 1
				if Ber_Lvl >= 2:
					Ber_Mas = true
