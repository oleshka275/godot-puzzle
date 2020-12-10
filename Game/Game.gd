extends Node2D

# var for tscenes
onready var player = $Player
onready var finish = $Finish
onready var throns = $Thorns
onready var ui = $CanvasLayer/UI
onready var win_control = $CanvasLayer/UI/WinControl/

#timer
var timer
var level_reload_delay = 3

func _process(delta):
	
	#processing for thornes area entered
	for member in get_tree().get_nodes_in_group("thorns"):
		if member.damage == true:
			win_control.is_dead = true
			player.gameLoop = false
			win_control.win_panel.show()
			
	
	#processing for coins area entered
	for member in get_tree().get_nodes_in_group("coins"):
		if member.get_coin == true:
			member.queue_free()
			ui.score += 1
			win_control.win_score += 1
		
	if finish.restart == true:
		win_control.win_panel.show()
		player.gameLoop = false
	
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()
