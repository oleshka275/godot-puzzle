extends Node2D

var get_coin = false

func _on_Hurtbox_area_entered(area):
	get_coin = true
	
