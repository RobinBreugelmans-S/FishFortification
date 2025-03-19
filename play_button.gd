extends Button

func _ready():
	self.pressed.connect(_button_pressed)

func _button_pressed():
	print("was pressed")
	#global.
	#get_tree().change_scene("res://level_select.tscn")
