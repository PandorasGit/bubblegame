extends Camera2D

var target : RigidBody2D
var track = true
var default_position = global_position

func _on_launched(bubble):
	track = true
	target = bubble
	
func _physics_process(delta: float) -> void:
	if position.y >= 800:
		track = false
	
	if track and target:
		lerp
		set_position(lerp(global_position,target.global_position,0.1))
	else:
		set_position(lerp(global_position,default_position,0.1))
