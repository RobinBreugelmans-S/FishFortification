extends Node

var stats: RichTextLabel
var wave_label: RichTextLabel

var max_hp: int = 64
var base_hp: int = max_hp
var money: int = 100

var wave = 1
var enemies_spawned = 0
var has_wave_started = true
var enemies_to_spawn = fib(wave)
var enemy_index = 0

var enemy: Resource = preload("res://enemy.tscn")
var tower: Resource = preload("res://tower.tscn")
var value_effect: Resource = preload("res://value_effect.tscn")
var shrimp_script: Script = load("res://scripts/tower_shrimp.gd")
var squid_script: Script = load("res://scripts/tower_squid.gd")
var bought_tower
var bought_tower_texture_path: String

var fullHpTexture: Resource = load("res://assets/Full_HP_Castle.png")
var damagedTexture: Resource = load("res://assets/Damaged_Castle.png")
var destroyedTexture: Resource = load("res://assets/Destroyed_Castle.png")
var base_anim_timer: int = 0

var enemy_textures: Array[Resource] = [
	load("res://assets/Can.png"),
	load("res://assets/Enemy_Straw.png"),
	load("res://assets/Car_Battery.png"),
]

var enemy_values = [
	[12, 69, 16],
	[5, 194, 8],
	[40, 33, 22],
]

var counter = 0

var move_up = false
var move_left = false
var move_right = false
var move_down = false

func _ready():
	stats = $UI/Stats/Text
	wave_label = $UI/Wave/Text
	wave_label.append_text("Wave: %s" % wave)

func _physics_process(delta: float):
	if (counter % 80 == 0 and enemies_to_spawn > 0):
		enemy_index += 1
		enemies_to_spawn -= 1;
		spawn_enemy(enemy_index)
		has_wave_started = true
	
	# Input
	if move_up:
		$Player.Move(0)
	if move_left:
		$Player.Move(2)
		$Player.flip_h = true
	if move_down:
		$Player.Move(1)
	if move_right:
		$Player.Move(3)
		$Player.flip_h = false
	
	if len(get_tree().get_nodes_in_group("enemy")) == 0 and has_wave_started and enemies_to_spawn == 0:
		wave += 1
		enemies_to_spawn = fib(wave)
		has_wave_started = false
		wave_label.text = "Wave: %s" % wave
	
	#stats
	stats.text = ""
	stats.push_color(Color(0, 0, 0, 1))
	stats.append_text("baseHp: %s\n" % base_hp)
	stats.append_text("money: %s¢\n" % money)
	
	#enemy sprite hover
	if bought_tower:
		if !$UI/TowerPreview.texture:
			$UI/TowerPreview.texture = load(bought_tower_texture_path)
		$UI/TowerPreview.global_position = get_viewport().get_mouse_position()
	else:
		$UI/TowerPreview.texture = null
	
	if(base_anim_timer >= 0):
		$Map/Area2D/Castle.offset.x = sin(base_anim_timer) * 6
		base_anim_timer -= 1
	
	counter += 1

#TODO: add parameters for which enemy
func spawn_enemy(index: int):
	var enemy: Node2D = enemy.instantiate()
	set_enemy_values(enemy.get_child(0), index)
	$Map/Path.add_child(enemy)

func damage_base(dmg: int):
	base_hp -= dmg
	spawn_value_effect(116, 18, -dmg, "")
	play_damage_base_anim()
	if base_hp <= max_hp/2:
		$Map/Area2D/Castle.texture = damagedTexture
	if base_hp <= 0:
		base_hp = 0
		$Map/Area2D/Castle.texture = destroyedTexture
		#TODO: handle death

func play_damage_base_anim():
	base_anim_timer = 12

#INPUT
func _input(event):
	if event.is_action_pressed("set_tower") && bought_tower:
		place_tower(get_viewport().get_mouse_position(), bought_tower)
		bought_tower = null
		#TODO: make it possible to place different towers
	if event.is_action_pressed("up"):
		move_up = true
	if event.is_action_released("up"):
		move_up = false
	if event.is_action_pressed("left"):
		move_left = true
	if event.is_action_released("left"):
		move_left = false
	if event.is_action_pressed("down"):
		move_down = true
	if event.is_action_released("down"):
		move_down = false
	if event.is_action_pressed("right"):
		move_right = true
	if event.is_action_released("right"):
		move_right = false
	
func place_tower(pos: Vector2, tower_script: Script):
	var new_tower: Sprite2D =  tower.instantiate()
	new_tower.position = pos
	new_tower.set_script(tower_script)
	add_child(new_tower)

func fib(num):
	var a = 0
	var b = 1
	var temp = 0
	
	for i in range(num + 5):
		temp = a
		a = b
		b = temp + b
	
	return b

func set_enemy_values(enemy: Sprite2D, index: int) -> void:
	var value_index = index % len(enemy_values)
	enemy.SetValues(enemy_values[value_index])
	enemy.texture = enemy_textures[value_index]

func add_money(amount: int):
	money += amount
	spawn_value_effect(116, 34, amount, "¢")

func spawn_value_effect(x: int, y: int, amount: int, end: String):
	var effect: Node2D = value_effect.instantiate()
	effect.position = Vector2(x, y)
	effect.set_value(amount, end)
	$UI.add_child(effect)
