extends Node

const teleport_particles = preload("res://scenes/TeleportParticles.tscn")
const sprites = []
const TRANSITION_TIME = 1.0

var time_left := TRANSITION_TIME
var score := 0
var player
var game
var attacks_container
var message_sys

func _ready():
	set_physics_process(false)
	self.pause_mode = Node.PAUSE_MODE_PROCESS

func _physics_process(delta):
	time_left -= delta
	if time_left <= 0:
		set_physics_process(false)
		time_left = TRANSITION_TIME
		# If the game is transitioning the player into an enemy, resume the game
		if game.get_tree().paused:
			game.get_tree().paused = false
		else:
			game.get_tree().paused = true
			# TODO: show game over screen
	Engine.set_time_scale(time_left / TRANSITION_TIME)

func spawn_particles(position: Vector2):
	var particles = teleport_particles.instance()
	particles.position = position
	game.add_child(particles)

func transform_player_into(enemy):
	enemy.dead = true
	Music.play_music_for_class(enemy.class_)
	game.get_tree().paused = true

	player.class_ = enemy.class_
	player.update_appearance()
	player.update_stats()
	player.healthbar.init(player)
	spawn_particles(player.position)
	player.position = enemy.position
	player.lin_speed = enemy.lin_speed

	enemy.queue_free()
	game.get_tree().paused = false

func game_over():
	set_physics_process(true)
