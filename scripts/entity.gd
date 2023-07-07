extends KinematicBody2D
class_name Entity

onready var sprite = $Sprite

var class_: int = Classes.Swordsman
var health: int = 100
var max_speed: int = 200
var acceleration: int = 800

var lin_speed = Vector2()

func _ready():
	pass

func attack():
	pass

func on_damage_taken():
	pass

func _process(delta):
	pass
