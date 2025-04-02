extends Button

@export
var tower_to_buy: Script
@export
var price: int
var level_logic

func _ready():
	level_logic = $"/root/Level"
	self.pressed.connect(_button_pressed)

func _button_pressed():
	if(level_logic.money >= price):
		level_logic.money -= price
		level_logic.bought_tower = tower_to_buy
