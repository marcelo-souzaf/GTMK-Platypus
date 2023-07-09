extends TextureButton

export var upgrade = 0

func _on_Panel_pressed():
	Game.upgrade_selected(upgrade)
