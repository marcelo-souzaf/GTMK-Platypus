extends Node

enum Mode {
	Playing,
	Paused,
	LevelingUp,
	GameOver
}
const teleport_particles = preload("res://scenes/TeleportParticles.tscn")
const blinking_shader = preload("res://resources/entity_damaged.tres")
const health_bar_scene = preload("res://scenes/HealthBar.tscn")
const enemy = preload("res://Scenes/Enemy.tscn")
# Measured in physics_process calls. These happen in 60 Hz
const TRANSITION_DURATION = 20
const DECREASE_INTERVAL = 10
const DECREASE_FRACTION = 0.5

export var kills_to_level_up := 5

var frames_left := TRANSITION_DURATION
var mode: int = Mode.Playing
var total_kill_count := 0
var player_level := 1
var enemy_count := 0
var score := 0
var player: Player
var game: Node2D
var ui: CanvasLayer

func init(player_node: Player, game_node: Node2D):
	game = game_node
	player = player_node
	ui = game.get_node("UI")
	ui.init(health_bar_scene.instance())

func _ready():
	set_physics_process(false)
	self.pause_mode = Node.PAUSE_MODE_PROCESS

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") and mode == Mode.Playing:
		get_tree().paused = not get_tree().paused

func _physics_process(_delta):
	if frames_left <= 0:
		set_physics_process(false)
		Engine.time_scale = 1.0
		if mode >= Mode.LevelingUp:
			get_tree().paused = true
			if mode == Mode.GameOver:
				game.get_node("UI/GameOver").show()
		return
	if frames_left % DECREASE_INTERVAL == 0:
		Engine.time_scale *= DECREASE_FRACTION
	frames_left -= 1

func spawn_particles(position: Vector2):
	var particles = teleport_particles.instance()
	particles.position = position
	game.add_child(particles)

func transform_player_into(enemy):
	frames_left = TRANSITION_DURATION

	score += 1
	enemy_count -= 1
	total_kill_count += 1
	if score >= kills_to_level_up:
		score = 0
		player_level += 1
		mode = Mode.LevelingUp
		game.get_node("UI/LevelUp").show()
	
	set_physics_process(true)
	player.class_ = enemy.class_
	player.update_appearance()
	player.update_stats()

	player.health_bar.init(player)
	spawn_particles(player.position)
	player.position = enemy.position
	player.lin_speed = enemy.lin_speed
	player.become_invulnerable()

	enemy.queue_free()

func game_over():
	frames_left = TRANSITION_DURATION * 3
	mode = Mode.GameOver
	set_physics_process(true)
