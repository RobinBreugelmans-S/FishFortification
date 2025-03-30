class_name Tower
extends Sprite2D

var dmg
var atk_delay
var range: float

var all_enemies: Array[Node]
var enemies_in_range: Array[Node] = []

var counter = 0
var atk_countdown = 0

func attack():
	pass

func _physics_process(delta: float):
	all_enemies = get_node("../Map/Path").get_children()
	
	enemies_in_range = []
	for enemy in all_enemies:
		if (enemy.global_position - global_position).length() <= range:
			enemies_in_range.append(enemy)
	
	if atk_countdown == 0 && there_are_enemies():
		atk_countdown = atk_delay
		attack()
	
	counter += 1
	atk_countdown = max(atk_countdown - 1, 0)

func get_first_enemy() -> Node:
	return enemies_in_range[0]

func get_first_enemy_dir() -> Vector2:
	return (get_first_enemy().global_position - self.position).normalized()

func there_are_enemies() -> bool:
	return len(enemies_in_range) > 0
