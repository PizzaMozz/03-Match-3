extends Node

var score = 0
var time = 0
var goal = 0

var level = 1

var level_times = {
	1:60,
	2:30,
	3:15,
	4:10,
	5:5,
	6:null
}

var level_scores = {
	1:500,
	2:350,
	3:200,
	4:100,
	5:75,
	6:null
}

var next_level = {
	1:"res://Game2.tscn",
	2:"res://Game3.tscn",
	3:"res://Game4.tscn",
	4:"res://Game5.tscn",
	5:"res://GameWin.tscn",
	6:null
}

signal score_changed
signal time_changed
signal goal_changed

var scores = {
	0:0,
	1:0,
	2:0,
	3:10,
	4:20,
	5:50,
	6:100,
	7:200,
	8:300,
	9:1000
}

func _ready():
	update_lev()
	
func update_lev():
	score = 0
	change_goal()
	time = level_times[level]

func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

func change_score(s):
	var camera = get_node_or_null("/root/Game/Camera")
	if camera:
		camera.add_trauma(0.7)
	score += s
	if score >= level_scores[level]:
		get_tree().change_scene(next_level[level])
		level += 1
		update_lev()
	emit_signal("score_changed")
	
func change_time():
	time -= 1
	if time < 0:
		get_tree().change_scene("res://GameOver.tscn")
	emit_signal("time_changed")

func change_goal():
	goal = level_scores[level]
	emit_signal("goal_changed")
