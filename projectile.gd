extends Node2D

var vel: Vector2

func set_values(damage: int, velocity: Vector2):
	get_child(0).set_damage(damage)
	vel = velocity;

func _physics_process(delta: float):
	#TODO: add doing damage
	position += vel;
