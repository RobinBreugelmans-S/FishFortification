extends Area2D

var dmg: int

func _ready() -> void:
	connect("area_entered", on_area_enter)

func on_area_enter(other: Area2D):
	get_parent().on_touch(other)

func set_damage(dmg: int):
	self.dmg = dmg
