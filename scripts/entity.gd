extends KinematicBody2D
class_name Entity

onready var sprite = $AnimatedSprite
onready var cooldown = $CooldownTimer
onready var healthbar_scene = preload("res://scenes/HealthBar.tscn")
var healthbar = null
export var class_: int

var health: int
var max_health: int
var max_speed: int
var acceleration: int
var is_player := false

var lin_speed := Vector2.ZERO

func _ready():
	update_appearance()
	create_healthbar()

func attack(direction: Vector2):
	var attack = Classes.attacks[class_].instance()
	attack.position = self.position
	attack.init(direction, self.is_player)
	Game.attacks_container.add_child(attack)

	cooldown.start(Classes.attack_cooldown[class_])

func take_damage(amount: int, attacker_class: int):
	var weakness: int = Classes.weakness[class_]
	# Doubles the damage if the entity is weak against the attacker's class
	health -= amount * (1 + int(weakness == attacker_class or weakness == Classes.All))

	# update the lifebar
	healthbar.update_bar(self)

func update_stats():
	# self.health = (self.health / self.max_health) * Classes.health[class_]
	self.health = Classes.health[class_]
	self.max_health = Classes.health[class_]
	self.max_speed = Classes.max_speed[class_]
	self.acceleration = Classes.acceleration[class_]
	if self.is_player:
		self.max_speed += 150

func update_appearance():
	self.sprite.frames = Classes.animations[class_]

func create_healthbar():
	var healthbar_inst = healthbar_scene.instance()
	add_child(healthbar_inst)
	healthbar_inst.init(self)
	self.healthbar = healthbar_inst
