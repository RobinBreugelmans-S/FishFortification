extends Tower

var projectile = preload("res://ink_splat.tscn")
var projectile_spd = 8

var stats = [2, 120, 320, 40]

func _init():
	dmg = 2
	atk_delay = 120
	range = 320
	price = 40
	texture = load("res://assets/squid.png")

func attack():
	for enemy in enemies_in_range:
		if(!enemy.get_child(0).Slowed):
			var new_projectile: Sprite2D = projectile.instantiate()
			new_projectile.set_values(dmg, get_first_enemy_dir() * projectile_spd)
			self.add_child(new_projectile)
			return
