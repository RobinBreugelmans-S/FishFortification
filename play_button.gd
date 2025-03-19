extends Button

func _ready():
	self.pressed.connect(_button_pressed)

func _button_pressed():
	print("was pressed")
	get_tree().change_scene("res://level_select.tscn")
