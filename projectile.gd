extends Node2D

var dmg: int
var vel: Vector2

func set_values(damage: int, velocity: Vector2):
	dmg = damage;
	vel = velocity;

func _physics_process(delta: float):
	#TODO: add doing damage
	position += vel;
