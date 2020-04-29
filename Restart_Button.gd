extends Button

func _on_Restart_Button_pressed():
	get_tree().get_nodes_in_group("Player")[0].dead = true
	get_tree().get_nodes_in_group("Pauser")[0].resume()