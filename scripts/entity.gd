extends KinematicBody2D
class_name Entity

onready var sprite = $AnimatedSprite

var class_: int = Classes.Mage
var health: int = 100
var max_speed: int = 300
var acceleration: int = 800

var lin_speed = Vector2()

func _ready():
	pass

func attack(by_player : bool = false):
	var attack = Classes.attacks[class_].instance()
	attack.by_player = by_player
	add_child(attack)

func take_damage(amount : int = 100):
	health -= amount
	if health <= 0:
		queue_free()

func on_damage_taken():
	pass

func _process(delta):
	pass
