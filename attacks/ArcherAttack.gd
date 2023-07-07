extends Node2D

onready var arrow = $Arrow

const ARROW_SPEED = 1500

var arrow_dir = Vector2.ZERO

func _ready():
	attack(get_global_mouse_position())

func attack(mouse_pos):
	var direction = mouse_pos - position
	direction = direction.normalized()

	arrow_dir = direction
	arrow.rotation = direction.angle()

func _physics_process(delta):
	var collision = arrow.move_and_collide(arrow_dir * ARROW_SPEED * delta)

	if collision:
		var body = collision.collider
		if body.has_method("take_damage"):
			body.take_damage()
		queue_free()





