extends Node2D

func _physics_process(delta: float):
	position.y -= .5
	modulate.a -= .025
	
	if modulate.a <= 0:
		queue_free()

func set_text_value(value: String):
	$Label.push_color(Color(.8, 0, 0, 1))
	$Label.fit_content
	$Label.add_text(value)
