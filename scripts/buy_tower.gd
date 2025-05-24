extends Button

@export
var tower_to_buy: GDScript
var _tower_to_buy: Sprite2D
var value_effect: Resource = preload("res://value_effect.tscn")
#@export
#var price: int
var level_logic
#@export
#var texture_path: String

func _ready():
	_tower_to_buy = tower_to_buy.new()
	level_logic = $"/root/Level"
	self.pressed.connect(_button_pressed)
	text += "\n\n\n" + str(_tower_to_buy.stats[3]) + "¢"
	$TowerSprite.texture = _tower_to_buy.texture

func _button_pressed():
	if(level_logic.money >= _tower_to_buy.stats[3]):
		level_logic.add_money(-_tower_to_buy.stats[3])
		level_logic.bought_tower = tower_to_buy
		level_logic.bought_tower_texture = _tower_to_buy.texture
	else:
		level_logic.display_not_enough()
#_path
