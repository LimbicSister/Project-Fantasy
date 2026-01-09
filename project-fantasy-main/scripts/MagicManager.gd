extends Node

var Fire = {"name" : "Fire", "damage" : 5, "Cost" : 3, "unlocked" : false}
var Thunder = {"name" : "Thunder", "damage" : 5, "Cost" : 3, "unlocked" : false}
var Water = {"name" : "Water Blast", "damage" : 5, "Cost" : 3, "unlocked" : false}
var Earth = {"name" : "Rock Blast", "damage" : 5, "Cost" : 3, "unlocked" : false}
var Firer = {"name" : "Flame", "damage" : 10, "Cost" : 3, "unlocked" : false}
var Thunderer = {"name" : "Lightning", "damage" : 10, "Cost" : 6, "unlocked" : false}
var Waterer = {"name" : "Power Blast", "damage" : 10, "Cost" : 6, "unlocked" : false}
var Earther = {"name" : "Rock Crush", "damage" : 10, "Cost" : 6, "unlocked" : false}
var Firest = {"name" : "Hellfire", "damage" : 15, "Cost" : 10, "unlocked" : false}
var Thunderest = {"name" : "Lightning Blast", "damage" : 15, "Cost" : 10, "unlocked" : false}
var Waterest = {"name" : "Water Pressure", "damage" : 15, "Cost" : 10, "unlocked" : false}
var Earthest = {"name" : "Earthquake", "damage" : 15, "Cost" : 10, "unlocked" : false}

var cure = {"name" : "cure", "restored" : 5, "Cost" : 3, "unlocked" : false}
var curer = {"name" : "cura", "restored" : 10, "Cost" : 6, "unlocked" : false}
var curest = {"name" : "curaga", "restored" : 15, "Cost" : 10, "unlocked" : false}
var restore = {"name" : "Restore", "restored" : 10, "Cost" : 6, "unlocked" : false}
var restorer = {"name" : "Revive", "restored" : 20, "Cost" : 12, "unlocked" : false}
var restorest = {"name" : "Bring Back", "restored" : 30, "Cost" : 20, "unlocked" : false}
var concentrate = {"name" : "Concentrate", "restored" : 5, "Cost" : 3, "unlocked" : false}
var concentrater = {"name" : "Meditate", "restored" : 10, "Cost" : 6, "unlocked" : false}
var concentratest = {"name" : "Enlighten", "restored" : 15, "Cost" : 10, "unlocked" : false}

var rage = {"name" : "Rage", "Cost" : 3, "unlocked" : false}
var rager = {"name" : "", "Cost" : 6, "unlocked" : false}
var ragest = {"name" : "Berserk", "Cost" : 10, "unlocked" : false}


var magic = [Fire, Thunder, Water, Earth, Firer, Thunderer, Waterer, Earther, Firest, Thunderest, Waterest, 
	Earthest]
