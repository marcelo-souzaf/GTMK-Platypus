extends Node2D

func _ready():
	Game.attacks_container = $Attacks
	Game.message_sys = $HUD/Control/MessageSys
	Game.upgrade_sys = $HUD/Control/UpgradeSys
	Game.message_sys.show_message("Use WASD/Arrows to move.")
