extends KinematicBody2D
class_name Entity

onready var sprite = $AnimatedSprite

var class_: int = Classes.Swordsman
var health: int = 100
var max_speed: int = 200
var acceleration: int = 800

var lin_speed = Vector2()

func _ready():
	pass

func attack():
	var attack = Classes.attacks[class_].instance()
	attack.launch(get_local_mouse_position())
	add_child(attack)

func take_damage(amount : int):
	health -= amount

func on_damage_taken():
	pass

func _process(delta):
	pass
