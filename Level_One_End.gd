extends Area2D

func _on_Level_One_End_body_entered(body):
	if body.is_in_group("Player"):
		body.spawn_point = get_tree().get_nodes_in_group("Level_Two_Spawn")[0].global_position
		body.dead = true