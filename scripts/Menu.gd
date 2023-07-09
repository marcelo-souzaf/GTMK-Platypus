extends Control

func _on_PlayButton_pressed():
	get_tree().change_scene("res://scenes/Game.tscn")

func _on_AboutButton_pressed():
	# Open link to GitHub
	OS.shell_open("https://github.com/marcelo-souzaf/Intrinity")

func _on_button_hovered():
	Music.hover()

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			Music.click()
