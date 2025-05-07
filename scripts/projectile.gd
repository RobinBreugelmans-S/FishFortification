class_name Projectile
extends Node2D

var dmg: int
var vel: Vector2

func set_values(damage: int, velocity: Vector2):
	dmg = damage
	vel = velocity

func on_touch(other: Area2D):
	var enemy = other.get_parent()
	if enemy.is_in_group("enemy") and enemy.Hp > 0:
		enemy.DoDamage(dmg)
		queue_free()

func _physics_process(delta: float):
	global_position += vel
	if global_position.x < -10 or global_position.x > 1930 or global_position.y < -10 or global_position.y > 1090:
		queue_free()
