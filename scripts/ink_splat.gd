extends Node2D

var dmg: int
#pos on track where it will go to
var target_pos: Vector2

var counter = 0

func set_values(damage: int, target_pos: Vector2):
	dmg = damage
	self.target_pos = target_pos

func _physics_process(delta: float):
	#global_position = target_pos
	var lerp_val = min(counter, 32) / 32.  #ADD QUADRADIC FUNC HERE!!
	global_position = lerp(global_position, target_pos, lerp_val)
	counter += 1

func on_touch(other: Area2D):
	var enemy = other.get_parent()
	if enemy.is_in_group("enemy"):
		enemy.DoDamage(dmg)
		#queue_free()
