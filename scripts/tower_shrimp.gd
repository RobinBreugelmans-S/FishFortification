extends Tower

var projectile = preload("res://projectile.tscn")
var projectile_spd = 8

func _init():
	dmg = 6
	atk_delay = 50
	range = 390
	texture = load("res://assets/Shrimp.png")

func attack():
	var new_projectile: Sprite2D = projectile.instantiate()
	new_projectile.set_values(dmg, get_first_enemy_dir() * projectile_spd)
	self.add_child(new_projectile)
