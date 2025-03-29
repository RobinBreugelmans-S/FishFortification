extends Node2D

var dmg: int
var vel: Vector2

func set_values(damage: int, velocity: Vector2):
	dmg = damage
	vel = velocity

func on_touch(other: Area2D):
	var enemy = other.get_parent()
	if enemy.is_in_group("enemy"):
		enemy.DoDamage(dmg)
		queue_free()

func _physics_process(delta: float):
	global_position += vel
	#TODO: add if outside of level bounds, queue_free()
