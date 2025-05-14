extends Tower

var projectile = preload("res://projectile.tscn")
var projectile_spd = 8

var stats = [4, 50, 460, 50]

func _init():
	dmg = 4
	atk_delay = 50
	range = 460
	price = 50
	texture = load("res://assets/Shrimp.png")

func attack():
	var new_projectile: Sprite2D = projectile.instantiate()
	new_projectile.set_values(dmg, get_first_enemy_dir() * projectile_spd)
	self.add_child(new_projectile)
