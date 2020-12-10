extends Control

var win_score = 0 setget set_win_score
var is_dead = false

onready var win_panel = $WinPanel
onready var win_score_label = $WinPanel/ScoreLabel
onready var win_label = $WinPanel/WinLabel


func _ready():
	win_panel.hide()

func set_win_score(score):
	win_score = score
	win_score_label.text = "Score: " +str(win_score)
func _process(delta):
	if is_dead == true:
		win_label.text = "You lose!"
