extends Node2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ESCAPE:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			get_tree().paused = true
			get_tree().get_nodes_in_group("Pause_Menu")[0].pause()

func resume():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	get_tree().get_nodes_in_group("Pause_Menu")[0].resume()