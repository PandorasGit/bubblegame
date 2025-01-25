extends RigidBody2D

var can_grow := true

func grow():
	if $CollisionShape2D.scale <= Vector2(2,2):
		$CollisionShape2D.scale += Vector2(0.1,0.1)
		mass += 0.05
	else:
		can_grow = false
