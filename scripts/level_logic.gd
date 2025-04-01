extends Node

var stats: RichTextLabel
var base_hp: int = 127

var wave = 1
var has_wave_started = true
var counter = 0
var enemies_to_spawn = fib(wave)
var enemy: Resource = preload("res://enemy.tscn")
var tower: Resource = preload("res://tower.tscn")
var shrimp_script: Script = load("res://scripts/tower_shrimp.gd")
var squid_script: Script = load("res://scripts/tower_squid.gd")
var bought_tower: Script
var enemies_spawned = 0

func _ready():
	stats = $UI/Stats

func _physics_process(delta: float):
	if (counter % 80 == 0 and enemies_to_spawn > 0):
		enemies_to_spawn -= 1;
		spawn_enemy()
		has_wave_started = true
	
	if len(get_tree().get_nodes_in_group("enemy")) == 0 and has_wave_started:
		wave += 1
		enemies_to_spawn = fib(wave)
		has_wave_started = false
		print(wave, " ", enemies_to_spawn)

	
	#stats
	stats.text = ""
	stats.push_color(Color(0, 0, 0, 1))
	stats.append_text("baseHp: %s\n" % base_hp)
	
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
		place_tower(get_viewport().get_mouse_position(), bought_tower)
		#TODO: make it possible to place different towers

func place_tower(pos: Vector2, tower_script: Script):
	var new_tower: Sprite2D =  tower.instantiate()
	new_tower.position = pos
	new_tower.set_script(tower_script)
	add_child(new_tower)

func fib(num):
	var a = 0
	var b = 1
	var temp = 0
	
	for i in range(num):
		temp = a
		a = b
		b = temp + b
	
	return b
