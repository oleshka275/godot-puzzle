extends Node2D

var get_coin = false

onready var animation = $AnimationPlayer

func _ready():
	animation.play("Coins")

func _on_Hurtbox_area_entered(area):
	get_coin = true
	
