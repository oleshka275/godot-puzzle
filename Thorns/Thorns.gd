extends Node2D

const wait_time = 2
var damage = false
var timer

func _ready():
	timer = Timer.new()
	timer.set_wait_time(wait_time)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	
func on_timeout_complete():
	get_tree().reload_current_scene()

func _on_Hurtbox_area_entered(area):
	timer.start()
	damage = true
