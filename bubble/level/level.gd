extends Node2D

@export var next_level : String
var score := 0
var goal_score : int
@onready var camera = $Camera2D

func _ready() -> void:
	goal_score = $Blocks.get_child_count()
	$CanvasLayer/Control/Button.connect("pressed",_reset_button_pressed)
	$Launcher.connect("shots_changed",_on_shots_left_changed)
	$CanvasLayer/Control/ShotsLeft.text = "Shots Left: "+ str($Launcher.shots)
	$Launcher.launched.connect(Callable(camera,"_on_launched"))
	$CanvasLayer/Control/Button2.connect("pressed", _on_next_pressed)
	$CanvasLayer/Control/Button3.connect("pressed", _on_menu_pressed)

func _on_area_2d_block_entered() -> void:
	score += 1
	$CanvasLayer/Control/Label.text = "Score:" + str(score)
	if score >= goal_score:
		transition()

func transition():
	$CanvasLayer/Control/Button2.visible = true


func _reset_button_pressed() -> void:
	
	get_tree().call_deferred("reload_current_scene")

func _on_shots_left_changed(number_of_shots):
	$CanvasLayer/Control/ShotsLeft.text = "Shots Left: " + str(number_of_shots)

func _on_next_pressed():
	get_tree().call_deferred("change_scene_to_file",next_level)

func _on_menu_pressed():
	get_tree().call_deferred("change_scene_to_file","res://start/startscreen.tscn")
