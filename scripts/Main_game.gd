extends Node2D

onready var message_sys = $HUD/Control/MessageSys
onready var upgrade_sys = $HUD/Control/UpgradeSys

func _ready():
	Game.attacks_container = $Attacks
	Game.message_sys = message_sys
	Game.upgrade_sys = upgrade_sys
	message_sys.show_message("Use WASD/Arrows to move.")
