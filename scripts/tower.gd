class_name Tower
extends Sprite2D

var dmg
var atk_delay

var all_enemies: Array[Node]

var counter = 0

func attack():
	pass

func _physics_process(delta: float):
	all_enemies = get_node("../Map/Path").get_children()
	if counter % atk_delay == 0:
		attack()
	
	counter += 1;

func get_first_enemy():
	return all_enemies[0]

func get_first_enemy_dir():
	return (get_first_enemy().global_position - self.position).normalized()

func there_are_enemies() -> bool:
	return len(all_enemies) > 0
