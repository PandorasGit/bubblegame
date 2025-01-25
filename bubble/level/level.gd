extends Node2D

var score := 0

func _on_area_2d_block_entered() -> void:
	score += 1
	$Label.text = "Score:" + str(score)
