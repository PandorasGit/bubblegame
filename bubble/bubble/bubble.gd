extends RigidBody2D



func grow():
	if $CollisionShape2D.scale <= Vector2(2,2):
		$CollisionShape2D.scale += Vector2(0.1,0.1)
		mass += 0.05
