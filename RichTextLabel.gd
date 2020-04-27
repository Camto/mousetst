extends RichTextLabel
	
func _input(event):
	if event is InputEventMouseMotion:
		text = str(event.relative)