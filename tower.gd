extends Sprite2D

var dmg = 6
var atk_delay = 60
var projectile = preload("res://projectile.tscn")
var projectile_spd = 8

var counter = 0

func attack():
	if there_are_enemies():
		var new_projectile: Sprite2D = projectile.instantiate()
		new_projectile.set_values(dmg, get_first_enemy_dir() * projectile_spd)
		self.add_child(new_projectile)

func _physics_process(delta: float):
	if counter % atk_delay == 0:
		attack()
	
	counter += 1;

func get_first_enemy_dir():
	var all_enemies: Array[Node] = get_node("../Map/Path").get_children()
	return (all_enemies[0].global_position - self.position).normalized()

func there_are_enemies() -> bool:
	return len(get_node("../Map/Path").get_children()) > 0
