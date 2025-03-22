class_name LevelLogic extends Node

var stats: RichTextLabel
var base_hp: int = 127

var counter = 0
var enemy: Resource = preload("res://enemy.tscn")

func _ready():
	stats = $UI/Stats

func _physics_process(delta: float):
	if (counter % 80 == 0):
		spawn_enemy()
	
	#stats
	stats.text = ""
	stats.push_color(Color(0, 0, 0, 1))
	stats.append_text("baseHp: %s" % base_hp)
	
	counter += 1

#TODO: add parameters for which enemy
func spawn_enemy():
	var new_path_follow = $Map/Path/PathFollow.duplicate()
	new_path_follow.add_child(enemy.instantiate())
	$Map/Path.add_child(new_path_follow)

func damage_base(dmg: int):
	base_hp -= dmg
	if (base_hp <= 0):
		base_hp = 0
		#TODO: handle death
		print_debug(base_hp)
	

#INPUT
func _input(event):
	if event.is_action_pressed("set_tower"):
		print_debug("tower spawned at: %s" %  get_viewport().get_mouse_position())
