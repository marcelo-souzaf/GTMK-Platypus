extends KinematicBody2D
class_name Entity

onready var sprite = $AnimatedSprite
onready var cooldown = $CooldownTimer
var health_bar = null
export var class_: int

var health: int
var max_health: int
var max_speed: int
var acceleration: int
var is_player := false

var lin_speed := Vector2.ZERO

func _ready():
	update_appearance()
	create_health_bar()

func attack(direction: Vector2):
	cooldown.start(Classes.attack_cooldown[class_])
	var attack = Classes.attacks[class_].instance()
	attack.init(direction, self.is_player)
	add_child(attack)

func take_damage(amount: int, attacker_class: int):
	var weakness: int = Classes.weakness[class_]
	# Doubles the damage if the entity is weak against the attacker's class
	health -= amount * (1 + int(weakness == attacker_class or weakness == Classes.All))

	# update the lifebar
	health_bar.update_bar(self)

func update_stats():
	self.health = Classes.health[class_]
	self.max_health = Classes.health[class_]
	self.max_speed = Classes.max_speed[class_]
	self.acceleration = Classes.acceleration[class_]

func update_appearance():
	self.sprite.frames = Classes.animations[class_]
	# self.sprite.play("idle")

func create_health_bar():
	var health_bar_inst = Game.health_bar_scene.instance()
	add_child(health_bar_inst)
	health_bar_inst.init(self)
	self.health_bar = health_bar_inst

func become_invulnerable(duration: float = 0.4):
	$Invulnerability.start(duration)
	sprite.material = Game.blinking_shader
