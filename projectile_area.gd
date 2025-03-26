extends Area2D

var dmg: int

func _ready() -> void:
	connect("area_entered", on_area_enter)

func on_area_enter(other: Area2D):
	var enemy = other.get_parent()
	if enemy.is_in_group("enemy"):
		enemy.DoDamage(dmg)
		get_parent().queue_free()

func set_damage(dmg: int):
	self.dmg = dmg
