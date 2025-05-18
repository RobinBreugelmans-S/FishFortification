extends Button

var isPressed = false

func _ready():
	pressed.connect(_button_pressed)

func _button_pressed():
	if !isPressed:
		isPressed = true
		$"../PlayerPreview".queue_free()
		$"../Text".text = ""
		$"../Text".push_color(Color(0,0,0))
		$"../Text".append_text("\n\n\n\nOn the top left you can see your stats.
		\nIf you click on a fish or \"tower\" in the shop on the left, you will buy a tower if you have enough money.
		You can then click on a tower to buy it, and then place it somewhere on the map.\n
		If you click on the play button in the bottom left it will start the wave. Once the wave has started, trash will come over the track, towards your base (the castle), and will do damage to it, it is your mission to stop them.")
		$"../Continue".text = "Play"
	else:
		$/root/Level.started = true
		$"..".queue_free()
