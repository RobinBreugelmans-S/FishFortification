extends Button

@export
var tower_to_buy: Script

func _ready():
	self.pressed.connect(_button_pressed)

func _button_pressed():
	print($"/root/Level")
	$"/root/Level".bought_tower = tower_to_buy
