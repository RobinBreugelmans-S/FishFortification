class_name Tower
extends Sprite2D

var dmg
var atk_delay

var counter = 0

func attack():
	pass
	
func _physics_process(delta: float):
	if counter % atk_delay == 0:
		attack()
	
	counter += 1;

func get_first_enemy_dir():
	var all_enemies: Array[Node] = get_node("../Map/Path").get_children()
	return (all_enemies[0].global_position - self.position).normalized()

func there_are_enemies() -> bool:
	return len(get_node("../Map/Path").get_children()) > 0
