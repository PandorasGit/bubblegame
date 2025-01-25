extends CharacterBody2D

var has_bubble := false
@onready var bubble_scene := load("res://bubble/bubble.tscn")
var bubble
@export var shots = 3

signal shots_changed(number_of_shots)



func _process(delta: float) -> void:
	var dir = Input.get_axis("up", "down")
	rotation += dir * delta
	if rotation <= deg_to_rad(-90):
		rotation = deg_to_rad(-90)
	elif rotation >= deg_to_rad(0):
		rotation = deg_to_rad(0)
	
	if Input.is_action_just_pressed("blow"):
		if has_bubble:
			$Bubble.grow()
		elif shots > 0:
			shots -= 1
			bubble = bubble_scene.instantiate()
			bubble.position = $Marker2D.position
			add_child(bubble)
			has_bubble = true
			shots_changed.emit(shots)

	
	if Input.is_action_just_pressed("fire") and has_bubble:

		has_bubble = false
		bubble.freeze = false
		bubble.apply_impulse(Vector2(100* cos(rotation),100*sin(rotation)), $Bubble.position)
		bubble.reparent(get_parent())
