extends RigidBody2D

var colors = [Color.ALICE_BLUE,Color.BISQUE, Color.LEMON_CHIFFON, Color.WHEAT,Color.AQUAMARINE]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate = colors.pick_random()
