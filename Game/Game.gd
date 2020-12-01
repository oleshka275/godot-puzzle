extends Node2D

# var for tscenes
onready var player = $Player
onready var finish = $Finish
onready var throns = $Thorns

#timer
var timer
var level_reload_delay = 3

func _process(delta):
	if throns.damage == true:
		player.gameLoop = false
		
	if finish.restart == true:
		player.gameLoop = false
	
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()
	
# processing area actions
func _on_Finish_body_entered(body):
	if body is KinematicBody2D:
		get_tree().reload_current_scene()
