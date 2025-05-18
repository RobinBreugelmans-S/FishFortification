extends Button

func _ready():
	pressed.connect(_button_pressed)

func _button_pressed() -> void:
	$/root/Level.started = true
	$"..".queue_free()
