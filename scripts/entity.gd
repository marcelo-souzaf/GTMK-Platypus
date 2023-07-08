extends KinematicBody2D
class_name Entity

onready var sprite = $AnimatedSprite

var class_: int = Classes.Archer
var health: int = 100
var max_speed: int = 300
var acceleration: int = 800
var is_player: bool = false

var lin_speed = Vector2.ZERO

func _ready():
	pass

func attack(direction: Vector2):
	var attack = Classes.attacks[class_].instance()
	attack.init(direction, self.is_player)
	add_child(attack)

func take_damage(amount: int, attacker_class: int):
	# TODO: update the lifebar

	var weakness: int = Classes.weakness[class_]
	# Doubles the damage if the entity is weak against the attacker's class
	health -= amount * (1 + int(weakness == attacker_class or weakness == Classes.All))
