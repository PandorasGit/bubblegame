extends Node2D

@export var next_level : String
var score := 0
var goal_score : int

func _ready() -> void:
	goal_score = $Blocks.get_child_count()
	$Control/Button.connect("pressed",_reset_button_pressed)
	$Launcher.connect("shots_changed",_on_shots_left_changed)
	$Control/ShotsLeft.text = "Shots Left: "+ str($Launcher.shots)

func _on_area_2d_block_entered() -> void:
	score += 1
	$Control/Label.text = "Score:" + str(score)
	if score >= goal_score:
		transition()

func transition():
	get_tree().call_deferred("change_scene_to_file",next_level)


func _reset_button_pressed() -> void:
	get_tree().call_deferred("reload_current_scene")

func _on_shots_left_changed(number_of_shots):
	$Control/ShotsLeft.text = "Shots Left: " + str(number_of_shots)
