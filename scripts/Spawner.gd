extends Position2D
class_name Spawner

onready var timer = $CooldownTimer
onready var enemies_container = get_node("../../Enemies")

export var radius := 400
export var min_player_distance := 1000
export var class_names : PoolStringArray = ["Swordsman"]
var classes : Array = []

export var num_of_spawns := 1
export var max_enemies_alive := 5
var current_enemies_alive := 0

func _ready():
	for class_name_ in class_names:
		classes.append(Classes.name_to_num[class_name_])

	timer.wait_time = rand_range(3.0, 7.5)
	timer.start()

func _on_CooldownTimer_timeout():
	# if it's close enough to the player
	if Game.player.position.distance_to(position) > min_player_distance:
		return

	for _i in range(num_of_spawns):
		if current_enemies_alive >= max_enemies_alive:
			return

		var enemy_instance = Game.enemy.instance()
		enemy_instance.init(
			self,
			classes[randi() % classes.size()],
			Vector2(rand_range(-radius, radius), rand_range(-radius, radius)) + self.position
		)

		enemies_container.add_child(enemy_instance)
		current_enemies_alive += 1
		Game.enemy_count += 1
