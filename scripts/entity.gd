extends KinematicBody2D
class_name Entity

onready var sprite = $AnimatedSprite
onready var cooldown = $CooldownTimer
export var class_: int

var health: int
var max_speed: int
var acceleration: int
var is_player := false

var lin_speed := Vector2.ZERO

func _ready():
	update_appearance()

func attack(direction: Vector2):
	var attack = Classes.attacks[class_].instance()
	attack.init(direction, self.is_player)
	add_child(attack)

	cooldown.start(Classes.attack_cooldown[class_])

func take_damage(amount: int, attacker_class: int):
	# TODO: update the lifebar

	var weakness: int = Classes.weakness[class_]
	# Doubles the damage if the entity is weak against the attacker's class
	health -= amount * (1 + int(weakness == attacker_class or weakness == Classes.All))

func update_stats():
	self.health = Classes.health[class_]
	self.max_speed = Classes.max_speed[class_]
	self.acceleration = Classes.acceleration[class_]

func update_appearance():
	self.sprite.frames = Classes.animations[class_]
