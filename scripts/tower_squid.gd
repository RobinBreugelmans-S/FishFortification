extends Tower

var projectile = preload("res://ink_splat.tscn")
var projectile_spd = 8

func _init():
	dmg = 6
	atk_delay = 50
	texture = load("res://assets/icon.svg")

func attack():
	if there_are_enemies():
		var new_projectile: Sprite2D = projectile.instantiate()
		new_projectile.set_values(dmg, get_first_enemy().global_position)
		self.add_child(new_projectile)
