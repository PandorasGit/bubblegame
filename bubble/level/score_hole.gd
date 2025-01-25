extends Area2D


signal block_entered

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("blocks"):
		block_entered.emit()
