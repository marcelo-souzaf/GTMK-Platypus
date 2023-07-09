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
	Game.mode = Game.Mode.Playing
	Game.kills_to_level_up = 5
	Game.total_kill_count = 0
	Game.player_level = 1
	Game.enemy_count = 0
	Game.score = 0
	get_tree().reload_current_scene()
	get_tree().paused = false
