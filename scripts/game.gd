extends Node

const teleport_particles = preload("res://scenes/TeleportParticles.tscn")
const sprites = []
const TRANSITION_TIME = 0.25

var time_left := TRANSITION_TIME
var score := 0
var player
var game

func _ready():
	self.pause_mode = Node.PAUSE_MODE_PROCESS
	set_physics_process(false)

func _physics_process(delta):
	time_left -= delta
	if time_left <= 0:
		set_physics_process(false)
		game.get_tree().paused = false
		time_left = TRANSITION_TIME
	Engine.set_time_scale(time_left / TRANSITION_TIME)

func spawn_particles(position: Vector2):
	var particles = teleport_particles.instance()
	particles.position = position
	game.add_child(particles)

func transform_player_into(enemy):
	game.get_tree().paused = true

	player.class_ = enemy.class_
	player.sprite.frames = sprites[player.class_]
	# player.sprite.play("idle")
	spawn_particles(player.position)
	player.position = enemy.position

	enemy.queue_free()
	set_physics_process(true)
