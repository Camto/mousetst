extends Button

func _on_Resume_Button_pressed():
	get_tree().get_nodes_in_group("Pauser")[0].resume()