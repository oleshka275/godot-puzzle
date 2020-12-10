extends Node2D


onready var water_anim = $Animation

func _ready():
	water_anim.play("Default")

