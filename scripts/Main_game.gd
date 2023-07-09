extends Node2D

func _ready():
	Game.attacks_container = $Attacks
	Game.message_sys = $HUD/LevelUp/MessageSys
	Game.upgrade_sys = $HUD/LevelUp/UpgradeSys
	Game.message_sys.show_message("Use WASD/Arrows to move.")
	Game.main = self

func call_wave():
	Game.message_sys.show_message("Wave " + str(Game.wave) + "!")

	for spawn in $Spawners.get_children():
		spawn.call_wave(Game.wave)

func retry():
	print("Click")
	get_tree().reload_current_scene()
