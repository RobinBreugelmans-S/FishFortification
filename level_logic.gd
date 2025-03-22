extends Node

var counter = 0
var path_follow: PathFollow2D
var enemy: Resource

func _ready():
	path_follow = $Path/PathFollow
	enemy = preload("res://enemy.tscn")

func _physics_process(delta: float):
	if (counter % 80 == 0):
		var new_path_follow = path_follow.duplicate()
		new_path_follow.add_child(enemy.instantiate())
		$Path.add_child(new_path_follow)
	
	counter += 1
