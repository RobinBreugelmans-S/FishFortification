extends Node2D

func _physics_process(delta: float):
	position.y -= .5
	modulate.a -= .025
	
	if modulate.a <= 0:
		queue_free()

func set_value(value: int, end: String):
	#z_index = -80
	if value < 0:
		$Label.push_color(Color(.8, 0, 0, 1))
	else:
		$Label.push_color(Color(0, .8, 0, 1))
		$Label.append_text("+")
	$Label.append_text("%s" % value)
	$Label.append_text(end)
