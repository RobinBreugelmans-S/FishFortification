extends Sprite2D

var dmg = 6
var atk_delay = 60
var projectile = preload("res://projectile.tscn")
var projectile_spd = 8

var counter = 0

func attack():
	var new_projectile: Sprite2D = projectile.instantiate()
	new_projectile.SetValues(5, 1, get_first_enemy_direction() * projectile_spd)
	self.add_child(new_projectile)

func _physics_process(delta: float):
	if counter % atk_delay == 0:
		attack()
	
	counter += 1;

func get_first_enemy_direction():
	var all_enemies: Array[Node] = get_node("../Map/Path").get_children()
	return (all_enemies[0].global_position - self.position).normalized()
