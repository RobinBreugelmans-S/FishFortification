extends Node

func _ready():
	self.pressed.connect(_button_pressed)

func _button_pressed():
	pass #TODO
	#if !activated:
	#for towerButton in $"../BuyTowerButtons".get_children():
	#	towerButton.visible = !towerButton.visible
