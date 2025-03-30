class_name Tower
extends Sprite2D

const Enemy: CSharpScript = preload("res://scripts/Enemy.cs")

var dmg
var atk_delay
var range: float

var all_enemies: Array[Node] #Array[Enemy]
var enemies_in_range: Array[Node] = []

var counter = 0

func attack():
	pass

func _physics_process(delta: float):
	all_enemies = get_node("../Map/Path").get_children() #convert to Enemy
	
	enemies_in_range = []
	for enemy in all_enemies:
		if (enemy.global_position - global_position).length() <= range:
			enemies_in_range.append(enemy)
	
	if counter % atk_delay == 0 && there_are_enemies():
		attack()
	
	counter += 1;

func get_first_enemy() -> Node:
	return enemies_in_range[0]

func get_first_enemy_dir() -> Vector2:
	return (get_first_enemy().global_position - self.position).normalized()

func there_are_enemies() -> bool:
	return len(enemies_in_range) > 0
