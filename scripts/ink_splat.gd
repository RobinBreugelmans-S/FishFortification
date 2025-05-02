extends Projectile

#var dmg: int
#pos on track where it will go to
#var target_pos: Vector2
var enemy: Node2D = null
var used = false

var counter = 0
var whenToRemove = -1

func _physics_process(delta: float):
	global_position += vel
	
	#V use this for other tower (like spike factory)
	#var lerp_val = min(counter, 32) / 32.
	#global_position = lerp(global_position, target_pos, lerp_val)
	
	if enemy:
		global_position = enemy.global_position
	
	if counter == whenToRemove && enemy:
		enemy.Spd *= 2
		enemy.Slowed = false
		queue_free()
	
	
	counter += 1

func on_touch(other: Area2D):
	var touched_enemy = other.get_parent()
	if !used && touched_enemy.is_in_group("enemy") && !touched_enemy.Slowed:
		enemy = touched_enemy
		used = true
		enemy.DoDamage(dmg)
		enemy.Spd /= 2.
		enemy.Slowed = true
		whenToRemove = counter + 260
