extends RigidBody2D

var can_grow := true
var goal 
var growing = false

func grow():

	if $CollisionShape2D.scale <= Vector2(2,2) and !growing:
		goal = $CollisionShape2D.scale + Vector2(0.1,0.1)
		mass += 0.05
		growing = true
	else:
		can_grow = false

func _process(delta: float) -> void:
	if goal:
		if growing:
			$CollisionShape2D.scale = lerp($CollisionShape2D.scale,$CollisionShape2D.scale + Vector2(0.1,0.1),0.5)
		if $CollisionShape2D.scale >= goal:
			growing = false
