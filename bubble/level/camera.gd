extends Camera2D

var target : RigidBody2D
var track = true
var default_position = global_position
var target_last_position

func _on_launched(bubble):
	track = true
	target = bubble
	
func _physics_process(delta: float) -> void:
	if target:
		if position.y >= 800 or target.sleeping:
			track = false
	
	if track and target:
		lerp
		set_position(lerp(global_position,target.global_position,0.1))
	else:
		set_position(lerp(global_position,default_position,0.1))
