extends Area2D

func _on_Death_Zone_body_entered(body):
	if body.is_in_group("Player"):
		body.dead = true