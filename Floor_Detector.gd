extends Area2D

func _on_Floor_Detector_body_entered(body):
	if body.is_in_group("Player"):
		body.on_floor = true

func _on_Floor_Detector_body_exited(body):
	if body.is_in_group("Player"):
		body.on_floor = false