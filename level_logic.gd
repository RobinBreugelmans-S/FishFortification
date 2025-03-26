extends Node

var stats: RichTextLabel
var base_hp: int = 127

var wave = 1
var counter = 0
var enemy: Resource = preload("res://enemy.tscn")
var tower: Resource = preload("res://tower.tscn")

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
	$Map/Path.add_child(enemy.instantiate())

func damage_base(dmg: int):
	base_hp -= dmg
	if (base_hp <= 0):
		base_hp = 0
		#TODO: handle death

#INPUT
func _input(event):
	if event.is_action_pressed("set_tower"):
		place_tower(get_viewport().get_mouse_position())

func place_tower(pos: Vector2):
	var new_tower: Sprite2D =  tower.instantiate()
	new_tower.position = pos
	
	add_child(new_tower)
