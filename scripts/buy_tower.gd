extends Button

@export
var tower_to_buy: Script
@export
var price: int
var level_logic
@export
var texture_path: String

func _ready():
	level_logic = $"/root/Level"
	self.pressed.connect(_button_pressed)
	text += "\n" + str(price) 

func _button_pressed():
	if(level_logic.money >= price):
		level_logic.add_money(-price)
		level_logic.bought_tower = tower_to_buy
		level_logic.bought_tower_texture_path = texture_path
