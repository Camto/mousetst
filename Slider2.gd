extends HSlider

onready var player = get_tree().get_nodes_in_group("Player")[0]

func _on_Slider_value_changed(num):
	$"../Show".text = str(num)
	player.jump_sensitivity = num