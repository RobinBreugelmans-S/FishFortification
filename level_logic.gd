extends Node

var counter = 0
var enemy: Resource

func _ready():
	enemy = preload("res://enemy.tscn")

func _physics_process(delta: float):
	if (counter % 80 == 0):
		create_enemy()
	
	counter += 1

#TODO: add parameters for which enemy
func create_enemy() -> void:
	var new_path_follow = $Path/PathFollow.duplicate()
	new_path_follow.add_child(enemy.instantiate())
	$Path.add_child(new_path_follow)
