extends Node2D

@export var next_level : String
var score := 0
var goal_score : int

func _ready() -> void:
	goal_score = $Blocks.get_child_count()

func _on_area_2d_block_entered() -> void:
	score += 1
	$Label.text = "Score:" + str(score)
	if score >= goal_score:
		transition()

func transition():
	get_tree().call_deferred("change_scene_to_file",next_level)
