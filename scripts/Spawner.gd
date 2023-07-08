extends Position2D

onready var timer = $CooldownTimer
onready var enemy = preload("res://Scenes/Enemy.tscn")
onready var enemies_container = get_parent().get_parent().get_node("Enemies")

export var radius := 400
export var min_player_distance := 1000
export var classes_names : PoolStringArray = ["Swordsman"]
var classes : Array = []
export var num_of_spawns := 1

func _ready():
	var classes_numbers = {
		"Swordsman": Classes.Swordsman,
		"Archer": Classes.Archer,
		"Mage": Classes.Mage,
		"Zombie": Classes.Zombie,
	}

	for class_name_ in classes_names:
		classes.append(classes_numbers[class_name_])

	timer.wait_time = rand_range(0.5, 1.5)
	timer.start()

func _on_CooldownTimer_timeout():
	# if it's close enough to the player
	if Game.player.position.distance_to(position) > min_player_distance:
		return

	for _i in range(num_of_spawns):
		var enemy_instance = enemy.instance()
		enemy_instance.position = Vector2(rand_range(-radius, radius), rand_range(-radius, radius)) + position
		enemy_instance.class_ = classes[randi() % classes.size()]
		enemy_instance.update_stats()
		enemies_container.add_child(enemy_instance)
