extends Node2D

onready var attack_area : Area2D = $AttackArea

const ATTACK_DURATION = 0.1

func _ready():
	$AttackTimer.wait_time = ATTACK_DURATION
	$AttackTimer.start()
	attack(get_global_mouse_position())

func attack(mouse_pos):
	var direction = mouse_pos - position
	rotation = direction.angle()

func _physics_process(delta):
	for body in attack_area.get_overlapping_bodies():
		if body.has_method("take_damage"):
			body.take_damage()

func _on_AttackTimer_timeout():
	queue_free()
